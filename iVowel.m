%%
%% /ae/ FILTER by GMM
%%

function mix = aVowel(numHarmonics,f0)
    maxFreq = numHarmonics*f0;
    freqIndeces = [0:f0:(maxFreq-f0)];

    %% F1
    weight = 1;
    mu(1:numHarmonics) = 300;
    sigma(1:numHarmonics) = 200;
    f1 = arrayfun(@uni_gauss_pdf,freqIndeces,mu,sigma);
    f1 = times(weight,f1);

    %% F2
    weight = .5;
    mu(1:numHarmonics) = 2400;
    sigma(1:numHarmonics) = 200;
    f2 = arrayfun(@uni_gauss_pdf,freqIndeces,mu,sigma);
    f2 = times(weight,f2);

    %% F3
    weight = .4;
    mu(1:numHarmonics) = 3100;
    sigma(1:numHarmonics) = 175;
    f3 = arrayfun(@uni_gauss_pdf,freqIndeces,mu,sigma);
    f3 = times(weight,f3);

    %% F4
    weight = .3;
    mu(1:numHarmonics) = 3700;
    sigma(1:numHarmonics) = 175;
    f4 = arrayfun(@uni_gauss_pdf,freqIndeces,mu,sigma);
    f4 = times(weight,f4);

    %% COMBINE COMPONENT GAUSSIANS TO MAKE GMM
    mix = f1+f2+f3+f4;
    maxMix = max(mix);
    mix = times(1/maxMix,mix);
