require_relative '../app/output_message'

class ShowMap
  UNCOVERED = '□ '
  UNDISCOVERED = '■ '

  def build(subject_name, x, y, positions)
    x_axis_max = x
    y_axis_max = y

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
    render(subject_name, final_map)
  end

  def render(subject_name, final_map)
    output_message = OutputMessage.new
    output_message.send_message("\n")
    output_message.send_message("#{subject_name} explored map!")

    final_map.reverse.each do |row|
      output_message.send_message(row)
    end
    output_message.send_message('')
  end
end
