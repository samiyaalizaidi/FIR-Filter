% open the text file
file_10 = fopen('Output-Filtered/log-10KHz.txt', 'r');

% read the data
data = textscan(file_10, 'Time: %f, Data_sin: %d, Filtered_Output: %d');

% close the file
fclose(file_10);

% extract the data
time = data{1};
data_sin = data{2};
Data_Out = data{3}./255;

% plot the graphs
figure;
plot(time, data_sin, "r", "LineWidth", 2);
hold on
plot(time, Data_Out, "b", "LineWidth", 1);
hold off

% add relevant labels
legend('Original', 'Filtered');
xlabel('Time');
ylabel('Amplitude');
title('Filtered Output at 10KHz');

grid on;
