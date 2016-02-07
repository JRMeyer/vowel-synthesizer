%% Author: Josh Meyer
%% 
%% This code is meant to generate speech sounds roughly based on a 
%% source-filter model.
%%

%% HYPERPARAMETERS
samplingRate = 44100;
dB = 20;

%% MAKE SOURCE aka WHITE NOISE
Source = wgn(samplingRate,1,3);

%% MAKE FILTERS ie BANDPASS FILTERS
bp1 = design(fdesign.bandpass('N,F3dB1,F3dB2',4,2000,3000,samplingRate));
bp2 = design(fdesign.bandpass('N,F3dB1,F3dB2',6,5000,6000,samplingRate));
bp3 = design(fdesign.bandpass('N,F3dB1,F3dB2',4,7500,8500,samplingRate));

%% APPLY FILTER TO SOURCE
y1 = filter(bp1,Source);
y2 = filter(bp2,Source);
y3 = filter(bp3,Source);
y4 = y1+y2+y3;

%% SHOW AND TELL
sound(y4,samplingRate)
pause(1)
spectrum = spec(y4,samplingRate);
plot(spectrum)
pause(2)

whos

exit()





