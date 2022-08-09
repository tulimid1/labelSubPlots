%% Using labelSubPlots

clear; clc; close all
cd('/Users/duncan/Documents/GitHub/labelSubPlots'); 

%% Example 1 
% 2 x 2 subplot 
figure();
x=linspace(0,2*pi);
for i = 1:4 
    subplot(2,2,i)
    plot(x,cos(x));
end
labelSubPlots();
% darkBackground();
% auto_save('ex1'); 

%% Example 2 
% 2 x 2 subplot with 3 axes 
figure();
x=linspace(0,2*pi);
subplot(2,2,1)
plot(x,cos(x));
subplot(2,2,2)
plot(x,cos(x));
subplot(2,2,[3 4])
plot(x,cos(x));

labelSubPlots();
% darkBackground();
% auto_save('ex2'); 

%% Example 3 
% number labels 
figure();
x=linspace(0,2*pi);
for i = 1:4 
    subplot(2,2,i)
    plot(x,cos(x));
end
labelSubPlots('assignments', ['1' '2' '3' '4']);
% darkBackground();
% auto_save('ex3'); 

%% Example 4 
% Better position for 2x2 grid 
figure();
x=linspace(0,2*pi);
for i = 1:4 
    subplot(2,2,i)
    plot(x,cos(x));
end
labelSubPlots('assignPosX', -0.2, 'assignPosY', 1.2);
% darkBackground();
% auto_save('ex4'); 

%% Example 5 
% Lower on y-axis, but separate x-axis positions 
figure();
x=linspace(0,2*pi);
for i = 1:4 
    subplot(2,2,i)
    plot(x,cos(x));
end
labelSubPlots('assignPosY', 1, 'assignPosX', -0.2:0.1:0.1);
% darkBackground();
% auto_save('ex5'); 
