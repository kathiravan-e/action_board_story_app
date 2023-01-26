require "test_helper"

class HomePageControllerTest < ActionDispatch::IntegrationTest
  def setup
    @post = stories(:story_2)
  end

  test 'post index' do
    get home_page_index_path
    assert_response :success
  end

  test 'post show' do
    get home_page_path(@post)
    assert_response :success
    unless @response.body.match?("#{@post.id}")
      assert_match "kirthi", @post.by
    end
  end

  test 'update' do
    patch home_page_path(@post), params: { format: :turbo_stream }
    assert_response :success
    assert_equal 10, @post.reload.likes
  end
end
