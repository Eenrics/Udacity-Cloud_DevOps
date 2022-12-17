# To know which user we are using in aws cli
aws sts get-caller-identity

# To configure multiple accounts in aws
aws configure --profile <name>

# To execute certain command using other user
aws iam list-users --profile <name>

# or ...
aws <command-here> --profile <name>

