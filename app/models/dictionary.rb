class Dictionary
  TAXONOMIES_DICTIONARY = {
    "kitchens" => { id: 1, text: 'Kitchens' },
    "living-rooms" => { id: 2, text: 'Living rooms' },
    "bathrooms" => { id: 3, text: 'Bathrooms' },
    "bedrooms" => { id: 4, text: 'Bedrooms' },
    "attics" => { id: 5, text: 'Attics' },
    "home-theaters" => { id: 6, text: 'Home theathers' },
    "home-exteriors" => { id: 7, text: 'Home exteriors' }
  }
  BATHROOM_FACETS_DICTIONARY = { "frameless-showerdoor" => { id: 8, text: 'Frameless showerdoor' } }
  LIVING_ROOMS_FACETS_DICTIONARY = { "stone-fireplace" => { id: 9, text: 'Stone fireplace' },
                                     "cement-fireplace" => { id: 10, text: 'Cement fireplace' },
                                     "fireplace" => { id: 11, text: 'Fireplace' },
                                     "stone" => { id: 12, text: 'Stone' } }

  def ordered_terms
    psycotic_dictionary.keys.sort_by { |slug| slug.length }.reverse!
  end

  def id(term)
    psycotic_dictionary[term][:id]
  end

  def term(id)
    psycotic_dictionary.each { |k, v| return v[:text] if v[:id] == id }
  end

  private

    def psycotic_dictionary
      TAXONOMIES_DICTIONARY.merge( BATHROOM_FACETS_DICTIONARY ).merge( LIVING_ROOMS_FACETS_DICTIONARY )
    end

end
