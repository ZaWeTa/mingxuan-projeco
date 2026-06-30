function d = gf_distance_int(a, b)
    % 计算两个0~7整数在GF(2^3)下的汉明距离（比较3位二进制）
    diff = bitxor(a, b);
    d = sum(bitget(diff, 1:3));  % 取低3位中1的个数
end