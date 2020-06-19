# Alan created the following code to keep track of items for a shopping cart application he's writing:

class InvoiceEntry
  attr_reader :quantity, :product_name

  def initialize(product_name, number_purchased)
    @quantity = number_purchased
    @product_name = product_name
  end

  def update_quantity(updated_count)
    # prevent negative quantities from being set
    quantity = updated_count if updated_count >= 0
  end
end

# Alyssa looked at the code and spotted a mistake. "This will fail when update_quantity is called", she says.

# Can you spot the mistake and how to address it?

# The mistake comes from the attr_reader method as this method will only 'get' the value associated with the instance variable
# On line 13, the instance variable `quantity` is assigned the updated_count arguement if it meets the conditions. As the instance variable
# `quantity` does not have access to a 'setter' method, the `update_quantity` method will fail. To readdess this, the attr_reader method
# should be changed to attr_accessor for `quantity`. In this case the quantity instance variable must be prefixed with self.