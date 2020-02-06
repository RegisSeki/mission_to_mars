# frozen_string_literal: true

require_relative '../app/output_message'

class InputValidate
  @@output_message = OutputMessage.new

  def valid_initial_position(initial_position)
    initial_position_array = initial_position.split(' ')

    if initial_position_array.size != 3
      @@output_message.send_message_exit("Wrong input! You sent #{initial_position_array.size}, have to be 3 characteres.")
    end

    initial_position_array.each_with_index do |value, index|
      if index == 2
        unless %w[N S E W].include? value
          @@output_message.send_message_exit('Wrong coordinate input, should be N, S, W or O!')
        end
      else
        valid_position(value, index)
      end
    end
  end

  def valid_max_exploration_area(max_exploration_area)
    area_values = max_exploration_area.split(' ')

    if area_values.size != 2
      @@output_message.send_message_exit("Wrong input! You sent #{area_values.size}, have to be 2 characteres.")
    end

    area_values.each_with_index do |value, index|
      valid_position(value, index)
    end
  end

  def valid_movements(pod_movement)
    pod_movement_list = pod_movement.split(//)

    pod_movement_list.each_with_index do |movement, _index|
      unless %w[L R M].include? movement
        @@output_message.send_message_exit('Wrong movement input, should be L, R or M!')
      end
    end
  end

  private

  def valid_position(position, index)
    int_position = Integer(position)
  rescue StandardError
    if index == 0
      @@output_message.send_message_exit('Your first entry is wrong!')
    else
      @@output_message.send_message_exit('Your second entry is wrong!')
    end
  end
end
