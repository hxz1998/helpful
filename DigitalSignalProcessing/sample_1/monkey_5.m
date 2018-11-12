clc;
clear all;
[y, Fs] = audioread('s8.wav');

N=1024;
X = fft(y, N);
magx=abs(X(1:1:N/2+1));
k=[0:1:N/2];w=2*pi/N*k;
plot(w/pi, magx)
grid on