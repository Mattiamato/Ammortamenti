class Activity < ActiveRecord::Base
#this might be a comment or a post or something else
  belongs_to :changed_item, :polymorphic => true
  #who did it?
  belongs_to :user
  #what did he do?
  

  
  def msg
    #do fancy text generation
    if cambiamenti.new_record
      "#{user.name} created a #{changed_item.class}"
    else
      "#{user.name} changed #{cambiamenti.length} attributes of the #{changed_item.class} #{changed_item.title}"
    end
  end



end
