resource "aws_s3_bucket" "image-bucket" {
    bucket  = "webserver-images321"
    acl     = "public-read"


provisioner "local-exec" { 
        command     = "git clone https://github.com/pk2101/automation.git"

}

provisioner "local-exec" {
        when        =   destroy
        command     =   "echo Yes | rmdir /s automation"
    }
}


resource "aws_s3_bucket_object" "image-upload" {
    content_type = "image/jpeg"
    bucket  = "${aws_s3_bucket.image-bucket.id}"
    key     = "webphoto.jpeg"
    source  = "automation/img2.jpeg"
    acl     = "public-read"
}