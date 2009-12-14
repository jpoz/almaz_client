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
	basic_auth 'jpoz', 'pass'
	base_uri 'localhost:9393'


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

