function DTMF_App()

    %% ---------------- Keypad App ----------------
    
    positions = [20 300; 100 300; 180 300;
                 20 220; 100 220; 180 220;
                 20 140; 100 140; 180 140;
                 20 60; 100 60; 180 60];

    texts = {'1','2','3','4','5','6','7','8','9','*','0','#'};

    Key_app = uifigure('Position',[100 100 250 400],'Name','Keypad_App');
    buttons = cell(1,length(texts));

    %% ---------------- Result App ----------------

    Result_app = uifigure('Position',[500 100 800 600],'Name','Result_App');

    Result_label = uilabel(Result_app,'Position',[80 500 400 100],...
        'Text','You Enter = ');
    Result_label.FontSize = 18;

    ax = uiaxes(Result_app,'Position',[50 100 700 400]);
    title(ax,'Spectrum of DTMF Tone');
    xlabel(ax,'Frequency (Hz)');
    ylabel(ax,'Power/Frequency (dB/Hz)');

    %% ---------------- Create Buttons ----------------

    for i = 1:length(texts)

        buttons{i} = uibutton(Key_app,'Position',...
            [positions(i,:) 50 50],'Text',texts{i});

        buttons{i}.ButtonPushedFcn = @(src,event) button_callback(src);
    end

    %% ---------------- Callback ----------------

    function button_callback(src)

        buffer = find(strcmp(texts,src.Text));

        [signal,fs] = Creat_DTMF_signal(buffer);

        result = dtmf(signal,fs);

        switch result
            case 10
                Result_label.Text = 'You Enter = *';
            case 11
                Result_label.Text = 'You Enter = 0';
            case 12
                Result_label.Text = 'You Enter = #';
            otherwise
                Result_label.Text = ['You Enter = ' num2str(result)];
        end

        window = hamming(130);
        noverlap = 100;
        nfft = length(signal);

        [pxx,f] = pwelch(signal,window,noverlap,nfft,fs);

        plot(ax,f,10*log10(pxx));
        xlim(ax,[0 2000]);

    end

end
