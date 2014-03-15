//light setpos [4314.7, 4328.57, 0.1];
lightDeg = 0;
lightRad = 10;

light = "#lightpoint" createvehicle position player;
light setLightBrightness 1;
light setLightAmbient [1, 1, 1];
light setLightColor [1, 1, 1];


waitUntil {
    posX = (position player) select 0;
    posY = (position player) select 1;

    posX = posX + ((sin lightDeg) * lightRad);
    posy = posy + ((cos lightDeg) * lightRad);

    light setpos [posX, posY, 0.1];

    lightDeg = lightDeg + 2;

    sleep 0.01;

    false;
};