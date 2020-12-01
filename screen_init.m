sca;
% http://psychtoolbox.org/docs/PsychDefaultSetup
%PsychDefaultSetup(0);
% set 0 for strict checks, 2 for skip checks
Screen('Preference','SkipSyncTests', 2);


screens = Screen('Screens');
screenNumber = min(screens);
white = WhiteIndex(screenNumber);
black = BlackIndex(screenNumber);

textSize = 33;
setXmax = 1224;
setYmax = 788;

[wHandle, wHandleRect] = Screen('OpenWindow', screenNumber, black, [0 0 setXmax setYmax]);
%[wHandle, windowRect] = PsychImaging('OpenWindow', screenNumber, black);

[xMax, yMax]=Screen('WindowSize', wHandle);
[xCenter, yCenter] = RectCenter(wHandleRect);
Screen('BlendFunction', wHandle, 'GL_SRC_ALPHA', 'GL_ONE_MINUS_SRC_ALPHA');
Screen('TextFont', wHandle, 'Ariel');
Screen('TextSize', wHandle, textSize);


% pixels
LEFT = round(xMax/22);
DELTA_X = round(xMax/16);
TOP = round(yMax/20);
DELTA_Y = round(yMax/10); 
nrows = 3;
ncols = 2;
% total six words to be displayed

Screen('FillRect', wHandle, white);

text_coords = [  [LEFT TOP];
                 [LEFT+2*DELTA_X TOP];

                 [LEFT TOP+2*DELTA_Y];
                 [LEFT+2*DELTA_X TOP+2*DELTA_Y];
                 
                 [LEFT TOP+3*DELTA_Y];
                 [LEFT+2*DELTA_X TOP+3*DELTA_Y]
              ];