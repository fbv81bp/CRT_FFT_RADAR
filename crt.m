function _ = crt(distance, wavelengths, imprecision)
phases = mod(distance, wavelengths)
position = 1:1:10000;
a = (mod(position-phases(1),wavelengths(1)) <= imprecision);
b = (mod(position-phases(2),wavelengths(2)) <= imprecision);
c = (mod(position-phases(3),wavelengths(3)) <= imprecision);
d = (mod(position-phases(4),wavelengths(4)) <= imprecision);
e_ = (mod(position-phases(5),wavelengths(5)) <= imprecision);
A = fft(a);
B = fft(b);
C = fft(c);
D = fft(d);
E = fft(e_);
CRT = A+B+C+D+E;
crt = ifft(CRT);
plot(real(crt))
end
