class RecordingsController < ApplicationController
  def create
    if request.get?
      response = Twilio::TwiML::Response.new do |r|
        r.Record
      end

      respond_to do |format|
        format.html do
          render :text => response.text
        end
        format.json do
          @recordings = Recording.all
          render :json => @recordings
        end
      end
    elsif request.post?
      Recording.create!(url: params[:RecordingUrl])
      render :text => ''
    end
  end

  def send_message
    respond_to do |format|
      format.html do
        @client = Twilio::REST::Client.new 'accountid', 'authtoken'

        @client.account.calls.create(
            :from => '+17801115555',
            :to => '+17802223333',
            :url => 'http://255.255.255.255:3000/music_response'
        )
        render :text => 'message sent!'
      end
    end
  end

  def music_response
    response = Twilio::TwiML::Response.new do |r|
      r.Play Recording.last.url + '.mp3'
    end
    respond_to do |format|
      format.html do
        render :text => response.text
      end
    end
  end

end
