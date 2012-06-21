module RailsTestShortcuts
  class Railtie < Rails::Railtie
    rake_tasks do
      load 'tasks/testing.rake'
    end
  end
end
