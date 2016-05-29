module pintang()
{
    cube(size=[3,9,0.4],center=true);

    translate(v=[0,6,0])
      cube(size=[5,5,0.4],center=true);

    translate(v=[-2,6,0.4])
      cube(size=[1,5,0.8],center=true);

    translate(v=[2,6,0.4])
      cube(size=[1,5,0.8],center=true);
}

union()
{
  difference()
  {
    cube(size=[6*(6+4.5)+4.5+1+10,10,2.4],center=true);

    translate(v=[0,1.5,0])
      cube(size=[6*(6+4.5)+4.5+1,10,2.4],center=true);
  }

  translate(v=[-15.75,1,-1.0]) pintang();

  translate(v=[-5.25,1,-1.0]) pintang();

  translate(v=[5.25,1,-1.0]) pintang();

  translate(v=[15.75,1,-1.0]) pintang();
}