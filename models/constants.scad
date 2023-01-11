// The model is devided into five main parts
// '-> body denoted by  'b_'
// '-> female part      'fp_'
// '-> female cut       'fc_'
// '-> male part        'mp_'
// '-> male cut         'mc_'
// and a main parameter height denoted 'height'

height = 3;

// body -> b_
b_a = 50/5;
// '-> body side

// female part -> fp_
fp_D = 30/5;
// '-> outer diameter
fp_b = (height-12/5)/2;
// '-> bevel
fp_d = 24/5;
// '-> beveled diameter
fp_off = (30/5)/2+fp_d/2;