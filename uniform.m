function [] =uniform()
Image=imread('lena.bmp');
% Image=rgb2gray(Image);   %gray scale deðilde rgb formatýnda bir goruntu varsa gray e cevirmek icin
[height width]=size(Image);
var=input('Enter a value between 1-255.');
if var<=0
    disp('this value is not allowed')
    var=input('enter a value between 1-255.');
end
if var>=256
     disp('this value is not allowed')
    var=input('enter a value between 1-255');
end
B=256;
q=B/var;
figure(1);
imshow(Image);
for i=1:height
    for j=1:width
       Image(i,j)=floor_x(Image(i,j),q);
    end
end
figure(2);
imshow(Image); title('uniform');
figure(3);
imshow(Floyd_Steinberg_Dithering(Image)); title('floyd steinberg dither');

function [x] =floor_x(pixel,div)
 x=floor(pixel/div)*div;


    

