# Behold My Stuff | Terraform-ed

![Behold My Stuff](img/behold-my-stuff.png)

My infra "stuff" :), playing around, self-hosting stuff, among other things

## Terraform Cloud config

Authentication & variable input is done through Terraform Cloud.
Runs are triggered locally with state stored in the Terraform Cloud workspace, under my TF Cloud (persona) "org".

## Fun SSH shenanigans

I like the idea of my ssh keys being in-sync with my services.
What I mean by that is that my GitHub SSH (Auth) keys shouldn't differ from those I use for ssh-ing to my servers.

So I fetch my SSH keys from my GitHub profile & create Hetzner Cloud ssh keys (my cloud hosting provider of choice).
These keys are injected into the VM instance. 

One nuisance ... Hetzner Cloud's API's does not allow keys to have the same name ... :( (even though they use id's 
internally). 
Additionally the data-call to github merely gives you the public keys, so not ideal for a name.

So I went with hacky option :D --> use random_pet a [terraform logical resource](https://registry.terraform.io/providers/hashicorp/random/latest/docs/resources/pet)
to assign random pet names to the keys. 

```terraform
resource "random_pet" "pet" {
  for_each = toset(data.github_user.current.ssh_keys)
}

resource "hcloud_ssh_key" "ssh_key" {
  for_each = toset(data.github_user.current.ssh_keys)
  public_key = each.key
  name = "GitHub SSH Key - ${random_pet.pet[each.key].id}"
}
```