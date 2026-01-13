resource "aws_iam_role" "nodes" {
  name = "A2A-eks-node-group-nodes"

  assume_role_policy = jsonencode({
    Statement = [{
      Action = "sts:AssumeRole"
      Effect = "Allow"
      Principal = {
        Service = "ec2.amazonaws.com"
      }
    }]
    Version = "2012-10-17"
  })
}

resource "aws_iam_role_policy_attachment" "nodes-AmazonEKSWorkerNodePolicy" {
  policy_arn = "arn:aws:iam::aws:policy/AmazonEKSWorkerNodePolicy"
  role       = aws_iam_role.nodes.name
}

resource "aws_iam_role_policy_attachment" "nodes-AmazonEKS_CNI_Policy" {
  policy_arn = "arn:aws:iam::aws:policy/AmazonEKS_CNI_Policy"
  role       = aws_iam_role.nodes.name
}

resource "aws_iam_role_policy_attachment" "nodes-AmazonEC2ContainerRegistryReadOnly" {
  policy_arn = "arn:aws:iam::aws:policy/AmazonEC2ContainerRegistryReadOnly"
  role       = aws_iam_role.nodes.name
}

resource "aws_eks_node_group" "private-nodes" {
  cluster_name    = aws_eks_cluster.eks-cluster.name
  node_group_name = "A2A-private-nodes"
  node_role_arn   = aws_iam_role.nodes.arn

  remote_access {
    ec2_ssh_key = var.keypair
  }
  scaling_config {
    desired_size = var.private_nodes_des
    max_size     = var.private_nodes_max
    min_size     = var.private_nodes_min
  }

  subnet_ids = aws_subnet.private_subnets.*.id

  capacity_type = var.private_nodes_capacity
}
resource "aws_eks_node_group" "public-nodes" {
  cluster_name    = aws_eks_cluster.eks-cluster.name
  node_group_name = "A2A-public-nodes"
  node_role_arn   = aws_iam_role.nodes.arn

  remote_access {
    ec2_ssh_key = var.keypair
  }
  scaling_config {
    desired_size = var.public_nodes_des
    max_size     = var.public_nodes_max
    min_size     = var.public_nodes_min
  }

  subnet_ids = aws_subnet.public_subnets.*.id

  capacity_type = var.public_nodes_capacity
}

