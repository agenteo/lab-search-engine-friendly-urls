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
  LIVING_ROOMS_FACETS_DICTIONARY = { "stone-fireplace" => 9,
                                     "cement-fireplace" => 10,
                                     "fireplace" => 11 }

  def initialize(slug)
    @slug = slug
  end

  def ids
    @ids = []
    ordered_terms.each do |term|
      if @slug.match(/-?#{term}-?/)
        @slug.gsub!(/-?#{term}-?/, '')
        @ids << psycotic_dictionary[term]
      end
      break if @slug.empty?
    end
    @ids
  end

  private

    def psycotic_dictionary
      TAXONOMIES_DICTIONARY.merge( BATHROOM_FACETS_DICTIONARY ).merge( LIVING_ROOMS_FACETS_DICTIONARY )
    end

    def ordered_terms
      psycotic_dictionary.keys.sort_by { |slug| slug.length }.reverse!
    end

end
