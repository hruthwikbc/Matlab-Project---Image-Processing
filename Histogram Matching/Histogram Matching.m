clc
clear all
close all
 
A = imread('A0.jpg');%INPUT IMAGE
B = imread('ref.jpg'); %REFRENCE IMAGE
D = imhistmatch(A,B); %HISTOGRAM MATCHED IMAGE
 
figure
subplot(2,3,1)
imshow(A)
title('Input RGB Image')
subplot(2,3,2)
imshow(B)
title('Reference Image')
subplot(2,3,3)
imshow(D)
title('Histogram Matched Image')
 
 
 
HIST_IN = zeros([256 3]);
HIST_OUT = zeros([256 3]);
 
%HISTOGRAM OF THE RED,GREEN AND BLUE COMPONENTS
 
HIST_IN(:,1) = imhist(A(:,:,1),256); %RED
HIST_IN(:,2) = imhist(A(:,:,2),256); %GREEN
HIST_IN(:,3) = imhist(A(:,:,3),256); %BLUE
 
HIST_OUT(:,1) = imhist(D(:,:,1),256); %RED
HIST_OUT(:,2) = imhist(D(:,:,2),256); %GREEN
HIST_OUT(:,3) = imhist(D(:,:,3),256); %BLUE
 
HIST_ref = imhist(B,256);
 
subplot(2,3,4)
bar(HIST_IN);
title('Before Applying Histogram Equalization');
subplot(2,3,5)
bar(HIST_ref);
title('Reference Image');
subplot(2,3,6)
bar(HIST_OUT);
title('After Applying Histogram Equalization');
