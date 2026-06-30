function [all_msg, all_code_msg] = generate_codebook_int()
    % 生成 8^3=512 种所有可能的3位8进制信息
    [x, y, z] = ndgrid(0:7, 0:7, 0:7);
    all_msg = [z(:), y(:), x(:)];  % 512x3
    
    % 调用组员1编码函数生成对应512个正确码字
    all_code_msg = rs_encode_int(all_msg);
end