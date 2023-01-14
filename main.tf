terraform {
  required_providers {
    fakerancher = {
      source  = "nfagerlund/fakerancher"
      version = ">= 0.0.1"
    }
  }
}

resource "fakerancher_cluster" "counterfeit_fake" {
  backup_config {
    enabled        = true
    interval_hours = 6
    retention      = 21
    s3_backup_config {
      access_key  = "aws_iam_access_key.etcd_backup_user.id"
      bucket_name = "aws_s3_bucket.etcd_backups.id"
      endpoint    = "s3.$${aws_s3_bucket.etcd_backups.region}.amazonaws.com"
      region      = "aws_s3_bucket.etcd_backups.region"
      secret_key  = "aws_iam_access_key.etcd_backup_user.secret"
      folder      = "$${local.name}-etcd-backup"
    }
  }

}
