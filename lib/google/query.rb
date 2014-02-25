module Google
  class Query
    attr_accessor :term, :ads

    def initialize(term)
      @term = term
      @ads = []
    end
  end
end
