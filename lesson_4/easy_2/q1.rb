# Question 1

# You are given the following code:

class Oracle
  def predict_the_future
    "You will " + choices.sample
  end

  def choices
    ["eat a nice lunch", "take a nap soon", "stay at work late"]
  end
end

# What is the result of executing the following code:

oracle = Oracle.new
oracle.predict_the_future


# The return value will be either: "You will eat a nice lunch", "You will take a nap soon" or "You will stay at work late"
# The choices method returns the array of strings and one is chosen at random. This is then concatenated with the string "You will" and returned. 