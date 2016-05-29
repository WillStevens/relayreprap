difference()
{
  union()
  {
    cube(size=[6*(6+4.5)+4.5+1+10,18,2.8],center=true);

    translate(v=[(6*(6+4.5)+4.5+1)/2+2.5,0,7.5+1.4])
      cube(size=[5,18,15],center=true);

    translate(v=[-(6*(6+4.5)+4.5+1)/2-2.5,0,7.5+1.4])
      cube(size=[5,18,15],center=true);
  }

  translate(v=[(6*(6+4.5)+4.5+1)/2+2.5,9-2-1.4,1.4+15-2.5])
    cube(size=[5,2.8,6],center=true);
  translate(v=[-(6*(6+4.5)+4.5+1)/2-2.5,9-2-1.4,1.4+15-2.5])
    cube(size=[5,2.8,6],center=true);

  translate(v=[(6*(6+4.5)+4.5+1)/2+2.5,-(9-2-1.4),1.4+15-2.5])
    cube(size=[5,2.8,6],center=true);
  translate(v=[-(6*(6+4.5)+4.5+1)/2-2.5,-(9-2-1.4),1.4+15-2.5])
    cube(size=[5,2.8,6],center=true);

  translate(v=[25,0,0]) cylinder(h=2.8,r=5,center=true,$fs=0.1);
  translate(v=[-25,0,0]) cylinder(h=2.8,r=5,center=true,$fs=0.1);

  cube(size=[50,10,2.8],center=true);
}
