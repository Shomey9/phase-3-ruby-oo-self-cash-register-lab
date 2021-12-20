# require 'pry'
class CashRegister
    attr_accessor :total, :discount, :items, :last_item

    def initialize(discount=nil, total=0)
        @total=total
        @discount=discount
        @items=[]
        @last_item=nil
    end

    def add_item(title, price, quantity = 1)
        @title=title
        self.last_item=price*quantity
        self.total=@total+self.last_item
        for i in 0..quantity-1
            self.items << title 
        end
    end

    def apply_discount
        if @discount
            self.total=self.total-self.total*self.discount/100
            "After the discount, the total comes to $#{self.total}."
        else 
            "There is no discount to apply."
        end
    end

    def void_last_transaction
        @items.pop(1)
        self.total-=self.last_item
    end

end
# myNewCashRegister = CashRegister.new(50)
# binding.pry