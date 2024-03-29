class List
  def initialize(name, id=nil)
    @name = name
    @id = id
  end

  def name
    @name
  end

  def self.all
    results = DB.exec("SELECT * FROM lists;")
    lists = []
    results.each do |result|
      name = result['name']
      lists << List.new(name)
    end
    lists
  end

  def save
    DB.exec("INSERT INTO lists (name) VALUES (#{@name}') RETURNING id;")
    @id = results.first['id'].to_i
  end

  def id
    @id
  end

end









