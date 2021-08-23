%%% INPUT IMAGE %%%
A = imread(‘photo1.jpg’);
 
%%% Convert RGB image to HSV color space %%%
I1 = rgb2hsv(A); %For Foreground Image
I2 = rgb2hsv(A); %For Background Image


%%%% Creating a mask based on my skin color and background color %%%%
%%% THRESHOLDS FOR FOREGROUND IMAGE %%%
 
% Thresholds for channel 1 based on histogram settings
Fgchannel1Min = 0.522;
Fgchannel1Max = 0.162;
% Thresholds for channel 2 based on histogram settings
Fgchannel2Min = 0.000;
Fgchannel2Max = 1.000;
%Thresholds for channel 3 based on histogram settings
Fgchannel3Min = 0.000;
Fgchannel3Max = 1.000;
 
%%% THRESHOLDS FOR BACKGROUND IMAGE %%%
 
%Thresholds for channel 1 based on histogram settings
Bgchannel1Min = 0.183;
Bgchannel1Max = 0.466;
%Thresholds for channel 2 based on histogram settings
Bgchannel2Min = 0.000;
Bgchannel2Max = 1.000;
%Thresholds for channel 3 based on histogram settings
Bgchannel3Min = 0.000;
Bgchannel3Max = 1.000;
 
%%% Create mask for Foreground based on chosen histogram thresholds %%%
BW1 = (I1(:,:,1) >= Fgchannel1Min ) | (I1(:,:,1) <= Fgchannel1Max ) &
    (I1(:,:,2) >= Fgchannel2Min ) & (I1(:,:,2) <= Fgchannel2Max) &
    (I1(:,:,3) >= Fgchannel3Min ) & (I1(:,:,3) <= Fgchannel3Max);
%%% Create mask for Background based on chosen histogram thresholds %%%
BW2 = (I2(:,:,1) >= Bgchannel1Min ) & (I2(:,:,1) <= Bgchannel1Max) &
    (I2(:,:,2) >= Bgchannel2Min ) & (I2(:,:,2) <= Bgchannel2Max) &
    (I2(:,:,3) >= Bgchannel3Min ) & (I2(:,:,3) <= Bgchannel3Max);
 
% Initialize output masked image based on input image.
ForegroundImage = A;
BackgroundImage = A;
 
% Set Background pixels where BW is false to zero.
ForegroundImage(repmat(~BW1,[1 1 3])) = 0;
% Set Foreground pixels where BW is false to zero.
BackgroundImage(repmat(~BW2,[1 1 3])) = 0;
 
figure(1)
subplot(1,3,1)
imshow(A)
title(‘Input Image’);
subplot(1,3,2)
imshow(BackgroundImage)
title(‘Background’);
subplot(1,3,3)
imshow(ForegroundImage)
title(‘Foreground’);
