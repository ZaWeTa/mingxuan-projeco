function interpret_msg = rs_decode_int(in_code, all_code_msg, all_msg)
    % 最小距离译码（纯整数版）
    num_cw = size(all_code_msg, 1);
    dist = zeros(num_cw, 1);
    
    for i = 1:num_cw
        d = 0;
        for j = 1:7
            d = d + gf_distance_int(in_code(j), all_code_msg(i, j));
        end
        dist(i) = d;
    end
    
    [~, idx] = min(dist);
    interpret_msg = all_msg(idx, :);
end