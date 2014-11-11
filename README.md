Title: Cookie-cutter environments with Chef and GCC

About Me

About You
- Do you use GCE? If not, where are your nodes?
- Do you use Chef? If not, how do you manage your nodes?
- How many nodes do you have under management?
- Are you tired of presenters making you raise your hand?
- Would you be willing to Tweet me these answers? 
-- Please raise hand

Phoenix Project
- How quickly can you stand up a dev environment?

Sample Env
- LB / Web Server / DB server (MySQL master-slave)
- Let's launch that

What's going on under the covers?

The node object - (Borrow from Jamie Winsor's talk)
- DSL to specify node resources
- cookbooks (encapsulate resources)

 In the world of Distribute Computing, the node is just an element, so now we are equally interested in the deployment/fleet/environment

Chef Provisioning (nee chef-metal)
- provisioning node
- nodes as resources

GCE cookbook

Provisioning identical whether on GCE or Vagrant (locally) or AWS

WIN!
