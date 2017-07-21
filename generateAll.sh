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
    echo generateAll template.html file*.json
fi

rm -f bin/*
rm -f images/*

for f in src/$2
do 
    echo "Processing $f..."
    ./graphGen.sh $1 $f
done

convert images/*.png report.pdf
#-resize 200×100
