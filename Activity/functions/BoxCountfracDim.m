function dim_val=BoxCountfracDim(im)
%Calculate the Box count fractal dimension
%This code is based on the original Hausdorff (Box-Counting fractal
%dimension) from Alceu Costa at https://www.mathworks.com/matlabcentral/fileexchange/30329-hausdorff--box-counting--fractal-dimension
%However, it deploy the multi-resolution calculation to significantly boost
%the speed of the code by a factor of 2
%Input:
%   im: input image
%Output:
%   dim_val: value of the fractal dimension
%Note:
%    Returns the Haussdorf fractal dimension D of an object represented by the
%    binary image I. Nonzero pixels belong to an object and 0 pixels 
%    constitute the background.
%
%    Algorithm
%    ---------
%    1 - Pad the image with background pixels so that its dimensions are a 
%        power of 2.
%    2 - Set the box size 'e' to the size of the image.
%    3 - Compute N(e), which corresponds to the number of boxes of size 'e' 
%        which contains at least one object pixel.
%    4 - If e > 1 then e = e / 2 and repeat step 3.
%    5 - Compute the points log(N(e)) x log(1/e) and use the least squares 
%        method to fit a line to the points.
%    6 - The returned Haussdorf fractal dimension D is the slope of the line.
%Author: Tan H. Nguyen
%University of Illinois at Urbana-Champaign
    %First, padd the image with 0 to make its dimension a power of 2
    newdim = 2^max(nextpow2(size(im)));
    im_pad = padarray(im,[newdim-size(im,1) newdim-size(im,2)],0,'post');
   h3= figure(1);set(h3, 'Visible', 'off');
    imagesc(im_pad);
    maxpow2 = log2(newdim);
    boxCount_arr = zeros(1,maxpow2+1);
    res_arr = zeros(1,maxpow2+1);
    curboxsize = newdim;
    boxCount_arr(1)=1;
    res_arr(1)=1.0/curboxsize;
    curim = im_pad;
    for idx = 1:maxpow2
        sum_val = sum(curim(:));%Go with the finest scale to the coarsest
        boxCount_arr(2+maxpow2-idx)=sum_val;
        res_arr(2+maxpow2-idx)=2^(-(idx-1));
        curim = ((curim(1:2:end,1:2:end)+curim(1:2:end,2:2:end)+curim(2:2:end,1:2:end)+curim(2:2:end,2:2:end))>0);
    end
    D = polyfit(log(res_arr), log(boxCount_arr), 1);
    dim_val = D(1);
    
end


