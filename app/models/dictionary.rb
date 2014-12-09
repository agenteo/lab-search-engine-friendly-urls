class Dictionary
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
                                     "fireplace" => 11,
                                     "stone" => 12 }

  def ordered_terms
    psycotic_dictionary.keys.sort_by { |slug| slug.length }.reverse!
  end

  def id(term)
    psycotic_dictionary[term]
  end

  private

    def psycotic_dictionary
      TAXONOMIES_DICTIONARY.merge( BATHROOM_FACETS_DICTIONARY ).merge( LIVING_ROOMS_FACETS_DICTIONARY )
    end

end
