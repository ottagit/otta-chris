require 'test_helper'

class MicropostTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end

  def setup
   @user = users(:chris)
   # This code is not idiomatically correct and therefore makes test to pass without validations( > rails 5)
   @micropost = Micropost.new(content: "Lorem ipsum", user_id: @user.id)
  end
 
  test "should be valid" do
    assert @micropost.valid?
  end

  test "user id should be present" do
    @micropost.user_id = nil
    assert_not @micropost.valid?
  end

  test "content should be present" do
    @micropost.content = nil 
    assert_not @micropost.valid?
  end

  test "content should have a max of 140 chars" do
    @micropost.content = "a" * 141
    assert_not @micropost.valid?
  end
end 