
%%
%% /u/ FILTER by GMM
%%

harmonicIndeces = [1:numHarmonics];

%% F1
weight = 1;
mu(1:numHarmonics) = 3;
sigma(1:numHarmonics) = 1.5;
f1 = arrayfun(@uni_gauss_pdf,harmonicIndeces,mu,sigma);
f1 = times(weight,f1);

%% F2
weight = .7;
mu(1:numHarmonics) = 9;
sigma(1:numHarmonics) = 1.5;
f2 = arrayfun(@uni_gauss_pdf,harmonicIndeces,mu,sigma);
f2 = times(weight,f2);

%% F3
weight = .1;
mu(1:numHarmonics) = 24;
sigma(1:numHarmonics) = 1.5;
f3 = arrayfun(@uni_gauss_pdf,harmonicIndeces,mu,sigma);
f3 = times(weight,f3);

%% F4
weight = .1;
mu(1:numHarmonics) = 33;
sigma(1:numHarmonics) = 1.75;
f4 = arrayfun(@uni_gauss_pdf,harmonicIndeces,mu,sigma);
f4 = times(weight,f4);

%% COMBINE COMPONENT GAUSSIANS TO MAKE GMM
mix = f1+f2+f3+f4;
maxMix = max(mix);
mix = times(1/maxMix,mix);

plot(mix)
