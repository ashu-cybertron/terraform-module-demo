 variable "ec2_ami"{

	  type=string 
    description="Ami Id"
  }

  variable "ec2_instance_type"{

	  type=string 
	  default="t2.micro"
    description="Instance type"
  }

  variable "ec2_availability_zone"{

	  type=string 
    description="Availability Zone"
  }

  variable "ec2_key_name"{

	  type=string 
    description="Key Name"
  }


