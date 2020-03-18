class Chat < ApplicationRecord
    belongs_to :transactions
    enum message_type: {parchase:0, exhibit:1}
end
