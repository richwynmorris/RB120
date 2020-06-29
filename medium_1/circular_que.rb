class CircularQueue
  attr_accessor :queue, :oldest_position
  
  def initialize(max_queue)
    @queue = {}
    @buffer = max_queue
    1.upto(max_queue) { |num| queue[num] = nil }
  end
  
  def dequeue
    return nil if queue.values.all?(nil)
    oldest_position = queue.values.select {|value| value.is_a?(Integer)}.sort.shift
    new_position = queue.key(oldest_position)
    queue[new_position] = nil
    oldest_position
  end
    
  def enqueue(num)
    if queue.values.count(nil).equal?(1)
      new_position = queue.key(nil)
    elsif queue.values.count(nil).equal?(0)
      lowest_value = queue.values.select {|value| value.is_a?(Integer)}.sort.shift
      new_position = queue.key(lowest_value)
    else
      new_position = queue.select {|k,v| k != oldest_position && v == nil}
      new_position = new_position.keys.shift
    end
    queue[new_position] = num
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