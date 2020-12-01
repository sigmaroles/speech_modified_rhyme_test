clear;

wav_root = "/home/sigmaroles/workspaces/datasets/ModifiedRhymeTest/Selected";
wdata = readtable('words.csv');

talkerids = ["F3", "F4", "M2",  "M4",];
ROW_MAX = 50;
COL_MAX = 6;

n_iter = 20;

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
    apl = audioplayer(ssig, fs);
    playblocking(apl);

end