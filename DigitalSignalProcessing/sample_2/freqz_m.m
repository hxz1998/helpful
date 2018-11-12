function[db, mag, pha, grd, w] = freqz_m(bz, az)
[H, w] = freqz(bz, az, 1000, 'whole');
H = (H(1:1:501))';
w = (w(1:1:501))';
mag = abs(H);
db = 20 * log10((mag+eps)/max(mag));
pha = angle(H);
grd = grpdelay(bz, az, w);