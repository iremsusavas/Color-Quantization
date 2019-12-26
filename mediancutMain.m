clc;
clear all;
close all;
fileName='Color-Quantization-Fish.png';
figure(1);
Image = imread('Color-Quantization-Fish.png');
imshow(Image); 
noOfColors=64;%bu sayý arttýkça yavaþlýyor..
final=mediancut(fileName,noOfColors);
figure(2);
imshow(final);
% title('median cut');
% figure(3);
% imshow(Floyd_Steinberg_Dithering(final));  title('floyd steinberg');
