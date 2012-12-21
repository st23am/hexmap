#= require views/hex_view

class App.GridView extends Backbone.View
  el: $("#timeline")

  constructor: (width, height, paper) ->
    @width = width
    @height = height
    @paper = paper

  draw_map: (map, rows, hex_size, columns) ->
    row_num = 0
    while row_num < rows
      hexes = [  ]
      hexes[0] =
        x: hex_size
        y: (row_num * hex_size * Math.sqrt(3) / 2) + (hex_size * Math.sqrt(3) / 2)
      i = 1
      while i < columns
        prev_x = hexes[i - 1].x
        prev_y = hexes[i - 1].y

        if i % 2 is 0
          this_y = hexes[0].y
        else
          this_y = hexes[0].y + (hex_size * Math.sqrt(3) / 4)
        this_x = prev_x + (1.5 * (hex_size / 2))
        hexes.push
          x: this_x
          y: this_y
        i++
      i = 0
      while i < hexes.length
        hex = new App.HexView(map, hexes[i].x, hexes[i].y, i, row_num)
        drawn_hex = hex.draw(map, hex_size, hexes[i].x, hexes[i].y, 1)
        drawn_hex.attr fill: "#abcdef"
        drawn_hex.paper.text hexes[i].x - hex_size / 2, hexes[i].y, row_num + "," + i
        drawn_hex.grid_location = "#{row_num}, #{i}"
        drawn_hex.click ->
           @attr fill: "green"
           console.log @grid_location
        i++
      row_num++

