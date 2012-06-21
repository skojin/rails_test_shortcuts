Set of rake tasks that let's you type less to run tests. 

## Installation

Add this line to your application's Gemfile:

    gem 'rails_test_shortcuts', :group => :development

And then execute:

    $ bundle

## Usage

### Shortcuts to standarts tasks
    
    rake u      # alias for rake test:units
    rake f      # alias for rake test:functionals
    rake i      # alias for rake test:integration
    rake uf     # run units and functionals tests only

### Run single test or set of tests by mask

Syntax: `rake t u=[file name] n=[test name]`

`rake t` task allows running tests by file name and test name. Add `u=user` parameter to run only the tests that have 'user' in name. Also available `f=` for functional tests, `i=` for integration tests and 't=' for any tests.

    
    rake t u=user            # test/units/*user*.rb tests
    rake t f=session         # test/functional/*session*.rb tests
    rake t i=login           # test/integration/*login*.rb tests
    rake t t=user            # test/**/*user*.rb tests, all tests that have 'user' in filename

`n=testname` parameter allows executing only the tests that matches /testname/

    rake t u=user n=create          # test/units/*user*.rb individual tests that have 'create' in test name

Also note that `rake t` task skips db:test:prepare database initialization task, so it executes a bit faster, but if your database schema changed, run once `rake u` or `rake tests` to prepare db.

## See Also

https://github.com/grosser/single_test