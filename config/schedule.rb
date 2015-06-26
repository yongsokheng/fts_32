env :PATH, ENV["PATH"]
set :environment, "development"
set :output, "/home/yongsokheng/Desktop/log.log"

every 1.day, at: "12 am" do
  rake "inform_user_task"
  command "echo 'success'"
end
