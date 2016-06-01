module basepillar()
{
  cube(size=[7,5,10]);
  translate(v=[1.5,0,10])
    cube(size=[4,5,2.4]);
}

module base()
{
  union()
  {
    difference()
    {
      cube(size=[30,35,2.4]);

      translate(v=[0,20,1.2])
      {
        cube(size=[30,10,1.2]);
      }

      translate(v=[5,25,0])
        cylinder(h=2.4,r=1.4,center=true,$fs=0.1);

      translate(v=[25,25,0])
        cylinder(h=2.4,r=1.4,center=true,$fs=0.1);
    }

    translate(v=[5,30,2.4])
      basepillar();

    translate(v=[18,30,2.4])
      basepillar();

    translate(v=[11.5,15,2.4])
      basepillar();
  }
}

module polerack()
{
  difference()
  {
    translate(v=[0,-15,0])
      cube(size=[30,15,4.8]);

    translate(v=[0,-10,2.4])
      cube(size=[30,5,2.4]);

    translate(v=[5,0,4.8-1.5/2])
      rotate([0,0,45])
        cube(size=[5,5,1.5],center=true);

    translate(v=[25,0,4.8-1.5/2])
      rotate([0,0,45])
        cube(size=[5,5,1.5],center=true);
  }
}

module coilholder()
{
  difference()
  {
    cube(size=[30,20,3.6]);

    translate(v=[0,4,1.2])
    {
      cube(size=[30,12,2.4]);
    }

    translate(v=[5,10,1.2])
      cube(size=[8,6,2.4],center=true);

    translate(v=[25,10,1.2])
      cube(size=[8,6,2.4],center=true);

    translate(v=[12.5,0,0])
      cube(size=[5,5,3.6]);

    translate(v=[6,16,0])
      cube(size=[5,4,3.6]);

    translate(v=[19,16,0])
      cube(size=[5,4,3.6]);
  }
}

module tangs()
{
  cube(size=[30,5,2.4+0.8]);

  translate(v=[3.5,5,0])
    cube(size=[3,20,0.4]);

  translate(v=[23.5,5,0])
    cube(size=[3,20,0.4]);

  translate(v=[2,20,0])
    cube(size=[6,5,0.8]);

  translate(v=[22,20,0])
    cube(size=[6,5,0.8]);

  translate(v=[2,20,0])
    cube(size=[1.5,5,3.2]);
  translate(v=[6.5,20,0])
    cube(size=[1.5,5,3.2]);

  translate(v=[22,20,0])
    cube(size=[1.5,5,3.2]);
  translate(v=[26.5,20,0])
    cube(size=[1.5,5,3.2]);
}

module coilgrip()
{
  difference()
  {
    cube(size=[30,12,2.4]);

    translate(v=[0,2.5,0])
      cube(size=[12,7,2.4]);

    translate(v=[18,2.5,0])
      cube(size=[12,7,2.4]);
  }
}

union()
{
  difference()
  {
    union()
    {
      base();

      polerack();
    }

    translate(v=[5,5,0])
      cube(size=[20,10,2.4]);

    translate(v=[10,-10,0])
      cube(size=[10,25,4.8]);
    translate(v=[10,20,0])
      cube(size=[10,10,4.8]);
  }

  translate(v=[40,10,0])
    coilholder();

  translate(v=[40,-30,0])
    tangs();

  translate(v=[0,-30,0])
    coilgrip();
}