del = require 'del'
gulp = require 'gulp'
pug = require 'gulp-pug'
wrap = require 'gulp-wrap-amd'
sass = require 'gulp-sass'
gutil = require 'gulp-util'
coffee = require 'gulp-coffee'
notify = require 'gulp-notify'
rename = require 'gulp-rename'
plumber = require 'gulp-plumber'
connect = require 'gulp-connect'
runSequence = require 'run-sequence'
autoprefixer = require 'gulp-autoprefixer'

sourceDir = 'src'
distDir = 'target'

coffeeFiles = "#{sourceDir}/**/*.coffee"
sassFiles = "#{sourceDir}/**/*.scss"
pugHtmlFiles = "#{sourceDir}/**/*.html.pug"
pugJsFiles = "#{sourceDir}/**/*.js.pug"

plumberConfig =
  errorHandler: (error) ->
    gutil.log gutil.colors.cyan('Plumber') + gutil.colors.red(' found unhandled error:\n'), error.toString()
    notify.onError()(error)
    @emit 'end'

gulp.task 'copy', ->
  gulp.src ["#{sourceDir}/fonts/**", "#{sourceDir}/img/**", "#{sourceDir}/js/**", "#{sourceDir}/libs/**"], base: sourceDir
    .pipe gulp.dest distDir

gulp.task 'build-scripts', ->
  gulp.src coffeeFiles
    .pipe plumber plumberConfig
    .pipe coffee()
    .pipe gulp.dest distDir
    .pipe connect.reload()

gulp.task 'build-sass', ->
  gulp.src sassFiles
    .pipe plumber plumberConfig
    .pipe sass()
    .pipe autoprefixer()
    .pipe gulp.dest distDir
    .pipe connect.reload()

# compile pug file with rename in index.html
gulp.task 'build-pug-html', ->
  gulp.src pugHtmlFiles
    .pipe rename(extname: '')
    .pipe plumber plumberConfig
    .pipe pug()
    .pipe gulp.dest distDir
    .pipe connect.reload()

# compile pug file template with rename in index.jade
gulp.task 'build-pug-js', ->
  gulp.src pugJsFiles
    .pipe rename(extname: '')
    .pipe pug
      client: on
      debug: off
      compileDebug: off
    .pipe wrap exports: 'template'
    .pipe gulp.dest distDir
    .pipe connect.reload()

# delete web folder
gulp.task 'clean', (cb) ->
  del ["#{distDir}/**", "!#{distDir}", "!#{distDir}/lib/**"], cb

gulp.task 'watch', ['build-scripts', 'copy', 'build-sass', 'build-pug-html', 'build-pug-js'], ->
  gulp.watch coffeeFiles, ['build-scripts']
  gulp.watch sassFiles, ['build-sass']
  gulp.watch pugHtmlFiles, ['build-pug-html']
  gulp.watch pugJsFiles, ['build-pug-js']

gulp.task 'build', ->
  runSequence 'clean', ['build-scripts', 'copy', 'build-sass', 'build-pug-html', 'build-pug-js']

# type gulp in console to start our app
# we start our tasks in que if we pass array the start paralel
gulp.task 'default', ->
  runSequence 'clean', ['watch']

gulp.task 'serve', ['default'], ->
  connect.server
    root: distDir,
    livereload: on