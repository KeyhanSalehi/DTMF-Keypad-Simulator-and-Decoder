function result = dtmf(x,fs)

    Button = [1 2 3;
              4 5 6;
              7 8 9;
              10 11 12];

    N = 512;

    row_k_values = round([697 770 852 941]*N/fs);
    col_k_values = round([1209 1336 1477]*N/fs);

    start = round(length(x)/2 - N/2);

    X = fft(x(start:start+N-1));

    [~,r] = max(abs(X(row_k_values)));
    [~,c] = max(abs(X(col_k_values)));

    result = Button(r,c);

end
