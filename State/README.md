TERRAFORM STATE

We'll understand how Terraform tracks real world infrastructure changes.

Let's take an example of a local directory 'terraform-local-file'.
Inside the directory, we've two files:
1. main.tf
2. variables.tf
![alt text](image.png)

The primary terraform configuration is mentioned in the 'main.tf' file

![alt text](image-2.png)

The Variables used by this main configuration file are in the 'variables.tf' file

![alt text](image-3.png)

At this stage, no local file resource has been created yet.

Initializing and Running Terraform Plan

Before any resources are created or provisioned, we need to download the necessary plugins required for this terraform configuration file to do what it is required for.

![alt text](image-4.png)

Now, let’s create an execution plan using the 'terraform plan' command. When we run it for the fist time, Terraform will generate a plan for what resources we need to create.
Since the state file does not yet record any resources, Terraform understands that all resources defined in the configuration will be newly created.

![alt text](image-5.png)

After this, let's say we ran the 'terraform apply' command and the resources get created.

![alt text](image-6.png)

If you run terraform apply again, Terraform refreshes the state, detects that the resource already exists, and confirms that no further actions are needed:

![alt text](image-7.png)

Terraform maintains a state file, which is how it tracks that the resource is already provisioned.

Terraform State File

After the initial successful terraform apply, an additional file named terraform.tfstate is created in the project directory. This file is a JSON data structure mapping your real-world infrastructure to the resource definitions from your configuration files. The directory now appears as follows:

![alt text](image-8.png)

Now, if we inspect the state file, it will look like this. It reveals a detailed record of the infrastructure, including Resouce IDs, provider information, and resource attributes:

![alt text](image-9.png)

This state file is the single source of truth for Terraform.
It is leveraged during subsequent commands such as terraform plan and terraform apply to determine if any changes to the infrastructure are required.

Updating the Configuration
Now, let's update the configuration in variables.tf to modify the content of the file, as shown below:

![alt text](image-10.png)

After this change, running terraform apply causes Terraform to refresh the state and detect a difference between the new configuration and the existing state. Consequently, Terraform decides the resource must be replaced:

![alt text](image-11.png)

After applying these changes, Terraform deletes the old resource and creates a new one with a different unique ID. The updated terraform.tfstate now reflects the new state:

![alt text](image-12.png)

Now that the configuration file and the state file are in sync, any subsequent runs of terraform apply will report that no changes are necessary.

Conclusion

In this lesson, we explored how Terraform leverages a state file—initially created during the first successful apply—to track and manage real-world infrastructure. This state file serves as the authoritative record for your resources and is essential for Terraform to efficiently plan and apply configuration changes.

