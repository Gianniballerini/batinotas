require 'test_helper'

class TaskTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end


  setup do
    @list = List.create(name: 'list')
    @temporalTask = TemporalTask.new(description: 'a description', state: 'done', valid_from: Date.new(2016, 12, 01), valid_until: Date.new(2016, 12, 22), priority: 2, list: @list)
    @longTask = LongTask.new(description: 'a description', state: 'done',percentage: 10, priority: 1, list: @list)
    @simpleTask = SimpleTask.new(description: 'a description', state: 'done', priority: 3, list: @list)
    @tasks = [@temporalTask, @longTask, @simpleTask] 
    
  end


  test "should sort tasks based on priorities" do
  	@tasks= @tasks.sort
  	assert_equal(1, @tasks.shift.priority)
  	assert_equal(2, @tasks.shift.priority)
  	assert_equal(3, @tasks.shift.priority)
  end

end
