#!/usr/bin/env ruby

require 'yaml'

# I would have done this with Hiera's `heira_include`, but this is more
# flexible, and plus it allows us to pass interesting things to Hiera later.

node = ARGV[0]
raise "No host provided" if node.nil?

hosts = YAML.load_file('hosts.yaml')

return hosts.fetch(node)
