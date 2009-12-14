# Controller.rb
# Almaz
#
# Created by James Pozdena on 12/13/09.
# Copyright 2009 JPoz. All rights reserved.

require 'Record'

class Controller
	attr_writer :dataTableView, :infoTableView, :url_field, :username_field, :password_field
	
	def awakeFromNib
		@data = []
		@info = []
		@dataTableView.dataSource = self
		@dataTableView.delegate = self
		@infoTableView.dataSource = self
	end
	
	def getData(sender)
		puts "Setting up connection with #{@url_field.stringValue}"
		Record.setup_class(@url_field.stringValue, @username_field.stringValue, @password_field.stringValue)
		puts "Getting data"
		@data = Record.get_records
		@dataTableView.reloadData
	end
	
	def numberOfRowsInTableView(view)
		if view == @dataTableView
			@data.size
		else
			@info.size
		end
	end

	def tableView(view, objectValueForTableColumn:column, row:index)
		if view == @dataTableView
			data = @data[index]
			data.identifier
		else
			@info[index]
		end
	end
	
	def tableViewSelectionDidChange(notification)
		puts "Selection changed #{notification.inspect}"
		puts "#{@dataTableView.selectedRow}"
		puts @data[@dataTableView.selectedRow].identifier
		@info = @data[@dataTableView.selectedRow].information
		@infoTableView.reloadData
	end
end