class PsycoticController < ApplicationController
  def index
    lookup = PsycoticLookup.new(params[:psycotic_slug])
    # redirect = PsycoticRedirect.new(params[:psycotic_slug], lookup.ids)
    # if redirect.execute?
    #   redirect_to "/digs/#{redirect.destination}"
    # end
    # do your search with lookup.ids
    terms = []
    dictionary = Dictionary.new
    lookup.ids.each do |id|
      terms << dictionary.term(id)
    end
    flash[:notice] = "You searched for : #{terms.join(' ')}"
  end
end
