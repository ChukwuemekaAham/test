HP@DESKTOP-9MLLT14 MINGW64 ~/Downloads/zoomcamp/data-engineering-zoomcamp/projects/terraform_infra (main)
$ terraform plan

Terraform used the selected providers to    
generate the following execution plan.      
Resource actions are indicated with the     
following symbols:
  + create

Terraform will perform the following actions:

  # google_bigquery_dataset.output_dataset will be created
  + resource "google_bigquery_dataset" "output_dataset" {
      + creation_time              = (known after apply)
      + dataset_id                 = "bikeshare"
      + default_collation          = (known after apply)
      + delete_contents_on_destroy = false  
      + effective_labels           = (known after apply)
      + etag                       = (known after apply)
      + id                         = (known after apply)
      + is_case_insensitive        = (known after apply)
      + last_modified_time         = (known after apply)
      + location                   = "US"   
      + max_time_travel_hours      = (known after apply)
      + project                    = "clear-router-390022"
      + self_link                  = (known after apply)
      + storage_billing_model      = (known after apply)
      + terraform_labels           = (known after apply)

      + access {
          + domain         = (known after apply)
          + group_by_email = (known after apply)
          + iam_member     = (known after apply)
          + role           = (known after apply)
          + special_group  = (known after apply)
          + user_by_email  = (known after apply)

          + dataset {
              + target_types = (known after apply)

              + dataset {
                  + dataset_id = (known after apply)
                  + project_id = (known after apply)
                }
            }

          + routine {
              + dataset_id = (known after apply)
              + project_id = (known after apply)
              + routine_id = (known after apply)
            }

          + view {
              + dataset_id = (known after apply)
              + project_id = (known after apply)
              + table_id   = (known after apply)
            }
        }
    }

  # google_composer_environment.composer will be created
  + resource "google_composer_environment" "composer" {
      + effective_labels = (known after apply)
      + id               = (known after apply)
      + name             = "de-proj-composer"
      + project          = "clear-router-390022"
      + region           = "us-central1"    
      + terraform_labels = (known after apply)

      + config {
          + airflow_uri      = (known after apply)
          + dag_gcs_prefix   = (known after apply)
          + environment_size = (known after apply)
          + gke_cluster      = (known after apply)
          + node_count       = (known after apply)
          + resilience_mode  = (known after apply)

          + database_config {
              + machine_type = (known after apply)
            }

          + encryption_config {
              + kms_key_name = (known after apply)
            }

          + maintenance_window {
              + end_time   = (known after apply)
              + recurrence = (known after apply)
              + start_time = (known after apply)
            }

          + master_authorized_networks_config {
              + enabled = (known after apply)

              + cidr_blocks {
                  + cidr_block   = (known after apply)
                  + display_name = (known after apply)
                }
            }

          + node_config {
              + disk_size_gb         = (known after apply)
              + enable_ip_masq_agent = (known after apply)
              + ip_allocation_policy = (known after apply)
              + machine_type         = (known after apply)
              + network              = (known after apply)
              + oauth_scopes         = (known after apply)
              + service_account      = (known after apply)
              + subnetwork           = (known after apply)
              + tags                 = (known after apply)
              + zone                 = (known after apply)
            }

          + private_environment_config {    
              + cloud_composer_connection_subnetwork   = (known after apply)
              + cloud_composer_network_ipv4_cidr_block = (known after apply)
              + cloud_sql_ipv4_cidr_block              = (known after apply)
              + connection_type             
           = (known after apply)
              + enable_private_endpoint                = (known after apply)
              + enable_privately_used_public_ips       = (known after apply)
              + master_ipv4_cidr_block                 = (known after apply)
              + web_server_ipv4_cidr_block             = (known after apply)
            }

          + recovery_config {
              + scheduled_snapshots_config {
                  + enabled                 
   = (known after apply)
                  + snapshot_creation_schedule = (known after apply)
                  + snapshot_location          = (known after apply)
                  + time_zone               
   = (known after apply)
                }
            }

          + software_config {
              + airflow_config_overrides = (known after apply)
              + env_variables            = (known after apply)
              + image_version            = (known after apply)
              + pypi_packages            = (known after apply)
              + python_version           = (known after apply)
              + scheduler_count          = (known after apply)
            }

          + web_server_config {
              + machine_type = (known after apply)
            }

          + web_server_network_access_control {
              + allowed_ip_range {
                  + description = (known after apply)
                  + value       = (known after apply)
                }
            }

          + workloads_config {
              + scheduler {
                  + count      = (known after apply)
                  + cpu        = (known after apply)
                  + memory_gb  = (known after apply)
                  + storage_gb = (known after apply)
                }

              + triggerer {
                  + count     = (known after apply)
                  + cpu       = (known after apply)
                  + memory_gb = (known after apply)
                }

              + web_server {
                  + cpu        = (known after apply)
                  + memory_gb  = (known after apply)
                  + storage_gb = (known after apply)
                }

              + worker {
                  + cpu        = (known after apply)
                  + max_count  = (known after apply)
                  + memory_gb  = (known after apply)
                  + min_count  = (known after apply)
                  + storage_gb = (known after apply)
                }
            }
        }

      + storage_config {
          + bucket = (known after apply)    
        }
    }

  # google_dataproc_cluster.cluster will be created
  + resource "google_dataproc_cluster" "cluster" {
      + effective_labels              = (known after apply)
      + graceful_decommission_timeout = "0s"
      + id                            = (known after apply)
      + name                          = "de-proj-cluster"
      + project                       = "clear-router-390022"
      + region                        = "us-central1"
      + terraform_labels              = (known after apply)

      + cluster_config {
          + bucket      = (known after apply)
          + temp_bucket = (known after apply)

          + endpoint_config {
              + enable_http_port_access = (known after apply)
              + http_ports              = (known after apply)
            }

          + gce_cluster_config {
              + internal_ip_only       = (known after apply)
              + metadata               = (known after apply)
              + network                = (known after apply)
              + service_account        = (known after apply)
              + service_account_scopes = (known after apply)
              + subnetwork             = (known after apply)
              + tags                   = (known after apply)
              + zone                   = (known after apply)

              + node_group_affinity {       
                  + node_group_uri = (known after apply)
                }

              + reservation_affinity {      
                  + consume_reservation_type = (known after apply)
                  + key                     
 = (known after apply)
                  + values                  
 = (known after apply)
                }

              + shielded_instance_config {  
                  + enable_integrity_monitoring = (known after apply)
                  + enable_secure_boot          = (known after apply)
                  + enable_vtpm             
    = (known after apply)
                }
            }

          + master_config {
              + image_uri        = (known after apply)
              + instance_names   = (known after apply)
              + machine_type     = "n1-standard-2"
              + min_cpu_platform = (known after apply)
              + num_instances    = 1        

              + disk_config {
                  + boot_disk_size_gb = (known after apply)
                  + boot_disk_type    = (known after apply)
                  + num_local_ssds    = (known after apply)
                }
            }

          + preemptible_worker_config {     
              + instance_names = (known after apply)
              + num_instances  = (known after apply)
              + preemptibility = (known after apply)

              + disk_config {
                  + boot_disk_size_gb = (known after apply)
                  + boot_disk_type    = (known after apply)
                  + num_local_ssds    = (known after apply)
                }

              + instance_flexibility_policy {
                  + instance_selection_results = (known after apply)

                  + instance_selection_list {
                      + machine_types = (known after apply)
                      + rank          = (known after apply)
                    }
                }
            }

          + software_config {
              + image_version       = (known after apply)
              + optional_components = (known after apply)
              + override_properties = (known after apply)
              + properties          = (known after apply)
            }

          + worker_config {
              + image_uri         = (known after apply)
              + instance_names    = (known after apply)
              + machine_type      = "n1-standard-2"
              + min_cpu_platform  = (known after apply)
              + min_num_instances = (known after apply)
              + num_instances     = 2       

              + disk_config {
                  + boot_disk_size_gb = (known after apply)
                  + boot_disk_type    = (known after apply)
                  + num_local_ssds    = (known after apply)
                }
            }
        }

      + virtual_cluster_config {
          + staging_bucket = (known after apply)

          + auxiliary_services_config {     
              + metastore_config {
                  + dataproc_metastore_service = (known after apply)
                }

              + spark_history_server_config {
                  + dataproc_cluster = (known after apply)
                }
            }

          + kubernetes_cluster_config {     
              + kubernetes_namespace = (known after apply)

              + gke_cluster_config {        
                  + gke_cluster_target = (known after apply)

                  + node_pool_target {      
                      + node_pool = (known after apply)
                      + roles     = (known after apply)

                      + node_pool_config {  
                          + locations = (known after apply)

                          + autoscaling {   
                              + max_node_count = (known after apply)
                              + min_node_count = (known after apply)
                            }

                          + config {        
                              + local_ssd_count  = (known after apply)
                              + machine_type     = (known after apply)
                              + min_cpu_platform = (known after apply)
                              + preemptible      = (known after apply)
                              + spot             = (known after apply)
                            }
                        }
                    }
                }

              + kubernetes_software_config {
                  + component_version = (known after apply)
                  + properties        = (known after apply)
                }
            }
        }
    }

  # google_storage_bucket.input_bucket will be created
  + resource "google_storage_bucket" "input_bucket" {
      + effective_labels            = (known after apply)
      + force_destroy               = true  
      + id                          = (known after apply)
      + location                    = "US"  
      + name                        = "clear-router-390022_de-proj-bucket"
      + project                     = (known after apply)
      + public_access_prevention    = (known after apply)
      + self_link                   = (known after apply)
      + storage_class               = "STANDARD"
      + terraform_labels            = (known after apply)
      + uniform_bucket_level_access = true  
      + url                         = (known after apply)

      + lifecycle_rule {
          + action {
              + type = "AbortIncompleteMultipartUpload"
            }

          + condition {
              + age                   = 1   
              + matches_prefix        = []  
              + matches_storage_class = []  
              + matches_suffix        = []  
              + with_state            = (known after apply)
            }
        }

      + versioning {
          + enabled = true
        }

      + website {
          + main_page_suffix = (known after apply)
          + not_found_page   = (known after apply)
        }
    }

Plan: 4 to add, 0 to change, 0 to destroy.

Changes to Outputs:
  + input_bucket_name = "clear-router-390022_de-proj-bucket"
  + output_dataset_id = "bikeshare"

─────────────────────────────────────────── 

Note: You didn't use the -out option to     
save this plan, so Terraform can't
guarantee to take exactly these actions if  
you run "terraform apply" now.