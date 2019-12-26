function [cluster_idx, cluster_center,input_vector,Colors]=kkmeans(Image)
Image=imread('lena.bmp');
figure(1);
imshow(Image);
%kmeans yalnýzca double veya single outputlarý kabul ediyor o yuzden:
Image = im2double(Image); %tum pixel degerlerini 255 e boluyor ve tekrar yerine yazýyor
%we have to pass the image as a vector and after clustering 
%we have to reshape it again to its original dimensions.

nrows = size(Image,1);
ncols = size(Image,2);
input_vector = reshape(Image,nrows*ncols,1);  %tek boyuta düþürüyoruz
Colors = input('please enter a K value');
[cluster_idx, cluster_center] = kmeans(input_vector,Colors,'distance','sqEuclidean');  %Resimdeki her pixelin her küme merkezi arasýndaki mesafenin hesaplanmasý yapýlýr. bu mesafe de euclidean distance olarak seçildi
%distance ý yazmasaydým bile default olarak euclidean veriyor kendisi

pixel_labels = reshape(cluster_idx,nrows,ncols); %double olarak tutuluyor
figure(2);
Image=uint8(255 * mat2gray(pixel_labels));
imshow(Image);  title('k means');
%imshow(I,[]) displays the grayscale image I, scaling the display based on the
%range of pixel values in I. imshow uses [min(I(:)) max(I(:))] as the display range.
%imshow displays the minimum value in I as black and the maximum value as white.
%dither fonksiyonu double ile çalýþmýyor
 %mat2gray will scale your values to the range 0-255.
figure(3);
imshow(Floyd_Steinberg_Dithering(Image));title('floyd steinberg');
