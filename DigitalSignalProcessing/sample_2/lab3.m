% 双线性变换法设计ChebyshevI型带通滤波器
% 技术要求：
% 通频带：wp1~wp2：0.4*pi~0.6*pi（单位：弧度） 最大衰减：1db
% 阻带：ws1 = 0.2*pi（单位：弧度） ws2 = 0.8*pi（单位：弧度）最小衰减：40db
clear;
clc;
clf;
rp = 1;
wp1 = 0.4*pi;
wp2 = 0.6*pi;
rs = 40;
ws1 = 0.2*pi;
ws2 = 0.8*pi;
T = 0.001;
wp3 = 2/T*tan(wp1/2);
wp4 = 2/T*tan(wp2/2);
ws3 = 2/T*tan(ws1/2);
ws4 = 2/T*tan(ws2/2);
wp = [wp3, wp4];
ws = [ws3, ws4];
[n, wn] = cheb1ord(wp, ws, rp, rs, 's');
[z, p, k] = cheb1ap(n, rp);
[b, a] = zp2tf(z, p, k);
w0 = sqrt(wp3*wp4);
bw = wp4-wp3;
[b1, a1] = lp2bp(b, a, w0, bw);
[bz, az] = bilinear(b1, a1, 1/T);
[db, mag, pha, grd, w] = freqz_m(bz, az);
plot(w/pi, db);
axis([0, 1, -50, 2]);