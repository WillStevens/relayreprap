module nailstemholder(radius,headradius)
{
  difference()
  {
    cube(size=[2*radius+4,5,headradius+radius]);

    translate(v=[2,0,headradius-radius])
      cube(size=[2*radius,5,2*radius]);
  }
}

module coilholder()
{
  translate(v=[-4,0,0])
    cube(size=[15,4,2.4]);
  translate(v=[-4,10,0])
    cube(size=[15,4,2.4]);

  translate(v=[0,-10,0])
    cube(size=[7,24,3.6]);

  translate(v=[0,-10,3.6])
    nailstemholder(1.5,4.75);

}

coilholder();
