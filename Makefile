.PHONY: clean distclean default

export SHELL := /bin/bash

ifeq ($(shell uname -s), Linux)
export PATH := /usr/include/llvm-5.0:$(PATH)
endif

export PATH := /usr/lib/llvm-5.0/:$(PATH)

CXXFLAGS=-Wall -g -std=c++11 `llvm-config --cxxflags`
LDFLAGS=`llvm-config --ldflags --system-libs --libs all`

default: minibasic

parser.hpp parser.cpp: parser.y
	bison -dv -o parser.cpp parser.y

lexer.cpp: lexer.l
	flex -s -o lexer.cpp lexer.l

parser.o: parser.cpp parser.hpp ast.hpp

lexer.o: lexer.cpp parser.hpp

ast.o: ast.cpp ast.hpp

%.o: %.cpp
	$(CXX) $(CXXFLAGS) -c $<

minibasic: lexer.o parser.o ast.o
	$(CXX) $(CXXFLAGS) -o minibasic $^ $(LDFLAGS) -lfl

clean:
	$(RM) lexer.cpp parser.cpp parser.hpp parser.output a.* *.o *~

distclean: clean
	$(RM) minibasic
