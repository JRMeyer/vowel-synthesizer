%%
%% SOURCE aka GLOTTAL PULSE
%%

function Source = makeSource(numHarmonics,samplingRate,f0)
    Source = zeros(numHarmonics,samplingRate);
    for harmonic = 1:numHarmonics
        %% Get parameters for new harmonic
        frequency = f0*harmonic;
        angularFrequency = 2*pi*frequency;
        stepSize = angularFrequency/(samplingRate-1);
        %% Generate a new signal (vector of amplitudes) for current harmonic
        %% and add that new signal to the matrix as a row
        Source(harmonic,:) = sin(0:stepSize:angularFrequency);
    end
