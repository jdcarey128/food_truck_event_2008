class Event
  attr_reader :name, :food_trucks

  def initialize(name)
    @name = name
    @food_trucks = []
  end

  def add_food_truck(food_truck)
    @food_trucks << food_truck
  end

  def food_truck_names
    @food_trucks.map do |food_truck|
      food_truck.name
    end
  end

  def food_trucks_that_sell(item)
    @food_trucks.select do |food_truck|
      food_truck.check_stock(item) > 0
    end
  end

  def all_items
    @food_trucks.flat_map do |food_truck|
      food_truck.inventory.map do |item, quantity|
        item
      end
    end.uniq
  end

  def sorted_item_list
    sorted_items = all_items.sort_by do |item|
      item.name
    end
    sorted_items.map do |item|
      item.name
    end
  end

  def total_inventory
    all_items.reduce(Hash.new({quantity: 0, food_trucks: []})) do |hash, item|
      hash[item][:quantity] = @food_trucks.map do |food_truck|
        food_truck.check_stock(item)
      end.sum
      hash[item][:food_trucks] = food_trucks_that_sell(item)
      hash[item]
    end
  end

  def overstocked_items
    total_inventory.select do |item, inventory|
      inventory[:quantity] > 50 && inventory[:food_trucks].count > 1
    end
  end

end
