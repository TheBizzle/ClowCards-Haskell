var gulp = require('gulp');

var del        = require('del');
var less       = require('gulp-less');
var rename     = require('gulp-rename');

gulp.task('clean', function(cb) {
  del(['target'], cb);
});

gulp.task('stylesheets', function() {
  return gulp.src("public/stylesheets/**/*")
             .pipe(gulp.dest("target/stylesheets"));
});

gulp.task('less', function() {
  return gulp.src("src/client/stylesheets/*.less")
             .pipe(less())
             .pipe(gulp.dest("target/stylesheets"));
});

gulp.task('jquery', function() {
  return gulp.src("node_modules/jquery/jquery.min.js")
             .pipe(gulp.dest("target/js"));
});

gulp.task('jquery-ui', function() {
  return gulp.src("public/js/jquery-ui-1.9.2.custom.min.js")
             .pipe(rename(function (path) { path.basename = "jquery-ui"; path.extname = ".min.js" }))
             .pipe(gulp.dest("target/js"));
});

gulp.task('build', ['stylesheets', 'less', 'jquery', 'jquery-ui']);
