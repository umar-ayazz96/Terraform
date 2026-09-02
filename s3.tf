resource aws_s3_bucket statefilebucket {
    bucket = "unifin-prod-aws-statefile"

    tags = {
        Name = "statefilebucket"
    }
}