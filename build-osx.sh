#!/bin/sh
mkdir -p GOG.gml/x86
mkdir -p GOG.gml/x64
mkdir -p GOG.gml.gmx/extensions/GOG.gml/x86
mkdir -p GOG.gml.gmx/extensions/GOG.gml/x64
g++ -m32 -O3 -fPIC -g -c -o GOG.gml/x86/GOG.gml.o GOG.gml/GOG.gml.cpp -std=c++11
g++ -m32 GOG.gml/x86/GOG.gml.o -shared -o GOG.gml.gmx/extensions/GOG.gml/x86/GOG.gml.dylib -Wl,-rpath,../Resources/ -LGOG/Libraries -lgalaxy
g++ -m64 -O3 -fPIC -g -c -o GOG.gml/x64/GOG.gml.o GOG.gml/GOG.gml.cpp -std=c++11
g++ -m64 GOG.gml/x64/GOG.gml.o -shared -o GOG.gml.gmx/extensions/GOG.gml/x64/GOG.gml.dylib -Wl,-rpath,../Resources/ -LGOG/Libraries -lgalaxy
lipo -create GOG.gml.gmx/extensions/GOG.gml/x86/GOG.gml.dylib GOG.gml.gmx/extensions/GOG.gml/x64/GOG.gml.dylib -output GOG.gml.gmx/extensions/GOG.gml/GOG.gml.dylib
cp GOG/Libraries/libGalaxy.dylib GOG.gml.gmx/extensions/GOG.gml/libGalaxy.dylib