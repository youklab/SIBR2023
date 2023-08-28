% File name: replace 'your_excel_file.xlsx' with the actual file's name
filename = 'your_excel_file.xlsx';

% Example:
% filename = 'Low_sampling.xlsx'; 

% Read the first two columns of data from the first sheet
data = xlsread(filename, 1, 'A:B');

x = data(:,1);  % 1st column of data 
y = data(:,2);  % 2nd column of data


% ======= Moving average: arithmetic mean ========= %


N = 200; % Window size for moving average (you can adjust this value as needed)
y_avg = movmean(y, N);

figure(1) % Create a new figure
plot(x, y, 'ko'); % Plot original data points 
hold on; % Retain current plot
xlabel('GFP'); 
ylabel('mCherry'); 
title('Plot on linear scale'); % Title for the plot
legend('Data'); % Legend for data
grid on; % Display grid


figure(2) 
loglog(x, y, 'ko'); 
hold on; 
xlabel('GFP'); 
ylabel('mCherry'); 
title('Plot on log-log scale'); 
legend('Data'); 
grid on; 


%{

figure(3) % Create a new figure
plot(x, y, 'ko'); % Plot original data points 
hold on; % Retain current plot
plot(x, y_avg, 'r-', 'LineWidth', 2); % Plot moving average as a smooth red curve
xlabel('GFP'); 
ylabel('mCherry'); 
title('Plot of with moving average'); % Title for the plot
legend('Data', 'moving Average'); % Legend to distinguish between original data and moving average
grid on; % Display grid


figure(4) % Create a new figure
loglog(x, y, 'ko'); % Plot original data points 
hold on; % Retain current plot
loglog(x, y_avg, 'r-', 'LineWidth', 2); % Plot moving average as a smooth red curve
xlabel('GFP'); 
ylabel('mCherry'); 
title('Plot of with moving average'); % Title for the plot
legend('Data', 'moving Average'); % Legend to distinguish between original data and moving average
grid on; % Display grid
%}