namespace :vgang do

  desc "imports new videos"
  task :import => [:environment] do
    Customer.all.each { |c| c.sync_bucket }
  end

end
