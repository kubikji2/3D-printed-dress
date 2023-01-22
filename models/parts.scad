include<qpp_all.scad>

include<constants.scad>

// beveled cylinder
// '-> D is the main diameter
// '-> d is the top and bottom diameter
// '-> h is the total height
// '-> b is the bevel height
module __beveled_cylinder(D,d,h,b)
{
    _h = h-2*b;
    cylinder(d1=d,d2=D,h=b+_eps);
    translate([0, 0, b])
        cylinder(d=D,h=_h);
    translate([0, 0, b+_h-_eps])
        cylinder(d1=D,d2=d,h=b+_eps);
}

// male connector cut
module male_cut()
{
    translate([0, 0, -height/2-_eps])
        __beveled_cylinder(D=mc_D,d=mc_d,h=height+2*_eps,b=mc_b);
}

module male_part()
{

}

// female connector related part
module female_part()
{
    translate([0, 0, -height/2])
        __beveled_cylinder(D=fp_D, d=fp_d, h=height, b=fp_b);
}

module female_cut()
{
    _h = height + 2*_eps;
    
    translate([0,fc_w/2+fc_off,-_h/2])
    {
        cylinder(d=fc_w,h=_h);
        translate([-fc_w/2,0,0])
            cube([fc_w,fc_w/2+fp_D,_h]);
    }
}

// TransForm to Horizontal Centered Cylinder
module __tf2hcc(h=b_a)
{
    translate([0,h/2,0])
        rotate([90,0,0])
            children();
}

// corner of the body, but for square module only
module __body_corner()
{
    _off = b_a/2-height/2;
    
    intersection()
    {
        __tf2hcc(b_a)
            cylinder(d=height,h=b_a);
        rotate([0,0,90])
            __tf2hcc(b_a)
                cylinder(d=height,h=b_a);
    }
}

module body()
{
    // checking the shape
    %cube([b_a,b_a,height], center=true);
    
    _off = b_a/2-height/2;
    _side_ends = [-_off,+_off];
    
    // adding corners
    qpp_replicate_at(x=_side_ends,y=_side_ends)
        __body_corner();
    
    // adding sides
    // ,-> aligned by y axis
    qpp_replicate_at(x=[_off,-_off],y=[-height/2])
        __tf2hcc()
            cylinder(d=height,h=b_a-height);
    // ,-> aligned by x axis
    qpp_replicate_at(x=[height/2],y=[_off,-_off])
        rotate([0,0,90])
            __tf2hcc()
                cylinder(d=height,h=b_a-height);

    // adding centra piece
    cube([b_a-height,b_a-height,height], center=true);
    
}

// The model is devided into five main parts
// '-> body, female part and cut, male part and cut
module unit()
{
    ftfs = [    [0,-b_a/2,0],
                [0,b_a/2,0],];

    difference()
    {
        union()
        {
            body();
            qpp_replicate_at(y=[-fp_off,fp_off])
                female_part();
        }

        qpp_replicate_at(x=[-mc_off,mc_off])
            male_cut();        

        // upper female cut
        female_cut();

        // lower female cut
        rotate([0,0,180])
            female_cut(); 
        
    }
}

