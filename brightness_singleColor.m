function brightness = brightness_singleColor(matrixSingleColor, value, pilihan)
    if strcmp(pilihan,'Tambah')
        brightness = matrixSingleColor + value;
    elseif strcmp(pilihan,'Kurang')
        brightness = matrixSingleColor - value;
    elseif strcmp(pilihan,'Bagi')
        brightness = matrixSingleColor / value;
    elseif strcmp(pilihan,'Kali')
        brightness = matrixSingleColor * value;
    end
end