class Video < ActiveRecord::Base

  belongs_to :customer

  def size
    File.size path
  end

  def path
    File::join(self.customer.bucket, self.key)
  end

end
