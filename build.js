({
  name: 'tabler',
  baseUrl: 'assets/javascripts/tabler',
  out: 'assets/javascripts/tabler.js',
  optimize: 'none',
  shim: {
    'c3': ['d3', 'core'],
    'd3': ['core'],
    'bootstrap': ['jquery'],
    'sparkline': ['jquery'],
    'tablesorter': ['jquery'],
    'vector-map': ['jquery'],
    'vector-map-de': ['vector-map', 'jquery'],
    'vector-map-world': ['vector-map', 'jquery'],
    'core': ['bootstrap', 'jquery']
  },
  paths: {
    'core': 'core',
    'jquery': 'vendors/jquery-3.2.1.min',
    'bootstrap': 'vendors/bootstrap.bundle.min',
    'sparkline': 'vendors/jquery.sparkline.min',
    'selectize': 'vendors/selectize.min',
    'tablesorter': 'vendors/jquery.tablesorter.min',
    'vector-map': 'vendors/jquery-jvectormap-2.0.3.min',
    'vector-map-de': 'vendors/jquery-jvectormap-de-merc',
    'vector-map-world': 'vendors/jquery-jvectormap-world-mill',
    'circle-progress': 'vendors/circle-progress.min',
    'd3': 'plugins/charts-c3/js/d3.v3.min',
    'c3': 'plugins/charts-c3/js/c3.min'
  }
})
