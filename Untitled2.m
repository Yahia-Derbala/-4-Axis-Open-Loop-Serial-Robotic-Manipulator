clear all
clc
delete(instrfindall);
arduino=serial('COM4','BaudRate',9600,'DataBits',8);
InputBufferSize = 8;
Timeout = 0.1;
set(arduino , 'InputBufferSize', InputBufferSize);
set(arduino , 'Timeout', Timeout);
set(arduino , 'Terminator', 'CR');
fopen(arduino);
pause(0.5)
while 1
    desPosition = input('Enter desired position: ');
    curPosition=str2num(fscanf(arduino,'%s'))
    distanceToMove = desPosition - curPosition;
    stepsToMove = distanceToMove * 160;
    if stepsToMove<0
        s1= ['0' num2str(abs(stepsToMove)) '>']
        fprintf(arduino,s1)
    elseif stepsToMove>=0
        s2= ['1' num2str(stepsToMove) '>']
        fprintf(arduino,s2)
    end
end

fclose(arduino);