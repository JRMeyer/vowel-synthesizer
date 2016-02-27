# Vowel Synthesizer

This code generates and plays a vowel-like sound based on the source-filter model of speech production. 

1. The source (aka glottal pulse) is generated in **makeSource.m**. 
2. The filter (aka vocal tract) is generated from a Gaussian Mixture Model in **vowelFilter.m**.
3. To adjust the formant settings and play the sound, use the **playVowel.m** file.

If you're running MATLAB from the command line:

>matlab -nodesktop -nosplash -r playVowel



