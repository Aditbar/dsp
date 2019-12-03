clear all
close all
clc

n = [0:50]; 
a = [1 0 0.81^2 0 0.81^4 0 0.81^6]; 
b = [1 0 1 0 1 0 1];
w = [pi]; 
A = [1]; 
theta = [0];
 
[H] = freqresp(b,a,w);
 
magH = abs(H);
phaH = angle(H); 

mag = A.*magH; 
pha = phaH+theta; 

term1 = w'*n;
term2 = pha'*ones(1,length(n)); 
cos_term = cos(term1+term2); 

y1 = mag*cos_term;
x = cos(pi*n); 
y2 = filter(b,a,x);

Hf_1 = figure;
subplot(2,1,1); 
Hs = stem(n,y1,'filled'); 
axis([-1 51 -2 2]);
xlabel('n');
title(['SS response y_{ss}(n) untuk x(n) = cos(\pi \times n)']);
ytick = [-2:0.5:2];  
ylabel('y(n)'); grid on; grid minor;

subplot(2,1,2); 
Hs = stem(n,y2,'filled'); 
axis([-1 51 -2 2]);
xlabel('n');
title(['Output response y(n) menggunakan filter fungsi']);
ytick = [-2:0.5:2];  
ylabel('y(n)'); grid on; grid minor;