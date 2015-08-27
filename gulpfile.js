var gulp = require('gulp');
var coffee = require('gulp-coffee');
var coffeelint = require('gulp-coffeelint');

gulp.task('validate_coffee', function () {
  gulp.src("./src/*/**.coffee")
    .pipe(coffeelint())
    .pipe(coffeelint.reporter());
});

gulp.task('compile_coffee', ['validate_coffee'], function() {
  gulp.src("./src/*/**.coffee")
    .pipe(coffee({bare: true}).on('error', console.log))
    .pipe(gulp.dest("./build"));
});

gulp.task('watch', function () {
    gulp.watch("./src/*/**.coffee", ['compile_coffee']);

});
gulp.task('default',['watch'], function() {
  // place code for your default task here
});
