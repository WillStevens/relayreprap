module nailheadholder(headradius)
{
  difference()
  {
    cube(size=[2*headradius+4,5,2*headradius-0.8]);

    translate(v=[1.8,0,0])
      cube(size=[2*headradius+0.4,2.5,2*headradius-0.8]);
  }

}

module nailstemholder(radius,headradius)
{
  difference()
  {
    cube(size=[2*radius+4,5,headradius+radius]);

    translate(v=[2,0,headradius-radius])
      cube(size=[2*radius,5,2*radius]);
  }
}

module coilholder(radius,headradius)
{
  difference()
  {
    translate(v=[0,-27,-1.2])
      cube(size=[2*headradius+6.25,27+5,1.2]);

    translate(v=[2*headradius+4-5,-20,-1.2])
      cube(size=[7.25,20,1.2]);
  }

  nailheadholder(headradius);

  translate(v=[headradius-radius,-27,0])
    nailstemholder(radius,headradius);
}

module poleholder(radius,headradius)
{
  nailstemholder(radius,headradius);

  translate(v=[0,0,-1.2])
    cube(size=[2*radius+4,5,1.2]);

  translate(v=[3,-10,-1.2])
    cube(size=[1.0,28,0.4]);

}

module ncholder(radius,headradius)
{
  translate(v=[0,2,0])
    rotate([0,0,90])
      nailstemholder(radius,headradius);

  translate(v=[-5,2,-1.2])
    cube(size=[5,7,1.2]);
  translate(v=[-22,0,-1.2])
    cube(size=[22,7,1.2]);
}

union()
{
  coilholder(1.5,4.75);

  translate(v=[11.75,-13,0])
    poleholder(1.5,4.75);

  translate(v=[30,-27,0])
    ncholder(1.5,4.75);
}
