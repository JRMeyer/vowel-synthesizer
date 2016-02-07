%%
%% /a/ FILTER by GMM
%%

function mix = aVowel(numHarmonics,f0)
    maxFreq = numHarmonics*f0;
    freqIndeces = [0:f0:(maxFreq-f0)];

    %% F1
    weight = 1;
    mu(1:numHarmonics) = 700;
    sigma(1:numHarmonics) = 150;
    f1 = arrayfun(@uni_gauss_pdf,freqIndeces,mu,sigma);
    f1 = times(weight,f1);

    %% F2
    weight = .8;
    mu(1:numHarmonics) = 1200;
    sigma(1:numHarmonics) = 150;
    f2 = arrayfun(@uni_gauss_pdf,freqIndeces,mu,sigma);
    f2 = times(weight,f2);

    %% F3
    weight = .35;
    mu(1:numHarmonics) = 2600;
    sigma(1:numHarmonics) = 150;
    f3 = arrayfun(@uni_gauss_pdf,freqIndeces,mu,sigma);
    f3 = times(weight,f3);

    %% F4
    weight = .3;
    mu(1:numHarmonics) = 3600;
    sigma(1:numHarmonics) = 175;
    f4 = arrayfun(@uni_gauss_pdf,freqIndeces,mu,sigma);
    f4 = times(weight,f4);

    %% COMBINE COMPONENT GAUSSIANS TO MAKE GMM
    mix = f1+f2+f3+f4;
    maxMix = max(mix);
    mix = times(1/maxMix,mix);