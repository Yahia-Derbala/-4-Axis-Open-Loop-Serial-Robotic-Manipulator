clc; 
clear all; 
close all;
Pos = thingSpeakRead(1394579,'Fields',[5,6,7],'OutputFormat','table')
PosTable=Pos(:,2:4)
PosArray = table2array(PosTable)
X=PosArray(1)
Y=PosArray(2)
Z=PosArray(3)
GetIKINE(X,Y,Z)
function [th1,th2,th3,th4] = GetIKINE(X,Y,Z)

L(1) = Link([0 0 0 0]) ;
L(2) = Link([0 50 0 -pi/2]) ;
L(3) = Link([0 0 140 0]) ;
L(4) = Link([0 0 180 0]) ;
L(5) = Link([0 0 100 0]);

manipulator = SerialLink(L) 
manipulator.name = 'Arm' 

T = [ 1 0 0 X;
      0 1 0 Y;
      0 0 1 Z;
      0 0 0 1]
  
angles = manipulator.ikine(T, [0 0 0 0], 'mask',[1 1 1 0 0 0]) * 180/pi 
th1 = angles(1) 
th2 = angles(2) 
th3 = angles(3) 
th4 = angles(4) 


manipulator.plot(angles*pi/180)

end
