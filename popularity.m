function []=popularity()
Image = imread('lena.bmp');
[height width]=size(Image);
[count,x] = imhist(Image);  %histogram cýkarmak için
figure(1);
imshow(Image); 
[count1,Indx]=sort(count,1,'descend');
x1=cat(1,x(Indx(:,1),1));
N=input('select a total color value to reduce the image');
quantize=zeros(N,1);
quantize=x1(1:N,1);
D=pdist2(x1,quantize,'euclidean');
new_matrix=zeros(size(count));
for i=1:length(x1)
      [u,v]=min(D(i,:));  %x te o satýrýn minimum deðeri y de minimum deðerin hangi sutunda bulundugunu tutuyor
      new_matrix(i,1)=quantize(v,1);
 
end
for i=1:width
    for j=1:height
        for t=1:length(x1)
            if Image(i,j)==x1(t,1)
            Image(i,j)=new_matrix(t,1);
            end
        end
    end
end

figure(2);imshow(Image);  title('popularity');
figure(3);
imshow(Floyd_Steinberg_Dithering(Image)); title('floyd steinberg');




