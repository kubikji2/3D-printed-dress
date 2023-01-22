include<parts.scad>


$fn=60;


_x_cnt = 2;
_y_cnt = 3;
_s = b_a + i_g;

for(x=[0:_x_cnt-1])
{
    for(y=[0:_y_cnt-1])
    {
        _x = x*_s;
        _y = y*_s;
        _r = (x+y) % 2 == 0 ? 0 : 90;
        translate([_x,_y,0])
        rotate([0,0,_r])
            unit(); 
    }
}

//unit();

//male_part();