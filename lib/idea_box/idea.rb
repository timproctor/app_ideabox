class Idea
  include Comparable

  attr_reader :title, :description, :rank, :id

  def initialize(attributes = {})
    @title       = attributes["title"]
    @description = attributes["description"]
    @rank        = attributes["rank"] || 0
    @id          = attributes["id"]
  end

  def save
    IdeaStore.create(to_h)
  end

  def to_h
    {
      "title"       => title,
      "description" => description,
      "rank"        => rank
    }
  end

  def like!
    @rank += 1
  end

  def <=>(other)
    other.rank <=> rank
  end

  def sms_as_idea(data)
    #get sms
    account_sid = 'ACb6d1d1bdbd8b4a3d7e33146a3ca2b3a2'
    auth_token  = '{{9a9b2a5fbc1373b5a338309cacc7fb6d}}'
    @client = Twilio::REST::Client.new account_sid, auth_token
    #set default title

    #save body of text as description
    @client.account.messages.list.each do |message|
      IdeaStore.create(message.to_s)
    end
  end

end
