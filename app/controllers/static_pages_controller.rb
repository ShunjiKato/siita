class StaticPagesController < ApplicationController
  def home
    if user_signed_in?
      @drafts = current_user.drafts.all
      if params[:id].present?
        @draft = current_user.drafts.find(params[:id])
      end
    end
  end

  def about
  end
end
