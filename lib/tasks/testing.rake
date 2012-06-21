desc "Shortcut for functional tests"
task :f => "test:functionals"

desc "Shortcut for unit tests"
task :u => "test:units"

desc "Shortcut for integration tests"
task :i => "test:integration"

desc "Run unit and functional tests"
task :uf => ["test:units", "test:functionals"]

desc "Run a single test without preparing database first. Smart about finding the test file.
Syntax: rake t u=[file name] n=[test name]
u (or f or i) is shortcut for unit, functional and integration
so this mean run test from unit folder where name match to 'file name' and test name match to 'test name'
"
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

    # filter by test name
    if ARGV[2] && ARGV[2][0..1] == 'n='
      t.options = "--name='/#{ARGV[2].split('=').last}/'"
    end

  end
end
