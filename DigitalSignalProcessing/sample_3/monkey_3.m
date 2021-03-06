clear;
clc;
wp = 0.2*pi;
ws = 0.35*pi;
rp = 1;
rs = 50;
wc = 0.2*pi;
% N = 33;
% alpha = (N-1)/2;
% k = 0:N-1;
% wk = (2*pi/N)*k;
% Hk = [ones(1,5), 0.5, zeros(1, 22), 0.5, ones(1, 4)];
% angH = -alpha * 2 * pi / N * k;
% H = Hk.*exp(1i*angH);
% h = real(ifft(H, N));
% [db, mag, pha, grd, w] = freqz_m(h, 1);
% [Hr, ww, a, L] = Hr_Type1(h);
% plot(w/pi, db);;hold on;
% grid on;

% wp = 0.2*pi;
% ws = 0.35*pi;
% rp = 1;
% rs = 50;

wc = 0.2*pi;
N = 34;
alpha = (N-1)/2;
k = 0:N-1;
wk = (2*pi/N)*k;
Hk = [ones(1,4), 0.5925, 0.1099, zeros(1, 23), -0.1099, -0.5925, -ones(1, 3)];
angH = -alpha * (2 * pi) / N * k;
H = Hk.*exp(1i*angH);
h = real(ifft(H, N));
[db, mag, pha, grd, w] = freqz_m(h, 1);
[Hr, ww, a, L] = Hr_Type2(h);
plot(w/pi, db); 
axis([0, 1, -100, 10]);
grid on;
% 
% wc = 0.2*pi;
% N = 40;
% alpha = (N)/2;
% k = 0:N-1;
% wk = (2*pi/N)*k;
% Hk = [ones(1,5), 0.5925, 0.1099, zeros(1, 27), 0.1099, 0.5925, ones(1, 4)];
% angH = -alpha * 2 * pi / N * k;
% H = Hk.*exp(1i*angH);
% h = real(ifft(H, N));
% [db, mag, pha, grd, w] = freqz_m(h, 1);
% [Hr, ww, a, L] = Hr_Type2(h);
% plot(w/pi, db); 
% % axis([0, 1, -200, 10]);
% legend('N=33, 两个过渡点', 'N=34, 两个过渡点', 'N=40, 两个过渡点');
% grid on;