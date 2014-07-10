class UploadController < ApplicationController
  protect_from_forgery except: :handle_uplaod
  # before_filter :add_headers, :only => :handle_upload

  def handle_upload
    data = params[:inputData]
    File.open(Rails.root.join('public', 'uploads', 'input.txt'),'w') do |file|
      file.write(data)
    end
    
    render :text => data, :content_type => 'text/plain'
  end

  private 
  
  def add_headers
    headers['Access-Control-Allow-Origin'] = '*'
    headers['Access-Control-Allow-Methods'] = 'POST'
    headers['Access-Control-Request-Method'] = '*'
    headers['Access-Control-Allow-Headers'] = 'Origin, X-Requested-With, Content-Type, Accept, Authorization'
  end
end
