# Record.rb
# Almaz
#
# Created by James Pozdena on 12/13/09.
# Copyright 2009 JPoz. All rights reserved.

require 'rubygems'
require 'httparty'

class Record
	include HTTParty
	format :json
	
	def self.setup_class(url, username, password)
		base_uri url
		basic_auth username, password
	end

	def self.get_records
		raw = get('/almaz')
		raw.map do |r|
			re = Record.new()
			re.identifier = r
			re
		end
	end
	
	attr_accessor :identifier, :information
end

