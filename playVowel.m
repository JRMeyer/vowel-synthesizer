%% FORMANT-SETTINGS
f0 = 104;

f1 = 700;
sig1 = 150;
w1 = 1;

f2 = 1200;
sig2 = 150;
w2 = .8;

f3 = 2600;
sig3 = 150;
w3 = .1;

f4 = 3600;
sig4 = 175;
w4 = .05;

samplingRate = 44100;
numHarmonics = 40;

%% MAKE GLOTTAL PULSE
Source = makeSource(numHarmonics,samplingRate,f0);

%% MAKE FILTER by GAUSSIAN MIXTURE MODEL
GMM = vowelFilter(numHarmonics,f0,f1,sig1,w1,f2,sig2,w2,f3,sig3,w3,f4,sig4,w4);

%% APPLY FILTER TO SOURCE
Filter = diag(GMM);
FilteredSource = mtimes(Filter,Source);
vowel = sum(FilteredSource,1);

sound(vowel,samplingRate)
pause(1)
exit()
