require 'minitest/spec'
require 'minitest/autorun'
require 'pry'
require_relative '../app/input_validate.rb'

# RSpec.describe 'InputValidate' do
#   describe '#valid_initial_position' do
#     context 'when input is less then 3' do
#       it 'return message and retry the enter' do
#         binding.pry
#         expect { InputValidate.new.wrong_input }.to output("Wrong input. Start the program again pleasecccccc!").to_stdout
#         # expect(InputValidate.new).to receive(:check_position)
#         # InputValidate.new.valid_initial_position('1 2')
#       end
#     end
#   end
# end

describe 'InputValidate' do
  it 'DADS' do
    (2 + 2).must_equal 4
  end
end
