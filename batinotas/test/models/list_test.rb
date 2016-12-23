require 'test_helper'

class ListTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end

  test "should not create a list without a name" do
	  list = List.new()
	  assert_not list.save
  end
  test "should create a list that respects slugs" do
	  list = List.new(name: "list name")
	  assert list.save
  end
  test "should create slug even with a conflict name" do
    list = List.new(name: "hello !! im a list!")
    assert list.save
  end
  test "should not create a list with the same url " do
    list = List.create(name: "nueva lista")
    list2 = List.create(name: "nueva lista")
    assert_not list2.save
  end
end
