demo-kitchen-docker
===================



How-to
------

We use a vagrant boot2docker image with VirtualBox as provider.
See the description on the vagrantcloud for more info.

1. Boot and access the VM
With VirtualBox >= 4.3.12 & vagrant >= 1.6.3 installed, just clone the repository and boot the VM :
```
$ vagrant up
```

Then ssh to the VM and navigate to the example chef-vim cookbook into the shared folder :
```
$ vagrant ssh
                        ##        .
                  ## ## ##       ==
               ## ## ## ##      ===
           /""""""""""""""""\___/ ===
      ~~~ {~~ ~~~~ ~~~ ~~~~ ~~ ~ /  ===- ~~~
           \______ o          __/
             \    \        __/
              \____\______/
 _                 _   ____     _            _
| |__   ___   ___ | |_|___ \ __| | ___   ___| | _____ _ __
| '_ \ / _ \ / _ \| __| __) / _` |/ _ \ / __| |/ / _ \ '__|
| |_) | (_) | (_) | |_ / __/ (_| | (_) | (__|   <  __/ |
|_.__/ \___/ \___/ \__|_____\__,_|\___/ \___|_|\_\___|_|
boot2docker: 1.1.1
	HEAD : 0e7516f - Sun Jul 13 18:12:23 UTC 2014
docker@boot2docker:~$ cd /vagrant/chef-vim
docker@boot2docker:/vagrant/chef-vim$ ls
Berksfile       CHANGELOG.md    Cheffile.lock   Gemfile.lock    Strainerfile    recipes/        test/
Berksfile.lock  Cheffile        Gemfile         README.md       metadata.rb     spec/
```

2. Launch the "chef-dev" container
It uses a volume used to share the "/vagrant" folder. Yeah i known, it'd would be better (Note that it's just a "quick" demo, extracted from an existing workflow where sharing volume on non fully portable containers are a requirement).
```
docker@boot2docker:/vagrant/chef-vim$
docker@boot2docker:/vagrant/chef-vim$ docker run -v /vagrant:/vagrant -ti chef-dev
bash-4.2# cd chef-vim/
bash-4.2# ls
Berksfile       CHANGELOG.md    Cheffile.lock   Gemfile.lock    Strainerfile    recipes/        test/
Berksfile.lock  Cheffile        Gemfile         README.md       metadata.rb     spec/
```

3. Run the kitchen tests
Voilà :
```
bash-4.2# chef exec kitchen test
...
```

There are some strainer/chefunit tests, you can try with
```
bash-4.2# chef exec strainer test
```




