
fs=1000; nfft = 512;noverlap=256;window=512;
% frequency (bin) resolution = sample_rate/fft_size= 1.953Hz, time resolution =
% (wind-noverlap)/fs=.112s , Hamming window
% as overlap increases processing time increases and noise immunity
% The length of the FFT is a tradeoff between frequency and time resolution
% stft_netcell_array  = NET.createArray('System.Double[][]',fall_cell_array_size);
stft_cell_array= cell(length(fall_cell_array),1);

for i = 1:length(dnPCA_cell_array)
%     denoised_sig=denoised_sig_cellarray{5};
%     test=denoised_sig(1,:);
    test  = dnPCA_cell_array{i}';
    sum_S = 0;
    for ii   = 2:6%num_PCs(i)
        [S,~,~] = spectrogram(test(ii,:),window,noverlap,nfft,fs);%/std(test(ii,:),0,2)
        sum_S   = abs(S)+sum_S; 
    end
    stft_cell_array{i} = imresize( sum_S,[500 10000]);
end
% stft_cell_array = cell(stft_netcell_array);
clear stft_netcell_array sum_S dnPCA_cell_array S test T 

% kitchen 47:lose balance, lose conscious 57, slip:69, trip:79
% sit chair: 2,stand chair: 11, bendpick: 25, walk:33, jump:39
% kitchen1_sitfl_10
kitchen2_stndfl_55 = abs(stft_cell_array{55});
figure
event_resize = imresize(kitchen2_stndfl_55,[500 1000]);
s = surf(event_resize,'edgecolor','none');
%  surf(test,'edgecolor','none')
% image(test)
colormap(jet)
% % % brighten(.2)
axis([0 1000 0 110])
caxis([100,8000])
set(s,'EdgeColor','interp');
% % Set faces transparent
% set(s,'FaceAlpha','interp');

% % (abs(stft_cell_array{14}))
% detect event




% BW2 = bwareaopen(afterOpening, 20);
% figure, surf(BW2,'edgecolor','none')
% colormap(hot)
% axis([0 9000 0 200])



% 
% figure
% subplot(2,1,2)
% surf((abs(S)+abs(S1)+abs(S2)+abs(S3)+abs(S4)+abs(S5)+abs(S6)+abs(S7))/7,'edgecolor','none')
% axis([0 10000 0 60])
% subplot(3,1,2)
% figure
% surf(abs(S8),'edgecolor','none')
% axis([0 10000 0 60])
% subplot(3,1,3)
% surf(abs(S3),'edgecolor','none')
% axis([0 10000 0 100])
% 
% fs = 1000;
% t = 0.001:1/fs:10;
% coeff=[Y_PCA_test123_base; zeros(216,30)];
% level = 6;
% %figure
% %subplot(2,1,2);
% wpt1 = wpdec(coeff(:,1),level,'sym6');
% wpt2 = wpdec(coeff(:,2),level,'sym6');
% wpt3 = wpdec(coeff(:,3),level,'sym6');
% wpt4 = wpdec(coeff(:,4),level,'sym6');
% wpt5 = wpdec(coeff(:,5),level,'sym6');
% wpt6 = wpdec(coeff(:,6),level,'sym6');
% wpt7 = wpdec(coeff(:,7),level,'sym6');
% 
% [S1,T1,F1] = wpspectrum(wpt1,fs);
% [S2,T2,F2] = wpspectrum(wpt2,fs);
% [S3,T3,F3] = wpspectrum(wpt3,fs);
% [S4,T4,F4] = wpspectrum(wpt4,fs);
% [S5,T5,F5] = wpspectrum(wpt5,fs);
% [S6,T6,F6] = wpspectrum(wpt6,fs);
% [S7,T7,F7] = wpspectrum(wpt7,fs);
% 
% figure
% surf(T1,fliplr(F1),(S1),'edgecolor','none')
% colormap(jet)
% axis([0 10 0 60])
% 
