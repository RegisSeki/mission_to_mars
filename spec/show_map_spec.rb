require_relative '../app/show_map'
require 'pry'

RSpec.describe 'ShowMap' do
  describe '#render' do
    it '' do
      positions = [["1", "2", "N"],
       ["1", "2", "W"],
       ["0", "2", "W"],
       ["0", "2", "S"],
       ["0", "1", "S"],
       ["0", "1", "E"],
       ["1", "1", "E"],
       ["1", "1", "N"],
       ["1", "2", "N"],
       ["1", "3", "N"]]
      ShowMap.new.render(positions)
    end
  end
end

