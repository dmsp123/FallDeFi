
function denoised_sig = wavelet_denoise_1d(noisy_sig)
%load noisbloc;
L = 8;
swc = swt(noisy_sig,L,'db10');

swcnew = swc;
ThreshSL = wthrmngr('sw1ddenoLVL','heursure',swc,'one');

for jj = 1:L
swcnew(jj,:) = wthresh(swc(jj,:),'s',ThreshSL(jj));
end

denoised_sig = iswt(swcnew,'db10');
end
% figure
% plot(test); hold on;
% plot(test_denoised,'r','linewidth',1);
