class Museum

  attr_reader :name,
              :exhibits,
              :patrons

  def initialize(name)
    @name = name
    @exhibits = []
    @patrons = []
  end

  def add_exhibit(exhibit)
    @exhibits << exhibit
  end

  def recommend_exhibits(patron)
    exhibits.select { |exhibit| patron.interests.include? exhibit.name }
  end

  def admit(patron)
    @patrons << patron
  end

  def patrons_by_exhibit_interest
    patrons_by_interest = Hash.new([])
    @exhibits.each do |exhibit|
      patrons_by_interest[exhibit] = @patrons.select do |patron|
        patron.interests.include? exhibit.name
      end
    end
    patrons_by_interest
  end

  def ticket_lottery_contestants(exhibit)

    @patrons.select do |patron|
      (patron.interests.include? exhibit.name) && (patron.spending_money < exhibit.cost)
    end
  end
end
