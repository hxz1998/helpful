% 使用hamming窗函数来完成
% 要求Rs = 50, 通带宽度为w = wp - ws = 0.628
% hamming窗在N=40时才符合要求
clear;
clc;
wp = 0.3*pi;
ws = 0.5*pi;
rp = 0.25;
rs = 50;

% 第一问第二问
% N 取15、45
% N = 45;
N = 15;
wc = (wp+ws)/2;
n = [0:1:N - 1];
hd = ideal_lp(wc, N);
if N == 15
    w_result = (hanning(N))';
    h = hd .* w_result;
    [db, mag, pha, grd, w] = freqz_m(h, 1);
    subplot(3, 1, 1)
    plot(n, h);
    title('脉冲响应');
    xlabel('n')
    ylabel('h');
    subplot(3, 1, 2);

    % 问题来了，怎么画频率响应？是直接画幅频特性么？
    plot(w/pi, db);
    title('频率响应(幅频特性曲线)');
    xlabel('\omega/\pi');
    ylabel('db');
    
    % 相频特性
    subplot(3, 1, 3);
    plot(w/pi, pha);
    title('相频特性曲线');
    xlabel('\omega/\pi');
    ylabel('pha');
elseif N == 45
    w_result = (hamming(N))';
%     w_result = (blackman(N))';
    h = hd .* w_result;
    [db, mag, pha, grd, w_result] = freqz_m(h, 1);
    subplot(2, 1, 1);
    % 问题来了，怎么画频率响应？是直接画幅频特性么？
    plot(w_result/pi, db);
    title('频率响应');
    xlabel('\omega/\pi');
    ylabel('db');
    subplot(2, 1, 2);
    plot(w_result/pi, pha);
    title('相频特性曲线');
    xlabel('\omega/\pi');
    ylabel('pha');
end

% 第三问
% N = 15;
% wc = (wp+ws)/2;
% n = [0:1:N - 1];
% hd = ideal_lp(wc, N);
% w_result = (hamming(N))';
% h = hd .* w_result;
% [db, mag, pha, grd, w] = freqz_m(h, 1);
% 
% plot(w/pi, db, 'r');hold on;
% title('频率响应(幅频特性曲线)');
% xlabel('\omega/\pi');
% ylabel('db');
% 
% N = 45;
% hd = ideal_lp(wc, N);
% w_result = (hamming(N))';
% h = hd .* w_result;   
% [db, mag, pha, grd, w_result] = freqz_m(h, 1);
% plot(w_result/pi, db);
% title('频率响应');
% xlabel('\omega/\pi');
% ylabel('db');
% 
% 
% w_result = (blackman(N))';
% hd = ideal_lp(wc, N);
% h = hd .* w_result;
% [db, mag, pha, grd, w_result] = freqz_m(h, 1);
% plot(w_result/pi, db, 'k');
% title('频率响应');
% xlabel('\omega/\pi');
% ylabel('db');
% legend('N=15,hamming','N=45,hamming', 'N=45, blackman');
