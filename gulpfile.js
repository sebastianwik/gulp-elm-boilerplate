var gulp = require('gulp');
var elm  = require('gulp-elm');
var browserSync = require('browser-sync').create();
var del = require('del');

// -------------------------
// BrowserSync
// -------------------------
gulp.task('browser-sync', function() {
    browserSync.init({
        server: {
            baseDir: "./dist"
        }
    });

    gulp.watch('app/*.elm', ['elm-watch'])

});

// -------------------------
// Elm compilation 
// -------------------------

gulp.task('elm-init', elm.init);
 
gulp.task('elm', ['elm-init'], function(){
  return gulp.src('app/*.elm')
    .pipe(elm())
    .pipe(gulp.dest('dist/'));
});

gulp.task('elm-watch', ['elm'], browserSync.reload);

// -------------------------
// Markup
// -------------------------

gulp.task('markup', function(){
	return gulp.src('app/*.html')
		.pipe(gulp.dest('dist/'));
});

// -------------------------
// Assets
// -------------------------

gulp.task('assets', function(){
    return gulp.src(['app/assets/**/*'])
    .pipe(gulp.dest('dist/assets'));
});


// -------------------------
// Common
// -------------------------

gulp.task('delete-dist', function(){
	del(['dist/*']);
});


// -------------------------
// CLI
// -------------------------

gulp.task('build', ['delete-dist', 'assets', 'elm', 'markup']);

gulp.task('serve', ['build', 'browser-sync']);

gulp.task('default', ['serve']);