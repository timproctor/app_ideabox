require './idea'

class IdeaBoxApp < Sinatra::Base
  configure :development do
    register Sinatra::Reloader
  end

  get '/' do
    erb :index, locals: {ideas: Idea.all}
  end

  not_found do
    erb :error
  end

  post '/' do
    #Create an idea based on the form parameters
    idea = Idea.new(params['idea_title'], params['idea_description'])
    #Store it
    idea.save
    #Send us back ot the index page to see all ideas
    redirect '/'
  end
end
