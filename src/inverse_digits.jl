export inverse_digits
inverse_digits(digits, base = 10) = sum([digits[k] * base^(k - 1) for k = 1:length(digits)])
