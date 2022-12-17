# To list all parameters we have
aws ssm describe-parameters

# To see the detail of a parameter of our choice with its values
aws ssm get-parameters --names "<parameter-name>"

# To see the parameter history
aws ssm get-parameter-history --name "<parameter-name>"

# To create new parameter
aws ssm put-parameter --name "<parameter-name>" --description "<parameter-description>" --value "<parameter-value>" --type String --tags "Key=<parameter-tagKey>,Value=<parameter-tagValue>"

# To change an existing parameter value
aws ssm put-parameter --name "<parameter-name>" --description "<parameter-description>" --value "<parameter-value>" --type String --overwrite

# To delete a parameter
aws ssm delete-parameter --name "<parameter-name>"
