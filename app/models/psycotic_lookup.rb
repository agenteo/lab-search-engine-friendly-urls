class PsycoticLookup
  TAXONOMIES_DICTIONARY = {
    "kitchens" => 1,
    "living-rooms" => 2,
    "bathrooms" => 3,
    "bedrooms" => 4,
    "attics" => 5,
    "home-theaters" => 6,
    "home-exteriors" => 7
  }
  BATHROOM_FACETS_DICTIONARY = { "frameless-showerdoor" => 8 }

  def initialize(slug)
    @slug = slug
  end

  def ids
    @ids = []
    psycotic_dictionary.each do |term, id|
require 'byebug'
byebug

      if @slug.match(/^-?#{term}-?$/)
        @slug.gsub(/^-?#{term}-?$/, '')
        @ids << id
      end
    end
    @ids
  end

  private

    def psycotic_dictionary
      TAXONOMIES_DICTIONARY.merge( BATHROOM_FACETS_DICTIONARY )
    end

end
