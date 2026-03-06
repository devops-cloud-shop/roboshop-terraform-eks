variable "project_name" {
    default = "roboshop"
}

variable "environment" {
    default = "dev"
}

variable "sg_names" {
    default = [
        #database
        "mongodb", "redis", "mysql", "rabbitmq",
        #backend - we deploy them as pods in k8s cluster- no need to run them as VMs
        # "catalogue", "cart", "user", "payment", "shipping",
        #frontend
        # "frontend",
        #bastion
        "bastion",
        #frontend/Ingress Load balancer
        "ingress_alb",
        "eks_control_plane",
        "eks_node"
        #backend Load balancer
        # "backend_alb",
        # "open_vpn" - we can use openvpn but aws free trial don't support openvpn ami
        #hence not included.

    ]
  
}