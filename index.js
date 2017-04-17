var browserify  = require('browserify');
var gulp        = require('gulp');
var watchify    = require('watchify');
var coffeeify = require('coffeeify');
var source      = require('vinyl-source-stream');

var paths = {
  entry:  './main.coffee',
  build:  __dirname,
  bundle: 'bundle.js'
}

function run() {
  function bundle() {
    return watch.bundle()
                .on('error', function(data) {
                  console.log(data);
                })
                .pipe(source(paths.bundle))
                .pipe(gulp.dest(paths.build));
  }
  var options = {
    entries: paths.entry,
    debug  : true
  };

  var watch = watchify(browserify(options));
  watch.transform(coffeeify);
  watch.on('update', function() {
    console.log("updating...");
    bundle();
  });

  return bundle();
}

gulp.task('run', function() {
  run();
});