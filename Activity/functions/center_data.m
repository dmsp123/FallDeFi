function [ abs_amp_RX1_centered,abs_amp_RX2_centered,abs_amp_RX3_centered, abs_amp_RX12_centered, abs_amp_RX123_centered] = center_data(abs_RX1_amp_interp,abs_RX2_amp_interp,abs_RX3_amp_interp, sample_size,normalize_index)
%UNTITLED Summary of this function goes here
%   mean subtraction and division by the standard deviation

%abs_amp_RX1 = vertcat(abs_RX1_amp_interp);
abs_amp_RX12 = vertcat(abs_RX1_amp_interp,abs_RX2_amp_interp);
abs_amp_RX123 = vertcat(abs_RX1_amp_interp,abs_RX2_amp_interp,abs_RX3_amp_interp);

for i =1:size(abs_RX1_amp_interp,2)/sample_size
    abs_amp_RX1_ml(:,sample_size*(i-1)+1:sample_size*i)   = bsxfun(@minus, abs_RX1_amp_interp(:,sample_size*(i-1)+1:sample_size*i), mean(abs_RX1_amp_interp(:,sample_size*(i-1)+1:sample_size*i),2));
    abs_amp_RX2_ml(:,sample_size*(i-1)+1:sample_size*i)   = bsxfun(@minus, abs_RX2_amp_interp(:,sample_size*(i-1)+1:sample_size*i), mean(abs_RX2_amp_interp(:,sample_size*(i-1)+1:sample_size*i),2));
    abs_amp_RX3_ml(:,sample_size*(i-1)+1:sample_size*i)   = bsxfun(@minus, abs_RX3_amp_interp(:,sample_size*(i-1)+1:sample_size*i), mean(abs_RX3_amp_interp(:,sample_size*(i-1)+1:sample_size*i),2));
    abs_amp_RX12_ml(:,sample_size*(i-1)+1:sample_size*i)  = bsxfun(@minus, abs_amp_RX12(:,sample_size*(i-1)+1:sample_size*i),       mean(abs_amp_RX12(:,sample_size*(i-1)+1:sample_size*i),2));
    abs_amp_RX123_ml(:,sample_size*(i-1)+1:sample_size*i) = bsxfun(@minus, abs_amp_RX123(:,sample_size*(i-1)+1:sample_size*i),      mean(abs_amp_RX123(:,sample_size*(i-1)+1:sample_size*i),2));
end

% plot(abs_amp_RX123_ml(1,:))
abs_amp_RX1_centered   = bsxfun(@rdivide, abs_amp_RX1_ml,   std(abs_amp_RX1_ml  (:,1:normalize_index),0,2));
abs_amp_RX2_centered   = bsxfun(@rdivide, abs_amp_RX2_ml,   std(abs_amp_RX2_ml  (:,1:normalize_index),0,2));
abs_amp_RX3_centered   = bsxfun(@rdivide, abs_amp_RX3_ml,   std(abs_amp_RX3_ml  (:,1:normalize_index),0,2));
abs_amp_RX12_centered  = bsxfun(@rdivide, abs_amp_RX12_ml,  std(abs_amp_RX12_ml (:,1:normalize_index),0,2));
abs_amp_RX123_centered = bsxfun(@rdivide, abs_amp_RX123_ml, std(abs_amp_RX123_ml(:,1:normalize_index),0,2));
%     plot(abs_amp_RX123_centered(1,:))

end

