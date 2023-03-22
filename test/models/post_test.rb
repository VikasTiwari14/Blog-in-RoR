require "test_helper"

class PostTest < ActiveSupport::TestCase
  test "the truth" do
    assert true
  end

  test "should_not_save_post_without_title" do
    post = Post.new
    assert_not post.save, "Saved the article without title"
  end

  test "should_not_save_post_without_body" do
    assert_not Post.new(title: "Its a test title").save
  end

  test "title_should_not_contain_numbers" do
    assert_not Post.new(title: 1234, body: "its a body").save
  end
end
