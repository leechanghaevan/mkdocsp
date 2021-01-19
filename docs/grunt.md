# Grunt

> 그런트(Grunt)는 축소화, 컴파일, 유닛 테스트, 린트 등 주기적인 태스크들을 자동으로 수행하기 위해 사용되는 도구로서 자바스크립트 태스크 러너이다. Gruntfile이라는 파일에 정의된 사용자 지정 태스크들을 수행하기 위해 명령 줄 인터페이스를 사용한다. 그런트는 Ben Alman이 개발하였으며 Node.js로 작성되어 있다. npm을 통해 배포된다. 2016년 9월 기준으로, 그런트 생태계에 5,000개 이상의 플러그인을 사용할 수 있다.

> [그런트 공식 페이지](https://gruntjs.com/)

- 관리툴 전역에 설치  
  `npm install -g grunt-cli`
- 프로젝트별 그런트 설치 (프로젝트별 다르게 버전 가능)  
  `npm install grunt --save-dev`  
  --save-dev 로 설치를 진행하면 grunt 설치와 동시에 다음 단계에서 생성할 package.json 파일과 연동시켜주며, 파일 내부의 devDependencies항목에 설치 대상(여기서는 grunt)을 자동으로 추가해준다
- 그런트 스크립트 파일 `gruntfile.js` 생성

```javascript
module.exports = function(grunt) {


  // Project configuration.
  grunt.initConfig({
      pkg: grunt.file.readJSON('package.json'),
      //uglify 설정
      uglify: {
          options: {
              banner: '/* <%= grunt.template.today("yyyy-mm-dd") %> / ' //파일의 맨처음 붙는 banner 설정
          },
          build: {
              src: 'public/build/result.js', //uglify할 대상 설정
              dest: 'public/build/result.min.js' //uglify 결과 파일 설정
          }
      },
      //concat 설정
      concat:{
          basic: {
              src: ['public/js/common/util.js', 'public/js/app.js', 'public/js/lib/.js', public/js/ctrl/.js'], //concat 타겟 설정(앞에서부터 순서대로 합쳐진다.)
              dest: 'public/build/result.js' //concat 결과 파일
          }
      }
  });

  // Load the plugin that provides the "uglify", "concat" tasks.
  grunt.loadNpmTasks('grunt-contrib-uglify');
  grunt.loadNpmTasks('grunt-contrib-concat');

  // Default task(s).
  grunt.registerTask('default', ['concat', 'uglify']); //grunt 명령어로 실행할 작업
};
```

- 사용을 원하는 플러그인 설치  
  `npm install grunt-conrib-concat --save-dev`
- 실행  
  `grunt`
- 자주 쓰이는 Grunt Plugin  
  `grunt-contrib-concat` 파일 통합  
  `grunt-contrib-uglify` UglifyJS를 통한 file minifying
  `grunt-contrib-jshint` JSHint를 통한 file Validation.
  `grunt-contrib-cssmin` CSS 파일을 압축한다.
- [참고 사이트](https://nuli.navercorp.com/community/article/1132682?email=true)
