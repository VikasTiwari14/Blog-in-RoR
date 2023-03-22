require "test_helper"
require 'capybara/rails'
require 'capybara/minitest'

class BlogFlowTest < ActionDispatch::IntegrationTest
  include Capybara::DSL
  # Make `assert_*` methods behave like Minitest assertions
  include Capybara::Minitest::Assertions
  include Devise::Test::IntegrationHelpers 

  # Reset sessions and driver between tests
  teardown do
    Capybara.reset_sessions!
    Capybara.use_default_driver
  end
  # test "the truth" do
  #   assert true
  # end
  def setup
    @post = posts(:one)
    post posts_url, params: { post: { body: @post.body, title: @post.title } }
  end

  test "should redirect from /posts to /posts/id when click on view full blog" do
    Capybara.visit("/posts")
    assert page.has_link?('view full blog')
    find("a[href='/posts/#{@post.id}']").click
    new_path = current_path

    assert_equal(new_path, "/posts/#{@post.id}")
  end

  test "should create new post if logged in" do
    visit("/users/sign_in")
    sign_in User.create(:email => "tiwari@gmail.com", :password => "12345678")
    visit("/posts")
    find("a[href='/posts/new']").click
    assert_equal(current_path, "/posts/new")
    assert page.has_content?("New Post")
    old_path = current_path
    fill_in "post_title", :with => "Its a title"
    fill_in "post_body", :with => "Its a descriptive body of a post"
    find("input[name='commit']").click
    new_path = current_path

    assert_not_equal(old_path, new_path)
  end


end
