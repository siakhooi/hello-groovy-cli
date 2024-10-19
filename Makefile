clean:
	 ./gradlew clean
build:
	./gradlew build
run:
	./gradlew run
init:
	gradle init \
		--type groovy-application \
		--dsl groovy \
		--test-framework spock \
		--package sing.cli \
		--project-name hellogroovy  \
		--no-split-project  \
		--java-version 21
