%PART A - A1
clc
clear all
close all
 
%INPUT IMAGE
A = imread('A0.jpg');
 
%RGB IMAGE TO HSV IMAGE FORMAT
HSV = rgb2hsv(A);
 
%PERFORM HISTOGRAM EQUALIZATION ON INTENSITY COMPONENT
Heq = histeq(HSV(:,:,3));
HSV_mod = HSV;
HSV_mod(:,:,3) = Heq;
% EQUALIZED IMAGE
C = hsv2rgb(HSV_mod); 
 
figure(1)
subplot(2,2,1)
imshow(A);title('Before Histogram Equalization');
subplot(2,2,2)
imshow(C);title('After Histogram Equalization');
 
HIST_IN = zeros([256 3]);
HIST_OUT = zeros([256 3]);

%HISTOGRAM OF THE RED, GREEN AND BLUE COMPONENTS
HIST_IN(:,1) = imhist(A(:,:,1),256); %RED
HIST_IN(:,2) = imhist(A(:,:,2),256); %GREEN
HIST_IN(:,3) = imhist(A(:,:,3),256); %BLUE
 
HIST_OUT(:,1) = imhist(C(:,:,1),256); %RED
HIST_OUT(:,2) = imhist(C(:,:,2),256); %GREEN
HIST_OUT(:,3) = imhist(C(:,:,3),256); %BLUE
 
subplot(2,2,3)
bar(HIST_IN);
title('Before Applying Histogram Equalization');
legend('BLUE CHANNEL','GREEN CHANNEL','RED CHANNEL');
subplot(2,2,4)
bar(HIST_OUT);
title('After Applying Histogram Equalization');
legend('BLUE CHANNEL','GREEN CHANNEL','RED CHANNEL');
