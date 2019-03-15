class Chat < ApplicationRecord
    enum message_type: {parchase:0, exhibit:1}
end
