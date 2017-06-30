#! /usr/bin/python3

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

import json
import sys
import numpy as np

with open(sys.argv[1]) as data_file:    
    data = json.load(data_file)
    
print(data['start']['connected'])

#print(float(data['intervals'][0]['sum']['bits_per_second'])  float(data['intervals'][0]['sum']['bits_per_second']) +1)

print(np.mean([x['sum']['bits_per_second'] for x in data['intervals']]))
print(len([x['sum']['bits_per_second'] for x in data['intervals']]))
print(len(data['intervals']))
print(sum([x['sum']['bits_per_second'] for x in data['intervals']])/len(data['intervals']))


#i = 0
#speed = 0
#for interval in data['intervals']:
#    i += 1
    

