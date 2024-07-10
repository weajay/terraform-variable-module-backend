terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "= 5.55.0"
    }
  }
  backend "s3" {
    bucket = "myaws-buckets"
    key    = "backend/dev/madd/terraformstate"
    region = "us-east-1"
  }
}

provider "aws" {
  region = var.region
}
provider "aws" {
  alias  = "new"
  region = var.region1
}


resource "aws_iam_user" "mye" {
  name = var.user-name

}

data "aws_iam_policy_document" "mypolicy" {
  statement {
    sid = "maddpolicy"

    actions = [
      "s3:GetBucketLocation",
      "s3:DescribeJob",
      "s3:ListJob",
      "s3:GetBucketPolicy",

    ]
    resources = [
      "arn:aws:s3:::myaws-buckets"
    ]
  }
}

resource "aws_iam_policy" "aws-policy" {
  name   = var.policy-name
  path   = "/"
  policy = data.aws_iam_policy_document.mypolicy.json
}

resource "aws_iam_user_policy_attachment" "test-attach" {
  user       = aws_iam_user.mye.name
  policy_arn = aws_iam_policy.aws-policy.arn
}
resource "aws_iam_user_policy_attachment" "test-attach2" {
  user       = aws_iam_user.mye.name
  policy_arn = var.policy_arn
  
}

resource "aws_instance" "web" {
  ami           = var.ami_web
  instance_type = var.instance_type_web
  

tags = {
    Name = var.tagName
}
}

resource "aws_instance" "web2" {
  ami           = var.ami_web2
  provider = aws.new
  instance_type = var.instance_type_web2
  }

output "ec2ip" {
  value = aws_instance.web2.public_ip
}

output "ashid" {
  value = aws_iam_user.mye.id
}


  
