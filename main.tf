terraform {
  cloud {
    organization = "auth-learning"

    workspaces {
      name = "API-driven-test-mahima"
    }
  }

  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 5.0"
    }
  }
}

provider "aws" {
  region = "us-east-1" # Change to your preferred region
}

resource "aws_s3_bucket" "example" {
  bucket = "tfc-test-bucket-${random_pet.name.id}"
}

resource "random_pet" "name" {
  length = 2
}

import {
  to = aws_s3_bucket.test
  id = "test-bucket-mahima-import"
}

resource "aws_s3_bucket" "test" {
  bucket = "test-bucket-mahima-import"
}
