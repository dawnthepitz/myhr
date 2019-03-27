class GiftsController < ApplicationController
	def index
		@Gifts=Gift.all
	end

	def show
		id = params[:id].to_i
		@record= Gift.find(id)
	end

	def update
		id=params[:id].to_i
		name=params[:name]
		price=params[:price].to_f
		message = ''
		success=true
		Gift.transaction do
			begin
				record = Gift.find(id)
				record[:name]=name
				record[:price]=price
				record.save
				message='Successfully Updated!'
			rescue Exception => ex 
				success=false
				message='Update Failed'
				raise ActiveRecord::Rollback

			end
		end
		flash[:message] ={sucess:success, message:message}
		redirect_to '/gifts/' + params[:id]
	end

	def create
		name=params[:name]
		price=params[:price].to_f
		message = ''
		success=true
		id=nil
		Gift.transaction do
			begin
				record = Gift.new
				record[:name]=name
				record[:price]=price
				record.save
				message='Successfully Updated!'
				id=record[:id]
			rescue Exception => ex 
				success=false

				message='Update Failed'
				raise ActiveRecord::Rollback
			end
		end
		flash[:message] ={sucess:success, message:message}
		redirect_to '/gifts/' + id.to_s
	end

	def delete
		id=params[:id]
		success=true
		message=''
		Gift.transaction do
			begin
				Gift.delete(id)
				message='Successfully Deleted'
			rescue Exception => ex 
				success=false
				message='Update Failed'
				raise ActiveRecord::Rollback
			end
		end
		redirect_to '/gifts/'
	end

end
