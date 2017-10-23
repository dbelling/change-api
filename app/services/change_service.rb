class ChangeService
  COINS = {
    'silver-dollar': 1.00,
    'half-dollar': 0.50,
    'quarter': 0.25,
    'dime': 0.10,
    'nickel': 0.05,
    'penny': 0.01
  }

  def self.make_change(amount)
    remaining_amount = BigDecimal.new(amount, 3)
    change_quantities = {}
    COINS.each do |name, coin|
      begin
        if (remaining_amount / coin).positive?
          change_quantities[name] = (remaining_amount / coin).floor
        else
          change_quantities[name] = 0
        end
      rescue ZeroDivisionError
        change_quantities[name] = 0
      end
      remaining_amount -= (change_quantities[name] * coin)
    end
    change_quantities
  end
end
