class PsycoticLookup

  def initialize(slug)
    @slug = slug
    @dictionary = Dictionary.new
  end

  def ids
    @ids = []
    @dictionary.ordered_terms.each do |term|
      if @slug.match(/-?#{term}-?/)
        @slug.gsub!(/-?#{term}-?/, '')
        @ids << @dictionary.id(term)
      end
      break if @slug.empty?
    end
    @ids
  end

end
