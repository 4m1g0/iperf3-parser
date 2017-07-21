#! /usr/bin/bash

#
# main.py - Entry point for the application
# Copyright 2017 Oscar Blanco.
#
# This library is free software; you can redistribute it and/or modify
# it under the terms of the GNU Lesser General Public License version
# 2.1 as published by the Free Software Foundation.
#
# This library is distributed in the hope that it will be useful, but
# WITHOUT ANY WARRANTY; without even the implied warranty of
# MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the GNU
# Lesser General Public License for more details.
#
# You should have received a copy of the GNU Lesser General Public
# License along with this library; if not, write to the Free Software
# Foundation, Inc., 51 Franklin Street, Fifth Floor, Boston, MA
# 02110-1301 USA
#

if [ $# -ne 2 ]
then
    echo graphGen template.html iperf3Data.json
fi

htmlName=$(sed s/json/html/ <<< $(basename $2))
pngName=$(sed s/json/png/ <<< $(basename $2))
./compile.sh $1 $2 bin/$htmlName
./phantomjs phantomScript.js bin/$htmlName images/$pngName
