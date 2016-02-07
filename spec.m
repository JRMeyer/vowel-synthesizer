function [m,f] = spec(y,Fs)
% SPEC compute the frequency spectrum for some sound
%   [m,f] = SPEC(x,Fs)
%   x = the sound
%   Fs = sampling frequency (Hz)
%   m = magnitude of sine components
%   f = frequency of sine components
%
% Mike Hammond, U. of Arizona, 1/2016

% Compute length of sound
Ns = length(y)/Fs;

% Compute FFT
x = fft(y);

% Get response until Fs/2
x = x(1:floor(Ns*Fs/2));

% return frequencies and magnitudes
m = abs(x);
f = (0:length(x)-1)*(Fs/2)/length(x);