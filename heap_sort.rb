require "time"
#require "SVG/Graph/Line"

# just took a look at lecture: 
# MIT 6.006 Introduction to Algorithms, Fall 2011
# View the complete course: http://ocw.mit.edu/6-006F11
# Instructor: Srini Devadas
# Keith Pike implementation of heap sort

def create_max_heap(unsorted_array)
  #the_end = (unsorted_array.length / 2)
  #node_num = 1
  #for i in (1..the_end) do
  #  node_num = the_end - i
  #  fix_max_heap(node_num, unsorted_array)
  #end
	
  (unsorted_array.length / 2).downto(1) do |node_num|
		fix_max_heap(node_num, unsorted_array)
	end
end

def fix_max_heap(node_num, unsorted_array)
  index = node_num - 1
  max = unsorted_array[index]
  new_index = index

  if unsorted_array.length < (node_num) * 2
    return max 
  elsif unsorted_array.length >= (node_num) * 2 + 1
    ((node_num) * 2).upto((node_num) * 2 + 1) do |check_node|
      contested_value = unsorted_array[check_node - 1]
      if  contested_value > max
        max = contested_value
        new_index = check_node - 1
      end
    end
  else
    contested_value = unsorted_array[(node_num) * 2 - 1]
    if contested_value > max
      max = contested_value
      new_index = (node_num) * 2 - 1
    end
  end

  unless new_index == index
    temp = unsorted_array[index]
    unsorted_array[index] = unsorted_array[new_index]
    unsorted_array[new_index] = temp
    fix_max_heap(new_index + 1, unsorted_array)
  else
    unsorted_array
  end
end

def create_min_heap(unsorted_array)
  (unsorted_array.length / 2).downto(1) do |node_num|
    fix_min_heap(node_num, unsorted_array)
  end
end

def fix_min_heap(node_num, unsorted_array)
  index = node_num - 1
  min = unsorted_array[index]
  new_index = index

  if unsorted_array.length < (node_num) * 2
    return min 
  elsif unsorted_array.length >= (node_num) * 2 + 1
    ((node_num) * 2).upto((node_num) * 2 + 1) do |check_node|
      contested_value = unsorted_array[check_node - 1]
      if  contested_value < min
        min = contested_value
        new_index = check_node - 1
      end
    end
  else
    contested_value = unsorted_array[(node_num) * 2 - 1]
    if contested_value < min
      min = contested_value
      new_index = (node_num) * 2 - 1
    end
  end

  unless new_index == index
    temp = unsorted_array[index]
    unsorted_array[index] = unsorted_array[new_index]
    unsorted_array[new_index] = temp
    fix_min_heap(new_index + 1, unsorted_array)
  else
    unsorted_array
  end
end

def get_min(sorted_array)
  min = sorted_array[0]
  temp = min
  sorted_array[0] = sorted_array.last
  sorted_array[sorted_array.length - 1] = min 
  sorted_array.pop
  fix_min_heap(1, sorted_array)
  min
end

def get_max(sorted_array)
  max = sorted_array[0]
  temp = max
  sorted_array[0] = sorted_array.last
  sorted_array[sorted_array.length - 1] = max 
  sorted_array.pop
  fix_max_heap(1, sorted_array)
  max
end


# source: http://my.safaribooksonline.com/book/web-development/ruby/9781593271824/sorting-algorithms/heap_sort
# wicked cool ruby scripts

def heap_sort2(a)
  size = a.length
  temp = 0
  i = (size/2)-1

  while i >= 0
    sift_down(a,i,size)
    i-=1
  end

  i=size-1
  while i >= 1
    a[0], a[1] = a[1], a[0]
    sift_down(a, 0, i-1)
    i-=1
  end
  return a
end

def sift_down(num, root, bottom)
  done = false
  max_child = 0
  temp  = 0

  while root*2 <= bottom and !done
    if root*2 == bottom
      max_child = root * 2
    elsif num[root*2].to_i > num[root*2+1].to_i
      max_child = root * 2
    else
      max_child = root * 2 + 1
    end
    if num[root] < num[max_child]
      num[root], num[max_child] = num[max_child], num[root]
      root = max_child
    else
      done = true
    end
  end
end

# heap sort from website 
# http://eigenclass.blogspot.com/2008/10/sorting-algs-in-ruby.html

def heap_sort (list)
  sl = []
  heap = build_heap(list)
  heap.size.times do
    sl << heap.shift
    heap = heapify(heap, 0)
  end
  sl.reverse
end
    
def left(i); ((i+1)*2)-1; end
    
def right(i); (i+1)*2; end
    
