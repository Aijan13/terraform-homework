
resource "aws_iam_user" "lb" {
  name = "jenny"
}

resource "aws_iam_user" "lb2" {
  name = "rose"
}
resource "aws_iam_user" "lb3" {
  name = "lisa"
}

resource "aws_iam_user" "lb4" {
  name = "jisoo"
}

resource "aws_iam_user" "lb5" {
  name = "jihyo"
}

resource "aws_iam_user" "lb6" {
  name = "sana"
}

resource "aws_iam_user" "lb7" {
  name = "momo"
}

resource "aws_iam_user" "lb8" {
  name = "dahyum"
}

resource "aws_iam_group" "devops" {
  name = "blackpink"
}

resource "aws_iam_group" "devops2" {
  name = "twice"
}


resource "aws_iam_group_membership" "team" {
  name = "tf-testing-group-membership"

  users = [
    aws_iam_user.lb.name,
    aws_iam_user.lb2.name,
    aws_iam_user.lb3.name,
    aws_iam_user.lb4.name,
    aws_iam_user.lb9.name,


  ]
  group = aws_iam_group.devops.name
}


resource "aws_iam_group_membership" "team2" {
  name = "tf-testing-group-membership2"

  users = [
    aws_iam_user.lb5.name,
    aws_iam_user.lb6.name,
    aws_iam_user.lb7.name,
    aws_iam_user.lb8.name,
    aws_iam_user.lb10.name,

  ]

  group = aws_iam_group.devops2.name

}


resource "aws_iam_user" "lb9" {
  name = "miyeon"
}


resource "aws_iam_user" "lb10" {
  name = "mina"
}

