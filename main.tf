terraform {
  cloud {
    organization = "auth-learning"

    workspaces {
      name = "tfc-s3-test"
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
  region = "ap-south-1" # Change to your preferred region
}

resource "aws_s3_bucket" "example" {
  bucket = "tfc-test-bucket-${random_pet.name.id}"
}

resource "random_pet" "name" {
  length = 2
}
