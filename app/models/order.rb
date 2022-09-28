class Order < ApplicationRecord
    belongs_to :order_detail
    belongs_to :customer
    
    #0ならクレジット払い、1なら銀行振り込み
    enum payment_method: { credit_card: 0, transfer: 1 }
end
