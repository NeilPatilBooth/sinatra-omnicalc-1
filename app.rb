require "sinatra"
require "sinatra/reloader"

#######Square#########
get("/square/new") do
  erb(:new_square_calc)
end

get("/square/results") do
  @the_num = params.fetch("users_number").to_f
  @the_result = @the_num ** 2
  erb(:square_results)
end

########SquareRoot###########
get("/square_root/new") do
  erb(:new_squareroot_calc)
end

get("/square_root/results") do
  @the_num = params.fetch("users_number").to_f
  @the_result = @the_num ** 0.5
  erb(:squareroot_results)
end

######Finance#######
get("/payment/new") do
  erb(:payment_calc)
end

get("/payment/results") do
  @apr=params.fetch("users_apr").to_f
  @formatted_rate = @apr.to_fs(:percentage, { :precision => 4 })
  @apr_monthly=(@apr/100/12)
  @years=params.fetch("users_years").to_f
  @months=@years * 12
  @principal=params.fetch("users_principal").to_f
  @formatted_principal=@principal.to_fs(:currency, {:precision =>2})
  @num=@apr_monthly*@principal
  @denom=1-(1+@apr_monthly)**-@months
  @solution = @num/@denom
  @solution_formatted = @solution.to_fs(:currency, {:precision =>2})
  erb(:payment_results)
end


####Random####
get("/random/new") do
  erb(:random_calc)
end


get("/random/results") do
  @max = params.fetch("user_max").to_f
  @min = params.fetch("user_min").to_f
  @solution = rand(@min..@max)
  erb(:random_results)
end




get("/") do
  "
  <h1>Welcome to your Sinatra App!</h1>
  <p>Define some routes in app.rb</p>
  "
end
