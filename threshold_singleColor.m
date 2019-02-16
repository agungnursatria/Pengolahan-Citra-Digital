% Threshold
function threshold_singleColor = threshold_singleColor(img, batasBawah, batasAtas)
    [row,col] = size(img);
    newImg = zeros(row,col);
    
    for r=1:row
       for c=1:col
           if img(r,c) >= batasBawah && img(r,c) <= batasAtas
               newImg(r,c) = 255;
           else
               newImg(r,c) = 0;
           end
       end
    end

    threshold_singleColor = newImg;
end