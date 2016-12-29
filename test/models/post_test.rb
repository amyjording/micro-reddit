require 'test_helper'

class PostTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
  def setup
    @post = Post.new(title: "Crazy coolio Link", link: "http://deserthorsedesigns.com", user_id: 1)
  end

  test "should be valid" do
    assert @post.valid?
  end

  test "post title should be present" do
    @post.title = "     "
    assert_not @post.valid?
  end

  test "post link should be present" do
    @post.link = "     "
    assert_not @post.valid?
  end

  test "post title should not be too long" do
    @post.title = "a" * 85
    assert_not @post.valid?
  end

  test "post link should not be too long" do
    @post.link = "e" * 1100
    assert_not @post.valid?
  end

  test "link validation should reject invalid url path" do
    invalid_urls = %w[http//orly.com http:www.example.com/main.html ftp:()okedokes.com]
    invalid_urls.each do |invalid_url|
      @post.link = invalid_url
      assert_not @post.valid?, "#{invalid_url.inspect} should be invalid"
    end
  end
end
