class CircularQueue
  attr_accessor :queue, :lowest_value
  
  def initialize(max_queue)
    @queue = {}
    1.upto(max_queue) { |num| queue[num] = nil }
  end
  
  def dequeue
    return nil if all_values_nil?
    lowest_value = find_lowest_value
    new_position = queue.key(lowest_value)
    queue[new_position] = nil
    lowest_value
  end
    
  def enqueue(num)
    if all_values_nil?
      new_position = queue.key(nil)
    elsif no_values_nil?
      lowest_value = find_lowest_value
      new_position = queue.key(lowest_value)
    else
      new_position = find_next_empty_nil
      new_position = new_position.keys.shift
    end
    queue[new_position] = num
  end

  private

  def all_values_nil?
    queue.values.all?(nil)
  end

  def find_lowest_value
    queue.values.select {|value| value.is_a?(Integer)}.sort.shift
  end

  def no_values_nil?
    queue.values.count(nil).equal?(0)
  end

  def find_next_empty_nil
    queue.select {|k,v| k != lowest_value && v == nil}
  end
end


queue = CircularQueue.new(3)
puts queue.dequeue == nil

queue.enqueue(1)
queue.enqueue(2)
puts queue.dequeue == 1

queue.enqueue(3)
queue.enqueue(4)
puts queue.dequeue == 2

queue.enqueue(5)
queue.enqueue(6)
queue.enqueue(7)
puts queue.dequeue == 5
puts queue.dequeue == 6
puts queue.dequeue == 7
puts queue.dequeue == nil

queue = CircularQueue.new(4)
puts queue.dequeue == nil

queue.enqueue(1)
queue.enqueue(2)
puts queue.dequeue == 1

queue.enqueue(3)
queue.enqueue(4)
puts queue.dequeue == 2

queue.enqueue(5)
queue.enqueue(6)
queue.enqueue(7)
puts queue.dequeue == 4
puts queue.dequeue == 5
puts queue.dequeue == 6
puts queue.dequeue == 7
puts queue.dequeue == nil