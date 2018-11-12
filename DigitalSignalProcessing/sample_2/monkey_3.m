% 数字带通滤波器
% 通频带  0.25~0.45p 通带最大衰减为3db
% 阻带： < 0.15p ||  > 0.55p 阻带最小衰减为15db
% 使用butterworth和ellip模拟低通滤波器
clear;
clc;
clf;
rp = 3;
rs = 15;
wp1 = 0.25*pi;% ---ws1---wp1---wp2---ws2
wp2 = 0.45*pi;
ws1 = 0.15*pi;
ws2 = 0.55*pi;
T = 0.001;
wp1 = wp1/T;    % 脉冲响应不变法转换
wp2 = wp2/T;
ws1 = ws1/T;
ws2 = ws2/T;
wp = [wp1, wp2];
ws = [ws1, ws2];
[n, wn] = buttord(wp, ws, rp, rs, 's'); % 巴特沃斯
[z, p, k] = buttap(n);
[b, a] = zp2tf(z, p, k);axis
w0 = sqrt(wp1*wp2);
bw = wp2-wp1;
[b1, a1] = lp2bp(b, a, w0, bw);
[db, mag, pha, grd, w] = freqz_m(bz, az);
subplot(2, 1, 1);
plot(w/pi, db);axis([0, 1, -50, 10])
title('巴特沃斯带通滤波器')

% 椭圆滤波器的绘制, 重新赋值重新开始
wp1 = 0.25*pi;% ---ws1---wp1---wp2---ws2
wp2 = 0.45*pi;
ws1 = 0.15*pi;
ws2 = 0.55*pi;
wp1 = 2/T*tan(wp1/2); % 双线性变换法
wp2 = 2/T*tan(wp2/2);
ws1 = 2/T*tan(ws1/2);
ws2 = 2/T*tan(ws2/2);
[n, wn] = ellipord(wp, ws, rp, rs, 's');
[z, p, k] = ellipap(n, rp, rs);
[b, a] = zp2tf(z, p, k);
w0 = sqrt(wp1*wp2);
bw = wp2 - wp1;
[b1, a1] = lp2bp(b, a, w0, bw);
[bz, az] = bilinear(b1, a1, 1/T);
[db, mag, pha, grd, w] = freqz_m(bz, az);
subplot(2, 1, 2);
plot(w/pi, db);
axis([0, 1, -30, 10]);
title('椭圆滤波器')