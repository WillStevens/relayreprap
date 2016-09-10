module pulley()
{
	difference()
	{
	  union()
	  {
	    cylinder(h=10.0,r=6.0,$fs=0.1);
	
	    cylinder(h=1.2,r=10,$fs=0.1);
	  }
	  cylinder(h=10.1,r=1.9,$fs=0.1);

        translate(v=[0,0,10-2.8])
        {
	    cylinder(h=2.9,r=4,$fs=0.1);
        }
	}
	
	translate(v=[25,0,0])
	{
	  difference()
	  {
          union()
          {
	      cylinder(h=1.2,r=10,$fs=0.1);
	      cylinder(h=1.2+2.8,r=4,$fs=0.1);
          }
	
	    cylinder(h=1.2+2.8,r=1.9,$fs=0.1);
	  }
	}

}

pulley();

translate(v=[0,25,0])
  pulley();
