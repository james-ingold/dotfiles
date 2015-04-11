// Config
S.cfga({
    'defaultToCurrentScreen': true,
    'secondsBetweenRepeat': 0.1,
    'checkDefaultsOnLoad': true,
    'focusCheckWidthMax': 3000,
    'orderScreensLeftToRight': true,
    'windowHintsShowIcons': true,
    'windowHintsSpread': true,
    'windowHintsIgnoreHiddenWindows': false
});

//Monitors
var macBookPro = '1920x1200';

// Operations
var lapFull = S.op('move', {
  'screen' : macBookPro,
  'x' : 'screenOriginX',
  'y' : 'screenOriginY',
  'width' : 'screenSizeX',
  'height' : 'screenSizeY'
});

//Bindings
S.bnda({
    //Resize
    'f:cmd;alt' : lapFull, //TODO: Make this not monitor specific
     'right:ctrl' : S.op('resize', { 'width' : '+10%', 'height' : '+0' }),

    //Push
    'right:cmd;alt' : S.op('push', { 'direction' : 'right', 'style' : 'bar-resize:screenSizeX/2' }),
    'left:cmd;alt' : S.op('push', { 'direction' : 'left', 'style' : 'bar-resize:screenSizeX/2' }),
    'up:cmd;alt' : S.op('push', { 'direction' : 'up', 'style' : 'bar-resize:screenSizeY/2' }),
    'down:cmd;alt' : S.op('push', { 'direction' : 'down', 'style' : 'bar-resize:screenSizeY/2' }),

    //Throw
    'right:ctrl;alt;cmd' : S.op('throw', { 'screen' : 'right', 'width' : 'screenSizeX', 'height' : 'screenSizeY' }),
    'left:ctrl;alt;cmd' : S.op('throw', { 'screen' : 'left', 'width' : 'screenSizeX', 'height' : 'screenSizeY' }),
    'up:ctrl;alt;cmd' : S.op('throw', { 'screen' : 'up', 'width' : 'screenSizeX', 'height' : 'screenSizeY' }),
    'down:ctrl;alt;cmd' : S.op('throw', { 'screen' : 'down', 'width' : 'screenSizeX', 'height' : 'screenSizeY' }),
    'pad0:ctrl;alt;cmd' : S.op('throw', { 'screen' : '0', 'width' : 'screenSizeX', 'height' : 'screenSizeY' }),
    'pad1:ctrl;alt;cmd' : S.op('throw', { 'screen' : '1', 'width' : 'screenSizeX', 'height' : 'screenSizeY' }),
    'pad2:ctrl;alt;cmd' : S.op('throw', { 'screen' : '2', 'width' : 'screenSizeX', 'height' : 'screenSizeY' }),

    //Slate Utils
    //Relaunch slate
    's:ctrl;alt;cmd' : S.op('relaunch'),
    // Show a positioning grid
    'g:ctrl;alt;cmd' : S.op('grid')
});
