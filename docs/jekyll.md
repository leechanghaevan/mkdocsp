# Jekyll

## 개요

- Jekyll은 마크 다운 기반의 웹사이트 생성기이다. 주로 블로그를 만드는데 사용된다.
- 깃헙페이지에서 기본 지원 + 무료 호스팅.
- Jekyll을 설치하기 위해선 루비를 설치하여야 한다.

## Linux에 설치

- Install Ruby
  `sudo apt-get install ruby-full build-essential zlib1g-dev`

- Install Jekyll
  `sudo gem install jekyll bundler`

## Window에 설치 (choco 사용)

- 루비 설치
  `choco install ruby -y`

- 파워셀을 따로 열고
  `gem install bundler`
  `gem install jekyll`

- 실행 에러시 아래 명령어 수행 후 시도
  `bundle install`

## 명령어

- Create Jekyll project
  `jekyll new PATH` and `cd PATH`

- Test on localhost
  `jekyll serve` or `jekyll s`

- Build
  `jekyll build` or `jekyll b`

- Publish
  `git push origin master`

<!-- ## 기능

Jekyll provides automatic regeneration when a source changes.

Links inside your blog should be this format. `{{site.baseurl}}/img/2020-12-24-194035.png`.
`{{site.baseurl}}` is defined in `_config.yml`

Anyone can use Github as a free hosting server for their static website, called Github page, just with a little setup.
`repository > settings > GitHub Pages`

Once github page setup is complete, you can find the public URL nearby. -->

## 주의 사항

- 깃헙에 커밋할때 gitignore 에서 \_site를 빼줘야 정적 페이지가 깃헙페이지에 호스팅이 된다.
- WSL 리눅스에 Jekyll 설치했을때는 `jekyll s`의 자동 갱신 기능이 잘 안되었었는데 윈도용으로 설치하니 잘 된다. 역시 윈도에선 윈도용!
- 깃헙 페이지에선 여전히 지킬을 기본으로 지원하지만, 정적 블로그의 최근 대세는 Gatsby로 넘어간 것 같다.

---

참고

[^jekyll-docs]: [jekyll-docs](https://jekyllrb.com/docs/home)
[^jekyll-gh]: [jekyll-gh](https://github.com/jekyll/jekyll)
[^jekyll-talk]: [jekyll-talk](https://talk.jekyllrb.com/)
