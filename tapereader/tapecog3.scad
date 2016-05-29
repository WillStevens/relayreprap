module pin()
{
    translate(v=[0,84/(2*3.1415926535),0])
    {
      cube(size=[5.5,2,2],center=true);
      translate(v=[0,1,0])
        cylinder(h=2,r=2.75,center=true,$fs=0.1);
    }
}

difference()
{
  union()
  {
    cylinder(h=2,r=84/(2*3.1415926535),center=true,$fs=0.1);
    translate(v=[0,0,1])
      cylinder(h=4,r=4,center=true,$fs=0.1);

    pin();

    rotate([0,0,45])
      pin();

    rotate([0,0,90])
      pin();

    rotate([0,0,135])
      pin();

    rotate([0,0,180])
      pin();

    rotate([0,0,225])
      pin();

    rotate([0,0,270])
      pin();

    rotate([0,0,315])
      pin();
  }

  translate(v=[0,0,1])
    cylinder(h=4,r=1.97,center=true,$fs=0.1);
}