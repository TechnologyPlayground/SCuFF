class Database
  def initialize
    @conn = Mongo::Connection.new
    @db = @conn['SCuFF']
  end

  def items
    @db['items']
  end

  def cats
    @db['cats']
  end
end