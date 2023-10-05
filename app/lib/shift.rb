class Shift
  attr_accessor :data

  def match(query)
    names = []
    query = query.downcase
    matched = data.select { |user| user[:full_name].downcase.include?(query) }
    matched.each{ |user| names.push(user[:full_name]) }
    names
  end

  def duplicate
    hash = {}
    data.each do |user|
      email = user[:email].downcase
      if hash.key?(email)
        hash[email] += 1
      else
        hash[email] = 1
      end
    end
    select_hash = hash.select{ |email, count| count > 1 }
  end
end
