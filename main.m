close all;
clear;
clc;

path = 'data/nsin.txt';
[t, send_signal] = textread(path);
fs = 1 / (t(2) - t(1)); % ����Ƶ��

[SEND_SIGNAL, f_send_shift] = t2f(send_signal, fs); % �������źŵ�Ƶ��
send_signal_mean = mean(send_signal);
send_signal_std = std(send_signal);
send_signal_autocorr = xcorr(send_signal);
% ����ά��-���ն����������ź�����غ�����Ƶ��õ��������ܶ�
[send_signal_PSD, f_send_PSD_shift] = t2f(send_signal_autocorr, fs); 

receive_signal = MatchedFilter(send_signal); % �������ź�ƥ���˲�

receive_signal_mean = mean(receive_signal);
receive_signal_std = std(receive_signal);
receive_signal_autocorr = xcorr(receive_signal);
% ����ά��-���ն���������ź�����غ�����Ƶ��õ��������ܶ�
[receive_signal_PSD, f_receive_PSD_shift] = t2f(receive_signal_autocorr, fs); 

% ��ͼ��
figure;
subplot(2, 1, 1);
plot(t, send_signal);
title('�����ź�');
xlabel('t/s');
ylabel('A');
subplot(2, 1, 2);
plot(f_send_shift, abs(SEND_SIGNAL));
title('�����ź�Ƶ��ͼ');
xlabel('f/Hz');
ylabel('A');
set(gca, 'XLim', [-5, 5]);

figure;
plot(2 * t, receive_signal(1:2:end));
title('ƥ���˲�����ź�');
xlabel('t/s');
ylabel('A');

figure;
subplot(2, 1, 1);
plot(2 * t, send_signal_autocorr(1:2:end));
title('�����ź�����غ���');
xlabel('t/s');
ylabel('A');
subplot(2, 1, 2);
plot(4 * t, receive_signal_autocorr(1:4:end));
title('ƥ���˲����ź�����غ���');
xlabel('t/s');
ylabel('A');

figure;
subplot(2, 1, 1);
plot(f_send_PSD_shift, abs(send_signal_PSD));
title('�����źŹ������ܶ�');
xlabel('f/Hz');
ylabel('A');
set(gca, 'XLim', [-2, 2]);
subplot(2, 1, 2);
plot(f_receive_PSD_shift, abs(receive_signal_PSD));
title('ƥ���˲����źŹ������ܶ�');
xlabel('f/Hz');
ylabel('A');
set(gca, 'XLim', [-2, 2]);
