#!/bin/sh
try() {
  expected="$1"
  input="$2"

  ./9cc "$input" > tmp.s
  gcc -o tmp tmp.s
  ./tmp
  actual="$?"

  if [ "$actual" = "$expected" ]; then
    echo "$input => $actual"
  else
    echo "$input => $expected expected, but got $actual"
    exit 1
  fi
}

try 0 0
try 42 42
try 21 '5+20-4'
try 41 ' 12 + 34 - 5 '
try 47 '5+6*7'
try 4 '8/4*2'
try 20 '(8+2)*2'
try 10 '-10+20'
try 1 '10 == 10'
try 0 '9 == 10'
try 1  '8 != 10'
try 0  '10 != 10'
try 1  '2 <= 3'
try 1  '2 <= 2'
try 0  '2 <= 1'
try 1  '17 < 20'
try 0  '17 < 17'
try 0  '17 < 16'
try 1  '21 > 20'
try 0  '21 > 21'
try 0  '21 > 22'
try 0 '21 == 21 + 1'
try 1 '21 < 22 == 24 >= 14'

echo OK
