# To perform basic string operations
namespace :shiftcare do

  def arr
    [
      { "id": 1, "full_name": "John Doe", "email": "john.doe@gmail.com" },
      { "id": 2, "full_name": "Jane Smith", "email": "jane.smith@yahoo.com" },
      { "id": 3, "full_name": "Alex Johnson", "email": "alex.johnson@hotmail.com" },
      { "id": 4, "full_name": "Michael Williams", "email": "michael.williams@outlook.com" },
      { "id": 5, "full_name": "Emily Brown", "email": "emily.brown@aol.com" },
      { "id": 6, "full_name": "William Davis", "email": "william.davis@icloud.com" },
      { "id": 7, "full_name": "Olivia Miller", "email": "olivia.miller@protonmail.com" },
      { "id": 8,"full_name": "James Wilson","email": "james.wilson@yandex.com" },
      { "id": 9,"full_name": "Ava Taylor","email": "ava.taylor@mail.com" },
      { "id": 10,"full_name": "Michael Brown","email": "michael.brown@inbox.com" },
      { "id": 11,"full_name": "Sophia Garcia","email": "sophia.garcia@zoho.com" },
      { "id": 12,"full_name": "Emma Lopez","email": "emma.lopez@protonmail.ch" },
      { "id": 13,"full_name": "Liam Martinez","email": "liam.martinez@fastmail.fm" },
      { "id": 14,"full_name": "Isabella Rodriguez","email": "isabella.rodriguez@me.com" },
      { "id": 15,"full_name": "Another Jane Smith","email": "jane.smith@yahoo.com" }
    ]
  end

  desc "To match the query"
  task matches: :environment do
    query = 'Jane'
    matched = arr.select { |user| user[:full_name].include?(query) }
    if matched
      names = []
      matched.each do |user|
        names.push(user[:full_name])
      end
      puts "Matched names are #{names.join(', ')}"
    else
      puts 'Not matched names found'
    end
  end

  desc "To get duplicate"
  task duplicate: :environment do
    hash = {}
    arr.each do |user|
      if hash.key?(user[:email])
        hash[user[:email]] += 1
      else
        hash[user[:email]] = 1
      end
    end
    select_hash = hash.select{ |email, count| count > 1 }
    puts "Duplicate email is #{select_hash.keys.join(', ')}"
  end

end
