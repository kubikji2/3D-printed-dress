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
io = (height - 12/5)/2;

// male part -> mp_
mp_W = 7.5/5;
// '-> with of the piece
mp_w = 3/5;
// '-> width of not beveled part
mp_pd = 4.3/5;
// '-> peg smaller diameter
mp_pD = height-2*io;
// '-> peg bigger diameter
mp_h = 1; //(17.5/5 - mp_w)/2;
// peg height
mp_l = 37.5/5;
// '-> total length

// female part -> fp_
fp_D = 30/5;
// '-> outer diameter
fp_b = (height-12/5)/2;
// '-> bevel
fp_d = 24/5;
// '-> beveled diameter
fp_off = (30/5)/2+fp_d/2;

// male cut -> mc_
mc_D = 35/5;
// '-> outer diameter
mc_b = fp_b;
// '-> bevel
mc_d = mc_D + 2*(3/5);
// '-> beveled diameter
mc_off = (16/5)/2+mc_D/2;
// '-> cut offset from the center


// female cut -> fc_
fc_off = (17.5/5)/2;
// '-> cut offset from the center
fc_w = 10/5;
// '-> width
