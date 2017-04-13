# class StaticPagesController < ApplicationController
#   # def home
#   # end
#   #
#   # def help
#   # end
#   #
#   # def about
#   # end
#   #
#   # def contact
#   # end
#   #
#   # def error_page
#   # end
#
#   def show
#     if valid_page?
#       render template: "static_pages/#{params[:page]}"
#     else
#       render file: "public/404.html", status: :not_found
#     end
#   end
#
#   private
#
#   def valid_page?
#     File.exist?(Pathname.new(Rails.root + "app/views/static_pages/#{params[:page]}.html.erb"))
#   end
# end
