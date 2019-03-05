class Chat < ApplicationRecord
    enum chat_send_type: [['parchase',0],['exhibit',1]]
end
