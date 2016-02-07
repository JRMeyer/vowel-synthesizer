%% Author: Josh Meyer
%% 
%% This code is meant to generate speech sounds roughly based on a 
%% source-filter model.
%%

%% HYPER-PARAMETERS
f0 = 100;
samplingRate = 44100;
numHarmonics = 40;

%% MAKE GLOTTAL PULSE
Source = makeSource(numHarmonics,samplingRate,f0);

%% MAKE FILTER by GAUSSIAN MIXTURE MODEL
mix = aeVowel(numHarmonics,f0);

%% APPLY FILTER TO SOURCE
Filter = diag(mix);
FilteredSource = mtimes(Filter,Source);
newAudioSignal = sum(FilteredSource,1);

%% PLAY SOUND AND SHOW FILTER
sound(newAudioSignal,samplingRate)
plot(mix)
pause(2)

exit()




