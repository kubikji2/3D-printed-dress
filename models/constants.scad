// The model is devided into five main parts
// '-> body denoted by  'b_'
// '-> female part      'fp_'
// '-> female cut       'fc_'
// '-> male part        'mp_'
// '-> male cut         'mc_'
// and a main parameter height denoted 'height'

height = 3;

_eps = 0.001;
// '-> new epsilon

// body -> b_
b_a = 50/5;
// '-> body side

// interface offset
io = 0.3; // (height - 12/5)/2;
// '-> interface offset, e.g. distance between cut na the piece
i_D = height;
// '-> bigger (base) conical interface diameter 
//     '-> note that this is the cut hole diameter,
//         the piece diameter is i_D-2*io, see bellow
i_d = height/2;
// '-> smaller (top) conical interface diameter
//     '-> note that this is the cut hole diameter,
//         the piece diameter is i_d-2*io, see bellow
i_h = 1;
// '-> conical interface heigh
//     '-> no change in the size between the cut and the piece
i_c = b_a/2;
// '-> interface center, e.g. distance from the piece center
i_w = 2;
// '-> interface width, e.g. distance between the conical pegs
i_g = 1;
// '-> interface (cut) gauge, e.g. distance between the hulled conical peg

// male part -> mp_
mp_W = i_w - 2*io; //7.5/5;
// '-> with of the piece
mp_w = 3/5;
// '-> width of not beveled part
mp_pd = i_d-2*io;//4.3/5;
// '-> peg smaller diameter
mp_pD = height-2*io;
// '-> peg bigger diameter
mp_h = i_h; //(17.5/5 - mp_w)/2;
// peg height
mp_l = i_c + i_g + height/2; //37.5/5;
// '-> total length

// female part -> fp_
fp_D = 30/5;
// '-> outer diameter
fp_b = (height-12/5)/2;
// '-> bevel
fp_d = 24/5;
// '-> beveled diameter
fp_off = b_a/2; //(30/5)/2+fp_d/2;

// male cut -> mc_
mc_D = 35/5;
// '-> outer diameter
mc_b = fp_b;
// '-> bevel
mc_d = mc_D + 2*(3/5);
// '-> beveled diameter
mc_off = b_a/2;//(16/5)/2+mc_D/2;
// '-> cut offset from the center

// female cut -> fc_
fc_off = (17.5/5)/2;
// '-> cut offset from the center
fc_w = i_w; //10/5;
// '-> width
fc_pg = i_g; //20/5-height;
// '-> peg gauge
