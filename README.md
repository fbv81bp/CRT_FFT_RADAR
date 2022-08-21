Images were created in GNU Octave with the following commands:
```
crt(1577, [11,12,13,14,15],2)

crt_conv(1577, [11,12,13,14,15],2)
```
Documentation tbc'd...

The idea of a Chinese Remainder Theorem based Continuous Wave RADAR is that one may compute the distance of the incoming phases of several carriers, without precisel, measuring their travelling time. Only the phase difference of at source and endpoints are needed.

The problem with CRT is when the remainder is around zero, then the if it flips to the maximum due to measurement error, it gives perfectly false results. Besides it is for natural numbers only.

The idea is to use the Fourier transform to calculate the interference of adequatly shaped signals. Such signals are pulse trains, whose wavelength equals that of the carriers, pulse widths represent the phase measurement's imprecision, and they are all shifted with the measured phase difference.

Within the distance specified by CRT ie. the multiple of all wavelengths, this interference is going to have a maximum at the place where all pulse trains align, ie. their phase is zero. The worse the phases'imprecision the more such peaks we might have, yet with a lucky selection of carriers, better precision and the application of convolution, we stand chances there will be few. While the correct peak is always necessarily among them!
