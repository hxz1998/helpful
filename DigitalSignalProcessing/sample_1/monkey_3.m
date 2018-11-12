clc;
clear all;
t=0:0.001:0.8;
x=sin(2*pi*50*t)+sin(2*pi*120*t);
y=x+0.5*randn(1,length(t));
N = 256;
Y=fft(y,N);
P=Y.*conj(Y)/N; %求功率谱
k=[0:1:N/2];w=2*pi/N*k;
subplot(2,1,1);
plot(w/pi,P(1:N/2+1));title('FFT N=256');
xlabel('频率(单位：pi)');ylabel('P');grid;
subplot(2,1,2);
plot(t, x)
title('时域')