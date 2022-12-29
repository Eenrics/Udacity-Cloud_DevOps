############### THIS IS FOR CLOUD FRONT YAML FILE#################
Parameters:
# Existing Bucket name
PipelineID:
  Description: Existing Bucket name
  Type: String
Resources:
    CloudFrontOriginAccessIdentity:
      Type: "AWS::CloudFront::CloudFrontOriginAccessIdentity"
      Properties:
        CloudFrontOriginAccessIdentityConfig:
          Comment: Origin Access Identity for Serverless Static Website
    WebpageCDN:
      Type: AWS::CloudFront::Distribution
      Properties:
        DistributionConfig:
          Origins:
            - DomainName: !Sub "${PipelineID}.s3.amazonaws.com"
              Id: webpage
              S3OriginConfig:
                OriginAccessIdentity: !Sub "origin-access-identity/cloudfront/${CloudFrontOriginAccessIdentity}"
          Enabled: True
          DefaultRootObject: index.html
          DefaultCacheBehavior:
            ForwardedValues:
              QueryString: False
            TargetOriginId: webpage
            ViewerProtocolPolicy: allow-all
  Outputs:
    PipelineID:
      Value: !Sub ${PipelineID}
      Export:
        Name: PipelineID














##################### THIS IS FOR WEBHOSTING S3 BUCKET YAML FILE##########################
Parameters:
# New Bucket name
MyBucketName:
  Description: Existing Bucket name
  Type: String
Resources:
WebsiteBucket:
  Type: AWS::S3::Bucket
  Properties:
    BucketName: !Sub "${MyBucketName}"
    AccessControl: PublicRead
    WebsiteConfiguration:
      IndexDocument: index.html
      ErrorDocument: error.html
WebsiteBucketPolicy:
  Type: AWS::S3::BucketPolicy
  Properties:
    Bucket: !Ref 'WebsiteBucket'
    PolicyDocument:
      Statement:
      - Sid: PublicReadForGetBucketObjects
        Effect: Allow
        Principal: '*'
        Action: s3:GetObject
        Resource: !Join ['', ['arn:aws:s3:::', !Ref 'WebsiteBucket', /*]]





############## RUN CLOUDFRONT YAML FILE LIKE ##################
aws cloudformation deploy \
--template-file cloudfront.yml \
--stack-name production-distro \
--parameter-overrides PipelineID="${S3_BUCKET_NAME}" \ # Name of the S3 bucket you created manually.
--tags project=udapeople &
################# RUN S3-BUCKET YAML FILE LIKE################
aws cloudformation deploy \
--template-file bucket.yml \
--stack-name production-distro \
--parameter-overrides PipelineID="${S3_BUCKET_NAME}" \ # Name of the S3 bucket you created manually.
--tags project=udapeople &
