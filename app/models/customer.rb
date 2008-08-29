class Customer < ActiveRecord::Base

  validates_presence_of   :company
  validates_uniqueness_of :company 

  has_many :videos

  after_create :create_bucket

  def bucket
    sanitized = self.company.downcase
    sanitized.strip!
    sanitized.gsub!(/[^\w\.\-]/,'_')
    sanitized = sanitized[0,32]
    File::join RAILS_ROOT, "public/uploads/#{sanitized}"
  end

  def sync_bucket
    logger.info "syncing #{bucket}"
    Dir.new(bucket).each do |fn|
      path = File::join bucket, fn
      logger.info "checking #{path}"
      next unless File.file? path
      next if '.' == fn[0,1]
      next if videos.find_by_key(fn)
      videos.create!(:key => fn, :title => 'imported')
    end
  end

  protected

    def create_bucket
      Dir.mkdir(bucket)
    end
end
