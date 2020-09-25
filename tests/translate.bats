#   Copyright IBM Corporation 2020
#
#   Licensed under the Apache License, Version 2.0 (the "License");
#   you may not use this file except in compliance with the License.
#   You may obtain a copy of the License at
#
#        http://www.apache.org/licenses/LICENSE-2.0
#
#   Unless required by applicable law or agreed to in writing, software
#   distributed under the License is distributed on an "AS IS" BASIS,
#   WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
#   See the License for the specific language governing permissions and
#   limitations under the License.

#!/usr/bin/env bats

load test_helpers

function setup() {
    setup_move2kube
}

function teardown() {
    teardown_move2kube
}

@test "translate_compose" {
    rm -rf .m2k
    DATA_DIR=$DATA_DIR TEST_TEMP_DIR=$TEST_TEMP_DIR run expect $DATA_DIR/expect/compose/script.exp
    echo "status = ${status}"
    echo "output = ${output}"
    [ "$status" = 0 ]
    run compare_folders $DATA_DIR/target/compose/ $TEST_TEMP_DIR/
    echo "status = ${status}"
    echo "output = ${output}"
    [ -z "$output" ]
}