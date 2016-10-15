sourceDir = 'src'
distDir = 'target'

del = require 'del'
gulp = require 'gulp'

gulp.task 'copy', ->
  gulp.src ["#{sourceDir}/fonts/**", "#{sourceDir}/img/**", "#{sourceDir}/js/**", "#{sourceDir}/libs/**"], base: sourceDir
    .pipe gulp.dest distDir
