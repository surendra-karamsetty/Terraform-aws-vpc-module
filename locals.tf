locals {
    common_tags = {
        Project = var.project
        environment = var.environment
        terraform = "true"
        
    }

    vpc_final_tags = merge(
    local.common_tags,
    {
        Name = "${var.project}-${var.environment}"
    },
    var.vpc_tags
  )

  igw_final_tags = merge (
    local.common_tags,
    {
        Name = "${var.project}-${var.environment}"
    },
    var.igw_tags
  )
    #by using the slice function we can get the first two avaiable zones. Here we have used 0-> first zone 1->second zone we have given 2 means it is excluse it wont take only first two zones it will take.
  az_zone = slice(data.aws_availability_zones.available,0,2)
}