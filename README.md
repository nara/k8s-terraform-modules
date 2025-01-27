# k8s-terraform-modules

Terraform modules to provision Kubernetes (K8s) resources.

## Overview

This repository contains a collection of Terraform modules designed to simplify the provisioning and management of Kubernetes resources. These modules can be used to create and manage various Kubernetes components such as namespaces, deployments, services, and more.

## Modules

- Argo: Module to install and configure argo in K8s cluster
- K8s Cluster Security: Configure Roles and Rolebindings
- Istio - Install and configure with helm charts
- Thanos + Grafana - Install and configure thanos and grafana
- Security - Setup namespace, networking and security for the namespace

## Features

- **Modular Design**: Each module is designed to be reusable and composable.
- **Best Practices**: Follows Kubernetes and Terraform best practices.
- **Customizable**: Easily configurable to suit different environments and use cases.

## Prerequisites

- [Terraform](https://www.terraform.io/downloads.html) v0.12 or later
- [Kubernetes](https://kubernetes.io/docs/tasks/tools/install-kubectl/) cluster
- [kubectl](https://kubernetes.io/docs/tasks/tools/install-kubectl/) command-line tool

## Getting Started

### Clone the Repository

```sh
git clone https://github.com/yourusername/k8s-terraform-modules.git
cd k8s-terraform-modules
```

## Contributing

Contributions are welcome! Please submit a pull request or open an issue to discuss changes.

## License

This project is licensed under the Apache 2 License.

## Authors

- [Nara Alzapur](https://github.com/nara)
