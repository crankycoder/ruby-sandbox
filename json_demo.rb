#!/usr/bin/env jruby

# This is really bad - NEVER require rubygems as that's a package
# management tool - you don't know what the OS/admin is using for
# package management.
#
# Instead, just fire up jruby with :
#    $ jruby -rubygems json_demo.rb
#
#require "rubygems"

require "json"

# de-serializing:
source_string = '{"sample": "Hello, world!"}'
puts JSON(source_string).inspect
# => {"sample"=>"Hello, world!"}

# serializing:
source_object = ["Just another Ruby Array", {"null value" => nil}]
puts JSON(source_object)
# => ["Just another Ruby Array",{"null value":null}]
