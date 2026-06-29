function c = gf_mul_int(a, b)
    % GF(2^3) 乘法，基于本原多项式 x^3 + x + 1
    if a == 0 || b == 0
        c = 0;
        return;
    end
    
    % 幂次表: 2^0=1, 2^1=2, 2^2=4, 2^3=3, 2^4=6, 2^5=7, 2^6=5
    exp_tab = [1, 2, 4, 3, 6, 7, 5];
    % 对数表: 索引为数值，值为指数（索引0占位）
    log_tab = [0, 0, 1, 3, 2, 6, 4, 5];  % log_tab[1]=0, log_tab[2]=1, ...
    
    exp_sum = log_tab(a + 1) + log_tab(b + 1);
    exp_sum = mod(exp_sum, 7);
    c = exp_tab(exp_sum + 1);
end