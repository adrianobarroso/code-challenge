class Job
  attr_reader :title, :categoryid, :expiresat
  attr_accessor :partnerid, :status

  def initialize(attributes = {})
    @partnerid = attributes[:partnerid]
    @title = attributes[:title]
    @categoryid = attributes[:categoryid]
    @expiresat = attributes[:expiresat]
    @status = attributes[:status].nil? ? 'draft' : 'activate'
  end

  def as_json(options={})
    {
      partnerid: @partnerid,
      title: @title,
      categoryid: @categoryid,
      expiresat: @expiresat,
      status: @status
    }
  end

  def to_json(*options)
    as_json(*options).to_json(*options)
  end

  def list_category(id)
    self.categoryid == "#{id}"
  end

  def values
    [self.partnerid, self.title, self.categoryid, self.expiresat, self.status]
  end
end
