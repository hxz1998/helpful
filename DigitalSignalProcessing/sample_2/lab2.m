% 双线性变换法设计ChebyshevI型高通滤波器
% 技术要求：
% 通带截至频率：fp = 300hz， 通带最大衰减：1.2db
% 阻带截至频率：fs = 200hz， 阻带最小衰减：20db
% 采样周期：0.001s
clear;
clc;
clf;
fp = 300;
rp = 1.2;
fs = 200;
rs = 20;
T = 0.001;
digit_wp = 2*pi*fp*T;
digit_ws = 2*pi*fs*T;
%预畸变
digit_wp = 2/T*tan(digit_wp/2);
digit_ws = 2/T*tan(digit_ws/2);
[n, wn] = cheb1ord(digit_wp, digit_ws, rp, rs, 's');
[b, a] = cheby1(n, rp, wn, 'high', 's');
[bz, az] = bilinear(b, a, 1/T);
[db, mag, pha, grd, w] = freqz_m(bz, az);
plot(w/pi, db);
axis([0, 1, -30, 2])