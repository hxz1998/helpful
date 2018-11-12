% 使用脉冲响应不变法和双线性变换法设计Butterworth数字低通滤波器
% 要求：fp = 200hz, rp = 1db, fs = 300hz, rs = 25db, T = 0.001s
clear;
clc;
clf;

fp = 200;
rp = 1;
fs = 300;
rs = 25;
T = 0.001;

% 双线性变换法：
% 转换为数字域数据
digit_wp = 2*pi*fp*T;
digit_ws = 2*pi*fs*T;
wp1 = 2*pi*fp;
ws1 = 2*pi*fs;
% 模拟的
[n, wn] = buttord(wp1, ws1, rp, rs, 's');
[b, a] = butter(n, wn, 's');
[db, mag, pha, w] = freqs_m(b, a, 2*500*pi);
% subplot(3, 1, 1);
plot(w/(2*pi), db, 'k');hold on;
axis([0, 500, -80, 3]);
% 预畸变
analog_wp = 2/T*tan(digit_wp/2);
analog_ws = 2/T*tan(digit_ws/2);
% 获取符合要求的阶数n和模拟滤波器的3db截至频率wn
[n, wn] = buttord(analog_wp, analog_ws, rp, rs, 's');
[b, a] = butter(n, wn, 'low', 's');
[bz, az] = bilinear(b, a, 1/T);
[db, ~, ~, ~, w] = freqz_m(bz, az);
% subplot(3, 1, 2);
plot(w/pi/2/T, db, 'r');
hold on;
analog_wp = digit_wp/T;
analog_ws = digit_ws/T;
% 脉冲响应不变法
[n_imp, wn_imp] = buttord(analog_wp, analog_ws, rp, rs, 's');
[b_imp, a_imp] = butter(n_imp, wn_imp, 'low', 's');
[bz_imp, az_imp] = impinvar(b_imp, a_imp, 1/T);
[db_imp, mag, pha, grd, w_imp] = freqz_m(bz_imp, az_imp);
% subplot(3, 1, 3);
plot(w_imp/pi/2/T, db_imp, 'b');
title('双线性-R--脉冲响应-B')
