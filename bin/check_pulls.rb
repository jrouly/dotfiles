#!/usr/bin/env ruby

require 'rest-client'
require 'json'

ARGV.each do |repo|
  begin
    pulls = JSON.parse RestClient.get "https://api.github.com/repos/#{repo}/pulls"
    #next if pulls.size == 0
    puts "#{repo} has #{pulls.size} open requests"
    pulls.each do |pull|
      user = pull["head"]["user"]["login"]
      branch = pull["head"]["ref"]

      puts "  [#{branch}] by #{user}"
      puts "    #{pull["title"]}"
    end
  rescue
    puts "ERROR: 404 #{repo} not found."
  end
end
