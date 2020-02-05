class PodMovementCalculator
  def execute(initial_position, movements)
    map = []
    map.push(initial_position)
    x = initial_position[0]
    y = initial_position[1]
    coord = initial_position[2]
    end_position = ''

    movements.each do |movement|
      if movement == 'M'
        new_map_entry = calculate(x, y, coord)
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

  def calculate(x, y, coord)
    x = x.to_i
    y = y.to_i
    new_position = case coord
    when 'N' then [x, (y + 1), coord]
    when 'S' then [x, (y - 1), coord]
    when 'E' then [(x + 1), y, coord]
    else [(x - 1), y, coord]
    end

    new_position.map(&:to_s)
  end
end
