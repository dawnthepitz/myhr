class EmployeesController < ApplicationController
	def index
		@Employees=Employee.all
	end

	def show
		id = params[:id].to_i
		@record= Employee.find(id)
		@lookupDepartments= Department.all
	end

	def new
		@lookupDepartments= Department.all
	end

	def update
		id = params[:id].to_i
		code = params[:code]
		firstname = params[:firstname]
		middlename = params[:middlename]
		lastname = params[:lastname]
		birthdate = params[:birthdate]
		address = params[:address]
		contactno = params[:contactno]
		dateHired = params[:datehired]
		dateRegular = params[:dateregular]
		dateFired = params[:datefired]
		departmentId = params[:departmentId].to_i
		message = ''
		success = true
		Employee.transaction do
			begin
				record = Employee.find(id)
				record[:code] = code
				record[:firstname] = firstname
				record[:middlename] = middlename
				record[:lastname] = lastname
				record[:birthdate] = birthdate
				record[:address] = address
				record[:contactno] = contactno
				record[:dateHired] = dateHired
				record[:dateRegular] = dateRegular
				record[:dateFired] = dateFired
				record[:departmentId] = departmentId
				record.save
				message='Successfully Updated!'
			rescue Exception => ex 
				success=false
				message='Update Failed'
				raise ActiveRecord::Rollback
			end
		end
		flash[:message] ={sucess:success, message:message}
		redirect_to '/employees/'+ params[:id]
	end

	def create
		code = params[:code]
		firstname = params[:firstname]
		middlename = params[:middlename]
		lastname = params[:lastname]
		birthdate = params[:birthdate]
		address = params[:address]
		contactno = params[:contactno]
		dateHired = params[:datehired]
		dateRegular = params[:dateregular]
		dateFired = params[:datefired]
		departmentId = params[:departmentId].to_i
		message = ''
		success = true
		id = nil
		Employee.transaction do
			begin
				record = Employee.new
				record[:code] = code
				record[:firstname] = firstname
				record[:middlename] = middlename
				record[:lastname] = lastname
				record[:birthdate]= birthdate
				record[:address] = address
				record[:contactno] = contactno
				record[:dateHired] = dateHired
				record[:dateRegular] = dateRegular
				record[:dateFired] = dateFired
				record[:departmentId] = departmentId
				record.save
				message = 'Successfully Created!'
				id = record[:id]
			rescue Exception => ex 
				success = false
				message = 'Create Failed'
				raise ActiveRecord::Rollback
			end
		end
		flash[:message] = {sucess:success, message:message}
		redirect_to '/employees/'+ id.to_s
	end

	def delete
		id = params[:id]
		success = true
		message = ''
		Employee.transaction do
			begin
				Employee.delete(id)
				message = 'Successfully Deleted'
			rescue Exception => ex 
				success = false
				message = 'Delete Failed'
				raise ActiveRecord::Rollback
			end
		end
		flash[:message] = {sucess:success, message:message}
		redirect_to '/employees/'
	end
end
