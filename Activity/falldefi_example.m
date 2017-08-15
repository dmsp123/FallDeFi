%%
% The MIT License (MIT)
% Copyright (c) 2017 Sameera Palipana <dhanapala.palipana@mycit.ie>
% 
% Permission is hereby granted, free of charge, to any person obtaining a 
% copy of this software and associated documentation files (the "Software"), 
% to deal in the Software without restriction, including without limitation 
% the rights to use, copy, modify, merge, publish, distribute, sublicense, 
% and/or sell copies of the Software, and to permit persons to whom the 
% Software is furnished to do so, subject to the following conditions:
% 
% The above copyright notice and this permission notice shall be included 
% in all copies or substantial portions of the Software.
% 
% THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS 
% OR IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY, 
% FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE 
% AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER 
% LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING 
% FROM, OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER 
% DEALINGS IN THE SOFTWARE.

% paths for CSI tool 
path(path,fullfile(pwd,'csi_tool_matlab/'))
% paths for FallDeFi scripts
addpath(genpath('csi_tool_matlab/Activity/'))
% paths for svm scripts
addpath(genpath('libsvm-3.22/'))

% extract CSI from .mat files for 'lab2' data  set
fall_lab2_data_extract
% DWT denoising
fall_data_denoise
% PCA
PCA_denoised_falldata
% spectrogram
fall_data_STFT
% spectrogram processing and feature extraction
time_freq_processing_all_events
% classification
svm_example
