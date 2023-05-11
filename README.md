## Usage

The highest peak on the X axis denotes the origin of the wave system.

Images were created in GNU Octave with the following commands:
```
crt(1577, [11,12,13,14,15],2)

crt_conv(1577, [11,12,13,14,15],2)
```
## Description

The idea of a Chinese Remainder Theorem based Continuous Wave RADAR is that one may compute the distance by the incoming phases of several carriers, without precisely, measuring their travelling time. Only the phase difference between source and endpoints are needed.

The problem with CRT is when the remainder is around zero, then if it flips to the maximum due to measurement error, it gives perfectly false results. Besides it is for natural numbers only.

The idea is to use the Fourier transform to calculate the interference of adequatly shaped signals. Such signals are pulse trains, whose wavelength equals that of the carriers, pulse widths represent the phase measurements' errors, and they are all shifted with the measured phase difference.

Within the distance specified by CRT ie. the multiple of all wavelengths, this interference is going to have a maximum at the place where all pulse trains pulses align, ie. their phase is zero. The worse the phases' imprecision the more such peaks one might observe, yet with a lucky selection of carriers, better precision and the application of convolution, we stand chances there will be few. While the correct peak is always necessarily among the, and the pulse with the highest energy is the likeliest to be the correct one.

This code computes the distance of an object similarly to the Chinese Remainder Theorem yet with spatial Fourier Transfroms from the phases of possibly reflected radio signals. It works with real numbers, not just with relative prime naturals.

## CONCEPT

Calculating the best distance guess can be thought of as in interference problem: if the received signals were sent out with the respective phase delays that were measure, then the interference would be the strongest at the original reflection point. This can be simulated by Fourier transforming such signals, that only have a non-zero values where offset plus the wavelength plus-minus the measurements' imprecisions determine it. Then adding up such Fourier transforms and calculating the inverse Fourier transform, yields the highest peak at the original point where phases were aligned: in this very siimple proof of concept I calculated with the traced object being the source of radio signals, and all signals were sent out with phase 0. Summing up the Fourier series is a solution, because of superposition.

## POSSIBLE IMPROVEMENTS

- the non-zero values in the saptial functions (variable 'a') could be replaced by the measurements actual error distribution, which may give more exact results
- there are most of time multiple spikes at the same highest maximum, yet the widest one seems to be the correct guess
- the space domain functions don't all have to be calculated for the Fourier transform, the laws of Fourier calculation should be enough to calculate the measurement error distributions' transform, and then caculate if it was delayed by the offset plus the wavelength
- imprecision likely varies from wavelength to wavelength


## Story

I had a weird idea that CRT's properties were useful in distance measurement, yet while searching, i constantly bumped into papers discussing 'robust CRT', trying to overcome its error prone nature due to measurements' imprecisions. Most of these papers use really heavy math to solve the problem of moduluses wrapping over between maximum and zero.

So i gave it some thought and here's what i got: a numerical computation, relatively easy to implement, and which inherently doesn't care about period boundaries, yet may cost much more computing power than a closed equation, but can be understood, discussed and implemented by average engineers.
