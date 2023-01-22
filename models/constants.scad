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

// male part -> mp_

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
