require 'pry'

class InputValidate
  def valid_initial_position(input)
    input_list = input.split(' ')
    if input_list.size != 3
      # system('clear')
      print "Wrong input! You sent #{input_list.size}, have to be 3 characteres. \n"
      exit
    end

    input_list.each_with_index do |input_data, index|
      if index == 2
        if !['N', 'S', 'E', 'W'].include? input_data
         print "Wrong coordinate input, should be N, S, W or O! \n"
         exit
        end
      else
        check_position(input_data, index)
      end
    end
    input_list
  end

  def valid_max_exploration_area(input)
    input_list = input.split(' ')

    if input_list.size != 2
      print "Wrong input! You sent #{input_list.size}, have to be 2 characteres. \n"
      exit
    end

    input_list.each_with_index do |input_data, index|
      check_position(input_data, index)
    end
    input_list
  end

  def valid_movements(input)
    input_list = input.split(//)

    input_list.each_with_index do |input_data, index|
      if !['L', 'R', 'M'].include? input_data
        print "Wrong movement input, should be L, R or M! \n"
        exit
      end
    end
  end

  private

  def check_position(position, index)
    begin
      int_position = Integer(position)
    rescue
      if index == 0
        print "Your first entry is wrong. Start the program again please! \n"
      else
        print "Your second entry is wrong. Start the program again please! \n"
      end
      exit
    end
  end
end
