# In this file we define the methods to help filter out candidates
# This way, we keep these methods separated from other potential parts of the program

def find(id)
  raise '@candidates must be an array' if @candidates.nil?
  @candidates.detect {|candidate| candidate[:id] == id}

end

def qualified_candidates(candidates = [])
  candidates.select do |candidate|
    experienced?(candidate) &&
    github_points?(candidate) &&
    can_code?(candidate) &&
    applied_recently?(candidate) &&
    is_adult?(candidate)

  end
end

def experienced?(candidate)
  unless candidate.has_key?(:years_of_experience)
    raise ArgumentError, 'candidate must have a :years_of_experience key'
  end
  candidate[:years_of_experience] >= 2
end

def github_points?(candidate)
  candidate[:github_points] >= 100
end

def can_code?(candidate)
  candidate[:languages].include?('Ruby' || 'Python')
end

def applied_recently?(candidate)
  
  candidate[:date_applied]  > 15.days.ago
end

def is_adult?(candidate)
  candidate[:age] >= 18
end

def ordered_by_qualifications(candidates)
  candidates.sort do |a1, a2|
    if a1[:years_of_experience] == a2[:years_of_experience]
      a2[:github_points] <=> a1[:github_points]
    else
      a1[:years_of_experience] <=> a2 [:years_of_experience]
    end
  end
end

def all_candidates
  @candidates.each do |candidates|
    puts candidates
  end
end

# More methods will go below