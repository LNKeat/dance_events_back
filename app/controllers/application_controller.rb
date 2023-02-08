class ApplicationController < Sinatra::Base
  set :default_content_type, 'application/json'
  
  # Add your routes here
  get "/" do
    { message: "Good luck with your project!" }.to_json
  end

  get "/events" do
    evts = Event.all.order(start: :asc)
    evts.map do |evt|
      evt.is_affordable = evt.find_affordability
      evt.save
    end

    evts.to_json(include: :location)
  end

  get "/locations" do
    loc = Location.all
    loc.to_json(include: { events: {only: [:name, :start] }})
  end

  get "/events/:id" do
    evt = Event.find(params[:id])
    evt.to_json
  end

  get "/locations/:id" do
    loc = Location.find(params[:id])
    loc.to_json
  end

end
