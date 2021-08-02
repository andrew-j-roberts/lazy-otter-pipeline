### Service Onboarding Checklist

- [] The application's repository is hosted under the solacese GitHub org
- [] There's a Dockerfile in the root of the application's repository
- [] Made a copy of the `terraform/modules/services/_template` directory for the new service
- [] Renamed the copy of the `_template` directory to exactly match the repository name for the application
- [] Updated the new service's `variables.tf` configuration file with its name and resource requirements
- [] Updated `terraform/modules/services/main.tf` to include a module block for the new service
- [] 😃
