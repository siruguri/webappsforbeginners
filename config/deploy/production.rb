# -*- coding: utf-8 -*-
# Simple Role Syntax
# ==================
# Supports bulk-adding hosts to roles, the primary
# server in each group is considered to be the first
# unless any hosts have the primary property set.
# Don't declare `role :all`, it's a meta role
role :app, %w{www-data@webappsforbeginners.com}
role :web, %w{www-data@webappsforbeginners.com}
role :db,  %w{www-data@webappsforbeginners.com}

# Extended Server Syntax
# ======================
# This can be used to drop a more detailed server
# definition into the server list. The second argument
# something that quacks like a hash can be used to set
# extended properties on the server.
# server 'webappsforbeginners.com', user: 'www-data', roles: %w{web app}, my_property: :my_value

# you can set custom ssh options
# it's possible to pass any option but you need to keep in mind that net/ssh understand limited list of options
# you can see them in [net/ssh documentation](http://net-ssh.github.io/net-ssh/classes/Net/SSH.html#method-c-start)
# set it globally
set :ssh_options, {
  keys: %w(/users/sameer/.ssh/digital_ocean_sitemirrorapp)

#  forward_agent: false,
#  auth_methods: %w(password)
}

set :default_environment, {
  'RAILS_SECRET_TOKEN' => '90f683d8b59aab69a4b274afa8cd730f2d0fe78b2a7f96bedd414689a14dca4bb2d7dcab5463c76bca95c1a87c77fcce05bc9cd8ce3832281f3ca3d8c8ec460e'
}

set :default_run_options, {shell: "/bin/bash"}

# and/or per server
# server 'example.com',
#   user: 'user_name',
#   roles: %w{web app},
#   ssh_options: {
#     user: 'user_name', # overrides user setting above
#     keys: %w(/home/user_name/.ssh/id_rsa),
#     forward_agent: false,
#     auth_methods: %w(publickey password)
#     # password: 'please use keys'
#   }
# setting per server overrides global ssh_options
