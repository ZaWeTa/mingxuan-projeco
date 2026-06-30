function correct_num = check_accuracy_int(original, decoded)
    [N, M] = size(original);
    correct_num = 0;
    for i = 1:N
        for j = 1:M
            if original(i, j) == decoded(i, j)
                correct_num = correct_num + 1;
            end
        end
    end
end