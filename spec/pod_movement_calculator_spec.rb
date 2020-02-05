require_relative '../app/output_message'
require_relative '../app/pod_movement_calculator'
require 'pry'

RSpec.describe 'PodMovementCalculator' do
  before(:each) do
    @subject = PodMovementCalculator.new
    @x = '5'
    @y = '5'
  end

  describe '#execute' do
    describe 'using correct initial_position input entrances' do
      it 'should return an array with end_position as 1 3 N' do
        result = @subject.execute([@x, @y], ['1', '2', 'N'], ['L', 'M', 'L', 'M', 'L', 'M', 'L', 'M', 'M'])
        expect(result[:end_position]).to eq ['1', '3', 'N']
      end

      it 'should return an array with 5 1 E' do
        result = @subject.execute([@x, @y], ['3', '3', 'E'], ['M', 'M', 'R', 'M', 'M', 'R', 'M', 'R', 'R', 'M'])
        expect(result[:end_position]).to eq ['5', '1', 'E']
      end
    end
  end

  describe '#change_coordenate' do
    describe 'check all possible results' do
      context 'when actual coord is N and direction is L' do
        it 'returns coordenate W' do
          result = @subject.change_coordenate(@x, @y, 'N', 'L')
          expect(result).to eq [@x, @y, 'W']
        end
      end

      context 'when actual coord is N and direction is R' do
        it 'returns coordenate E' do
          result = @subject.change_coordenate(@x, @y, 'N', 'R')
          expect(result).to eq [@x, @y, 'E']
        end
      end

      context 'when actual coord is S and direction is L' do
        it 'returns coordenate E' do
          result = @subject.change_coordenate(@x, @y, 'S', 'L')
          expect(result).to eq [@x, @y, 'E']
        end
      end

      context 'when actual coord is S and direction is R' do
        it 'returns coordenate W' do
          result = @subject.change_coordenate(@x, @y, 'S', 'R')
          expect(result).to eq [@x, @y, 'W']
        end
      end

      context 'when actual coord is E and direction is L' do
        it 'returns coordenate N' do
          result = @subject.change_coordenate(@x, @y, 'E', 'L')
          expect(result).to eq [@x, @y, 'N']
        end
      end

      context 'when actual coord is E and direction is R' do
        it 'returns coordenate S' do
          result = @subject.change_coordenate(@x, @y, 'E', 'R')
          expect(result).to eq [@x, @y, 'S']
        end
      end

      context 'when actual coord is W and direction is L' do
        it 'returns coordenate S' do
          result = @subject.change_coordenate(@x, @y, 'W', 'L')
          expect(result).to eq [@x, @y, 'S']
        end
      end

      context 'when actual coord is W and direction is R' do
        it 'returns coordenate N' do
          result = @subject.change_coordenate(@x, @y, 'W', 'R')
          expect(result).to eq [@x, @y, 'N']
        end
      end
    end
  end

  describe '#calculate' do
    before(:each) do
      @x = '1'
      @y = '1'
      @max_x_axis = '5'
      @max_y_axis = '5'
    end

    context 'when coordenate is N' do
      it 'return y + 1' do
        result = @subject.calculate([@max_x_axis, @max_y_axis], @x, @y, 'N')
        expect(result).to eq [@x, @y.to_i + 1, 'N'].map(&:to_s)
      end
    end

    context 'when coordenate is S' do
      it 'return y - 1' do
        result = @subject.calculate([@max_x_axis, @max_y_axis], @x, @y, 'S')
        expect(result).to eq [@x, @y.to_i - 1, 'S'].map(&:to_s)
      end
    end

    context 'when coordenate is E' do
      it 'return x + 1' do
        result = @subject.calculate([@max_x_axis, @max_y_axis], @x, @y, 'E')
        expect(result).to eq [@x.to_i + 1, @y, 'E'].map(&:to_s)
      end
    end

    context 'when coordenate is W' do
      it 'return x - 1' do
        result = @subject.calculate([@max_x_axis, @max_y_axis], @x, @y, 'W')
        expect(result).to eq [@x.to_i - 1, @y, 'W'].map(&:to_s)
      end
    end

    context 'when new position is greater than max exploration area' do
      it 'return message' do
        @y = '5'
        expect_any_instance_of(OutputMessage).to receive(:send_message).with("The movements you sent will make the pod reach the maximum exploration area\n        \n Change the maximum exploration area or change the pod movements!")
        @subject.calculate([@max_x_axis, @max_y_axis], @x, @y, 'N')
      end
    end
  end
end
