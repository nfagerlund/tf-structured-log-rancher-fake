terraform {
  required_providers {
    fakerancher = {
      source  = "nfagerlund/fakerancher"
      version = ">= 0.0.1"
    }
  }
}

provider "fakerancher" {}

resource "fakerancher_cluster" "counterfeit_fake" {
  name        = "its_not_fake_its_real"
  description = "hey / hey / counterfeit fake / history sold you they made a mistake"
  extranested_rke_config {
    rke_config {
      services {
        etcd {
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
      }
    }
  }
  rke_config {
    services {
      etcd {
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
    }
  }
  unnested_rke_config_services {
    etcd {
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
  }
  unnested_rke_config_services_etcd {
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
}
