class EventsController < ApplicationController
  before_action :set_event, only: [:show, :edit, :update, :destroy]
  respond_to :json
  skip_before_filter :verify_authenticity_token
  BASE_URL = "http://localhost:3000/"
  # GET /events
  # GET /events.json
  def index
    @events = Event.all
  end
  
  def add 
    @event = Event.find_by_id(params[:id])
    puts @event
    @opt = Option.new
    @opt.name = params[:option]
    @opt.eventId = params[:id]
    @opt.save!
    @event.save!
    render :nothing => :true
  end
  
  def update_2
    #puts "begin"
    #puts params[:id]
    @options = Option.select('name, eventId').where(:eventId => params[:id])
    #puts :eventId
    #puts Option.all
    #puts "here"
    #puts @options
    #@options.each do |option|
    #  option.update_attributes()
    #end
    #format.json { head :ok}
    #respond_with  ( @options)
    #puts response.body
    #respond_to do |format|
    #  format.js {}
    #  format.json { render json: @options, status: :created, location: @options } 
    #end
    #head :ok
    render json: @options
    #respond_to do |format|
    #  render :json => @options
    #end
  end
  
  def 

  # GET /events/1
  # GET /events/1.json
  def show
  end

  # GET /events/new
  def new
    @event = Event.new
  end
  
  def main
    
  end
  
  def result
    puts params
    @options = Option.select('name, eventId').where(:eventId => params[:id])
    #@sorted_options = @options.sort()
    #render json: @sorted_options
  end
  
  def updated_result
    @options = Option.select('name, eventId').where(:eventId => params[:id])
    @sorted_options = @options.sort()
    render json: @sorted_options
  end
  
  def getOptions
    @options = Option.select_public.where(:eventId => params[:id])
    @eventId = params[:id]
  end

  # GET /events/1/edit
  def edit
  end

  # POST /events
  # POST /events.json
  def create
    @event = Event.new(params[:event])
    @event.url = BASE_URL + @event.name.gsub(' ', '_')
    
    respond_to do |format|
      if @event.save
        format.html { redirect_to @event, notice: 'Event was successfully created.' }
        format.json { render action: 'show', status: :created, location: @event }
      else
        format.html { render action: 'new' }
        format.json { render json: @event.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /events/1
  # PATCH/PUT /events/1.json
  def update
    respond_to do |format|
      if @event.update(event_params)
        format.html { redirect_to @event, notice: 'Event was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: 'edit' }
        format.json { render json: @event.errors, status: :unprocessable_entity }
      end
      @event.save!
    end
  end

  # DELETE /events/1
  # DELETE /events/1.json
  def destroy
    @event.destroy
    respond_to do |format|
      format.html { redirect_to events_url }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_event
      @event = Event.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def event_params
      params[:event]
    end
end
