# dc_devfest

TODO: Enter the cookbook description here.

knife data bag create  gce
knife data bag from file gce data_bags/gce/service_account.json
 chef gem install --no-rdoc --no-ri google-api-client uuidtools multi_json
  255  stove --help
  256  man git-tag
  257  stove --no-git
  258  cd ~/.chef
  259  more knife.rb 
  260  ll
  262  pbpaste > pburkholder.pem
  263  chmod 400 pburkholder.pem 
  264  chmod 600pburkholder.pem
  265  chmod 600 pburkholder.pem
  267  cirs
  268  dirs
  269  cd -
  270  stove --no-git
  271  s3cmd ls
  273  more ~/.aws/config 
  274  cd ~/tmp
  275  chef --version
  277  CHEF_DRIVER=aws chef-client -z mycluster.rb
  278  chef gem list
  280  gem search provisioning
  281  gem install chef-provisioning-aws
  283  CHEF_DRIVER=aws chef-client -z mycluster.rb
  284  ssh-add ~/.ssh/chef_aws
  285  CHEF_DRIVER=aws chef-client -z mycluster.rb
  286  aws ec2 describe-instances
  287  CHEF_DRIVER=aws chef-client -z mycluster.rb
  288  aws ec2 describe-instances i-91b9119b
  289  aws ec2 describe-instances --help
  290  aws ec2 describe-instances help
  291  aws ec2 describe-instances --instance-ids i-91b9119b
  292  aws ec2 describe-instances --instance-ids i-91b9119b
  295  ec2din i-91b9119b
  296  CHEF_DRIVER=aws chef-client -z mycluster.rb
  297  export CHEF_DRIVER=aws
  298  CHEF_DRIVER=aws chef-client -z mycluster.rb
  299  cd ~/Projects/GCE/
  301  cd ~/Projects/
  302  git clone git@github.com:opscode/chef-dk.git
  303  cd chef-dk/
  306  ack rubocop
  307  ack 'ruby.re'
  308  ack chefspec
  309  ack 'ruby.parse'
  310  ack foodcritic
  311  ack foodcritic
  312  ce /opt/chefdk/
  313  cd /opt/chefdk/
  314  cd bin/
  315  ls
  316  cd ../embedded/bin/
  317  ls
  319  more rubocop 
  320  ls
  321  pwd
  322  more rubocop
  323  cd ../../bin
  324  more rubocop 
  325  vmrun list
  326  cd ~/Projects/tci
  327  kitchen list
  328  kitchen help
  329  more /etc/host
  330  more /etc/hosts
  331  nc chef.chef-demo.com 443
  332  nc 192.168.243.21 80
  333  nc 192.168.243.21 80
  334  nc 192.168.243.21 80
  337  cd ~/Projects/demo-framework/vagrant/vbox/
  338  ls
  339  cd chef-server-12/
  340  vagrant ssh
  341  rake -T
  342  rake server:destroy
  343  rake server:bootstrap
  344  ls
  345  dirs
  346  push ~/Projects/demo-framework
  347  pushd ~/Projects/demo-framework
  348  ls
  349  cd chef/
  350  ack opscode-anal
  351  ack anal
  352  cd ..
  353  ack anal
  354  ack anal -l
  355  ack anal -li
  356  more vagrant/vbox/chef-server-12/shared/scripts/bootstrap.sh
  357  popd
  358  rake server:bootstrap
  359  curl -k https://analytics.chef-demo.com
  360  vagrant ssh
  361  rake server:destroy server:bootstrap
  362  vagrant ssh
  364  ls
  367  vagrant plugins
  368  vagrant plugin list
  374  git diff
  380  git diff
  383  wget https://opscode-omnibus-packages.s3.amazonaws.com/ubuntu/12.04/x86_64/chef_11.16.2-1_amd64.deb
  386  ls
  388  curl -L https://www.opscode.com/chef/install.sh > install.sh
  392  ls
  393  rm install.sh 
  394  git diff
  396  vagrant ssh
  397  ls
  398  mv opscode-analytics_1.1.0-beta.2-1_amd64.deb pkgs/
  399  mv pkgs/opscode-analytics_1.1.0-beta.1-1_amd64.deb .
  400  pushd ~/Clients/bridgewater/
  401  ls
  402  cd docs/
  403  ls
  404  atom .
  405  cd ~/Projects/
  406  more */Berksfile
  408  more chef-mongodb/Berksfile
  409  more chef-mongodb/Berksfile.lock 
  410  cd ~/Projects/cheffian-examples/
  411  ls
  413  git checkout motd_fixed 
  414  mkdir ~/Projects/pburkholder_base
  415  mkdir ~/Projects/pburkholder_motd
  416  cp -r motd_busted/ ~/Projects/pburkholder_motd
  417  cd ~/Projects/pburkholder_motd
  418  ls
  420  rm -rf .kitchen
  421  git init .
  422  git status
  423  git add .
  424  git commit -m "Working motd"
  425  git remote add origin git@github.com:pburkholder/pburkholder_motd.git
  426  git push -u origin master
  427  cd ../pburkholder_base/
  428  cp -r ../pburkholder_motd/ .
  429  cd ../pburkholder_base/
  430  cd -
  431  atom .
  432  git rm attributes/default.rb
  433  cd ..
  434  mv pburkholder_base/ pdb_motd
  435  mv pdb_motd/ pbd_base
  436  mv pburkholder_motd/ pdb_motd
  437  cd pdb_motd/
  438  git remote -v
  439  git remote -h
  440  git remote set-url origin git@github.com:pburkholder/pdb_motd.git
  441  git status
  442  ack motd
  443  atom .
  444  rake
  445  ack examp
  446  git status
  447  git commit -am "Rename to pdb_motd"
  448  git push origin HEAD
  449  cd ..
  450  ls
  451  mv pbd_base/ pdb_base
  452  cd pdb_base
  453  rake
  454  rubocop -a
  455  rubocop 
  456  rake
  457  rake
  458  ack depends ../*/metadat
  459  ack depends ../*/metadata.rb
  460  more metadata.rb 
  461  atom .
  462  rake
  463  ack -l supermarket ../*/Berksfile
  464  mroe ../iptables/Berksfile
  465  more ../iptables/Berksfile
  467  ack -l git ../*/Berksfile
  468  mroe ../chef-fundamentals-repo/Berksfile 
  469  more ../chef-fundamentals-repo/Berksfile
  470  git status
  471  git add _Berksfile_
  472  git commit -am "Hacking from motd to base"
  473  git remote -v
  474  git remote set-url origin git@github.com:pburkholder/pdb_base.git
  475  git remote -v
  476  git push -u origin master
  477  rake
  478  rake
  479  ln -s _Berksfile_ Berksfile
  480  rake
  481  git status
  482  git add test/
  483  git commit -am "Ready for show off"
  484  git push origin HEAD
  485  git checkout -b working
  486  berks install
  487  more Berksfile.lock 
  488  rspec
  489  rake
  490  rake
  491  kitchen verify
  493  kitchen verify
  494  kitchen destroy
  495  cd ~/Projects/demo-framework/
  496  git status
  497  git branch pdb/analytics_1.1
  498  git commit -am "This works now with analytics beta.1"
  499  git push origin HEAD
  500  cd ~/Projects/
  501  git clone https://github.com/portertech/chef-monitor.git
  502  cd chef-monitor/
  503  more .kitchen.yml 
  504  cd ..
  506  cd tci
  507  more Vagrantfile.erb 
  508  cd ..
  510  cd chef-monitor/
  512  more ../tci/.kitchen.yml 
  514  kitchen up
  515  kitchen help
  516  kitchen create
  517  more README.md 
  518       bundle install --path vendor/bundle
  519  kitchen create
  520  chef gem install librarian-chef
  521  kitchen create
  522  vagrant destroy
  523  kitchen destroy
  524  kitchen list
  525  kitchen create centos
  526  time kitchen converge
  530  time kitchen converge
  532  time kitchen converge
  533  more .kitchen
  534  more .kitchen.yml 
  535  time kitchen converge
  538  kitchen login
  539  atom .
  541  kitchen destroy
  542  kitchen converge
  543  cd ~/Projects/demo-framework/
  544  git branch
  545  git checkout pdb/analytics_1.1 
  546  git remote add mine https://github.com/pburkholder/demo-framework.git
  547  git remote -v
  548  git push mine HEAD
  549  git remote set-url mine git@github.com:pburkholder/demo-framework.git
  550  git push mine HEAD
  551  cd
  552  cd ~/Projects/GCE/
  553  git status
  554  git diff
  556  atom .
  557  curl https://sdk.cloud.google.com | bash
  559  source ~/.bash_profile
  562  cd
  564  source ~/.bash_profile
  566  which vmrun
  567  vmrun
  569  source ~/.bash_profile
  570  gcloud
  571  cd ~/Projects/demo-framework/
  572  atom .
  573  vagrant global-status
  574  rake -T
  575  cd ~/tmp
  576  wget http://demo-framework.s3.amazonaws.com/mysite-A.tar.gz
  577  tar -zxvf mysite-A.tar.gz 
  578  cd mysite
  579  atom .
  580  pwd
  581  git status
  582  pwd
  583  cd ~/Projects/demo-framework/
  584  git status
  585  git checkout master
  586  git log
  587  git pull origin master
  588  git revert a1e4d670be3f460c4371383ed9492356b35726b3
  589  git log
  590  git push origin master
  591  git branch
  592  cd ../GCE/
  593  ls
  594  git status
  595  git add README.md
  596  git commit -m "More notes"
  597  berks help
  598  chef cookbook dc_devfest
  599  chef generate cookbook dc_devfest
  600  ls
  601  cd dc_devfest/
  602  ls
  603  more README.md 
  605  git statu s.
  606  git status .
  607  more *ignore*
  608  more .gitignore chefignore 
  609  common .gitignore chefignore 
  610  comm .gitignore chefignore 
  611  pwd
  612  cd ..
  613  git status
  614  git add dc_devfest/
  615  cd dc_devfest/
  616  ls
  617  atom .
  618  ruby -e "require 'fog'"
  619  chef gem install fag
  620  chef gem install fog
  621  more ~/.chef/knife.rb 
  622  knife client list
  623  knife node list
  624  knife client delete userhack
  625  knife client delete peterb-hack
  626  knife client delete chef-read
  627  knife client list
  628  knife node delete centossh
  629  knife client list
  630  knife client delete centossh
  631  berks install
  633  berks install
  634  berks upload
  635  chef-client -o 'recipe[dc_devfest]'
  636  chef-client -l -o 'recipe[dc_devfest]'
  637  chef-client --help
  638  chef-client -z -o 'recipe[dc_devfest]'
  639  mroe metadata.rb 
  640  more metadata.rb
  642  chef-client --help
  643  knife client list
  644  more ~/.chef/knife.rb 
  646  pwd
  647  knife node list
  648  knife node help
  649  knife node create pburkholder-macpro
  651  knife node create pburkholder-macpro
  652  lh
  654  find nodes/
  655  more nodes/pburkholder-getchef-com.json 
  656  knife node create pburkholder-macpro --help
  658  more ~/.chef/knife.rb 
  659  chef-client -z -o 'recipe[dc_devfest]'
  660  mroe metadata.rb 
  661  more metadata.rb
  663  rm -rf nodes/
  665  chef-client -z -o 'recipe[dc_devfest]'
  667  chef-client -z -o 'recipe[dc_devfest]'
  668  chef-client --help
  669  mkdir .chef
  670  cd .chef
  671  knife configure client .
  672  ll
  673  more -lt
  674  ls
  675  more validation.pem 
  676  more client.rb 
  677  cd ..
  678  chef-client  -o 'recipe[dc_devfest]'
  680  md5 .chef/validation.pem ~/.chef/pdbchef-validator.pem 
  682  chef-client  -o 'recipe[dc_devfest]'
  683  chef-client  -o 'recipe[dc_devfest]' -c .chef/client.rb 
  684  pwd
  685  ls
  686  mkdir data_bags/
  687  mkdir gce
  688  mv gce data_bags/
  689  touch data_bags/gce/service_account.json
  690  pbpaste > data_bags/gce/service_account.json
  691  pwd
  692  mv ~/Downloads/DCDevFest0-b7fe04ca48e2.p12 .chef/
  693  more ~/Downloads/DCDevFest0-025f8feea895.json 
  694  more .chef/DCDevFest0-b7fe04ca48e2.p12 
  695  mv ~/Downloads/DCDevFest0-025f8feea895.json .chef/
  697  git status
  698  git add data_bags/
  699  knife data bag create  gce
  700  knife data bag help
  701  knife data bag from file gce data_bags/gce/service_account.json 
  702  knife data bag from file gce data_bags/gce/service_account.json 
  703  knife data bag from file gce data_bags/gce/service_account.json 
  705  git status
  708  git status
  709  git add recipes/ Gemfile
  710  git commit -am "Work in progress"
  719  knife node list
  720  knife node show workstation_macpro
  721  knife node show pburkholder-macpro
  723  chef-client  -r 'recipe[dc_devfest]' -c .chef/client.rb 
  724  berks upload
  725  chef 
  726  knife help
  727  knife plugin help
  728  chef gem install knife-cookbook-bump
  729  knife cookbook bump patch
  730  knife bump patch
  731  knife bump help
  733  berks upload
  734  berks install
  735  knife cookbook upload dc_devfest
  736  chef-client  -r 'recipe[dc_devfest]' -c .chef/client.rb 
  737  knife cookbook upload dc_devfest
  738  chef-client  -r 'recipe[dc_devfest]' -c .chef/client.rb 
  740  bundle install --path vendor/bundle
  741  more Gemfile 
  743  chef-client  -r 'recipe[dc_devfest]' -c .chef/client.rb 
  746  find ~/.chef/cache/
  749  gcloud help
  750  gcloud compute instances --help
  751  gcloud compute instances list
