# Controller.rb
# Almaz
#
# Created by James Pozdena on 12/13/09.
# Copyright 2009 JPoz. All rights reserved.

require 'Record'

class Controller
	attr_writer :dataTableView
	
	def awakeFromNib
		@data = []
		@dataTableView.dataSource = self
	end
	
	def getData(sender)
		puts "Getting data"
		@data = Record.get_records
		@dataTableView.reloadData
	end
	
	def numberOfRowsInTableView(view)
		@data.size
	end

	def tableView(view, objectValueForTableColumn:column, row:index)
		data = @data[index]
		data.identifier
	end
end