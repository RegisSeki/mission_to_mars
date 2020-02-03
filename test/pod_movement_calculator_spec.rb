require_relative '../app/pod_movement_calculator'
require 'pry'

RSpec.describe 'PodMovementCalculator' do
  context '#execute' do
    before do
    end

    describe 'using specification document first input entrance' do
      it 'should return an array with end_position as 1 3 N' do
        result = PodMovementCalculator.new.execute(['1', '2', 'N'], ['L', 'M', 'L', 'M', 'L', 'M', 'L', 'M', 'M'])
        expect(result).to eq ['1', '3', 'N']
      end
    end

    describe 'using second input entrance' do
      it 'should return an array with 5 1 E' do

      end
    end
  end
end
