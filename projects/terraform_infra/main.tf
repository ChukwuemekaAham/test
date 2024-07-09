terraform {
  required_providers {
    google = {
      source  = "hashicorp/google"
      version = "5.6.0"
    }
  }
}

# Define the required providers
provider "google" {
  credentials = file(var.credentials)
  project     = var.project
  region      = var.region
  zone        = var.zone
}

# Create a Cloud Storage bucket for input data
resource "google_storage_bucket" "input_bucket" {
  name          = "${local.data_lake_bucket}_${var.project}" # Concatenating DL bucket & Project name for unique naming
  location      = var.location

  # Optional, but recommended settings:
  storage_class = var.storage_class
  uniform_bucket_level_access = true

  versioning {
    enabled     = true
  }

  lifecycle_rule {
    condition {
      age = 1 // days
    }
    action {
      type = "AbortIncompleteMultipartUpload"
    }
  }

  force_destroy = true
}

# Create a BigQuery dataset for the transformed data
resource "google_bigquery_dataset" "output_dataset" {
  dataset_id = var.BQ_DATASET
  project    = var.project
  location   = var.location
}

# Create a Dataproc cluster for running the Spark job
resource "google_dataproc_cluster" "cluster" {
  name          = var.dataproc_cluster_name
  project       = var.project
  region        = var.region
 
  cluster_config {
    master_config {
    num_instances = 1
    machine_type  = "n1-standard-2"
    disk_config {
        boot_disk_size_gb = 30
      }
  }

  worker_config {
    num_instances = 0
    machine_type  = "n1-standard-2"
    disk_config {
        boot_disk_size_gb = 30
      }
  }
  }
  
}

# resource "google_service_account" "composer_service_account" {
#   account_id   = "composer-service-account"
#   display_name = "composer Service Account"
# }

# resource "google_project_iam_member" "composer_service_account" {
#   project  = var.project
#   member   = format("serviceAccount:%s", google_service_account.composer_service_account.email)
#   // Role for Public IP environments
#   role     = "roles/composer.worker"
# }

# resource "google_service_account_iam_member" "composer_service_account" {
#   service_account_id = google_service_account.composer_service_account.name
#   role = "roles/composer.ServiceAgentV2Ext"
#   member = "serviceAccount:service-583662008298@cloudcomposer-accounts.iam.gserviceaccount.com"
# }

# # Create a Cloud Composer environment
# resource "google_composer_environment" "composer" {
#   name          = var.composer_name
#   project       = var.project
#   region        = var.region

#   config {
#     software_config {
#       image_version = "composer-2.6.6-airflow-2.6.3"
#     }

#     node_config {
#       service_account = google_service_account.composer_service_account.email
#     }
#   }  
# }

# # Define the Cloud Composer DAG for the ETL pipeline
# resource "google_composer_environment_config" "composer_dag" {
#   project  = "<your-project-id>"
#   location = "us-central1"
#   environment = google_composer_environment.composer.name

#   config = <<EOF
# {
#   "name": "spark_etl_pipeline",
#   "dag": {
#     "tasks": [
#       {
#         "task_id": "submit_spark_job",
#         "operator": "bash_operator",
#         "bash_command": "gcloud dataproc jobs submit pyspark --cluster=${google_dataproc_cluster.cluster.name} --region=${google_dataproc_cluster.cluster.region} --project=<your-project-id> --bucket=<your-bucket> --py-files=gs://<your-bucket>/etl_job.py -- gs://${google_storage_bucket.input_bucket.name}/input_data.csv bq://${google_bigquery_dataset.output_dataset.project_id}/${google_bigquery_dataset.output_dataset.dataset_id}.output_table"
#       }
#     ]
#   }
# }
# {
#   "name": "spark_etl_pipeline",
#   "dag": {
#     "tasks": [
#       {
#         "task_id": "submit_spark_job",
#         "operator": "google_cloud_platform.operators.dataproc.DataprocSubmitPySparkJobOperator",
#         "arguments": {
#           "project_id": "<your-project-id>",
#           "region": "us-central1",
#           "cluster_name": "<your-dataproc-cluster-name>",
#           "job": {
#             "reference": {
#               "project_id": "<your-project-id>",
#               "job_id": "etl_job"
#             },
#             "placement": {
#               "cluster_name": "<your-dataproc-cluster-name>"
#             },
#             "pyspark_job": {
#               "main_python_file_uri": "gs://<your-bucket>/etl_job.py",
#               "args": [
#                 "gs://${google_storage_bucket.input_bucket.name}/input_data.csv",
#                 "bq://${google_bigquery_dataset.output_dataset.project_id}/${google_bigquery_dataset.output_dataset.dataset_id}.output_table"
#               ]
#             }
#           }
#         }
#       }
#     ]
#   }
# }
# EOF
# }

# Output the created resources
output "input_bucket_name" {
  value = google_storage_bucket.input_bucket.name
}

output "output_dataset_id" {
  value = google_bigquery_dataset.output_dataset.dataset_id
}
