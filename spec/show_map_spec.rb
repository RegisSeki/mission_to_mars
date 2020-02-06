# frozen_string_literal: true

require_relative '../app/show_map'

RSpec.describe 'ShowMap' do
  before(:each) do
    @subject = ShowMap.new
    @expected_result = ['■ ■ ■ ■ ■ ', '□ □ ■ ■ ■ ', '□ □ ■ ■ ■ ', '■ □ ■ ■ ■ ', '■ ■ ■ ■ ■ ']
  end

  describe '#render' do
    context 'call method with postions' do
      it 'renders map with the explored area expected_result' do
        positions = [
          %w[1 2 N],
          %w[1 2 W],
          %w[0 2 W],
          %w[0 2 S],
          %w[0 1 S],
          %w[0 1 E],
          %w[1 1 E],
          %w[1 1 N],
          %w[1 2 N],
          %w[1 3 N]
        ]

        expect(@subject).to receive(:render).with('subject_name', @expected_result)
        @subject.build('subject_name', 5, 5, positions)
      end
    end
  end
end
