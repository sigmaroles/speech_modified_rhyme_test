% a demo of the single trial -- for about ten trials
% play sound through default output, show stimuli and ask to click
% todo: privide feedback

clear all;
screen_init;

NOISE = 5;
n_iter = 5;

wav_root = "/home/sigmaroles/workspaces/datasets/ModifiedRhymeTest/Selected";
wdata = readtable('words.csv');
talkerids = ["F1", "F2", "M2",  "M3"];
ROW_MAX = 50;
COL_MAX = 6;


for i = 1:n_iter
    word_row = randi(ROW_MAX);
    word_col = randi(COL_MAX);
    tdindx = randi(length(talkerids));
    talkerID = talkerids(tdindx);
    chosen_word = string(wdata{word_row,word_col})

    % filename example:
    % path + F3_b1_w5_orig.wav (the speaker ID appears twice, in foldername and filename)
    fname = wav_root + "/" + talkerID + "/" + talkerID + "_b" + word_row + "_w" + word_col + "_orig.wav"

    [ssig, fs] = audioread(fname);
    psig = vertcat(ssig, zeros(fs/10,1));

    if NOISE~=0
        wn = 0.01 * NOISE * randn(length(psig), 1);
        wn = wn .* tukeywin(length(wn), 2*0.2);
        psig = psig * 2.1 + wn;
    end

    rowID = word_row;
    displayed_words = string(wdata{rowID,:});

    Screen('FillRect', wHandle, rect_colors, rect_coords);

    for windx = 1:6
        Screen('DrawText', wHandle, char(displayed_words(windx)), text_coords(windx,1), text_coords(windx,2), WHITE);
    end
    SetMouse(xCenter, yMax-200, wHandle);
    apl = audioplayer(psig, fs);


    % actual stimulus delivery happens next
    Screen('Flip',wHandle);
    playblocking(apl);

    % wait for click, and return the position of click
    [clicks,xp,yp,whichButton] = GetClicks(wHandle);
    % which rectangle did the participant click?
    for i = 1:nrows*ncols
        arect = rect_coords(:,i);
        isClicked = IsInRect(xp,yp,arect);
        if isClicked
            cindex = i;
            break
        end
    end
    if exist('cindex')
        sprintf("index of clicked box = %d", cindex)
    else
        sprintf("clicked outside")
    end

end




sca;