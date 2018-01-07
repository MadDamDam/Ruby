require 'open3'

desc "open3 task"
task :check_not_root do
  stdout, stderr, status = Open3.capture3("whoami")
  if stdout.strip == "root"
    raise "You cannot be root user!"
  end
end

desc "say hello"
task :hello do # call with rake hello
  puts 'Hello opsschool 2017!'
end

desc "say hello with daytime"
task :greeting do #call with rake greeting DAYTIME=evening NAME=adam
  daytime = ENV["DAYTIME"] || "morning" # if part 1 is nil it goes to morning
  name = ENV["NAME"] || "Boby"

  puts "Good #{daytime} #{name}!"
end

desc "say hello with arguments"
task :say_hi, [:name] do |t, args| #allows passing parameters with rake say_hi[adam]
  puts "hi #{args.name}!"
end

desc "list files"
task :ls do
  sh 'ls -la'
end

#task dependencies
desc "task1"
task task1: [:task2, :task3] do
  puts "Runnig task1..."
end

desc "task2"
task task2: [:task3] do
  puts "running task2..."
end

desc "task3"
task task3: [:task4] do
  puts "running task3..."
end

desc "task4"
task :task4 do
  puts "running task4..."
end

#task -P shows dependencies

desc "uptime print"
task :check_load, [:threshold] do |t, args|
  stdout, stderr, status = Open3.capture3("uptime")
  output = stdout.split
  output = "20:46  up 20 days, 14:50, 3 users, load averages: 1.37, 1.79, 1.98".split
  puts output[10].tr(",","")
  puts "load averages: #{output[9]} #{output[10]} #{output[11]}"
  if output[10].tr(",","").to_f > args.threshold.to_f
    raise "valar margulis above #{args.threshold}"
  end
end

desc "Pizza and potatoes task"
task pizza_and_potatoes: [:market] do
  puts "Creating Dough"
  puts "Putting tomato sauce"
  puts "Adding cheese"
  puts "Peel potatoes"
  puts "Put spices"
end

desc "Go to market"
task :market do
  puts "Go to market"
end

desc "Turn on oven"
task oven: [:pizza_and_potatoes] do
  puts "Turn on oven"
end
desc "Put in oven"

task put_in_oven:[:oven] do
  puts "Put pizza in oven"
  puts "Put potatoes in oven"
end

namespace :server do
  desc 'Restart web server'
  task :restart do
    touch './tmp/restart.txt'
  end
end

namespace :db do
  desc 'Clean the DB'
  task :clean do
    puts "clean the DB"
  end
end

desc 'Cleans backup files *~'
task :clean do
  files = Dir['*~']
  #rm(files)
  puts files
end
