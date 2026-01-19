#!/bin/bash
set -e

ENV=$1

if [ -z "$ENV" ]; then
  echo "Usage: ./deploy.sh dev|prod"
  exit 1
fi

echo "🔄 Loading environment: $ENV"
source ../env/${ENV}_env.sh

export AWS_DEFAULT_REGION=$AWS_REGION

STACK_NAME=ecs-cpu-codepipeline-$ENV

echo "🚀 Deploying CodePipeline stack: $STACK_NAME"

aws cloudformation deploy \
  --stack-name $STACK_NAME \
  --template-file pipeline.yaml \
  --capabilities CAPABILITY_NAMED_IAM \
  --parameter-overrides \
    Environment=$ENV \
    GitHubConnectionArn=$GITHUB_CONNECTION_ARN \
    RepositoryName=$GITHUB_REPO \
    BranchName=$BRANCH \
    ArtifactBucket=$ARTIFACT_BUCKET \
    ImageRepoName=$IMAGE_REPO_NAME \
    VpcId=$VPC_ID \
    PublicSubnet1=$PUBLIC_SUBNET1 \
    PublicSubnet2=$PUBLIC_SUBNET2 \
    TaskExecutionRoleArn=$TASK_EXECUTION_ROLE_ARN
