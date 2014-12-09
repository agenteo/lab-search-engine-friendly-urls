class PsycoticController < ApplicationController
  def index
    lookup = PsycoticLookup.new(params[:psycotic_slug])
    render text: lookup.ids
  end
end
