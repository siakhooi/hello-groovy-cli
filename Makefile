verify: clean build deb

set-version:
	scripts/set-version.sh
git-commit-and-push:
	scripts/git-commit-and-push.sh
create-release:
	scripts/create-release.sh
deb:
	./scripts/build-deb.sh
	dpkg-deb -c $$(ls hello-groovy_*_amd64.deb)
rpm:
	rpm --eval '%{_arch}'
	./scripts/build-rpm.sh
	rpm -ql $$(ls hello-groovy-*.rpm)

install-deb:
	apt install -y ./$$(ls hello-groovy_*_amd64.deb)
uninstall-deb:
	apt remove hello-groovy -y
install-rpm:
	yum install -y $$(ls hello-groovy-*.rpm)
uninstall-rpm:
	yum remove hello-groovy -y

bats-prepare-deb:
	scripts/bats-prepare-deb.sh
bats-prepare-rpm:
	scripts/bats-prepare-rpm.sh
bats-run:
	scripts/bats-run.sh

clean:
	 ./gradlew clean
	 rm -f *.deb *.sha256sum *.sha512sum *.rpm
build:
	./gradlew build
sonar:
	./gradlew sonar
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
