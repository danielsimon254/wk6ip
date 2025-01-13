variable "vm_name" {
  description = "yoloapp"
  default     = "backend-server"
}

variable "vm_count" {
  description = "Number of Virtual Machines to create"
  default     = 1
}

variable "vm_memory" {
  description = "Memory size for the Virtual Machine (in MB)"
  default     = 1024
}

variable "vm_cpu" {
  description = "Number of CPUs for the Virtual Machine"
  default     = 2
}
