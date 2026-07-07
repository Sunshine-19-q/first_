img=imread('xiaogou.png');
gray_img=rgb2gray(img);
% imshow(gray_img);
% imtool(gray_img);
ref=gray_img(10:1000,10:1900);
ref1=ref>110;
figure,imshow(ref1);
% figure(1);
% subplot(2,2,1);
% 
% imshow(gray_img);title('xiaogou')
% ref=gray_img(10:1000,10:1900);
% subplot(2,2,3);
% 
% reg=ref>110;
% imshow(reg);title('110比较');
% subplot(2,2,4);
% reh=ref>150;
% imshow(reh);
% title('150比较');

%%  remove noise
% ref2=imfill(ref,'holes');
% figure(3),imshow(ref2);

figure(2);
SE=strel('disk',80);
subplot(2,2,1);
ref3=imerode(ref1,SE);
imshow(ref3);   %imerode:腐蚀，是黑色数值小的部分按照设置的半径来覆盖掉白色部分
title('腐蚀')
subplot(2,2,2);
ref4=imdilate(ref1,SE);   %扩张：白色部分（数值大）连接覆盖黑色部分
imshow(ref4);          %按照coin讲解，在白色周围的黑色可能会覆盖到coin的白色部分，但是完整的白色coin部分没有改变

ME=strel('disk',10);
subplot(2,2,3);
ref5=imerode(ref1,ME);
imshow(ref5);
subplot(2,2,4);
ref6=imdilate(ref1,ME);
imshow(ref6);


