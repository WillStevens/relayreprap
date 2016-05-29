difference()
{
  cube(size=[6*(6+4.5)+4.5+1+10,5,2.8],center=true);

  rotate([60,0,0])
  {
    translate(v=[-15.75,0,5])
      cube(size=[4,7,7],center=true);

    translate(v=[-5.25,0,5])
      cube(size=[4,7,7],center=true);

    translate(v=[5.25,0,5])
      cube(size=[4,7,7],center=true);

    translate(v=[15.75,0,5])
      cube(size=[4,7,7],center=true);
  }
}
