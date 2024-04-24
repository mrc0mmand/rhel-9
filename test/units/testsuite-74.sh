#!/usr/bin/env bash
# SPDX-License-Identifier: LGPL-2.1-or-later
set -eux
set -o pipefail

# shellcheck source=test/units/test-control.sh
. "$(dirname "$0")"/test-control.sh

: >/failed

cat /proc/1/environ | tr '\0' '\n'
cat /proc/self/environ | tr '\0' '\n'
. "$(dirname "$0")"/testsuite-74.coredump.sh

touch /testok
rm /failed
