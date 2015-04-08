ubuntu1204_nodejs WITH RUBY
=================
Shippable CI image for Ruby on Ubuntu 12.04. Available versions are:

1.8.7
1.9.2
1.9.3
2.0.0
2.1.1
jruby
ruby-head

Shippable CI image for Node.js on Ubuntu 12.04. Available Node.js versions:

1. 0.8
2. 0.10
3. 0.11

## How to use
You can use this image to run node.js builds on Shippable. Just update your
`shippable.yml` file and add the `build_image` directive. You should also
activate the appropriate nvm so your build runs against the
correct version of node.js. Here's a sample YML file to get you going:

````
language: node_js
node_js:
  - 0.8
  - 0.10
  - 0.11

build_image: shippableimages/ubuntu1204_nodejs

before_install:
  # activate the node.js version
  - source ~/.nvm/nvm.sh && nvm install $SHIPPABLE_NODE_VERSION
  - node --version
  - npm install -g grunt-cli

install:
  - npm install

script:
  - grunt

````

