output "node_role_arn" {
  value = aws_iam_role.eks_node_role.arn
}

output "eks_role_arn" {
    value = aws_iam_role.eks_cluster_role.arn
}