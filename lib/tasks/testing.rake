desc "Shortcut for functional tests"
task :f => "test:functionals"

desc "Shortcut for unit tests"
task :u => "test:units"

desc "Shortcut for integration tests"
task :i => "test:integration"

desc "Run unit and functional tests"
task :uf => ["test:units", "test:functionals"]

desc "Run single test, syntax: rake t t=[file_name] n=[test_name] ."
task :t

Rake::TestTask.new(:t) do |t|
  if ARGV[1]
    # take the first parameter and grab everything right of '=' sign, ignore .rb if it exists in parameter
    file_pattern = ARGV[1].sub(/^(.*)=/, '')
    test_type = $1
    folder = case test_type
      when 'u' then 'unit/'
      when 'f' then 'functional/'
      when 'i' then 'integration/'
      else ''
    end
    file_pattern.gsub!('.rb', "")
    filelist = FileList["test/#{folder}**/*#{file_pattern}*.rb"]
    puts filelist.inspect

    t.test_files = filelist
    t.libs << "test"
    t.verbose = true
    t.warning = false

    # filter by test name
    if ARGV[2] && ARGV[2][0..1] == 'n='
      t.options = "--name='/#{ARGV[2].split('=').last}/'"
    end

  end
end

