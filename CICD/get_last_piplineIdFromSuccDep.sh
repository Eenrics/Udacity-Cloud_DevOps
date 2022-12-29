# Fetch and save the pipeline ID (bucket ID) responsible for the last release.
get_last_deployment_id:
  docker:
    - image: amazon/aws-cli
  steps:
    - checkout
    - run: yum install -y tar gzip
    - run:
        name: Fetch and save the old pipeline ID (bucket name) responsible for the last release.
        command: |
          aws cloudformation \
          list-exports --query "Exports[?Name==\`PipelineID\`].Value" \
          --no-paginate --output text > ~/textfile.txt
    - persist_to_workspace:
        root: ~/
        paths: 
          - textfile.txt 
