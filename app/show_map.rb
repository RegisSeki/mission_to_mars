require 'pry'
require_relative '../app/output_message'

class ShowMap
  UNCOVERED = '□ '
  UNDISCOVERED = '■ '

  def build(positions)
    x_axis_max = 5
    y_axis_max = 5

    final_map = []

    positions.map(&:pop)

    y_axis_max.times do |y|
      row = ''
      x_axis_max.times do |x|
        if positions.include? [x.to_s, y.to_s]
          row += UNCOVERED
        else
          row += UNDISCOVERED
        end
      end
      final_map.push(row)
    end
    render(final_map)
  end

  def render(final_map)
    output_message = OutputMessage.new
    final_map.reverse.each do |row|
      output_message.send_message(row)
    end
  end
end
