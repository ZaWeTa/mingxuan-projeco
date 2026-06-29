function code = rs_encode_int(msg)
    % 输入: msg 为 Nx3 的整数矩阵（0~7）
    % 输出: code 为 Nx7 的RS编码结果
    g = rs_get_generator_int();  % 调用组长的参数
    N = size(msg, 1);
    code = zeros(N, 7);
    
    for i = 1:N
        for j = 1:7
            sum_val = 0;
            for k = 1:3
                % GF(2^3) 乘法 + 加法（异或）
                sum_val = bitxor(sum_val, gf_mul_int(msg(i, k), g(k, j)));
            end
            code(i, j) = sum_val;
        end
    end
end