class Camper < ApplicationRecord
  belongs_to :campsite
  has_many :supplies
  has_many :reviews

  def self.find_or_create_from_auth(auth)
    provider = auth['provider']
    uid = auth['uid']

    Camper.find_or_create_by(provider: provider, uid: uid) do |camper|
      camper.username = auth['info']['nickname']
      camper.name = auth['info']['name']
    end
  end
end
