
  task :test => :environment do
   
   @message = "Hi it's " + Time.now.strftime("%I:%M:%S")
  puts @message
   file = File.open("#{Rails.root}/doc/test.txt", 'a+')
   file2 = file.puts @message
    file.close
  end
