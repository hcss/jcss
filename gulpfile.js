var gulp = require('gulp');
var coffee = require('gulp-coffee');
var coffeelint = require('gulp-coffeelint');

var src=["./src/*.coffee","./example/*.coffee"]


gulp.task('validate_coffee', function () {
  gulp.src(src)
    .pipe(coffeelint())
    .pipe(coffeelint.reporter());
});

gulp.task('compile_coffee', ['validate_coffee'], function() {
  gulp.src(src)
    .pipe(coffee({bare: true}).on('error', console.log))
    .pipe(gulp.dest("./build"));
});

gulp.task('watch', function () {
    gulp.watch(src, ['compile_coffee']);

});
gulp.task('default',['watch','validate_coffee','compile_coffee'], function() {
  // place code for your default task here
});
