provider "aws" {
  region = "us-west-2"
}

provider "kubernetes" {
  host                   = module.eks.cluster_endpoint
  token                  = data.aws_eks_cluster_auth.eks.token
  cluster_ca_certificate = base64decode(module.eks.cluster_certificate_authority_data)
}

provider "helm" {
  kubernetes {
    host                   = module.eks.cluster_endpoint
    token                  = data.aws_eks_cluster_auth.eks.token
    cluster_ca_certificate = base64decode(module.eks.cluster_certificate_authority_data)
  }
}


data "aws_eks_cluster_auth" "eks" {
  name = module.eks.cluster_name
}

resource "kubernetes_config_map" "aws_auth" {
  metadata {
    name      = "aws-auth"
    namespace = "kube-system"
  }

  data = {
    mapRoles = jsonencode([
      {
        rolearn = module.iam.node_role_arn
        username = "system:node:{{EC2PrivateDNSName}}"
        groups = ["system:bootstrappers", "system:nodes"]
      }
    ])
    mapUsers = jsonencode([
  {
    userarn = "arn:aws:iam::711387104213:user/sneha"
    username = "sneha"
    groups = [
      "system:masters"
    ]
  }
])
}
}

