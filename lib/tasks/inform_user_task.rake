desc "Inform users and delete exam"
task inform_user_task: :environment do
  DeleteExamWorker.perform_async
  InformUserWorker.perform_async
end
