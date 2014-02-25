module Google
  class Ad
    attr_accessor :index, :link, :description

    def initialize(index, link, description)
      @index = index
      @link = link
      @description = description
    end
  end
end
