function zoomOut_singlecolor = zoomOut_singlecolor(matrixSingleColor)
    [row,col] = size(matrixSingleColor);
    matriks_temp = uint8(zeros(floor(row/2),floor(col/2)));

    for i=1:floor(row/2)
       for j=1:floor(col/2)
           matriks_temp(i,j) = uint8((int32(matrixSingleColor(i*2-1,j*2-1)) + int32(matrixSingleColor(i*2-1,j*2)) + int32(matrixSingleColor(i*2,j*2-1)) + int32(matrixSingleColor(i*2,j*2)))/4);
       end
    end
    zoomOut_singlecolor = matriks_temp;
end