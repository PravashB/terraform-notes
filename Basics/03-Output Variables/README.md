**Terraform Output** variables are a powerful tool which allows us to store the results of expressions from the configuration file for later use.

The syntax is:
![alt text](image-2.png)

**NOTE:** The value argument is Mandatory and is a reference expression. While we can add the optional argument 'description'.

Now, let's consider an example.
Let's create a configuration file 'main.tf' that creates a random pet name and an output variable that captures the generated id.

![alt text](image-3.png)

We'll also have a variables.tf file that declares the variables used in the main.tf file.

![alt text](image-5.png)

When we run a 'terraform apply' command, it prints the output variable in the screen.

![alt text](image-6.png)

Now, if we want to see the value of the output variables at a later stage, we can use the command:
'terraform output'

![alt text](image-7.png)

Additionally, if we want to print the value of the existing output variable, we can use the command:
'terraform output pet-name'

![alt text](image-8.png)

![alt text](image-9.png)