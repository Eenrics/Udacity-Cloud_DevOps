#Example of CloudFormation IAC yaml formate
"""
AWSTemplateFormatVersion: 2010-09-09
Description: Carlos Rivas / Udacity - This template deploys a VPC
Resources:
  UdacityVPC:
    Type: "AWS::EC2::VPC"
    Properties:
      CidrBlock: 10.0.0.0/16
      EnableDnsHostnames: "true"
      Tags:
        - Key: name
          Value: myfirsttestvpc
"""


#To configure aws cli, use
aws configure


#To create new IAC using aws cli
aws cloudformation create-stack  --stack-name myFirstTest --region us-east-1 --template-body file://testcfn.yml


#To update the stack of CloudFormation,
aws cloudformation update-stack  --stack-name myFirstTest --region us-east-1 --template-body file://testcfn.yml


#Once a stack is created successfully, you can verify by either going to\
# the web console or running the following command, which will display all the details the stack.
aws cloudformation describe-stacks --stack-name myFirstTest



#If no stack name is specified, then it will return the description for all the stacks created in your account.


#To connect to your EC2 instances using pem 
ssh -i "Udacity-IAC.pem" ec2-user@ec2-34-238-43-186.compute-1.amazonaws.com
