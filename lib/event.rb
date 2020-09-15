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
    
  end



  def total_inventory
    @food_trucks.reduce(Hash.new()) do |hash, food_truck|
    end

  end

end
