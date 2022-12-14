class EventsController < ApplicationController
  before_action :authenticate_user!, except: %i[ index show ]
  before_action :set_event, only: %i[ show edit update destroy rsvp cancel]
  def new
    @event = Event.new
  end

  def index
    @events = Event.all
  end

  def user_rsvps
    @events = Event.all
  end
  def edit
  end

  def show

  end

  def create
    @event = Event.new(event_params)
    @event.user_id = current_user.id

    respond_to do |format|
      if @event.save
        format.html {redirect_to event_url(@event), notice: "Event was successfully created." }
      else
        format.html {render :new, status: :unprocessable_entity}
      end
    end
  end

  def update
    respond_to do |format|
      if @event.update(event_params)
        format.html { redirect_to event_url(@event), notice: "Event was successfully updated." }
      else
        format.html { render :edit, status: :unprocessable_entity }
      end
    end
  end 

  def destroy
    @event.destroy

    respond_to do |format|
      format.html { redirect_to events_url, notice: "Event was successfully deleted." }
    end
  end

  def rsvp
    if @event.attendees.include?(current_user)
      redirect_to event_url(@event), notice: "You have already RSVP'd to this event"
    else
      @event.attendees << current_user
      redirect_to event_url(@event)
    end
  end

  def cancel
    @event.attendees.delete(current_user)
    redirect_to event_url(@event), notice: "You have successfully cancelled your RSVP"
  end
  private

  def set_event
    @event = Event.find(params[:id])
  end

  def event_params
    params.require(:event).permit(:title, :date, :location, :description, :user_id, :first_name, :last_name)
  end
end
