# dc_devfest

chef-client -l debug -z -r 'dc_devfest::database' -c .chef/client.rb -E dev
chef-client -l debug -z -r 'dc_devfest::default' -c .chef/client.rb -E prodsubl

# cleanup

knife node list | grep 141 | while read node; do for act in node client; do knife $act delete -y $node; done; done

gcloud compute instances list | awk '/central/ {print $1}' | while read instance; do  gcloud compute instances delete $instance -q --delete-disks all; done

gcloud compute disks list | perl -ane 'm/central/ && print $F[0]," "'

TODO: Enter the cookbook description here.
