## Terraform Module

Basic terraform configuration using a module 


** The code in the repo is used to create two instances in 
    Amazon EC2. 
    In order to use it, you should have an Account in AWS ***

### Prerequisites

   * AWS Account
   * [terraform](https://www.terraform.io/intro/getting-started/install.html)

### How to provision your infrastructure

   1. Clone this repository by running the line below: 

    ```
    git clone https://github.com/firedot/terraform_module.git 
    ```
   2. Go to the cloned repository directory: 

    ```
    cd terraform_module
    ```
   3. Initialize your terraform working directory with the following line: 
   ```
   terraform init
   ````
   4. Run ``` terraform apply ``` to provision your infrastructure. 
