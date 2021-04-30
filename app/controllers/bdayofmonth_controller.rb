class BdayofmonthController < ApplicationController
    before_action :set_member, only: [:show]
    def index
        @members = Member.where("extract(month from birthday) = ?", Date.today.strftime('%m'))
        render json: @members
    end
end
