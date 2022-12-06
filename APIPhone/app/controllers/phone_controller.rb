class PhoneController < ApplicationController

    skip_before_action :verify_authenticity_token

		def index
			@listPhoneNumber = AllocatedPhoneNumber.all
			 if @listPhoneNumber.present?
                 json_response(@listPhoneNumber.pluck(:phoneNumber), "List of allocated  phone numbers.",200)
			 else
                json_response(@listPhoneNumber.pluck(:phoneNumber), "Not Found allocated phone numbers.",200)
			end
		rescue => exception
	     	 render json: { success: false, errors: exception.message}, status: 400
		end

        def special_number
            special_number_tmp = params[:phone]
            if special_number_tmp.present?
              special_number_tmp = special_number_tmp.gsub(/-/, "")
              existing = AllocatedPhoneNumber.where(phoneNumber: special_number_tmp)
                if existing.present?
                      random_number = AllocatedPhoneNumber.get_random_number
                          result = AllocatedPhoneNumber.create(phoneNumber: random_number)
                          json_response(result.phoneNumber, "Sorry #{special_number_tmp} is not available,  New phone number allocated Successfully.",200)
                 else
                      result = AllocatedPhoneNumber.new({phoneNumber: special_number_tmp})
                        if result.save
                            str =  result.phoneNumber;
                            [4, 7].each { |i| str.insert i, '-' }
                          json_response(str,"The special number is allocated",200)
                        else
                          json_response(nil,result.errors,200)
                        end
                end
            else 
                random_number = AllocatedPhoneNumber.get_random_number
                result = AllocatedPhoneNumber.create(phoneNumber: random_number)
                str =  result.phoneNumber;
                    [4, 7].each { |i| str.insert i, '-' } 
                json_response(str,"New phone number allocated Successfully.", 200)
            end
        end    

end
