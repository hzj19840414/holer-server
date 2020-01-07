#!/bin/bash

# Copyright 2018-present, Yudong (Dom) Wang
#
# Licensed under the Apache License, Version 2.0 (the "License");
# you may not use this file except in compliance with the License.
# You may obtain a copy of the License at
#
#      http://www.apache.org/licenses/LICENSE-2.0
#
# Unless required by applicable law or agreed to in writing, software
# distributed under the License is distributed on an "AS IS" BASIS,
# WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
# See the License for the specific language governing permissions and
# limitations under the License.

# -----------------------------------------------------------------------------
# Holer Setup Script
# -----------------------------------------------------------------------------
cd `dirname $0`/..

HOLER_OK=0
HOLER_ERR=1

HOLER_NAME="holer"
HOLER_HOME=`pwd`
HOLER_BIN=$HOLER_HOME/bin
HOLER_SERVICE="holer.service"
SYSD_DIR="/lib/systemd/system"

setup()
{
    cp $HOLER_BIN/$HOLER_SERVICE $SYSD_DIR/
    sed -i "s|@HOLER_HOME@|$HOLER_HOME|" $SYSD_DIR/$HOLER_SERVICE

    chmod +x $HOLER_BIN/$HOLER_NAME*
    chmod +x $HOLER_BIN/*.sh

    systemctl enable $HOLER_SERVICE
    systemctl daemon-reload
    systemctl start $HOLER_SERVICE
    systemctl status $HOLER_SERVICE
}

setup