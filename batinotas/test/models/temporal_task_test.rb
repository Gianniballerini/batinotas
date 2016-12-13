require 'test_helper'

class TemporalTaskTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end

  setup do
    @list = List.create(name: 'list')
  end
  
  
  test "should not create a task without data" do
      task = TemporalTask.new()
      assert_not task.save
  end

  test "should create a task succesfully" do
      task = TemporalTask.new(description: 'a description', state: 'pending', valid_from: DateTime.new(2016, 12, 01), valid_until: Date.new(2016, 12, 22), priority: 1, list: @list)
      assert task.save
  end

  test "should not create a task with inverted date range" do
      task = TemporalTask.new(description: 'a description', state: 'pending', valid_from: DateTime.new(2016, 12, 22), valid_until: DateTime.new(2016, 12, 01), priority: 2, list: @list)
      assert_not task.save
  end

  test "should change to expired" do
  	task = TemporalTask.new(description: 'a description', state: 'pending', valid_from: DateTime.new(2016, 11, 01), valid_until: DateTime.new(2016, 12, 01), priority: 2, list: @list)
  	assert task.save
  	assert_equal('expired', task.state)
  end

end
