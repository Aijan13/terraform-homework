resource "aws_key_pair" "deployer" {
  key_name   = "Bastion-key"
  public_key = file("~/.ssh/id_rsa.pub")
}

resource "aws_s3_bucket" "example" {
  bucket = "kaizen-aijan"
}
resource "aws_s3_bucket" "example2" {
  bucket_prefix = "kaizen-"
}


resource "aws_s3_bucket" "my_bucket" {
  bucket = "muratova93"
}

resource "aws_s3_bucket" "my_bucket2" {
  bucket = "negrescu01"
}

resource "aws_iam_user" "girls" {
  for_each = toset([
    "jenny",
    "rose",
    "lisa",
    "jisoo"
  ])
  name = each.key
}

resource "aws_iam_group" "honey" {
  name = "blackpink"
}

resource "aws_iam_group_membership" "team" {
  name = "blackpink"

  users = [
    for i in aws_iam_user.girls : i.name
  ]

  group = aws_iam_group.honey.name
}