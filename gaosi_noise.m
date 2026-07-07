img=imread('xiaogou.png');
img=rgb2gray(img);

mean_noise=0;  %噪声均值设为0；
sigma=12;      %标准差，数值越大噪声越重

img_d=double(img);
noise=normrnd(mean_noise,sigma,size(img_d));
img_noise_d=img_d+noise;

img_noise_d(img_noise_d<0)=0;
img_noise_d(img_noise_d>255)=255;
img_noise=uint8(img_noise_d);

%对比显示原图和加噪声图
figure,
subplot(1,2,1);imshow(img);title('原始图像');
subplot(1,2,2);imshow(img_noise);title('加性噪声');

%计算mse psnr
mse=immse(img_noise,img);
[peaknar,snr]=psnr(img_noise,img);

fprintf('高斯噪声图 PSNR=%.2f dB,MSE=%.4f\n',snr,mse);

% err=immse(A,ref);
% % fprintf('\n The error is %0.4f\n',err);
% % [peaksnr,snr]= psnr(A, ref);










