class UpdateUserIdsInTasks < ActiveRecord::Migration[6.1]
  def change
    # Assuming User.first is the user you want to assign to existing tasks
    user = User.first

    Task.update_all(user_id: user.id)
  end
end
