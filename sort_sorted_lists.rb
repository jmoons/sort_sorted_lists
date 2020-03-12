class SortSortedLists
  UPPER_BOUND_ON_RANDOM_LIST_LENGTH       = 200
  UPPER_BOUND_ON_RANDOM_LIST_ITEM_INTEGER = 1000

  def initialize
    @list_one     = generate_sorted_array_of_random_numbers
    @list_two     = generate_sorted_array_of_random_numbers
    @sorted_lists = merge_sorted_lists

    print_results
  end

  def generate_sorted_array_of_random_numbers
    my_array = []
    (1 .. (rand UPPER_BOUND_ON_RANDOM_LIST_LENGTH)).each do | i |
      my_array << (rand 0..UPPER_BOUND_ON_RANDOM_LIST_ITEM_INTEGER)
    end

    sort_array( my_array )
  end

  def sort_array(unsorted_array)
    sorted_array = []

    while ( unsorted_array.any? )
      # Here we'll grab the first value in the array and compare it to all other elements of the array
      # If there is a value that is lower, make that the new low element and continue searching array
      # After comparing to all array values, slice off the low value via its index into our sorted array
      # Repeat this until the sorted array has the same number of elements as the unsorted array
      current_low_index = 0
      current_low_value = unsorted_array[current_low_index]
      unsorted_array.each_with_index do | candidate_value, index |
        next if index == 0
        if candidate_value < current_low_value
          current_low_value = candidate_value
          current_low_index = index
        end
      end
      sorted_array << unsorted_array.slice!(current_low_index)
    end
    sorted_array
  end

  def merge_sorted_lists
    list_a      = @list_one.dup
    list_b      = @list_two.dup
    merged_list = []

    while (true) do

      if list_a.length == 0
        merged_list << list_b
        break
      end

      if list_b.length == 0
        merged_list << list_a
        break
      end

      if list_a[0] <= list_b[0]
        merged_list << list_a.shift
      else
        merged_list << list_b.shift
      end

    end
    merged_list.flatten
  end

  def print_results
    puts "List A: #{@list_one.inspect}"
    puts "Length: #{@list_one.length.inspect}"
    puts "==========================="
    puts "List B: #{@list_two.inspect}"
    puts "Length: #{@list_two.length.inspect}"
    puts "==========================="
    puts "Sorted: #{@sorted_lists.inspect}"
    puts "Length: #{@sorted_lists.length.inspect}"
    puts "==========================="
  end

end

SortSortedLists.new
