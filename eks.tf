//node_groups are amazon eks managed nodes and worker_groups are self managed nodes.

module "eks" {
  source          = "terraform-aws-modules/eks/aws"
  cluster_name    = var.cluster_name
  cluster_version = "1.20"
  subnets         = module.vpc.private_subnets
  vpc_id          = module.vpc.vpc_id
  kubeconfig_output_path = "~/.kube/" //
  //  # Worker groups (using Launch Configurations)
  worker_groups = [
    {
      name                          = "worker-group-1"
      instance_type                 = "t2.small"
      additional_userdata           = "echo foo bar"
      asg_desired_capacity          = 2
      additional_security_group_ids = [aws_security_group.worker_group_mgmt_one.id]
    },
    {
      name                          = "worker-group-2"
      instance_type                 = "t2.medium"
      additional_userdata           = "echo foo bar"
      additional_security_group_ids = [aws_security_group.worker_group_mgmt_two.id]
      asg_desired_capacity          = 1
    },
  ]
  tags = {
      Owner = var.owner
      Name = "eks-lartey"
  } // tell it to create worker groups 
}

# get EKS cluster info to configure Kubernetes providers
data "aws_eks_cluster" "cluster" {
  name = module.eks.cluster_id
}

data "aws_eks_cluster_auth" "cluster" {
  name = module.eks.cluster_id
}



# # resource "null_resource" "java"{
# #   depends_on = [module.eks]
# #   provisioner "local-exec" {
# #     command = "aws eks --region eu-central-1  update-kubeconfig --name $AWS_CLUSTER_NAME"
# #     environment = {
# #       AWS_CLUSTER_NAME = "java-cluster"
# #     }
# #   }
# # }
