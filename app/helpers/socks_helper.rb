# Nothing here for now. I wonder what helpers do?

module SocksHelper
def get_matched_ids
  matched_ids = Array.new
  @matches.each do |m|
    unless matched_ids.include?(m.sock_1_id)
      matched_ids.append(m.sock_1_id)
    end
    unless matched_ids.include?(m.sock_2_id)
      matched_ids.append(m.sock_2_id)
    end
  end
  return matched_ids
end

def is_matched?(id)
  get_matched_ids.include?(id)
end

def matched_class(id)
  if is_matched?(id)
    return "matched"
  else
    return ""
  end
end
end