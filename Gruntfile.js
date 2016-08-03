module.exports = function(grunt) {
  grunt.initConfig({
    coffee: {
      glob_to_multiple: {
        expand: true,
        flatten: true,
        cwd: 'src/',
        src: ['*.coffee'],
        dest: 'lib/',
        ext: '.js'
      }},
    watch: {
      files: ["src/*.coffee"],
      tasks: ["coffee"]
    }
  });
  grunt.loadNpmTasks('grunt-contrib-coffee');
  grunt.loadNpmTasks('grunt-contrib-watch');
  grunt.registerTask('default', ['coffee']);
};
