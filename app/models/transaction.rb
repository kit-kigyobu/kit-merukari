class Transaction < ApplicationRecord
  enum parchase_status:{parchase_normal:0, parchase_cansel:1, parchase_done:2}
  enum exhibit_status:{exhibit_normal:0, exhibit_cansel:1, exhibit_done:2}
end
