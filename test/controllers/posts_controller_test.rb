require "test_helper"

class PostsControllerTest < ActionDispatch::IntegrationTest
  include Devise::Test::IntegrationHelpers 
  setup do
    @post = posts(:one)
    sign_in User.create(:email => "tiwari@gmail.com", :password => "12345678")
  end

  test "should get index" do
    sign_out :user
    get posts_url
    assert_response :success
  end

  test "should get new" do
    get new_post_url
    assert_response :success
  end

  test "should create post with login" do
    
    assert_difference('Post.count') do
      post posts_url, params: { post: { body: @post.body, title: @post.title } }
    end

    assert_redirected_to post_url(Post.last)
  end

  test "should show post" do
    sign_out :user
    get post_url(@post)
    assert_response :success
  end

  test "should get edit" do
    
    get edit_post_url(@post)
    assert_response :success
  end

  test "should update post" do
    
    patch post_url(@post), params: { post: { body: @post.body, title: @post.title } }
    assert_redirected_to post_url(@post)
  end

  test "should destroy post" do
    
    assert_difference('Post.count', -1) do
      delete post_url(@post)
    end

    assert_redirected_to posts_url
  end
end
