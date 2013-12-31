module.exports = function(grunt) {

  grunt.initConfig({
    coffee: {
      dist: {
        expand: true,
        cwd: 'src/js',
        src: ['**/*.coffee'],
        dest: '.tmp/js',
        ext: '.js'
      }
    },
    copy: {
      dist: {
        expand: true,
        cwd: 'src',
        src: ['**/*.html'],
        dest: 'dist'
      }
    },
    uglify: {
      options: {
        banner: '/*! Built with Grunt */',
        mangle: false,
        compress: false,
        beautify: true
      },
      dist: {
        files: [{
          expand: true,
          cwd: '.tmp/js',
          src: ['*.js'],
          dest: 'dist/js',
          ext: '.js'
        }, {
          src: ['bower_components/jquery/jquery.js'],
          dest: 'dist/js/lib/jquery.js'
        }, {
          src: ['bower_components/handlebars/handlebars.js'],
          dest: 'dist/js/lib/jquery.js'
        }, {
          src: ['bower_components/requirejs/require.js'],
          dest: 'dist/js/require.js'
        }, {
          src: ['bower_components/markdown/lib/markdown.js'],
          dest: 'dist/js/lib/markdown.js'
        }, {
          src: ['bower_components/db.js/src/db.js'],
          dest: 'dist/js/lib/db.js'
        }]
      }
    },
    less: {
      dist: {
        options: {
          yuicompress: true,
          concat: false
        },
        files: [{
          expand: true,
          cwd: 'src/css',
          src: ['*.less'],
          dest: 'dist/css',
          ext: '.css'
        }]
      }
    },
    handlebars: {
      compile: {
        options: {
          amd: true
        },
        files: {
          "dist/js/templates.js": "src/templates/*.hbs"
        }
      }
    },
    concurrent: {
      build: ['coffee', 'less', 'copy', 'handlebars'],
      postbuild: ['uglify'],
      watch: ['watch:coffee', 'watch:less', 'watch:handlebars']
    },
    clean: {
      pre: ['dist'],
      post: ['.tmp']
    },
    watch: {
      coffee: {
        files: ['src/js/*.coffee'],
        tasks: ['coffee', 'uglify']
      },
      less: {
        files: ['src/css/*.less'],
        tasks: ['less']
      },
      handlebars: {
        files: ['src/templates/*.hbs'],
        tasks: ['handlebars']
      },
    },
  });

  grunt.loadNpmTasks('grunt-concurrent');
  grunt.loadNpmTasks('grunt-contrib-coffee');
  grunt.loadNpmTasks('grunt-contrib-uglify');
  grunt.loadNpmTasks('grunt-contrib-less');
  grunt.loadNpmTasks('grunt-contrib-clean');
  grunt.loadNpmTasks('grunt-contrib-copy');
  grunt.loadNpmTasks('grunt-contrib-watch');
  grunt.loadNpmTasks('grunt-contrib-handlebars');

  grunt.registerTask('default', ['clean:pre', 'concurrent:build', 'concurrent:postbuild', 'clean:post']);
  grunt.registerTask('spy', ['clean:pre', 'concurrent:build', 'concurrent:postbuild', 'clean:post', 'concurrent:watch']);

};