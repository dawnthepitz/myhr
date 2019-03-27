class DepartmentsController < ApplicationController
	def index
		@Departments=Department.all
	end

	def show
		id = params[:id].to_i
		@record= Department.find(id)
	end

	def update
		id=params[:id].to_i
		name=params[:name]
		code=params[:code]
		active=params[:active]
		message = ''
		success=true
		Department.transaction do
			begin
				record = Department.find(id)
				record[:name]=name
				record[:code]=code
				record[:active]=active
				record.save
				message='Successfully Updated!'
			rescue Exception => ex 
				success=false
				message='Update Failed'
				raise ActiveRecord::Rollback
			end
		end
		flash[:message]={sucess:success, message:message}
		redirect_to '/departments/'+ params[:id]
	end

	def create
		name=params[:name]
		code=params[:code]
		active=params[:active]
		message = ''
		success=true
		id=nil
		Department.transaction do
			begin
				record = Department.new
				record[:name]=name
				record[:code]=code
				record[:active]=active
				record.save
				message='Successfully Created!'
				id=record[:id]
			rescue Exception => ex 
				success=false

				message='Update Failed'
				raise ActiveRecord::Rollback
			end
		end
		flash[:message]={sucess:success, message:message}
		redirect_to '/departments/'+ id.to_s
	end

	def delete
		id=params[:id]
		success=true
		message=''
		Department.transaction do
			begin
				Department.delete(id)
				message='Successfully Deleted'
			rescue Exception => ex 
				success=false
				message='Update Failed'
				raise ActiveRecord::Rollback
			end
		end
		flash[:message]={sucess:success, message:message}
		redirect_to '/departments/'
	end
end