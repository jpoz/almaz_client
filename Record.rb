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
			Record.new(r)
		end
	end
	
	attr_accessor :identifier, :information
	
	def initialize(identifier)
		@identifier = identifier
		@information = []
	end
	
	def information
		return @information unless @information.empty?
		id_array = @identifier.split('::')
		id = id_array.size > 2 ? id_array[2] : 'noid'
		@information = self.class.get("/almaz/#{id}")
		puts @information.inspect
		@information
	end
end

