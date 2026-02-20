function [out_s,out_f] = Creat_DTMF_signal(key)

    fs = 8000;
    t = 0:1/fs:0.5;

    key_map = [697 1209; 697 1336; 697 1477;
               770 1209; 770 1336; 770 1477;
               852 1209; 852 1336; 852 1477;
               941 1209; 941 1336; 941 1477];

    row_freq = key_map(key,1);
    col_freq = key_map(key,2);

    signal = sin(2*pi*row_freq*t) + sin(2*pi*col_freq*t);

    player = audioplayer(signal,fs);
    playblocking(player);

    out_s = signal;
    out_f = fs;

end
