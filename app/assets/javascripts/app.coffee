window.App = {}

$ ->
  App.Paper = Raphael("timeline", 960, 960)
  gridView = new App.GridView(9,5, App.Paper)
  gridView.draw_map gridView, 15, 60, 20
