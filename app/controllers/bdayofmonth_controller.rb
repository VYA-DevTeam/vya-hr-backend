class BdayofmonthController < ApplicationController
    def index
        @members = Member.where("extract(month from birthday) = ?", Date.today.strftime('%m'))
        render json: @members
    end
end
