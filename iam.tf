resource "aws_iam_user" "demo-buck-123" {
  name = "demo-buck-123-user"
}

resource "aws_iam_access_key" "demo-buck-123" {
  user = aws_iam_user.demo-buck-123.name
}

resource "aws_iam_user_policy" "demo-buck-123" {
  name   = "demo-buck-123-user-policy"
  user   = aws_iam_user.demo-buck-123.name
  policy = <<EOF
{
  "Version": "2012-10-17",
  "Statement": [
    {
      "Effect": "Allow",
      "Action": [
        "s3:PutObject",
        "s3:GetObject",
        "s3:ListBucket",
        "s3:DeleteObject"
      ],
      "Resource": ["arn:aws:s3:::${aws_s3_bucket.demo-buck-123.id}/*"]
    }
  ]
}
EOF
}


resource "aws_iam_policy" "demo-buck" {
  name        = "test_policy"
  path        = "/"
  description = "My test policy"

  policy = jsonencode({
    Version = "2012-10-17"
    Statement = [
      {
        Action = [
          "s3:GetObject",
          "s3:ListBucket"
        ]
        Effect   = "Allow"
        "Resource": ["arn:aws:s3:::${aws_s3_bucket.demo-buck-123.id}/*"]
      },
    ]
  })
}