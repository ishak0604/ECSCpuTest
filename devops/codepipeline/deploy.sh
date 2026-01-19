#!/bin/bash
set -e

if [ -z "$1" ]; then
  echo "Usage: ./deploy.sh <dev|prod>"
  exit 1
fi

ENV=$1
export ENV

echo "🔄 Loading environment: $ENV"
source ../env/${ENV}_env.sh

echo "🚀 Deploying CodePipeline for $ENV"

aws cloudformation deploy \
  --region "$AWS_REGION" \
  --template-file pipeline.yaml \
  --stack-name "ecs-cpu-pipeline-$ENV" \
  --capabilities CAPABILITY_NAMED_IAM \
  --tags Project=learning \
  --parameter-overrides \
    Environment="$ENV" \
    GitHubConnectionArn="$GITHUB_CONNECTION_ARN" \
    RepositoryName="$GITHUB_REPO" \
    BranchName="$BRANCH" \
    ArtifactBucket="$ARTIFACT_BUCKET" \
    ImageRepoName="$IMAGE_REPO_NAME" \
    VpcId="$VPC_ID" \
    PublicSubnet1="$PUBLIC_SUBNET1" \
    PublicSubnet2="$PUBLIC_SUBNET2"

echo "✅ Pipeline deployed successfully"
