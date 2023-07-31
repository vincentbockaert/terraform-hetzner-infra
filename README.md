# Behold My Stuff | Terraform-ed

My terraform infra "stuff" at the Hetzner cloud provider :), playing around, self-hosting stuff, among other things.

## Terraform Cloud config

Authentication & variable input is done through Terraform Cloud.
Runs are triggered locally with state stored in the Terraform Cloud workspace, under my TF Cloud (persona) "org".

So assuming the setup (secrets are added to Terraform Cloud) is done:

```bash
op run --env-file .env -- terraform login
op run --env-file .env -- terraform init
op run --env-file .env -- terraform plan
op run --env-file .env -- terraform apply
```

## Fun SSH shenanigans

I like the idea of my ssh keys being in-sync with my services.
What I mean by that is that my GitHub SSH (Auth) keys shouldn't differ from those I use for ssh-ing to my servers.

So I fetch my SSH keys from my GitHub profile & create Hetzner Cloud ssh keys (my cloud hosting provider of choice).
These keys are injected into the VM instance. 