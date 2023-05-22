Award = Struct.new(:name, :expires_in, :quality) do |new_class|
    def decrease_quantity(amount)
        self.quality -= amount
    end

    def increase_quantity(amount)
        self.quality += amount
    end
end
