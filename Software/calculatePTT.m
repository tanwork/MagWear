clear all;
close all;
clc;

% load data
load('GMR_output1.mat');
load('GMR_output2.mat');

% normalization 
a1= (a1-mean(a1)) / (max(a1)-min(a1));
a2 = (a2-mean(a2)) / (max(a2)-min(a2));

% filtering 
Fs = 100;
fc = 0.7; 
[b, a] = butter(2, fc/(Fs/2), 'low');
filtered_signal1 = filter(b, a, a1);
filtered_signal2 = filter(b, a, a2);

% Peak detection  
[y1, loc_filter1]=getPeak(filtered_signal1,0.6);
[y2, loc_filter2]=getPeak(filtered_signal2,0.6);

% Peak matching  
res= sequence_matching(loc_filter1, loc_filter2);

% res
PTT_value= abs(loc_filter1(res(:,1))-loc_filter2(res(:,2)));
mean_PTT_value= mean(PTT_value);

figure;
t = (0:length(filtered_signal1)-1) / Fs;
subplot(211)
plot(t,a1);
hold on
plot(t,a2);
grid on;
hold off;
set(gca, 'FontName', 'Times New Roman', 'FontSize', 20);
xlabel('Time (s)')
ylabel('Voltage (V)')
title('Raw signal')
yticks(-0.6:1.2:0.6);
xticks(0:2:8);

subplot(212)
plot(t, filtered_signal1, 'color', [146/255, 146/255, 146/255],'LineWidth', 1.5);
hold on;
plot(t, filtered_signal2, 'color', [0.843, 0.219, 0.180], 'LineWidth', 1.5);
plot(loc_filter1(res(:,1))/Fs,filtered_signal1(loc_filter1(res(:,1))), 'color', [146/255, 146/255, 146/255],'LineWidth', 1,'LineStyle', '--');
plot(loc_filter2(res(:,2))/Fs,filtered_signal2(loc_filter2(res(:,2))), 'color', [0.843, 0.219, 0.180],'LineWidth', 1,'LineStyle', '--');
grid on;
hold off;
yticks(-0.15:0.05:0.15);
xticks(0:2:8);
set(gca, 'FontName', 'Times New Roman', 'FontSize', 20);
xlabel('Time (s)')
ylabel('Voltage (V)')
title('Signal after filtering')
