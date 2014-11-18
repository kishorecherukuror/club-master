class ClubCoffeesController < ApplicationController
 
 def send_a_gift
 end

 def show
   @coffee = ClubCoffee.find(params['id'])
 end
  
end
