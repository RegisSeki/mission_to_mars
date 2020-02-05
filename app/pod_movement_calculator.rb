require 'pry'
require_relative '../app/output_message'
class PodMovementCalculator
  def execute(max_exploration_area, initial_position, movements)
    map = []
    map.push(initial_position)
    x = initial_position[0]
    y = initial_position[1]
    coord = initial_position[2]
    end_position = ''

    movements.each do |movement|
      if movement == 'M'
        new_map_entry = calculate(max_exploration_area, x, y, coord)
        x = new_map_entry[0]
        y = new_map_entry[1]
        map.push(new_map_entry)
      else
        new_map_entry = change_coordenate(x, y, coord, movement)
        coord = new_map_entry[2]
        map.push(new_map_entry)
      end
    end
    {
      end_position: map[movements.size],
      scanned_map: map
    }
  end

  def change_coordenate(x, y, coord, movement)
    new_coord = case [coord, movement]
    when ["N", "L"] then "W"
    when ["N", "R"] then "E"
    when ["S", "L"] then "E"
    when ["S", "R"] then "W"
    when ["E", "L"] then "N"
    when ["E", "R"] then "S"
    when ["W", "L"] then "S"
    else
      "N"
    end

    [x, y, new_coord]
  end

  def calculate(max_exploration_area, x, y, coord)
    x = x.to_i
    y = y.to_i

    new_position = case coord
    when 'N' then [x, (y + 1), coord]
    when 'S' then [x, (y - 1), coord]
    when 'E' then [(x + 1), y, coord]
    else [(x - 1), y, coord]
    end

    possible_moviment?(max_exploration_area, new_position)

    new_position.map(&:to_s)
  end

  def possible_moviment?(max_exploration_area, new_position)
    max_x_axis = max_exploration_area[0].to_i
    max_y_axis = max_exploration_area[1].to_i

    if new_position[0] > max_x_axis || new_position[1] > max_y_axis
      OutputMessage.new.send_message(
        "The movements you sent will make the pod reach the maximum exploration area
        \n Change the maximum exploration area or change the pod movements!"
      )
    end

    true
  end
end
