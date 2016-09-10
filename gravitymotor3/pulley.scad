module pulley()
{
	difference()
	{
	  union()
	  {
	    cylinder(h=6.0,r=4.0,$fs=0.1);
	
	    cylinder(h=1.2,r=5,$fs=0.1);
	  }
	  cylinder(h=6.1,r=1.9,$fs=0.1);
	}
	
	translate(v=[15,0,0])
	{
	  difference()
	  {
	    cylinder(h=1.2,r=5,$fs=0.1);
	
	    cylinder(h=1.2,r=1.9,$fs=0.1);
	  }
	}
}

pulley();

translate(v=[0,15,0])
  pulley();
