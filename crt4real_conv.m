function _ = crt4real_conv(distance, wavelengths, imprecision)
  phases = real_mod(distance, wavelengths); % simulating phase measurements
  max_pos = 1;
  for i = 1:size(wavelengths)(2)
    max_pos = max_pos * wavelengths(i) % maximum distance according to Chinese Remainder Theorem
  endfor
  position_line = [1:0.001:max_pos];
  lines = ones(size(wavelengths)(2),1);
  position = lines * position_line; % this helps to set up the spatial functions
  a = (real_mod(position.-phases, wavelengths) <= imprecision); % spatial functions are either 0 or 1:
  % areas with 1-s represent the measured phase and the measurements' imprecision, their interference
  % will show the best guess for the distance of the wave sources
  
  A = fft(a');
  A = A';
  CRT = conv(A(1,:), A(2,:));
    for i = 3:size(A(:,1))(1)
    CRT = conv(CRT, A(i,:)); % summing up Fourier transforms so that their inverse shows the interference
  endfor
  crt = ifft(CRT');
  plot(abs(crt'))
  [val, idx] = max(crt);
  position = max_pos*idx/size(crt)(1)
endfunction

function ret_val  = real_mod(dividend, divisor)
  quote = dividend ./ divisor'; % number of wavelengths in the distance
  natural = floor(quote); % number of whole wavelengths
  ret_val = dividend .- natural .* divisor'; % phases are that remain after subtracting whole wavelengths
endfunction
