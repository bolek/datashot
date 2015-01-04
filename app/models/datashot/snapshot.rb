module Datashot
  class Snapshot < ActiveRecord::Base
    validates :name, presence: true
    validates :query, presence: true

    def reload_query
      begin
        self.result = ActiveRecord::Base.connection.select_all(query).to_json
        self.error_message = nil
      rescue ActiveRecord::StatementInvalid => e
        self.result = nil
        self.error_message = e.message
      end
      self.last_ran_at = DateTime.now
      save
      self
    end
  end
end
