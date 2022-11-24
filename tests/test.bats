setup() {
  set -eu -o pipefail
  export DIR="$( cd "$( dirname "$BATS_TEST_FILENAME" )" >/dev/null 2>&1 && pwd )/.."
  export TESTDIR=~/tmp/test-selenium-chrome
  mkdir -p $TESTDIR
  export PROJNAME=test-selenium-chrome
  export DDEV_NON_INTERACTIVE=true
  ddev delete -Oy ${PROJNAME} >/dev/null 2>&1 || true
  cd "${TESTDIR}"
  ddev config --project-name=${PROJNAME}
  ddev start -y >/dev/null
}

teardown() {
  set -eu -o pipefail
  cd ${TESTDIR} || ( printf "unable to cd to ${TESTDIR}\n" && exit 1 )
  ddev delete -Oy ${PROJNAME} >/dev/null
  [ "${TESTDIR}" != "" ] && rm -rf ${TESTDIR}
}

@test "install from directory" {
  set -eu -o pipefail
  cd ${TESTDIR}
  echo "# ddev get ${DIR} with project ${PROJNAME} in ${TESTDIR} ($(pwd))" >&3
  ddev get ${DIR}
  ddev restart
  # Make sure we get a success message from the status page.
  # For extra credit, use a real CMS with actual config.
  ddev exec "curl  http://selenium-chrome:4444/status" | grep "\"message\": \"Selenium Grid ready.\"" >/dev/null || (echo "# Selenium Grid not ready"  >&3 && exit 1);
}

 @test "install from release" {
  set -eu -o pipefail
  cd ${TESTDIR} || ( printf "unable to cd to ${TESTDIR}\n" && exit 1 )
  echo "# ddev get alexfinnarn/ddev-selenium-chrome with project ${PROJNAME} in ${TESTDIR} ($(pwd))" >&3
  ddev get alexfinnarn/ddev-selenium-chrome
  ddev restart >/dev/null
  # Make sure we get a success message from the status page.
  ddev exec "curl  http://selenium-chrome:4444/status" | grep "\"message\": \"Selenium Grid ready.\"" >/dev/null || (echo "# Selenium Grid not ready"  >&3 && exit 1);
}
