clc; 
close all;
clear all;

l = [0:5]; 
a = 0.5 .^ l; 
b = [1]; 

[H,w] = freqz(b,a,100);
magH = abs(H); 
phaH = angle(H)*180/pi;

Hf_1 = figure;
subplot(2,1,1); 
plot(w/pi,magH,'LineWidth',1.5); 
axis([-1 1 0 1.8]);
wtick = [0:0.2:1]; 
magtick = [0:0.2:1.8];
xlabel('\omega / \pi'); ylabel('|H|');
title(['Magnitude Response']); grid on; grid minor;
set(gca,'XTick',wtick); 
set(gca,'YTick',magtick);

subplot(2,1,2); 
plot(w/pi,phaH,'LineWidth',1.5); 
axis([-1 1 -180 180]);
wtick = [0:0.2:1]; 
magtick = [-180:60:180];
xlabel('\omega / \pi'); ylabel('Degrees');
title(['Phase Response']); grid on; grid minor;
set(gca,'XTick',wtick); 
set(gca,'YTick',magtick);