require 'idea_box'

class IdeaBoxApp < Sinatra::Base
  set :method_override, true
  set :root, 'lib/app'

  configure :development do
    register Sinatra::Reloader
  end

  not_found do
    haml :error
  end

  get '/' do
    haml :index
  end

  get '/ideas' do
    haml :ideas, locals: {ideas: IdeaStore.all.sort, idea: Idea.new}
  end

  get '/archives' do
    haml :archives, locals: {ideas: IdeaStore.all.sort}
  end

  post '/ideas' do
    IdeaStore.create(params[:idea])
    redirect to ('/archives')
  end

  post '/:id/like' do |id|
    idea = IdeaStore.find(id.to_i)
    idea.like!
    IdeaStore.update(id.to_i, idea.to_h)
    redirect to ('/archives')
  end

  delete '/:id' do |id|
    IdeaStore.delete(id.to_i)
    redirect to ('/archives')
  end

  get '/:id/edit' do |id|
    idea = IdeaStore.find(id.to_i)
    haml :edit, locals: {id: id, idea: idea}
  end

  post '/sms-quickstart' do
    IdeaStore.create('title'=>params["FromCity"],'description'=>params["Body"])
  end

  put '/:id' do |id|
    IdeaStore.update(id.to_i, params[:idea])
    redirect to ('/archives')
  end
end
