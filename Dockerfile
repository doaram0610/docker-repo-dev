#어떤 베이스이미지를 사용할건지를 선언한다-nodejs버전16을 사용하겠다.
FROM node:16-alpine   

#어떤 디렉토리에 어플리케이션을 복사해올건지 선언한다.
WORKDIR /app

#이제 프로젝트파일을 복사해와야 한다.
#nodejs 에서 디펜던시하는 라이브러리 선언파일(package.json, package-lock.json)을 복사해온다.
COPY package.json package-lock.json ./

#복사해온 라이브러리 선언파일을 실행한다. - 그럼 위에 선언파일에 선언된 모든 라이브러리를 가져온다.
#그런데 npm install 대신에 npm ci를 사용하면 내가 사용한 특정버전을 설치해주고 install 사용하면 최신버전을 설치해준다.
#그러니까 지정한 버전으로 설치하려면 npm ci 를 사용해라
RUN npm ci

#소스파일을 카피해오자
COPY index.js .

#괄호안에 있는 파일을 실행해라
ENTRYPOINT [ "node", "index.js" ]

#가장 빈번히 변경되는것을 제일 하단에 선언해야 된다. - COPY 가 여러개가 될때 말이다.
