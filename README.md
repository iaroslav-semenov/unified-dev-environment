# Unified Development Environment
Requirements
- Vagrant
- Ansible 2.4+
- Python 2.7+

To get started run:

`vagrant up`

When you have the VM up and running try to create a simple php up by running:

`./create.sh simple-php test-app`

Now add the following string to your _/etc/hosts_

`192.168.50.10 test-app.local`

Create an _index.php_ in your app directory (by default _../applications/test-app/_) with some code:

`<?php
 phpinfo();`
 
Now you should be able to navigate to _http://test-app.local_ in your browser.
