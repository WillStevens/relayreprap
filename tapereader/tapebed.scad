module hole()
{
  union()
  { 
     cylinder(h=0.4,r=4.5,center=true,$fs=0.1);
     translate(v=[0,0,1.4])
       cylinder(h=2.4,r=1.5,center=true,$fs=0.1);
     translate(v=[0,0,0.4]) 
       cube(size=[9,1,0.5],center=true);
  }
}

module pillar()
{
  difference()
  {
    cube(size=[5,10,3+84/(2*3.1415926535)+5],center=true);

    translate(v=[0,0,(3+84/(2*3.1415926535)+5)/2-5])
      rotate([0,90,0])
        cylinder(h=6,r=2,center=true,$fs=0.1);
  }
}

module cogmount()
{
  difference()
  {
    union()
    {
      cube(size=[6*(6+4.5)+4.5+1+10,10,2.8],center=true);

      translate(v=[-(6*(6+4.5)+4.5+1)/2-2.5,10,(3+84/(2*3.1415926535)+5)/2-1.5])
        pillar();

      translate(v=[(6*(6+4.5)+4.5+1)/2+2.5,10,(3+84/(2*3.1415926535)+5)/2-1.5])
        pillar();
    }

    union()
    {
      translate(v=[-(6*(6+4.5)+4.5)/2+5,+2.5,0])
        cube(size=[10.5,5,2.8],center=true);
      translate(v=[(6*(6+4.5)+4.5)/2-5,+2.5,0])
        cube(size=[10.5,5,2.8],center=true);
    }
  }
}

union()
{

translate(v=[0,4*(6+4.5)/2-5,0])
  cogmount();

rotate([0,180,0])
{
difference()
{
  translate(v=[0,10,0])
    cube(size=[4*(6+4.5)+4.5,4*(6+4.5),2.8],center=true);
  translate(v=[-15.75,0,-1.2])
    hole();
  translate(v=[-5.25,0,-1.2])
    hole();
  translate(v=[5.25,0,-1.2])
    hole();
  translate(v=[15.75,0,-1.2])
    hole();
}
}

}
