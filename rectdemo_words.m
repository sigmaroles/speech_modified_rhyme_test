clear all;
screen_init;


w1 = ["tap", "gap", "map", "nap", "chap", "yap"];

for windx = 1:6
    Screen('DrawText', wHandle, char(w1(windx)), text_coords(windx,1), text_coords(windx,2), black);
    %Screen('DrawText', wHandle, w1(windx));
end

%SetMouse(xCenter, yMax-200, wHandle);
Screen('Flip',wHandle);

% wait for click, and return the position of click
[clicks,xp,yp,whichButton] = GetClicks(wHandle);


sca;