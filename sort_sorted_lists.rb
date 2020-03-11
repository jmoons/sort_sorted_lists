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

    my_array.sort
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
    puts "==========================="
    puts "List B: #{@list_two.inspect}"
    puts "==========================="
    puts "Sorted: #{@sorted_lists.inspect}"
  end

end

SortSortedLists.new
