function [] = Anurup()
%Anurup's Assignment on Denoising Image
%We are using a median filter of 3*3, 5*5, and 7*7 matrices to denoise.                        
tic                         %Checking time taken to execute code blocks            
Im=imread('Anurup.jpg');    
[r,c]=size(Im);
display(r);                 %Colour images have 3 8bit values of RGB for each pixel as evident when we dsiplay size
display(c);                     
Imgray=rgb2gray(Im);        %Converts image into grayscale with a 8 bit value denoting the pixel. 
Imnoisy = imnoise(Imgray, 'salt & pepper',0.1);     %Inserting noise manually to make the effect of denoising clearer.
[r,c]=size(Imnoisy);
display(r);
display(c);               
toc
tic

for i = 1:r                 %Iterating through each pixel value
    for j = 1:c
        xmin = max(1,i-1);  %This code block is necessary to limit pixels to the edge of the image and not get errors.
        xmax = min(r,i+1);
        ymin = max(1,j-1);
        ymax = min(c,j+1);
        temp = Imnoisy(xmin:xmax, ymin:ymax);   %The neighbouring matrix of the pixel is defined here.
        output3(i,j) = median(temp(:));         %Calculating pixel value as median3
        
        xmin = max(1,i-2);
        xmax = min(r,i+2);
        ymin = max(1,j-2);
        ymax = min(c,j+2);
        temp = Imnoisy(xmin:xmax, ymin:ymax);
        output5(i,j) = median(temp(:));         %Calculating pixel value as median5
        
        xmin = max(1,i-3);
        xmax = min(r,i+3);
        ymin = max(1,j-3);
        ymax = min(c,j+3);
        temp = Imnoisy(xmin:xmax, ymin:ymax);
        output7(i,j) = median(temp(:));         %Calculating pixel value as median7
        
        
    end
end
toc
subplot(231),imshow(Im),title('Original Image');       %Plotting all the images
subplot(232),imshow(Imgray),title('Greyscale Image');
subplot(233),imshow(Imnoisy),title('Noisy Image');
subplot(234),imshow(output3),title('Using median3 filter');
subplot(235),imshow(output5),title('Using median5 filter');
subplot(236),imshow(output7),title('Using median7 filter');
end