# //need to set IAM rule + add it to the module line 251 (i think) so that nodes can be seen on the console.
# //currently the nodes are not shown on the eks as the eks module does not have the iam rule permission to show the node details (the stupid guy ahaha)




# resource "aws_iam_role" "example" {
#   name               = "yak_role"
#   assume_role_policy = data.aws_iam_policy_document.instance_assume_role_policy.json # (not shown)

#   inline_policy {
#     name = "my_inline_policy"

#     policy = jsonencode(
#         {
#     "Version": "2012-10-17",
#     "Statement": [
#         {
#             "Effect": "Allow",
#             "Action": [
#                 "eks:DescribeNodegroup",
#                 "eks:ListNodegroups",
#                 "eks:DescribeCluster",
#                 "eks:ListClusters",
#                 "eks:AccessKubernetesApi",
#                 "ssm:GetParameter",
#                 "eks:ListUpdates",
#                 "eks:ListFargateProfiles"
#             ],
#             "Resource": "*"
#         }
#     ]
# }       
#     )
#   }

#   inline_policy {
#     name   = "policy-8675309"
#     policy = data.aws_iam_policy_document.inline_policy.json
#   }
# }

# data "aws_iam_policy_document" "inline_policy" {
#   statement {
#     actions   = ["ec2:DescribeAccountAttributes"]
#     resources = ["*"]
#   }
# }