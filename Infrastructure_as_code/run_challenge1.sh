#To run callenge1 using aws cli
aws cloudformation create-stack  --stack-name challenge1 --region us-east-1 --template-body file://challenge1.yml --parameters file://challenge1-parameters.json
