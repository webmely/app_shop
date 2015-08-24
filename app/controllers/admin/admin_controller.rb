module Admin
  class AdminController < ApplicationController
     layout 'admin_application'
     before_filter :kiemtra

     #Kiem tra dang nhap
     private
	  def kiemtra
	    authorize! :manage, :all 
      
	  end
	  
   end
end