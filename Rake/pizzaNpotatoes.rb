#Activate with bake[x,y]. x,y optional

desc "Prepare food task"
task :pizza_and_potatoes => [:market] do |task, args|
 Rake::Task["prepare_" + args.food1].execute if args.food1
 Rake::Task["prepare_" + args.food2].execute if args.food2
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
 raise "Nothing to bake" unless args.food1
 puts args.food2 ? "Went to market to buy #{args.food1} and #{args.food2}" : "Went to market to buy #{args.food1}"
end

desc "Turn on oven task"
task :oven => [:pizza_and_potatoes] do
 puts "Turn on oven"
end

desc "Baking task"
task :bake, [:food1, :food2] => [:oven] do |task, args|
 puts "Put #{args.food1} in oven" if args.food1
 puts "Put #{args.food2} in oven" if args.food2
end
