# `ec2connect`

This is a fork from [glassechidna/ec2connect](https://github.com/glassechidna/ec2connect).
The last commit is from two years ago. This project is very usefull and functional,
except that it was not working on AWS SSO authentication.

As it became very useful, we in [Escale Digital](https://escale.com.br/) decided to fork & maintain it.

The following content is from original README repository. We only had to update the repository owner references.

In [June 2019][rel-notes], AWS released [EC2 Instance Connect][docs] - a way of
authenticating SSH sessions using AWS IAM policies. This **massively** improves
security by removing the need for sharing SSH private keys. It also improves
reliability by removing the need for any workarounds to avoid sharing keys!

AWS did release an [`mssh`][mssh] tool, but it's not as nice as it could be.
`ec2connect` improves upon it:

* Doesn't require Python to be installed. Single binary available for Mac, Linux
  and Windows.
* Doesn't require a new command to be remembered - just `ssh ec2-user@host` as 
  normal.
* Integrates nicely with every other tool - any tool that relies on SSH (e.g. `git`)
  will work out of the box due to the above.

## Installation

* Mac: `brew install escaletech/taps/ec2connect`
* Otherwise get the latest build from the [Releases][releases] tab.

## Usage

On first time usage, run `ec2connect setup`. This sets up your SSH configuration
to use `ec2connect` to connect to your instances. You only need to run this once.

Now, connect to your instances using `ssh <user>@<instance id>`. For example:

```
# regular ssh connection
ssh ec2-user@i-000abc124def

# in a different region
AWS_REGION=us-west-2 ssh ec2-user@i-000abc124def

# with a profile
AWS_PROFILE=mycompany ssh ec2-user@i-000abc124def

# with port-forwarding. the possibilities are endless!
ssh -L 2375:127.0.0.1:2375 ec2-user@i-000abc124def
```

## Known issues

Right now this tool only works with SSH public keys that are stored on disk or
in an SSH agent. What that means in effect is that you can't pass in an identity 
using `ssh -i <pemfile>`.

[rel-notes]: https://aws.amazon.com/about-aws/whats-new/2019/06/introducing-amazon-ec2-instance-connect/
[docs]: https://docs.aws.amazon.com/AWSEC2/latest/UserGuide/Connect-using-EC2-Instance-Connect.html
[mssh]: https://docs.aws.amazon.com/AWSEC2/latest/UserGuide/ec2-instance-connect-set-up.html#ec2-instance-connect-install-eic-CLI
[releases]: https://github.com/escaletech/ec2connect/releases
