resource "aws_vpc_peering_connection" "default" {
  count = var.VPC_peering_is_required ? 1 : 0
  #peer_owner_id = var.peer_owner_id --if your are creating the peering request for anoter user you need to user this.
  
  #requester
  peer_vpc_id   = data.aws_vpc_default.id

  #accepter
  vpc_id        = aws_vpc.main.id

  auto_accept = true

  accepter {
    allow_remote_vpc_dns_resolution = true
  }

  requester {
    allow_remote_vpc_dns_resolution = true
  }

  tags = merge (
    local.common_tags,
    {
        Name = "${var.project}-${var.environment}-default"
    },
    var.peering_tags
  )
}