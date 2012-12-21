class App.HexView extends Backbone.View
  constructor: (map, cx, cy, x, y ) ->
    @map = map
    @cx = cx
    @cy = cy
    @x = x
    @y = y
    @grid_location = ""


  clickHandler: ->
    @attr fill: "green"
    console.log "Hex location: #{@grid_location} was clicked"

  draw:  (map, s, center_x, center_y, fact) ->
    size = s / 2 * fact
    x = size / 2
    y = size * Math.sqrt(3) / 2
    p1_x = center_x - s * fact
    p1_y = center_y
    p2_x = p1_x + x
    p2_y = p1_y - y
    p3_x = p2_x + (2 * x)
    p3_y = p2_y
    p4_x = p3_x + x
    p4_y = p3_y + y
    p5_x = p4_x - x
    p5_y = p4_y + y
    p6_x = p5_x - (2 * x)
    p6_y = p5_y

    return map.paper.path("M" + p1_x + " " + p1_y + "L" + p2_x + " " + p2_y + "L" + p3_x + " " + p3_y + "L" + p4_x + " " + p4_y + "L" + p5_x + " " + p5_y + "L" + p6_x + " " + p6_y + "L" + p1_x + " " + p1_y + "Z")

