class Organization < OpenStruct

  def self.service
    GithubService.new
  end

  def self.all
    temp_organization_hash = service.organizations
    temp_organization_hash.map {|organization_hash| Organization.new(organization_hash)}
  end

end
