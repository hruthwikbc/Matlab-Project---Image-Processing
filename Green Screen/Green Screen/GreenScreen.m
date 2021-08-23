clc
clear all
close all
 
%%% INPUT IMAGE %%%
A = imread('photo1.jpg');
 
%%% Convert RGB image to HSV color space %%%
I1 = rgb2hsv(A); %For Foreground Image
I2 = rgb2hsv(A); %For Background Image
 
%%%% Creating a mask based on my skin color and background color %%%%
%%% THRESHOLDS FOR FOREGROUND IMAGE %%%
 
% Thresholds for channel 1 based on histogram settings
FGchannel1Min = 0.522;
FGchannel1Max = 0.162;
% Thresholds for channel 2 based on histogram settings
FGchannel2Min = 0.000;
FGchannel2Max = 1.000;
%Thresholds for channel 3 based on histogram settings
FGchannel3Min = 0.000;
FGchannel3Max = 1.000;
 
%%% THRESHOLDS FOR BACKGROUND IMAGE %%%
 
%Thresholds for channel 1 based on histogram settings
BGchannel1Min = 0.183;
BGchannel1Max = 0.466;
%Thresholds for channel 2 based on histogram settings
BGchannel2Min = 0.000;
BGchannel2Max = 1.000;
%Thresholds for channel 3 based on histogram settings
BGchannel3Min = 0.000;
BGchannel3Max = 1.000;
 
%%% Create mask for Foreground based on chosen histogram thresholds %%%
BW1 = (I1(:,:,1) >= FGchannel1Min ) | (I1(:,:,1) <= FGchannel1Max ) & 
    (I1(:,:,2) >= FGchannel2Min ) & (I1(:,:,2) <= FGchannel2Max) & 
    (I1(:,:,3) >= FGchannel3Min ) & (I1(:,:,3) <= FGchannel3Max);
%%% Create mask for Background based on chosen histogram thresholds %%%
BW2 = (I2(:,:,1) >= BGchannel1Min ) & (I2(:,:,1) <= BGchannel1Max) &
    (I2(:,:,2) >= BGchannel2Min ) & (I2(:,:,2) <= BGchannel2Max) & 
    (I2(:,:,3) >= BGchannel3Min ) & (I2(:,:,3) <= BGchannel3Max);
 
% Initialize output masked image based on input image.
ForegroundImage = A;
BackgroundImage = A;
 
% Set Background pixels where BW is false to zero.
ForegroundImage(repmat(~BW1,[1 1 3])) = 0;
% Set Foreground pixels where BW is false to zero.
BackgroundImage(repmat(~BW2,[1 1 3])) = 0;
%%% BACKGROUND IMAGE %%% 
B= imread('bg.jpg');
 
% RESIZING THE BACKGROUND IMAGE TO THAT OF INPUT IMAGE 
[r c b]=size(A);
resizedB=imresize(B,[r c]);
 
% SUPERIMPOSING PART OF THE FOREGROUND ON THE NEW BACKGROUND 
bg=resizedB.*uint8(~ForegroundImage);
 
figure(1)
subplot(1,3,1);
imshow(resizedB);
title('New Background')
subplot(1,3,2);
imshow(bg);
title('Superimposed background with Foreground')
subplot(1,3,3);
imshow(bg+A.*uint8(~BackgroundImage)); % ADDIND THE FOREGROUND AND THE NEW SUPERIMPOSED BACKGROUND PART  
title('Image with Changed Background')
