env :PATH, ENV["PATH"]
set :environment, "development"
set :output, "/home/yongsokheng/Desktop/log.log"

every 1.hour do
  rake "inform_user_task"
  rake "delete_exam_task"
  command "echo 'success'"
end
