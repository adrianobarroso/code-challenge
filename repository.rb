class Repository
  attr_reader :data

  def initialize
    @file = 'jobs.txt'
    @load_db = []
    load_db
  end

  def check_expire_date(exp_date)
    Date.parse(exp_date).to_time < Time.now
  end

  def create_job(attributes)
    job = Job.new(attributes)
    job.partnerid = partnerid_definition
    @load_db << job
    write_db
  end

  def job_activate(id)
    job = @load_db.select {|job| job.partnerid == id.to_s}.first
    job.status = 'activate'
    write_db
  end

  def partnerid_definition
    "#{@load_db.map(&:partnerid).sort.last.to_i + 1}"
  end

  def load_db
    options = { headers: true, header_converters: :symbol, col_sep: '|'}
    CSV.foreach(@file, options) do |row|
      @load_db << Job.new(row) if check_expire_date(row[:expiresat])
    end
    cipher = Secret.new
    @data = cipher.encrypt(@load_db.to_json.to_s)
  end

  def write_db
    headers = Job.new.instance_variables.map {|d| d.to_s.gsub(/@/,'')}
    CSV.open(@file, 'w', col_sep: '|') {|csv_obj| csv_obj << headers}

    CSV.open(@file, 'a', col_sep: '|') do |csv_obj|
      @load_db.each do |job|
        csv_obj << job.values
      end
    end
  end
end
