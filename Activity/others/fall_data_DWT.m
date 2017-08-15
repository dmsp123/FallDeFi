%% TIME FREQUENCY ANALYSIS
% Y_PCA_test123_base = [Y_PCA_test123_base; zeros(800,30)];

lev   = 8;
wname = 'db10';
nbcol = 10;
[c,l] = wavedec(coeff(:,2),lev,wname);%performs a multilevel one-dimensional wavelet analysis

len   = length(coeff(:,2));
cfd   = zeros(lev,len);

for k = 1:lev
    d = detcoef(c,l,k);%D = detcoef(C,L,N) extracts the detail coefficients at level k from the wavelet decomposition structure [C,L]. See wavedec for more information on C and L.
    d = d(:)';
    d = d(ones(1,2^k),:);
    cfd(k,:) = wkeep1(d(:)',len);% wkeep1 extracts the vector Y from the vector X.
end
cfd    = cfd(:);
I      = find(abs(cfd)<sqrt(eps)); %eps returns the distance from 1.0 to the next larger double-precision number, that is, eps = 2^-52.
% I has the indexes of the values less than of sqrt(eps)
% Replacing the values of indexes in I with 0s
cfd(I) = zeros(size(I));
cfd    = reshape(cfd,lev,len);
cfd1   = cfd(:,1:20000);
% figure;image((cfd1))
%wcodemat rescales an input matrix to a specified range for display
cfd    = wcodemat_(cfd,nbcol,'row',1);
% figure;image((cfd))

figure
h211       = subplot(2,1,1);
h211.XTick = [];
plot(coeff(:,2),'r');
title('Analyzed signal.');
ax         = gca;
ax.XLim    = [1 length(coeff(:,2))];
subplot(2,1,2);
colormap(hot(nbcol));
image(cfd);
tics       = 1:lev;
labs       = int2str(tics');
ax         = gca;
ax.YTickLabelMode = 'manual';
ax.YDir    = 'normal';
ax.Box     = 'On';
ax.YTick   = tics;
ax.YTickLabel = labs;
title('Discrete Transform, absolute coefficients.');
ylabel('Level');
