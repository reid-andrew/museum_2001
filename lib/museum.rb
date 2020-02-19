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

  def draw_lottery_winner(exhibit)
    return nil if ticket_lottery_contestants(exhibit).length == 0
    ticket_lottery_contestants(exhibit).sample.name
  end

  def announce_lottery_winner(exhibit)
    return "No winners for this lottery" if draw_lottery_winner(exhibit) == nil
    return "#{draw_lottery_winner(exhibit)} has won the Dead Sea Scrolls exhibit lottery"
  end

  # def patrons_of_exhibits
  #   exhibits_with_patrons = Hash.new([])
  #   exhibits_by_cost = @exhibits.sort_by(@exhibits.cost)
  #   exhibits_by_cost.each do |exhibit|
  #     exhibits_with_patrons[exhibit] = @patrons.select do |patron|
  #       (patron.interests.include? exhibit.name) && (patron.spending_money > exhibit.cost)
  #       patron.spending_money -= exhibit.cost
  #     end
  #   end
  # end
end
