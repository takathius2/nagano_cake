class Order < ApplicationRecord
    has_many :order_details, dependent: :destroy
    has_many :addresses, dependent: :destroy
    belongs_to :customer
    
    #0ならクレジット払い、1なら銀行振込
    enum payment_method: { credit_card: 0, transfer: 1 }
    
    enum delivery_method: { my_postal_code: 0, registered_address:1, new_address: 2 }
end
