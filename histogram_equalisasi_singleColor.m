function histogram = histogram_equalisasi_singleColor(matrixSingleColor, indexTertinggiBaru, indexTerendahBaru)
    hist = histogram_singleColor(matrixSingleColor);
    
    indexTertinggi = max(matrixSingleColor(:));
    indexTerendah = min(matrixSingleColor(:));
    jarakLama = int32(indexTertinggi - indexTerendah);
    jarakBaru = int32(indexTertinggiBaru - indexTerendahBaru);
    
    histEq = zeros(256,1);
    
    % X/jarakBaru = i/jarakLama => X = (i*jarakBaru)/jarakLama
    for i = 1 : 256
        if hist(i) ~= 0
            x = uint8(round((int32(i)*jarakBaru)/jarakLama));
            if x == 0
                x = 1;
            end
            x = x + indexTerendahBaru;
            histEq(x) = histEq(x) + hist(i);
        end
    end

    histogram = histEq;
end