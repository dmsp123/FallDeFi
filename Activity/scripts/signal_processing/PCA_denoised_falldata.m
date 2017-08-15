% 1. walk, 2. walk 3. stand from floor 4. stand from floor 5. stand from chair 6. stand from chair [7]. sit floor 8. sit floor 9. sit chair 10. sit chair 
%11. run 12. run 13. jump 14. empty 15.empty 16. rightlat 17. rightlat 18.
%leftlat 19. leftlat 20 trip 21. trip 22. slip 23. slip
  

% 
%     dsc = denoised_sig_cellarray{9}' ;
% %     noisy_sig = fall_cell_array{7};
%     figure
%     plot(dsc)
%     clear coeff score eigenvalue;
%     for i = 1:9000/sample_size
%         %          [eigVector_PCA_test123,eigValue_PCA_test123] = KPCA(dsc(:,(i-1)*sample_size+1:sample_size*i)',options);
%         %         Ktest1_RX123 = constructKernel(dsc(:,(i-1)*sample_size+1:sample_size*i)',[],options);
%         %
%         %         Y_PCA_test123_base((i-1)*sample_size+1:sample_size*(i),:) = Ktest1_RX123*eigVector_PCA_test123;
%         %         eigValue(:,i)=eigValue_PCA_test123;
%         
%         % [Y_PCA_test, eigVector_PCA_test, eigValue_PCA_test] =PCA(test_abs_RX1_amp_interp_centered',60);% PCA(test_abs_RX1_amp_interp_ml',4);
%         
%         [PCs,score,eigenvalue(:,i)] = PCA(dsc(1:30,(i-1)*sample_size+1:sample_size*i)',30);
%         delta_q2(i) = mean(abs(diff(score(:,2))));
%         if(i > 1)
%             %   eig_vec_flip = -eigVector_PCA_test123;
%             PC_flip = -PCs;
%             PC_orig = PCs;
%             if(abs(PC_orig(1,2) - coeff(sample_size*(i - 1),2)) > abs(PC_flip(1,2) - coeff(sample_size*(i - 1),2)))
%                 PCs = PC_flip;
%             else
%                 PCs = PC_orig;
%             end
%      end
%         eig_vec2_mat(:,i) = score(:,2);
%         coeff((i-1)*sample_size+1:sample_size*i,:) = PCs;
%     end
%     clear PCs PC_orig PC_flip;
% %     test=score'*dsc;
%     figure 
%     plot(coeff(:,1))
%     title(['sample size', int2str(sample_size)])
%         
%     sample_size =1000;
eigs_cell_array  = cell(length(fall_cell_array),1);
dnPCA_cell_array= cell(length(fall_cell_array),1);

%      dsc                  = denoised_sig_cellarray{7}';
%      dsc                  = fall_cell_array{7};
%     [PCs,score,eigenvalue] = PCA(dsc(1:30,:)',30);
    for i = 1 : length(fall_cell_array)
        
%          dsc = fall_cell_array{i};
         
        dsc = denoised_sig_cellarray{i};
       [PCs,~,eigenvalue] = PCA(dsc(1:30,:)',30);
       %         for ii = 1:10
%             test(:,(ii-1)*sample_size+1:sample_size*ii) = score'*dsc(1:30,(ii-1)*sample_size+1:sample_size*ii);
%         end
        eigs_cell_array{i}  = eigenvalue;
        dnPCA_cell_array{i} = PCs;%PCs;
    end  
    
%     test1 = dnPCA_cell_array{3};     
%     figure;hold on
% %     for i=1:length(dnPCA_cell_array)   
%      plot(test1(:,1),'k')
%      
%      figure
%      plot(test1(:,2),'k')
%      
%      figure
%      plot(test1(:,3),'k')
     
     
%      axis([0 10000 -120 120])
% 
%      figure
%     plot(test1(:,2),'k')      
%      axis([0 10000 -120 120])
    
%     end
for i=1:length(fall_cell_array)   
%     (( cumsum(eigs_cell_array{i}*100/sum(eigs_cell_array{i})) - 95))
%      [val, num_PCs(i)] = min(abs( cumsum(eigs_cell_array{i}*100/sum(eigs_cell_array{i})) - PC_percent));
      num_PCs(i)=3;
%     PCs               = dnPCA_netcell_array(i);
%     eigs              = eigs_netcell_array(i);
%     Best_PCs          = PCs(:,num_PCs(i));
%     Best_eigs         = eigs(num_PCs(i));
%      Best_PCs*min(Best_eigs)/max(Best_eigs);
    
end
fall_cell_array_size = length(fall_cell_array);

% clear dnPCA_netcell_array eigs_netcell_array eigs_cell_array denoised_sig_cellarray PCs score test1 dsc
% clear fall_cell_array


     %figure; plot((eigenvalue(1:5)'*test(1:5,:)))
     
%     for i = 1:9000/sample_size
%         %          [eigVector_PCA_test123,eigValue_PCA_test123] = KPCA(dsc(:,(i-1)*sample_size+1:sample_size*i)',options);
%         %         Ktest1_RX123 = constructKernel(dsc(:,(i-1)*sample_size+1:sample_size*i)',[],options);
%         %
%         %         Y_PCA_test123_base((i-1)*sample_size+1:sample_size*(i),:) = Ktest1_RX123*eigVector_PCA_test123;
%         %         eigValue(:,i)=eigValue_PCA_test123;
%         
%         % [Y_PCA_test, eigVector_PCA_test, eigValue_PCA_test] =PCA(test_abs_RX1_amp_interp_centered',60);% PCA(test_abs_RX1_amp_interp_ml',4);
%         
%         [PCs,score,eigenvalue(:,i)] = PCA(dsc(1:30,(i-1)*sample_size+1:sample_size*i)',30);
%         delta_q2(i) = mean(abs(diff(score(:,2))));
%         if(i > 1)
%             %   eig_vec_flip = -eigVector_PCA_test123;
%             PC_flip = -PCs;
%             PC_orig = PCs;
%             if(abs(PC_orig(1,2) - coeff(sample_size*(i - 1),2)) > abs(PC_flip(1,2) - coeff(sample_size*(i - 1),2)))
%                 PCs = PC_flip;
%             else
%                 PCs = PC_orig;
%             end
%      end
%         eig_vec2_mat(:,i) = score(:,2);
%         coeff((i-1)*sample_size+1:sample_size*i,:) = PCs;
%     end