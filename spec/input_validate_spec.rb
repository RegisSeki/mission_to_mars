require_relative '../app/input_validate'
require 'pry'

RSpec.describe 'InputValidate' do
  before(:each) do
    @subject = InputValidate.new
  end

  describe '#valid_initial_position' do
    describe 'Success' do
      context 'when input are all correct' do
        it 'return same array with the same values' do
         expect(@subject.valid_initial_position('1 2 N')).to eq ['1', '2', 'N']
        end
      end
    end

    describe 'Fail' do
      context 'when input is less then 3 characters' do
        it 'return message for wrong input' do
          expect(@subject).to receive(:output_message).with("Wrong input! You sent 2, have to be 3 characteres.")
          @subject.valid_initial_position('1 2')
        end
      end

      context 'when coordenate are not correct' do
        it 'return message showing the right coordinates' do
          expect(@subject).to receive(:output_message).with("Wrong coordinate input, should be N, S, W or O!")
          @subject.valid_initial_position('1 2 R')
        end
      end

      context 'when first character of initial_position is invalid' do
        it 'return proper message' do
          expect(@subject).to receive(:output_message).with("Your first entry is wrong!")
          @subject.valid_initial_position('A 2 N')
        end
      end

      context 'when second character of initial_position is invalid' do
        it 'return proper message' do
          expect(@subject).to receive(:output_message).with("Your second entry is wrong!")
          @subject.valid_initial_position('1 A N')
        end
      end
    end
  end

  describe '#valid_max_exploration_area' do
    describe 'success' do
      context 'when is a correct entry' do
        it 'return array with 2 numbers' do
          expect(@subject.valid_max_exploration_area('5 5')).to eq ['5', '5']
        end
      end
    end

    describe 'fail' do
      context 'when input has less then 2 numbers' do
        it 'return proper message' do
          expect(@subject).to receive(:output_message).with("Wrong input! You sent 1, have to be 2 characteres.")
          @subject.valid_max_exploration_area('5')
        end
      end

      context 'when first character of initial_position is invalid' do
        it 'return proper message' do
          expect(@subject).to receive(:output_message).with("Your first entry is wrong!")
          @subject.valid_max_exploration_area('A 2')
        end
      end

      context 'when second character of initial_position is invalid' do
        it 'return proper message' do
          expect(@subject).to receive(:output_message).with("Your second entry is wrong!")
          @subject.valid_max_exploration_area('1 A')
        end
      end
    end
  end

  describe '#valid_movements' do
    describe 'when pod movements list is all correct' do
      it 'return array with movements list' do
        expect(@subject.valid_movements('MLMRMLM')).to eq ['M', 'L', 'M', 'R', 'M', 'L', 'M']
      end
    end

    describe 'when pod movement list has not acceptable movement' do
      it 'return message' do
        expect(@subject).to receive(:output_message).with("Wrong movement input, should be L, R or M!")
        @subject.valid_movements('A')
      end
    end
  end
end