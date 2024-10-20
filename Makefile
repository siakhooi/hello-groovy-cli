verify: clean build deb

deb:
	gradle buildAppDeb
	dpkg-deb -c hello-groovy/build/distributions/hello-groovy_1.0.2_amd64.deb
install:
	apt install ./hello-groovy/build/distributions/hello-groovy_1.0.2_amd64.deb

uninstall:
	apt remove hello-groovy -y
clean:
	 ./gradlew clean
build:
	./gradlew build
run:
	./gradlew run
runjar:
	java -jar app/build/libs/app-all.jar
runapp:
	./app/build/scriptsShadow/app
init:
	gradle init \
		--type groovy-application \
		--dsl groovy \
		--test-framework spock \
		--package sing.cli \
		--project-name hellogroovy  \
		--no-split-project  \
		--java-version 21
