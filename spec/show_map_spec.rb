require_relative '../app/show_map'
require 'pry'

RSpec.describe 'ShowMap' do
  before(:each) do
    @subject = ShowMap.new
    @expected_result = ["■ ■ ■ ■ ■ ", "□ □ ■ ■ ■ ", "□ □ ■ ■ ■ ", "■ □ ■ ■ ■ ", "■ ■ ■ ■ ■ "]
  end

  describe '#render' do
    it 'renders map with the explored area' do
      positions = [
        ["1", "2", "N"],
        ["1", "2", "W"],
        ["0", "2", "W"],
        ["0", "2", "S"],
        ["0", "1", "S"],
        ["0", "1", "E"],
        ["1", "1", "E"],
        ["1", "1", "N"],
        ["1", "2", "N"],
        ["1", "3", "N"]
      ]

      expect(@subject).to receive(:render).with(@expected_result)
      @subject.build(positions)
    end
  end
end
