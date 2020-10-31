# !/bin/sh
#
# Copyright 2015-2020 The OpenZipkin Authors
#
# Licensed under the Apache License, Version 2.0 (the "License"); you may not use this file except
# in compliance with the License. You may obtain a copy of the License at
#
# http://www.apache.org/licenses/LICENSE-2.0
#
# Unless required by applicable law or agreed to in writing, software distributed under the License
# is distributed on an "AS IS" BASIS, WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express
# or implied. See the License for the specific language governing permissions and limitations under
# the License.
#

# ENTRYPOINT script that runs the dependencies job on-demand, processing today's spans unless CLI
# args override it (Ex. 2020-10-31)
set -eu

exec java ${JAVA_OPTS} -Djava.io.tmpdir=/tmp -jar zipkin-dependencies.jar $@
