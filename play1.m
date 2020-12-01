clear;

NOISE = 2; % zero, one two or three; zero is no noise, the rest are levels

% ========

wav_root = "/home/sigmaroles/workspaces/datasets/ModifiedRhymeTest/Selected";
wdata = readtable('words.csv');

talkerids = ["F1", "F2", "M5",  "M3",];
ROW_MAX = 50;
COL_MAX = 6;

n_iter = 5;
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

    apl = audioplayer(psig, fs);
    playblocking(apl);

end