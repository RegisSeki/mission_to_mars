require 'pry'

class ShowMap
  def render(positions)
    t = '□ '
    f = '■ '

    x_axis_max = 5
    y_axis_max = 5

    x_ref = 0
    y_ref = 0

    final_map = []
    row = ''

    positions.map(&:pop)

    x_axis_max.times do |x|
      stop_y_axis = false
      # binding.pry
      y_axis_max.times do |y|
        # binding.pry
        if stop_y_axis
          break
        else
          positions.uniq.each do |position|
              # binding.pry
            if [x.to_s, y.to_s] == position
              # puts "#{position}"
              row += t
              # binding.pry
              stop_y_axis = true
              puts 'true'
              break
            end
          end
        end
        puts 'row'
        row += f
      end
      binding.pry
      final_map.push(row)
    end
    puts "#{final_map}"
  end
end
