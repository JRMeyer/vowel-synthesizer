%%
%% VOWEL FILTER by GMM
%%

%% INPUT: values for the (1) means and (2) sigmas and (3) weights of the 
%% Gaussians which will define formants f0 through f4, 
%% in addition to (4) the number of harmonics you want in your vowel fiter, 

%% RETURNS: a GMM filter which you can apply
%% to some glottal source to make a vowel-like sound

function GMM = vowelFilter(numHarmonics,f0,f1,sig1,w1,f2,sig2,w2,f3,sig3,w3,f4,sig4,w4)
    maxFreq = numHarmonics*f0;
    freqIndeces = [0:f0:(maxFreq-f0)];

    %% F1
    mu(1:numHarmonics) = f1;
    sigma(1:numHarmonics) = sig1;
    f1 = arrayfun(@uni_gauss_pdf,freqIndeces,mu,sigma);
    f1 = times(w1,f1);

    %% F2
    mu(1:numHarmonics) = f2;
    sigma(1:numHarmonics) = sig2;
    f2 = arrayfun(@uni_gauss_pdf,freqIndeces,mu,sigma);
    f2 = times(w2,f2);

    %% F3
    mu(1:numHarmonics) = f3;
    sigma(1:numHarmonics) = sig3;
    f3 = arrayfun(@uni_gauss_pdf,freqIndeces,mu,sigma);
    f3 = times(w3,f3);

    %% F4
    mu(1:numHarmonics) = f4;
    sigma(1:numHarmonics) = sig4;
    f4 = arrayfun(@uni_gauss_pdf,freqIndeces,mu,sigma);
    f4 = times(w4,f4);

    %% COMBINE COMPONENT GAUSSIANS TO MAKE GMM
    GMM = f1+f2+f3+f4;
    maxGMM = max(GMM);
    GMM = times(1/maxGMM,GMM);
