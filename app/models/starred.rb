class Starred < OpenStruct

  def self.service
    GithubService.new
  end

  def self.all
    temp_starred_hash = service.starred
    temp_starred_hash.map {|starred_hash| Starred.new(starred_hash)}
  end


end
