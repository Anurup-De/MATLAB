function [] = Hist()
%SIMULAB FINAL TEST
%Anurup De 510818020
%

A=imread('A.tif');
B=imread('B.tif');
disp("Size of A:");
disp(size(A));
disp("Size of B:");
disp(size(B));

A1=A(:,:,1);
B1=B(:,:,1);

figure;
subplot(121),imhist(A1),title('Histogram of A');
subplot(122),imhist(B1),title('Histogram of B');

disp("Mean value of pixels in A:")
disp(mean(A1(:)));
disp("Median value of pixels in A:")
disp(median(A1(:)));
disp("Mode value of pixels in A:")
disp(mode(A1(:)));
disp("Mean value of pixels in B:")
disp(mean(B1(:)));
disp("Median value of pixels in B:")
disp(median(B1(:)));
disp("Mode value of pixels in B:")
disp(mode(B1(:)));

figure;
subplot(121),cdfplot(imhist(A1)),title('CDF Plot of A');
subplot(122),cdfplot(imhist(B1)),title('CDF Plot of B');

end