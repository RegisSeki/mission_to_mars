require_relative '../app/input_validate'
require_relative '../app/show_map'
require_relative '../app/output_message'
require_relative '../app/pod_movement_calculator'

class ExplorationController
  def initialize

    example = {
      nick_name: 'Spock',
      max_exploration_area: '5 5',
      first_pod_initial_position: '1 2 N',
      first_pod_movements: 'LMLMLMLMM',
      second_pod_initial_position: '3 3 E',
      second_pod_movements: 'MMRMMRMRRM',
    }

    input_valid = InputValidate.new
    show_map = ShowMap.new
    output_message = OutputMessage.new
    pod_movement_calculator = PodMovementCalculator.new

    output_message.send_message_clear('')
    output_message.send_message(
      "WELCOME TO THE PROJECT MISSION TO MARS!
      \n My name is Yuki and i will help you on this journey!
      \n You will be the command!"
    )
    output_message.send_message(
      "Are you familiar with the program?
      \n Answear (N) to have a guided exploration or (Y) to start:\n↴"
    )

    answear = gets.chomp
    if answear === 'N'
      output_message.send_message_clear("Perfect! How can i call you:\n↴")
      nick_name = gets.chomp
      if nick_name == ''
        nick_name = example[:nick_name]
      end

      output_message.send_message_clear("Hello #{nick_name.capitalize}, nice to have you here.\n")
      output_message.send_message(
        "Our mission is to explore Mars area, to do this you need to give me the max lenght of the area that we gonna explore now!\n"
      )
      output_message.send_message("I will help you if you do not want type anything. In this case just press ↲ (enter) and it will fill with example values")

      output_message.send_message("Give me the max size with 2 numbers separeted with space. For example: #{example[:max_exploration_area]}:\n ↴")
      input_max_exploration_area = gets.chomp
      if input_max_exploration_area == ''
        input_max_exploration_area = example[:max_exploration_area]
      end
      max_exploration_area = (input_valid.valid_max_exploration_area(input_max_exploration_area)).map(&:to_i)

      output_message.send_message_clear(
        "Good! Now let's deploy the first pod.
        \n Tell me the first pod initial location, please.
        \n Should be 3 characters, first the x position, second the y position
        \n and the cardinal coordenate as N from North, S from South, O for Oest and W for West.
        \n For example: #{example[:first_pod_initial_position]}:\n↴"
      )
      input_first_pod_initial_position = gets.chomp
      if input_first_pod_initial_position == ''
        input_first_pod_initial_position = example[:first_pod_initial_position]
      end
      first_pod_initial_position = input_valid.valid_initial_position(input_first_pod_initial_position)

      output_message.send_message_clear(
        "Now give me the movements you want the first pod to do.
        \n You can use L (left) or R (right) to turn 90 degrees
        \n for respective side and M for move 1 space.
        \n For example #{example[:first_pod_movements]}, it means the pod will turn left
        \n and move one space and than turn right and move one more space:\n↴"
      )
      input_first_pod_movements = gets.chomp
      if input_first_pod_movements == ''
        input_first_pod_movements = example[:first_pod_movements]
      end
      first_pod_movements = input_valid.valid_movements(input_first_pod_movements)

      output_message.send_message_clear("We gonna sent the second pod, give the initial position. Ex: #{example[:second_pod_initial_position]}:\n↴")
      input_second_pod_initial_position = gets.chomp
      if input_second_pod_initial_position == ''
        input_second_pod_initial_position = example[:second_pod_initial_position]
      end
      second_pod_initial_position = input_valid.valid_initial_position(input_second_pod_initial_position)

      output_message.send_message_clear("And now the commands. Example: #{example[:second_pod_movements]}:\n↴")
      input_second_pod_movements = gets.chomp
      if input_second_pod_movements == ''
        input_second_pod_movements = example[:second_pod_movements]
      end
      second_pod_movements = input_valid.valid_movements(input_second_pod_movements)

      first_pod_exploration_result = pod_movement_calculator.execute(max_exploration_area, first_pod_initial_position, first_pod_movements)
      second_pod_exploration_result = pod_movement_calculator.execute(max_exploration_area, second_pod_initial_position, second_pod_movements)
      output_message.send_message_clear('')

      output_message.send_message("#{nick_name.capitalize}, Congratulations! Pods are all finished it moves and actual position is:")
      output_message.send_message("First pod are in #{first_pod_exploration_result[:end_position].join(' ')} and Second pod at #{second_pod_exploration_result[:end_position].join(' ')}")

      output_message.send_message("Do you want see the explorated area? (Y):\n↴")
      answear_2 = gets.chomp
      if answear_2 === 'Y' || answear_2 === 'y'
        show_map.build('First Pod', max_exploration_area[0], max_exploration_area[1], first_pod_exploration_result[:scanned_map])
        show_map.build('Second Pod', max_exploration_area[0], max_exploration_area[1], second_pod_exploration_result[:scanned_map])
      else
        output_message.send_message_clear("Ok, bye then! \n See you!")
      end
    elsif answear === 'Y' || answear === 'y'
      output_message.send_message('↴')
      max_exploration_area = input_valid.valid_max_exploration_area(gets.chomp).map(&:to_i)
      output_message.send_message('↴')
      first_pod_initial_position = input_valid.valid_initial_position(gets.chomp)
      output_message.send_message('↴')
      first_pod_movements = input_valid.valid_movements(gets.chomp)
      output_message.send_message('↴')
      second_pod_initial_position = input_valid.valid_initial_position(gets.chomp)
      output_message.send_message('↴')
      second_pod_movements = input_valid.valid_movements(gets.chomp)
      output_message.send_message('↴')
      first_pod_exploration_result = pod_movement_calculator.execute(max_exploration_area, first_pod_initial_position, first_pod_movements)
      second_pod_exploration_result = pod_movement_calculator.execute(max_exploration_area, second_pod_initial_position, second_pod_movements)
      output_message.send_message(first_pod_exploration_result[:end_position].join(' '))
      output_message.send_message(second_pod_exploration_result[:end_position].join(' '))
      show_map.build('First Pod', max_exploration_area[0], max_exploration_area[1], first_pod_exploration_result[:scanned_map])
      show_map.build('Second Pod', max_exploration_area[0], max_exploration_area[1], second_pod_exploration_result[:scanned_map])
    else
      output_message.send_message('Unknown Command!')
    end
  end
end
