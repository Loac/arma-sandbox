#define true 1
#define false 0
#define CT_STATIC 0
#define ST_CENTER 2

class RscHint
{
    type = CT_STATIC;
    style = ST_CENTER;
    text = "";
    font = "PuristaMedium";
    sizeEx = 0.03;
    colorBackground[] = { 0, 0, 0, 0.8 };
    colorText[] = { 1, 1, 1, 1 };
};

class RscTitles
{
    class RscTimer
    {
        idd = 1000;
        duration = 1e+011;
        onLoad = "uiNamespace setVariable ['rscTimer', _this select 0];";
        onUnLoad = "uiNamespace setVariable ['rscTimer', nil]";
        movingEnable = false;
        controlsBackground[] = { };
        fadein = 1;
        fadeout = 1;
        objects[] = { };
        controls[] = { Display, BlueIcon, RedIcon };

        class Display: RscHint
        {
            idc = 1001;
            x = 0.45; // 0.5 - (w / 2).
            y = 0;
            w = 0.1;
            h = 0.06;
        };

        class BlueIcon: RscHint
        {
            idc = 1002;
            colorBackground[] = { 0, 0, 0, 0.2 };
            x = 0.44 - (0.06 * 3 / 4); // 0.45 - w.
            y = 0;
            w = 0.06 * 3 / 4;
            h = 0.06;
        };

        class RedIcon: RscHint
        {
            idc = 1003;
            colorBackground[] = { 0, 0, 0, 0.2 };
            x = 0.56; // Fix 1 px bug.
            y = 0;
            w = 0.06 * 3 / 4;
            h = 0.06;
        };

    };
};


