function [ x_vec,y_vec,x_dash_vec,y_dash_vec ] = extractPairsFromRectifiedDisparityMap( silhouetteIm, bestshiftsL )
%EXTRACTPAIRSFROMRECTIFIEDDISPARITYMAP extract left and right corresponding points from disparity map 
%  all returned parameters are num_silhouette_elements x 1 vectors
num_silhouette_elements = sum(sum(silhouetteIm));
x_vec = ones(num_silhouette_elements,1);
y_vec = ones(num_silhouette_elements,1);
x_dash_vec = ones(num_silhouette_elements,1);
y_dash_vec = ones(num_silhouette_elements,1);

idx = 1;
for i=1:size( silhouetteIm,2 )
    for j=1:size( silhouetteIm,1 )
        if( (silhouetteIm(j,i) == 1) && mod(i,8) == 0 )
            x_vec(idx) = i;
            x_dash_vec(idx) = i + bestshiftsL(j,i);
            y_vec(idx) = j;
            y_dash_vec(idx) = j;
            idx = idx+1;
        end
    end
end

end

