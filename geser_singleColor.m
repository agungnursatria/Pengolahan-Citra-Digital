function geser_singleColor = geser_singleColor(matrixSingleColor, valueGeser, arah)
    [y,x] = size(matrixSingleColor);
    
    % Menyediakan matriks kosong dengna ukuran sama seperti matrixSingleColor
    matrix_temp = uint8(zeros(x,y));
    
    if strcmp(arah,'Kanan')
        % Kanan -> Mengisi index setelah nilai geser dengan angka dari indeks
        % pertama
        for i=valueGeser+1:x
            matrix_temp(:,i) = matrixSingleColor(:,i-valueGeser); 
        end
    elseif strcmp(arah,'Kiri')
        % Kiri -> Mengisi index dari pertama sampai dengan indeks terakhir
        % - value geser, dengan nilai dari index setelah value geser
        for i=1:x-valueGeser
            matrix_temp(:,i) = matrixSingleColor(:,i+valueGeser); 
        end
    elseif strcmp(arah,'Atas')
        % Atas -> Mengisi index dari pertama sampai dengan indeks terakhir
        % - value geser, dengan nilai dari index setelah value geser
        for i=1:y-valueGeser
            matrix_temp(i,:) = matrixSingleColor(i+valueGeser,:); 
        end
    elseif strcmp(arah,'Bawah')
        % Bawah -> Mengisi index setelah nilai geser dengan angka dari indeks
        % pertama
        for i=valueGeser+1:y
            matrix_temp(i,:) = matrixSingleColor(i-valueGeser,:); 
        end
    end
    
    geser_singleColor = matrix_temp;  
end