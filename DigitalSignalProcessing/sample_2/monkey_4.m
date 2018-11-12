% 使用双线性变换法设计带宽为0.08*pi的10阶椭圆带阻滤波器
% 选择合适的阻带衰减值
% 画出幅度响应
clear;
clc;
clf;
wp1 = 0.39*pi;
wp2 = 0.50*pi;
ws1 = 0.4*pi;
ws2 = 0.49*pi;
rs = 40;
rp = 1;
T = 0.0001;
wp1 = 2/T*tan(wp1/2);
wp2 = 2/T*tan(wp2/2);
ws1 = 2/T*tan(ws1/2);
ws2 = 2/T*tan(ws2/2);
wp = [wp1, wp2];
ws = [ws1 ws2];
[n, wn] = ellipord(wp, ws, rp, rs, 's');
[z, p, k] = ellipap(10, rp, rs);
[b, a] = zp2tf(z, p, k);
bw = ws2-ws1;
w0 = sqrt(ws1*ws2);
[b1, a1] = lp2bs(b, a, w0, bw);
[bz, az] = bilinear(b1, a1, 1/T);
[db, ~, ~, ~, w] = freqz_m(bz, az);
subplot(2, 1, 1)
plot(w/pi, db);
xn = 2*sin(0.44*pi*[0:1:200]) + 0.5*sin(0.8*pi*[0:1:200]);
subplot(2, 1, 2);
plot([0:1:200], filter(bz, az, xn));