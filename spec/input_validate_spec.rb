require_relative '../app/input_validate'
require_relative '../app/output_message'

RSpec.describe 'InputValidate' do
  before(:each) do
    @subject = InputValidate.new
  end

  describe '#valid_initial_position' do
    context 'Success' do
      context 'when input are all correct' do
        it 'return same array with the same values' do
         expect(@subject.valid_initial_position('1 2 N')).to eq ['1', '2', 'N']
        end
      end
    end

    context 'Fail' do
      context 'when input is less then 3 characters' do
        it 'return message for wrong input' do
          expect_any_instance_of(OutputMessage).to receive(:send_message_exit).with('Wrong input! You sent 2, have to be 3 characteres.')
          @subject.valid_initial_position('1 2')
        end
      end

      context 'when coordenate are not correct' do
        it 'return message showing the right coordinates' do
          expect_any_instance_of(OutputMessage).to receive(:send_message_exit).with("Wrong coordinate input, should be N, S, W or O!")
          @subject.valid_initial_position('1 2 R')
        end
      end

      context 'when first character of initial_position is invalid' do
        it 'return proper message' do
          expect_any_instance_of(OutputMessage).to receive(:send_message_exit).with("Your first entry is wrong!")
          @subject.valid_initial_position('A 2 N')
        end
      end

      context 'when second character of initial_position is invalid' do
        it 'return proper message' do
          expect_any_instance_of(OutputMessage).to receive(:send_message_exit).with("Your second entry is wrong!")
          @subject.valid_initial_position('1 A N')
        end
      end
    end
  end

  describe '#valid_max_exploration_area' do
    context 'success' do
      context 'when is a correct entry' do
        it 'return array with 2 numbers' do
          expect(@subject.valid_max_exploration_area('5 5')).to eq ['5', '5']
        end
      end
    end

    context 'fail' do
      context 'when input has less then 2 numbers' do
        it 'return proper message' do
          expect_any_instance_of(OutputMessage).to receive(:send_message_exit).with("Wrong input! You sent 1, have to be 2 characteres.")
          @subject.valid_max_exploration_area('5')
        end
      end

      context 'when first character of initial_position is invalid' do
        it 'return proper message' do
          expect_any_instance_of(OutputMessage).to receive(:send_message_exit).with("Your first entry is wrong!")
          @subject.valid_max_exploration_area('A 2')
        end
      end

      context 'when second character of initial_position is invalid' do
        it 'return proper message' do
          expect_any_instance_of(OutputMessage).to receive(:send_message_exit).with("Your second entry is wrong!")
          @subject.valid_max_exploration_area('1 A')
        end
      end
    end
  end

  describe '#valid_movements' do
    context 'when pod movements list is all correct' do
      it 'return array with movements list' do
        expect(@subject.valid_movements('MLMRMLM')).to eq ['M', 'L', 'M', 'R', 'M', 'L', 'M']
      end
    end

    context 'when pod movement list has not acceptable movement' do
      it 'return message' do
        expect_any_instance_of(OutputMessage).to receive(:send_message_exit).with("Wrong movement input, should be L, R or M!")
        @subject.valid_movements('A')
      end
    end
  end
end
