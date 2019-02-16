function histogram = histogram_singleColor(matrixSingleColor)
    [x,y] = size(matrixSingleColor);
    hist = zeros(256,1);
    
    for i = 0 : 255
        hist(i+1) = numel(find(matrixSingleColor == i));
    end
    
    histogram = hist;
end