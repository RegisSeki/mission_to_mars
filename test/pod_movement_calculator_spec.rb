require_relative '../app/pod_movement_calculator'
require 'pry'

RSpec.describe 'PodMovementCalculator' do
  context '#execute' do
    describe '' do
      it '' do
        result = PodMovementCalculator.new.execute(["1", "2", "N"], ["L", "M", "L", "M", "L", "M", "L", "M", "M"])
        binding.pry
      end
    end
  end
end
