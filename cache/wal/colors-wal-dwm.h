static const char norm_fg[] = "#e5ccc6";
static const char norm_bg[] = "#090a11";
static const char norm_border[] = "#a08e8a";

static const char sel_fg[] = "#e5ccc6";
static const char sel_bg[] = "#5F6982";
static const char sel_border[] = "#e5ccc6";

static const char urg_fg[] = "#e5ccc6";
static const char urg_bg[] = "#62667A";
static const char urg_border[] = "#62667A";

static const char *colors[][3]      = {
    /*               fg           bg         border                         */
    [SchemeNorm] = { norm_fg,     norm_bg,   norm_border }, // unfocused wins
    [SchemeSel]  = { sel_fg,      sel_bg,    sel_border },  // the focused win
    [SchemeUrg] =  { urg_fg,      urg_bg,    urg_border },
};
