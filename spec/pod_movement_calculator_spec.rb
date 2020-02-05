require_relative '../app/pod_movement_calculator'
require 'pry'

RSpec.describe 'PodMovementCalculator' do
  before(:each) do
    @subject = PodMovementCalculator.new
    @x = '1'
    @y = '1'
  end

  describe '#execute' do
    describe 'using correct initial_position input entrances' do
      it 'should return an array with end_position as 1 3 N' do
        result = @subject.execute(['1', '2', 'N'], ['L', 'M', 'L', 'M', 'L', 'M', 'L', 'M', 'M'])
        expect(result[:end_position]).to eq ['1', '3', 'N']
      end

      it 'should return an array with 5 1 E' do
        result = @subject.execute(['3', '3', 'E'], ['M', 'M', 'R', 'M', 'M', 'R', 'M', 'R', 'R', 'M'])
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
    context 'when coordenate is N' do
      it 'return y + 1' do
        result = @subject.calculate(@x, @y, 'N')
        expect(result).to eq [@x, @y.to_i + 1, 'N'].map(&:to_s)
      end
    end

    context 'when coordenate is S' do
      it 'return y - 1' do
        result = @subject.calculate(@x, @y, 'S')
        expect(result).to eq [@x, @y.to_i - 1, 'S'].map(&:to_s)
      end
    end

    context 'when coordenate is E' do
      it 'return x + 1' do
        result = @subject.calculate(@x, @y, 'E')
        expect(result).to eq [@x.to_i + 1, @y, 'E'].map(&:to_s)
      end
    end

    context 'when coordenate is W' do
      it 'return x - 1' do
        result = @subject.calculate(@x, @y, 'W')
        expect(result).to eq [@x.to_i - 1, @y, 'W'].map(&:to_s)
      end
    end
  end
end
