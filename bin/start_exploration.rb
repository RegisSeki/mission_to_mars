require_relative '../app/input_validate'
require_relative '../app/pod_movement_calculator'
require 'pry'

input_valid = InputValidate.new
pod_movement_calculator = PodMovementCalculator.new

puts "\n"
puts " WELCOME TO THE PROJECT MISSION TO MARS! \n\n My name is Yuki and i will help you on this journey! \n\n You will be the command!"
puts ' Are you ready? (y):'

answear = gets.chomp
if answear === 'y'
  puts ' Perfect! How can i call you:'
  nick_name = gets.chomp
  puts " Hello #{nick_name.capitalize}, nice to have you here."
  puts ' Our mission is to explore Mars area, to do this you need to give me the max lenght of the area that we gonna explore now!'
  puts ' Give me the max size with 2 numbers separeted with space. For example: 5 5:'
  max_exploration_area = input_valid.valid_max_exploration_area(gets.chomp)
  puts " Good! Now let's deploy the first pod. \n Tell me the first pod initial location, please. \n Should be 3 characters, first the x position, second the y position and the cardinal coordenate as N from North, S from South, O for Oest and W for West. For example: 1 2 N :"
  first_pod_initial_position = input_valid.valid_initial_position(gets.chomp)
  puts " Now give me the movements you want the first pod to do. \n You can use L (left) or R (right) to turn 90 degrees for respective side and M for move 1 space. For example LMRM, it means the pod will turn left and move one space and than turn right and move one more space :"
  first_pod_movements = input_valid.valid_movements(gets.chomp)
  puts ' We gonna sent the second pod, give the initial position. Ex: 2 2 S:'
  second_pod_initial_position = input_valid.valid_initial_position(gets.chomp)
  puts ' And now the commands. Example: LMRM:'
  second_pod_movements = input_valid.valid_movements(gets.chomp)
  puts 'Pods are all finished it moves and actual position is:'
  result = []
  result.push(pod_movement_calculator.execute(first_pod_initial_position, first_pod_movements))
  result.push(pod_movement_calculator.execute(second_pod_initial_position, second_pod_movements))
  print result
else
  puts " Sorry, i think you are very busy doing something better! \n If you change your mind, see you later!"
end
