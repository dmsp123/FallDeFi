
fs=sample_rate; nfft = 2^(nextpow2(sample_rate)-1); noverlap=nfft/2;window=nfft;
% frequency_resolution = sample_rate/fft_size= .5Hz, time resolution =
% (wind-noverlap)*1/fs=1ms , Hamming window
% as overlap increases processing time increases and noise immunity
% The length of the FFT is a tradeoff between frequency and time resolution
stft_netcell_array  = NET.createArray('System.Double[][]',fall_cell_array_size);
for i = 1:fall_cell_array_size
%     denoised_sig=denoised_sig_cellarray{5};
%     test=denoised_sig(1,:);
    test  = dnPCA_cell_array{i}';
    sum_S = 0;
    for ii   = 1:3%num_PCs(i)
        [S,~,~] = spectrogram(test(ii,:),window,noverlap,nfft,fs);%/std(test(ii,:),0,2)
        sum_S   = abs(S)+sum_S; 
    end
    stft_netcell_array(i) = imresize( sum_S,[sample_rate/2 10000]);
end
stft_cell_array = cell(stft_netcell_array);
clear stft_netcell_array sum_S dnPCA_cell_array S test T fall_cell_array

test=abs(stft_cell_array{7});
figure
% s = surf(imresize(test(1:100,:),[100 1000]),'edgecolor','none')
surf(test,'edgecolor','none')
% colormap(jet(100))
% % brighten(.2)
 axis([0 10000 0 100])
% caxis([50,5000])
% set(s,'EdgeColor','interp');
% % Set faces transparent
% set(s,'FaceAlpha',1);

