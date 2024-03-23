Verilog_LPF = [];

for i = 1:32
    if (low_pass_filter(i) >= 0)
        Verilog_LPF(i) = low_pass_filter(i);
    else
        Verilog_LPF(i) = 0;
    end
end

figure;
stem(Verilog_LPF, 'b', 'MarkerSize', 1);
hold on
plot(Verilog_LPF, 'r', 'LineWidth', 2);
hold off
title('Filter Coefficients in Time Domain');
xlabel('Index');
ylabel('Coefficient Value');
grid on;

bits = 8;
new_filter = [];

for i = 1:32
    var = round(Verilog_LPF(i) * 255);
    new_filter{i} = dec2bin(var, bits);
end

disp(new_filter)
