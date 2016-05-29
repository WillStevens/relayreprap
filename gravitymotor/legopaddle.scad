module paddle(angle)
{
  rotate([0,0,angle])
    translate(v=[-0.75,17.9,0])
      cube(size=[1.5,3,2.4]);
}

module legocross()
{
  cube(size=[5.2,1.7,2.4],center=true);
  cube(size=[1.7,5.2,2.4],center=true);
}

difference()
{
  cylinder(h=2.4,r=18,$fs=0.1);

  translate(v=[7,7,0])
    cylinder(h=2.4,r=4,$fs=0.1);  
  translate(v=[-7,7,0])
    cylinder(h=2.4,r=4,$fs=0.1);  
  translate(v=[-7,-7,0])
    cylinder(h=2.4,r=4,$fs=0.1);  
  translate(v=[7,-7,0])
    cylinder(h=2.4,r=4,$fs=0.1);  

  translate(v=[0,0,1.2])
    legocross();
}

paddle(0);
paddle(1*36);
paddle(2*36);
paddle(3*36);
paddle(4*36);
paddle(5*36);
paddle(6*36);
paddle(7*36);
paddle(8*36);
paddle(9*36);
