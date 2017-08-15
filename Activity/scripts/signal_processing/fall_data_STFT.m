


% figure
% [s,w,t]=spectrogram(Y_PCA_test123_base(:,2),100);
% % 

% axis([0 215 0 500])
% val_=PC2_activities_cell_array{23};
% figure2;
% subplot(2,1,1)
% plot(val_)
% 
% [S,F,T]=spectrogram(val_,512,511,1000);
% 
% Y_PCA_test123_base = test';
% 
% subplot(2,1,1)
% surf(abs(S),'edgecolor','none')
% axis([0 10000 0 100])
% Y_PCA_test123_base = coeff;
% [S,F,T]    = spectrogram(Y_PCA_test123_base(:,1),512,511,1000);
% [S1,F1,T1] = spectrogram(Y_PCA_test123_base(:,2),512,511,1000);
% [S2,F2,T2] = spectrogram(Y_PCA_test123_base(:,3),512,511,1000);
% [S3,F3,T3] = spectrogram(Y_PCA_test123_base(:,4),512,511,1000);
% [S4,F4,T4] = spectrogram(Y_PCA_test123_base(:,5),512,511,1000);
% [S5,F5,T5] = spectrogram(Y_PCA_test123_base(:,6),512,511,1000);
% [S6,F6,T6] = spectrogram(Y_PCA_test123_base(:,7),512,511,1000);
% [S7,F7,T7] = spectrogram(Y_PCA_test123_base(:,8),512,511,1000);
% 
% test123    = (Y_PCA_test123_base(:,1)+Y_PCA_test123_base(:,2)+Y_PCA_test123_base(:,3)+Y_PCA_test123_base(:,4)+Y_PCA_test123_base(:,5)+Y_PCA_test123_base(:,6)+Y_PCA_test123_base(:,7))/7;
% [S8,F8,T8] = spectrogram(test123,512,511,1000);
% figure
% % subplot(2,1,1)
% surf(abs(S8),'edgecolor','none')
% axis([0 10000 0 60])
fs=1000; nfft = 256;noverlap=256;window=512;
% frequency (bin) resolution = sample_rate/fft_size= 1.953Hz, time resolution =
% (wind-noverlap)/fs=.112s , Hamming window
% as overlap increases processing time increases and noise immunity
% The length of the FFT is a tradeoff between frequency and time resolution
% stft_netcell_array  = NET.createArray('System.Double[][]',fall_cell_array_size);
stft_cell_array= cell(length(fall_cell_array),1);

for i = 1:fall_cell_array_size
    denoised_sig=denoised_sig_cellarray{i};
%     test=denoised_sig(1,:);
%     test  = stft_cell_array{i}';
    sum_S = 0;
    for ii   = 1:10%num_PCs(i)
        [S,~,~] = spectrogram(denoised_sig(ii,:),window,noverlap,nfft,fs);%/std(test(ii,:),0,2)
        sum_S   = abs(S)+sum_S; 
    end
    stft_cell_array{i} = imresize( sum_S/10,[500 10000]);
end
% stft_cell_array = cell(stft_netcell_array);
% clear stft_netcell_array sum_S dnPCA_cell_array S test T 

% kitchen 47:lose balance, lose conscious 57, slip:69, trip:79
% sit chair: 2,stand chair: 11, bendpick: 25, walk:33, jump:39
% kitchen1_sitfl_10
kitchen2_stndfl_55 = abs(stft_cell_array{37});
% figure
event_resize = imresize(kitchen2_stndfl_55,[500 10000]);
% s = surf(event_resize,'edgecolor','none');
% %  surf(test,'edgecolor','none')
% % image(test)
% colormap(jet)
% % % % brighten(.2)
% axis([0 10000 0 200])
% caxis([1,100])
% set(s,'EdgeColor','interp');


event_resize(event_resize<2*max(max(event_resize(250:500,:))))=0;
% event_resize(event_resize>=2)=1;

figure
surf(event_resize,'edgecolor','none')
colormap(jet)
% % % brighten(.2)
axis([0 10000 0 200])
caxis([1,10])

% % Set faces transparent
% set(s,'FaceAlpha','interp');

% % (abs(stft_cell_array{14}))
% detect event
% wl = 513;tr = 1; fftl = 512;
% param_beta=0.9;param=0.1;
% denoised_sig=stft_cell_array{1};
% output = quadtfd(denoised_sig(1,:) , wl, tr, 'emb', param, param_beta, fftl); % generating EMBD
% event_resize = imresize(output,[500 10000]);
% 
% % figure; tfsapl(denoised_sig,output);
% figure
% s = surf(event_resize,'edgecolor','none');
% colormap(jet)
% % % % brighten(.2)
% axis([0 10000 0 100])
% % caxis([100,2000])
% set(s,'EdgeColor','interp');



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
