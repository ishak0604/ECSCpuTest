#!/bin/bash

export AWS_REGION=ap-south-1

# GitHub
export GITHUB_CONNECTION_ARN=arn:aws:codeconnections:ap-south-1:140857882741:connection/4c43c5a0-6ac9-417b-8d51-7bbc0c0822ad
export GITHUB_REPO=ishak0604/ECSCpuTest
export BRANCH=main

# Artifacts
export ARTIFACT_BUCKET=ecs-cpu-artifacts-140857882741

# App
export IMAGE_REPO_NAME=ecs-cpu-test

# Network
export VPC_ID=vpc-0299f63509a82a65c
export PUBLIC_SUBNET1=subnet-0eb3b9e2b9785076a
export PUBLIC_SUBNET2=subnet-07362db383752c2e2

export TASK_EXECUTION_ROLE_ARN=arn:aws:iam::140857882741:role/ecs-cpu-task-execution-role

