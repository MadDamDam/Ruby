#Activate with bake[foodx foody...].
#Supported foods are [potatoes, pizza]

desc "Prepare food task"
task :prepare_food => [:market] do |task, args|
  args.foods.split.each {|food| Rake::Task["prepare_#{food}"].execute}
end

desc "Prepare pizza task"
task :prepare_pizza do
  puts "Creating Dough"
  puts "Putting tomato sauce"
  puts "Adding cheese"
end

desc "Prepare potatoes task"
task :prepare_potatoes do
  puts "Peel potatoes"
  puts "Put spices"
end

desc "Go to market task"
task :market do |task, args|
  if args.foods then
    print "Went to market to buy: "
    args.foods.split.each_with_index {|food, index|
      print index != args.foods.split.size - 1 ? "#{food}, " : "#{food}."}
    puts
  else
    raise "Nothing to bake" unless args.foods
  end
end

desc "Turn on oven task"
task :oven => [:prepare_food] do
  puts "Turn on oven"
end

desc "Baking task"
task :bake, [:foods] => [:oven] do |task, args|
  args.foods.split.each {|food| puts "Put #{food} in oven"}
end
