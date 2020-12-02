sca;
% http://psychtoolbox.org/docs/PsychDefaultSetup
%PsychDefaultSetup(0);
% set 0 for strict checks, 2 for skip checks
Screen('Preference','SkipSyncTests', 2);
Screen('Preference', 'VisualDebuglevel', 3);


screens = Screen('Screens');
screenNumber = min(screens);
white = WhiteIndex(screenNumber);
black = BlackIndex(screenNumber);

BGCOLOR = [23, 23, 25];
RED = [white, 0, 0];
GREEN = [0, white, 0];
BLUE = [0, 0, white];
WHITE = [white, white, white];
DARKGREEN = [62, 84, 61];

textSize = 62;
setXmax = 1090;
setYmax = 788;

[wHandle, wHandleRect] = Screen('OpenWindow', screenNumber, black, [0 0 setXmax setYmax]);
%[wHandle, windowRect] = PsychImaging('OpenWindow', screenNumber, black);

[xMax, yMax]=Screen('WindowSize', wHandle);
[xCenter, yCenter] = RectCenter(wHandleRect);
Screen('BlendFunction', wHandle, 'GL_SRC_ALPHA', 'GL_ONE_MINUS_SRC_ALPHA');
Screen('TextFont', wHandle, 'Ariel');
Screen('TextSize', wHandle, textSize);


% pixels
DELTA_X = round(xMax/11);
DELTA_Y = round(yMax/10); 

LEFT = round(xCenter - 2.6*DELTA_X);
TOP = round(yCenter - 3*DELTA_Y);

nrows = 3;
ncols = 2;
% total six words to be displayed

Screen('FillRect', wHandle, BGCOLOR);

text_coords = [  [LEFT TOP];
                 [LEFT+4*DELTA_X TOP];

                 [LEFT TOP+2*DELTA_Y];
                 [LEFT+4*DELTA_X TOP+2*DELTA_Y];
                 
                 [LEFT TOP+4*DELTA_Y];
                 [LEFT+4*DELTA_X TOP+4*DELTA_Y]
              ];


WSIZE = 150;

c_ = repmat(DARKGREEN, 6, 1);
rect_colors = c_';

rectTOP = TOP - 50;

rect_coords = [
                 [LEFT rectTOP LEFT+WSIZE rectTOP+WSIZE];
                 [LEFT+4*DELTA_X rectTOP LEFT+4*DELTA_X+WSIZE rectTOP+WSIZE];

                 [LEFT rectTOP+2*DELTA_Y LEFT+WSIZE rectTOP+2*DELTA_Y+WSIZE];
                 [LEFT+4*DELTA_X rectTOP+2*DELTA_Y LEFT+4*DELTA_X+WSIZE rectTOP+2*DELTA_Y+WSIZE];
                 
                 [LEFT rectTOP+4*DELTA_Y LEFT+WSIZE rectTOP+4*DELTA_Y+WSIZE];
                 [LEFT+4*DELTA_X rectTOP+4*DELTA_Y LEFT+4*DELTA_X+WSIZE rectTOP+4*DELTA_Y+WSIZE]

               ];
rect_coords = rect_coords';            