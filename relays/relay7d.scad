/* Pole holder centered on the holder */
module poleHolder(radius,headradius,pivotlength)
{
  translate(v=[-radius-2,-2.5,0])
  {
    difference()
    {
      translate(v=[0,0,-1.2])
        cube(size=[2*radius+4,5,headradius+radius+1.2]);
      translate(v=[2,0,headradius-radius])
        cube(size=[2*radius,5,2*radius]);
    }
  }

  translate(v=[-0.5,0,-1.2])
    cube(size=[1.0,pivotlength,0.8]);
}

/* Pole holder centered on the holder */
module poleHolderNoUpright(radius,headradius,pivotlength)
{
  translate(v=[-radius,-2.5,0])
  {
    translate(v=[-2,0,-1.2])
      cube(size=[2*radius+4,5,headradius-radius+1.2]);
  }

  translate(v=[-0.5,0,-1.2])
    cube(size=[1.0,pivotlength,1.2]);
}

module halfRelay(radius,headradius)
{
  /* Half a nail head holder */
  difference()
  {
    cube(size=[headradius+2,5,2*headradius-0.8]);

    cube(size=[headradius+0.2,2.5,2*headradius-0.8]);
  }

  translate(v=[0,0,-1.2])
    cube(size=[headradius+6.5,5,1.2]);

  translate(v=[0,-27,-1.2])
  {
    cube(size=[3,27,1.2]);

    cube(size=[3.5,5,1.2]);
  }

  /* Half a nail stem holder */
  translate(v=[0,-27,0])
    difference()
    {
      cube(size=[radius+2,5,headradius+radius]);
      translate(v=[0,0,headradius-radius])
        cube(size=[radius,5,2*radius]);
    }

  translate(v=[8.7,-15.5,0])
    rotate([0,0,-7.0])
      poleHolderNoUpright(radius,headradius,17);
}

halfRelay(1.5,4.75);
mirror([1,0,0])
  halfRelay(1.5,4.75);