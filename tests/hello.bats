setup() {
    load 'common-setup'
    common_setup

}


@test "echo" {
    run hello-groovy
    assert_output 'Hello Groovy (and Sonar??)!!!'
}
