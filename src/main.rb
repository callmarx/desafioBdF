#require_relative "mars_probe_test" # descomente para testar o input

require_relative "mars_probe" # comente se for descomentar a linha anterior

help = "
  Execução do desafio da Sonda em Marte por linha de comando.
  Execute:
  ruby main.rb <input file>

  A saida será do forma ./tmp/<timestamp>output.txt
"

if ARGV.length != 1 or ARGV[0] == "--help"
  puts help
else
  file_in = File.open(ARGV[0], 'r')
  limit = file_in.readline.strip.split(" ").map(&:to_i)
  mars_probe = MarsProbe.new(x_max: limit[0], y_max:limit[1])
  file_out_name = "./tmp/#{Time.now.to_i}_output.txt"
  while !file_in.eof?
    start = file_in.readline.strip.split(" ")
    mars_probe.start(x: start[0].to_i, y: start[1].to_i, direction: start[2])
    move = file_in.readline.strip
    mars_probe.proceed_commands(commands_string: move)
    File.write(file_out_name, "#{mars_probe.get_status}\n", mode: 'a')
  end
  file_in.close
end


