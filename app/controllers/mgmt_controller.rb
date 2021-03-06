class MgmtController < ApplicationController
  before_filter :authenticate#, only: [:blah]
  layout "mgmt"

  def list
    @agendas = Agenda.all.order("id DESC")
  end
  
  def detail
    @agenda = Agenda.joins(:venue).select('agendas.*, venues.venue as venue_name, venues.map_link as map_link').find(params[:id])
  end
  
  def updateagenda
    agenda = Agenda.find(params[:agenda_id])
    values_to_update = [:topic1, :topic2, :topic3, :beer1, :beer2, :beer3]
     .reduce({}) { |t, i| t.merge(i => params[i]) }
    agenda.update_attributes!(values_to_update)
  #  agenda.update(topic1: params[:topic1], topic2: params[:topic2], topic3: params[:topic3])
  #  Agenda.update(params[:agenda_id], params[:topic1], params[:topic2], params[:topic3], params[:beer1], params[:beer2], params[:beer3])
    redirect_to controller: 'mgmt', action: 'list', status: 303
  end
  
  
  protected
  def authenticate
    authenticate_or_request_with_http_basic do |username, password|
      username == ENV["MGMT_LOGIN"] && password == ENV["MGMT_PASSWORD"]
    end
  end
end
