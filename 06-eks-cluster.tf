resource "aws_eks_cluster" "eks-cluster" {
  name     = "my-eks-cluster"
  role_arn = "arn:aws:iam::123456789012:role/eks-cluster-role"
  vpc_config {subnet_ids = []}
}

resource "aws_eks_addon" "pod-identity-agent" {
  cluster_name             = aws_eks_cluster.eks-cluster.name
  addon_name               = "eks-pod-identity-agent"
  addon_version            = "v1.0.0-eksbuild.1"
  resolve_conflicts        = "OVERWRITE"
}
