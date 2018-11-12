clc
clear all;
N=128;
n=0:N-1;
t=0.001*n;
df = 1/64;
x=sin(2*pi*0.15*n)+cos(2*pi*(0.15+df)*n)+cos(2*pi*(0.15+2*df)*n);
subplot(2,1,1);stem(t,x,'.');title('signal x(n)');grid;
X=fft(x,N);
magx=abs(X(1:1:N/2+1));k=[0:1:N/2];w=2*pi/N*k;
subplot(2,1,2);plot(w/pi,magx);title('FFT N=128 df=1/64');
xlabel('ÆµÂÊ(µ¥Î»£ºpi)');ylabel('|X|');grid;