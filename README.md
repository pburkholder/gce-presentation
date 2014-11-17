Title: Cookie-cutter environments with Chef and GCC

### Main Points

* Repeat
* Test
* Scale

### About Me

(Point of this slide: That I have experience and insight that give me creedence)


### About You

(Point of this slide: That we are responsive to our customers and users)

This is the point in the talk where presenters ask their audience about their background via a show of hands

I'm interested in whence you approach GCE and Chef, but I'd prefer hard data to a show of hands, and the answer I get aren't going to change the content of the talk.

So, with a show of hands let me know if you would be willing to Tweet me answers to any of the following questions?

- Do you use GCE? If not, where are your nodes?
- Do you use Chef? If not, how do you manage your nodes?
- How many nodes do you have under management?
- Are you tired of presenters making you raise your hand?
- Would you be willing to Tweet me these answers?
-- Please raise hand




### Sample distributed application

(Point: We're discussing a common business scenario: Devs need to dev, product needs to demo, ops needs to prod)

Sample Env
- LB / Web Server / DB server (MySQL master-slave)
- Let's launch that

### Bottleneck?


### Let's talk DevOps:

(Point of this slide: contextualize our distributed app -- that everything we're discussing today is in the context of maximizing your business)

(We can discuss lean and constraints w/o Gene Kim)


- How quickly can you stand up a dev environment?
- Has provisioning consistent copies of your distribute app become a bottleneck?
- Can you maintain app configuration consistently and demonstrably?
- Can you
- This is the sort of thing that would happen to me with regularity:


### Solution: Chef + GCE

### What is Chef?


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

GCE live notes:
---------------

Cool that DNS is instance-1.c.dc-devfest.internal


    curl https://sdk.cloud.google.com | bash

GCE notes
========

- promo code chef14-con
- https://github.com/opscode/knife-google - older knife plugin
- https://www.youtube.com/watch?v=6K2biJbVV8o - 24 Aug Chef/GCE demo w/ George Miranda, etc
- https://github.com/GoogleCloudPlatform/compute-video-demo-chef - code for the above demo
- https://github.com/chef-partners/google-compute-engine - LWRP for GCE
 http://googlecloudplatform.blogspot.com/2014/04/using-chef-to-automate-google-compute.html - READ this (by Adam Edwards)
- https://github.com/anl/kitchen-gce - active
- https://github.com/chef-partners/google-compute-engine LWRP active
- http://www.meetup.com/gdg-boston/messages/boards/thread/37440682 - gdg-in
- https://www.getchef.com/blog/2014/11/12/chef-provisioning-infrastructure-as-code/


Billing Woes
= submitted ticket at 13:57