def heapify(h, root)
  max = root
  l, r = left(root), right(root)
  if ( l < h.size && h[l] > h[max])
    max = l
  end
  if ( r < h.size && h[r] > h[max])
    max = r
  end
  if( root != max)
    h[root], h[max] = h[max], h[root]
    return heapify(h, max)
  else
    return h
  end
end

def build_heap(list)
  heap = list.clone
  (((heap.size)-1)/2).downto(0) do |e|
    heap = heapify(heap, e)
  end
  heap
end


def heapsort(unsorted_array)
  heapsort2(unsorted_array)
end
 
def heapsort2(arr)
    # in pseudo-code, heapify only called once, so inline it here
  ((arr.length - 2) / 2).downto(0) {|start| siftdown(arr, start, arr.length - 1)}
 
    # "end" is a ruby keyword
  (arr.length - 1).downto(1) do |end_|
    arr[end_], arr[0] = arr[0], arr[end_]
    siftdown(arr, 0, end_ - 1)
  end
  self
end
 
def siftdown(arr,start, end_)
  root = start
  loop do
    child = root * 2 + 1
    break if child > end_
    if child + 1 <= end_ and arr[child] < arr[child + 1]
      child += 1
    end
    if arr[root] < arr[child]
      arr[root], arr[child] = arr[child], arr[root]
      root = child
    else
      break
    end
  end
end
  
  
# http://www.codecodex.com/wiki/Heapsort#Ruby
# implementation of heapsort
  
def heap_sort3(array)  
  n = array.size  
  a = [nil] + array             # heap root [0]=>[1]  
  (n / 2).downto(1) do |i|  
    down_heap(a, i, n)  
  end  
  while n > 1  
    a[1], a[n] = a[n], a[1]  
    n -= 1  
    down_heap(a, 1, n)  
  end  
  a.drop(1)                     # heap root [1]=>[0]  
end  
  
def down_heap(a, parent, limit)  
  wk = a[parent]  
  while (child = 2 * parent) <= limit  
    child += 1  if child < limit and a[child] < a[child + 1]  
    break  if wk >= a[child]  
    a[parent] = a[child]  
    parent = child  
  end  
  a[parent] = wk  
end  
  
  
# i was going to add a display of the tree here...will get back to later  
def display_tree(an_array)
  an_array.length
  count = 1
  (count - 1).upto(count) do
  end
end





#some_array = []
#srand()
#1.upto(1_000_000) do
#  some_array << rand(10000 - 1 + 1) + 1
#end
=begin 
average_heap_times = []

0.upto(3) do |i|
  create_max_heap_times = []
  50.times do
    some_array = *(1..(1_000_00 * 10**i))
    #puts "array created"
    create_min_heap(some_array)
    some_time = Time.now
    create_max_heap(some_array)
    create_max_heap_times << Time.now - some_time
    #puts "#{Time.now - some_time} seconds"
  end
  sum = 0
  puts create_max_heap_times.length
  create_max_heap_times.each do |value|
    sum += value
  end
  average = sum / 50.0
  average_heap_times << average
  puts average
end

 



fields = [100000,1000000,10000000,100000000].map{|value|value.to_s}


graph = SVG::Graph::Line.new({
        :height => 500,
        :width => 1000,
        :fields => fields,
})

graph.add_data({
                :data => [
                  average_heap_times[0]/fields[0].to_i,
                  average_heap_times[1]/fields[1].to_i,
                  average_heap_times[2]/fields[2].to_i,
                  average_heap_times[3]/fields[3].to_i],
                :title => 'create_max_heap',
})
print "Content-type: image/svg+xml\r\n\r\n";
print graph.burn();
=end

#some_array = [1,2,3,4,5,6,7,8,9,10]

#some_array = [16,14,10,8, 7, 9, 3, 2, 4, 1]
#some_array = [15, 19, 10, 7, 17, 16]
#heapsort(some_array) # inneficient 1,000,000 @ 14.67 sec
#display_tree

#create_max_heap(some_array) # 1,000,000 @ 1.17 sec, 10,000,000 @ 11.5 sec, 100,000,000 @ 121.48 sec
#heap_sort(some_array) # super inneficient 1,000,000 random took 400+ secs
#heap_sort2(some_array) #works fine with 1,000,000 (2.53 sec) 10,000,000 @ 43.7 sec
#heap_sort3(some_array) # 1,000,000 5.72 sec
#puts "#{Time.now - some_time} seconds"
#sorted_array = []

some_array = *(1..1_000_000_0)
#puts "array created"
#create_min_heap(some_array)
some_time = Time.now
create_max_heap(some_array)
puts Time.now - some_time
#puts "#{Time.now - some_time} seconds"
#some_time = Time.now

#1000000.times do
#  sorted_array << get_max(some_array)
#end
#puts "#{Time.now - some_time} seconds"
#puts sorted_array.inspect


#puts some_array.inspect
