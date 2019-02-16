function zoomIn_singlecolor = zoomIn_singlecolor(matrixSingleColor)
    [row,col] = size(matrixSingleColor);
    matriks_temp = uint8(zeros(row*2,col*2));
    for i=1:row
       for j=1:col
            matriks_temp(i*2-1,j*2-1) = matrixSingleColor(i,j); 
            matriks_temp(i*2-1,j*2) = matrixSingleColor(i,j);
            matriks_temp(i*2,j*2-1) = matrixSingleColor(i,j);
            matriks_temp(i*2,j*2) = matrixSingleColor(i,j);
       end
    end
    zoomIn_singlecolor = matriks_temp;
end