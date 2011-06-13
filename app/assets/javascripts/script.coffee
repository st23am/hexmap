class HexMap
  constructor: (domID, width, height) ->
    @width = width
    @height = height
    @paper = Raphael(domID, 960, 960)

  draw_grid: (map, rows, hex_size, columns) ->
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
        hex = new Hex(map, hexes[i].x, hexes[i].y)
        drawn_hex = hex.draw(map, hex_size, hexes[i].x, hexes[i].y)
        drawn_hex.attr fill: "#abcdef"
        drawn_hex.paper.text hexes[i].x, hexes[i].y, row_num + "," + i
        drawn_hex.click ->
          @attr fill: "green"
          console.log this
        i++
      row_num++

class Hex
  constructor: (map, x, y) ->
    @map = map
    @x = x
    @y = y

  draw:  (map, size, center_x, center_y) ->
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

    return map.paper.path("M" + p1_x + " " + p1_y + "L" + p2_x + " " + p2_y + "L" + p3_x + " " + p3_y + "L" + p4_x + " " + p4_y + "L" + p5_x + " " + p5_y + "L" + p6_x + " " + p6_y + "L" + p1_x + " " + p1_y + "Z")

jQuery ->
  window.Hexmap = new HexMap("timeline", 9, 5)
  Hexmap.draw_grid window.Hexmap, 15, 60, 20
