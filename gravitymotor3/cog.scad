module paddle(angle)
{
  rotate([0,0,angle])
    translate(v=[-0.75,26.8,0])
      cube(size=[1.5,3.1,2.4]);
}

module strut(angle)
{
  rotate([0,0,angle])
    translate(v=[-2,3,0])
      cube(size=[4,24,2.4]);
}

difference()
{
  cylinder(h=2.4,r=27,$fs=0.1);

  cylinder(h=2.4,r=22,$fs=0.1);
}

difference()
{
  union()
  {
    cylinder(h=2.4,r=10,$fs=0.1);
    cylinder(h=4.8,r=5,$fs=0.1);
  }

  cylinder(h=4.8,r=1.9,$fs=0.1);
}

strut(0);
strut(1*72);
strut(2*72);
strut(3*72);
strut(4*72);


paddle(0);
paddle(1*18);
paddle(2*18);
paddle(3*18);
paddle(4*18);
paddle(5*18);
paddle(6*18);
paddle(7*18);
paddle(8*18);
paddle(9*18);
paddle(10*18);
paddle(11*18);
paddle(12*18);
paddle(13*18);
paddle(14*18);
paddle(15*18);
paddle(16*18);
paddle(17*18);
paddle(18*18);
paddle(19*18);
