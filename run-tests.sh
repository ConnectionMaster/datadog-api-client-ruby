#!/usr/bin/env bash
function finish {
    rm -rf rerun.txt failed.txt
}
trap finish EXIT

RERUN_RESULT=0

bundle install
bundle exec rspec
RSPEC_RESULT=$?
if [ "$RERECORD_FAILED_TESTS" == "true" -a "$RSPEC_RESULT" -ne 0 ]; then
    RECORD=true bundle exec rspec --only-failures
    RSPEC_RESULT=$?
fi
bundle exec cucumber -t 'not @skip' -f rerun -o rerun.txt -f pretty
CUCUMBER_RESULT=$?
if [ "$RERECORD_FAILED_TESTS" == "true" -a "$CUCUMBER_RESULT" -ne 0 ]; then
    RECORD=true bundle exec cucumber @rerun.txt
    CUCUMBER_RESULT=$?
fi

# Always run integration-only scenarios
set -e
if [ "$RECORD" != "none" -a -n $DD_TEST_CLIENT_API_KEY -a -n $DD_TEST_CLIENT_APP_KEY ]; then
    RECORD=none bundle exec cucumber -t '@integration-only' -f pretty
fi

exit $(($RSPEC_RESULT+$CUCUMBER_RESULT))
