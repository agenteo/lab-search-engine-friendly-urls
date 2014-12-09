class PsycoticController < ApplicationController
  def index
    lookup = PsycoticLookup.new(params[:psycotic_slug])
    # redirect = PsycoticRedirect.new(params[:psycotic_slug], lookup.ids)
    # if redirect.execute?
    #   redirect_to "/digs/#{redirect.destination}"
    # end
    # do your search with lookup.ids
    render text: lookup.ids
  end
end
