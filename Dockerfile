FROM widerin/eks-helmsman
RUN aws eks update-kubeconfig --name=$AWS_EKS_CLUSTER_NAME
