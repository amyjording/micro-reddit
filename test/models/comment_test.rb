require 'test_helper'

class CommentTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end

  def setup
    @comment = Comment.new(comment_body: "That is questionable.", post_id: 1, user_id: 1)
  end

  test "should be valid" do
    assert @comment.valid?
  end

  test "comment_body should be present" do
    @comment.comment_body = "     "
    assert_not @comment.valid?
  end

  test "user_id should be present" do
    @comment.user_id = ""
    assert_not @comment.valid?
  end

  test "post_id should be present" do
    @comment.post_id = ""
    assert_not @comment.valid?
  end

end
