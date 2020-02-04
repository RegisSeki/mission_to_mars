require_relative '../app/input_validate'
require_relative '../app/output_message'
require_relative '../app/pod_movement_calculator'
require 'pry'

input_valid = InputValidate.new
output_message = OutputMessage.new
pod_movement_calculator = PodMovementCalculator.new

output_message.send_message("\n")
output_message.send_message(" WELCOME TO THE PROJECT MISSION TO MARS! \n\n My name is Yuki and i will help you on this journey! \n\n You will be the command!")
output_message.send_message(' Are you ready? (y):')

answear = gets.chomp
if answear === 'y'
  output_message.send_message('Perfect! How can i call you:')
  nick_name = gets.chomp
  output_message.send_message("Hello #{nick_name.capitalize}, nice to have you here.")
  output_message.send_message('Our mission is to explore Mars area, to do this you need to give me the max lenght of the area that we gonna explore now!')
  output_message.send_message('Give me the max size with 2 numbers separeted with space. For example: 5 5:')
  max_exploration_area = input_valid.valid_max_exploration_area(gets.chomp)
  output_message.send_message("Good! Now let's deploy the first pod. \n Tell me the first pod initial location, please. \n Should be 3 characters, first the x position, second the y position and the cardinal coordenate as N from North, S from South, O for Oest and W for West. For example: 1 2 N :")
  first_pod_initial_position = input_valid.valid_initial_position(gets.chomp)
  output_message.send_message("Now give me the movements you want the first pod to do. \n You can use L (left) or R (right) to turn 90 degrees for respective side and M for move 1 space. For example LMLMLMLMM, it means the pod will turn left and move one space and than turn right and move one more space :")
  first_pod_movements = input_valid.valid_movements(gets.chomp)
  output_message.send_message('We gonna sent the second pod, give the initial position. Ex: 3 3 E:')
  second_pod_initial_position = input_valid.valid_initial_position(gets.chomp)
  output_message.send_message('And now the commands. Example: MMRMMRMRRM:')
  second_pod_movements = input_valid.valid_movements(gets.chomp)
  result = []
  first_pod_end_position = pod_movement_calculator.execute(first_pod_initial_position, first_pod_movements)
  second_pod_end_position = pod_movement_calculator.execute(second_pod_initial_position, second_pod_movements)
  output_message.send_message('Pods are all finished it moves and actual position is:')
  output_message.send_message("first pod #{first_pod_end_position[0]} #{first_pod_end_position[1]} #{first_pod_end_position[2]} and second pod #{second_pod_end_position[0]} #{second_pod_end_position[1]} #{second_pod_end_position[2]}")
else
  output_message.send_message("Sorry, i think you are very busy doing something better! \n If you change your mind, see you later!")
end
