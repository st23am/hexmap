HexMap = (domID, width, height) ->
  if not (this instanceof arguments.callee)
    return new arguments.callee(arguments)
  self = this
  self.init = ->
    self.width = width
    self.height = height
    self.paper = Raphael(domID, 960, 960)

  self.get_cords = ->
    num_cols = self.height
    num_rows = self.width

  self.draw_grid = (map, rows, hex_size, columns) ->
    row_num = 0
    while row_num < rows
      hexes = [  ]
      if row_num is 0
        hexes[0] =
          x: (hex_size / 2)
          y: (hex_size / 2)
      else
        hexes[0] =
          x: (hex_size / 2)
          y: (row_num * hex_size) + (hex_size / 2)
      i = 1
      while i < columns
        prev_x = hexes[i - 1].x
        prev_y = hexes[i - 1].y


        if i % 2 is 0
          this_y = hexes[0].y
        else
          this_y = hexes[0].y + (hex_size / 2)
        this_x = prev_x + (1.5 * (hex_size / 2))
        hexes.push
          x: this_x
          y: this_y
        i++
      i = 0
      while i < hexes.length
        hex = new Hex(map)
        hex.draw map, hex_size, hexes[i].x, hexes[i].y
        i++
      row_num++

  self.init()
Hex = (map) ->
  if not (this instanceof arguments.callee)
    return new arguments.callee(arguments)
  self = this
  self.init = (map) ->
    self.map = map

  self.draw = (map, size, center_x, center_y) ->
    p1_x = center_x - (size / 2)
    p1_y = center_y
    p2_x = p1_x + ((size / 2) / 2)
    p2_y = p1_y - (size / 2)
    p3_x = p2_x + (size / 2)
    p3_y = p2_y
    p4_x = p3_x + ((size / 2) / 2)
    p4_y = p3_y + (size / 2)
    p5_x = p4_x - ((size / 2) / 2)
    p5_y = p4_y + (size / 2)
    p6_x = p5_x - (size / 2)
    p6_y = p5_y
    return map.paper.path("M" + p1_x + " " + p1_y + "L" + p2_x + " " + p2_y + "L" + p3_x + " " + p3_y + "L" + p4_x + " " + p4_y + "L" + p5_x + " " + p5_y + "L" + p6_x + " " + p6_y + "L" + p1_x + " " + p1_y + "Z")hex.attr
      stroke: "#000"
      fill: "blue"

  self.init map

jQuery ->
  Hexmap = new HexMap("timeline", 9, 5)
  Hexmap.draw_grid Hexmap, 8, 60, 20
