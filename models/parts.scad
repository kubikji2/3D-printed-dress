include<qpp_all.scad>

include<constants.scad>

module male_cut()
{

}

module male_part()
{

}

module femal_part()
{

}

module female_cut()
{

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
    difference()
    {
        union()
        {
            body();
        }

        
    }
}

