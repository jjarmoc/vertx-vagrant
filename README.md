# Vertx vagrant box
## Getting started
This box contains everything you need to get started with JRuby + vert.x.

If you haven't cloned this repository with ```git clone --recursive``` you should now initialize the puppet-rvm submodule by running

    $ git submodule init

You can start playing with it by running

    $ vagrant up
    $ vagrant ssh
    $ cd /vagrant
    $ vertx run server.rb
    
Now point your browser to [http://10.10.10.10:8080](http://10.10.10.10:8080) and you should see "Hello World!".

## Create your own projects
The root directory of this repository is shared with the vagrant box.
When you ssh'd into the vagrant box, you find the files at ```/vagrant```.

## Vert.x
Documentation for vert.x Ruby can be found [here](http://vertx.io/core_manual_ruby.html), a tutorial can be found [here](http://vertx.io/ruby_web_tutorial.html)