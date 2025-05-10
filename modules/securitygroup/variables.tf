variable "vpc_id"{
    type=string
}

# variable "ingress_port" {
#     type=list(number)
#     default=[22,80]
# }
# variable "egress_port"  {
#     type=list(number)
#     default = [ 0 ]
# }
# variable "cidr_block" {
#   type=map(list(string))
#   default={
#     22=["49.207.180.197/32"],
#     80=["0.0.0.0/0"],
#     0=["0.0.0.0/0"]
#   }

# }

  variable "cidr_block"{
    type=list(object({
        port = number
        cidr_block=list(string)
    }))
    default = [
        {port = 22,cidr_block = [ "0.0.0.0/0" ]},
        {port = 80,cidr_block = [ "0.0.0.0/0"]},
        {port = 3306,cidr_block = [ "0.0.0.0/0" ]},
        {port = 443,cidr_block = [ "0.0.0.0/0" ]},
        {port = 0,cidr_block = [ "0.0.0.0/0"]}
    ]
  }
