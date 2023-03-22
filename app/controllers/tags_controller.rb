class TagsController < ApplicationController
    skip_before_action :verify_authenticity_token
    def index
        @tags = Tag.all

        render json: @tags
    end

    def create
        @tag = Tag.create(tag_param)

        render json: @tag
    end

    def tag_param
        params.require(:tag).permit(:name)
    end
end
