class ApplicationController < Sinatra::Base
  set :default_content_type, 'application/json'
  
  # Add your routes here
  # ***  make sure affordability is being accounted for with post & put requests  ***
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
    loc = Location.all.order(name: :asc)
    loc.to_json()
    # include events with location: include: { events: {only: [:name, :start] }}
  end

  get "/events/:id" do
    evt = Event.find(params[:id])
    evt.to_json(include: :location)
  end

  get "/locations/:id" do
    loc = Location.find(params[:id])
    loc.to_json
  end

  post "/locations" do
    loc = Location.find_or_create_by(name: params[:name])
    loc.to_json
  end

  put "/locations/:id" do
    loc = Location.find(params[:id])
    loc.update(
      name: params[:name]
      )
    loc.to_json
  end

  post "/events" do
    evt = Event.create(
      name: params[:name], 
      dance_style: params[:dance_style],
      is_affordable: params[:is_affordable],
      start: params[:start],
      price: params[:price],
      location_id: params[:location_id]
      )
    evt.to_json
  end

  put "/events/:id" do
    evt = Event.find(params[:id])
    evt.update(
      name: params[:name], 
      dance_style: params[:dance_style],
      is_affordable: params[:is_affordable],
      start: params[:start],
      price: params[:price],
      location_id: params[:location_id]
      )
    evt.to_json
  end

  delete "/events/:id" do 
    evt = Event.find(params[:id])
    evt.destroy
    evt.to_json
  end

end
