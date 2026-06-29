%% main_RS73_int.m - 组长负责：系统主流程（纯整数版）
clear; clc;

% 1. 生成所有可能信号源（组员4负责）
[all_msg, all_code_msg] = generate_codebook_int();

% 2. 产生5组随机的3位8进制信息
msg = floor(rand(5, 3) * 8);
fprintf('原始信息序列(十进制):\n');
disp(msg);

% 3. RS编码（组员1负责）
code = rs_encode_int(msg);
fprintf('编码后的RS(7,3)码:\n');
disp(code);

% 4. 模拟信道：添加噪声（污染后2位）
noise = [zeros(5,5), floor(rand(5,2)*8)];
in_msg = bitxor(code, noise);  % GF加法 = 异或
fprintf('接收到的带噪信号:\n');
disp(in_msg);

% 5. 译码（组员3负责）
new_msg = zeros(5, 3);
for ii = 1:5
    new_msg(ii, :) = rs_decode_int(in_msg(ii, :), all_code_msg, all_msg);
end
fprintf('译码输出序列:\n');
disp(new_msg);

% 6. 统计正确率（组员4负责）
correct_num = check_accuracy_int(msg, new_msg);
rate = correct_num / 15;
fprintf('本次仿真译码正确率为: %.2f%%\n', rate * 100);