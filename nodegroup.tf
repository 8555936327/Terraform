resource "aws_iam_role" "eks_worker_node_role" {
  name               = var.node_iam_role
  assume_role_policy = var.node_iam_role_policy
}


resource "aws_eks_node_group" "eks_worker" {
  cluster_name    = aws_eks_cluster.mycluster.name
  node_group_name = var.node_group_name
  node_role_arn   = var.node_iam_role.arn
  subnet_ids      = module.public.*.id
  scaling_config {
    desired_size = 1
    max_size     = 2
    min_size     = 1
  }

   update_config {
     max_unavailable = 1     
   }

}