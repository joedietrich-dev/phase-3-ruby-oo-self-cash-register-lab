class CashRegister
  attr_accessor :total, :discount, :transactions
  attr_reader :items

  def initialize(discount = 0)
    @total = 0
    @discount = discount
    @items = []
    @transactions = []
  end

  def add_item(name, price, quantity=1)
    self.total += price * quantity
    quantity.times {|i| self.items << name}
    self.transactions << {name: name, price: price, quantity: quantity}
  end

  def apply_discount
    message = ""
    if self.discount > 0
      self.total -= self.total * (self.discount / 100.0)
      message = "After the discount, the total comes to $#{self.total.to_i}."
    else
      message = "There is no discount to apply."
    end
    message
  end

  def void_last_transaction
    voided_transaction = self.transactions[-1]
    self.total -= voided_transaction[:quantity] * voided_transaction[:price]
    voided_transaction[:quantity].times {|i| self.items.pop }
  end
end