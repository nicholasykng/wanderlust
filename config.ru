require './config/environment'
use Rack::Static, :urls => ['/stylesheets', '/javascripts'], :root => 'public'
if ActiveRecord::Base.connection.migration_context.needs_migration?
  raise 'Migrations are pending. Run `rake db:migrate` to resolve the issue.'
end

use Rack::MethodOverride
use UsersController
use DestinationsController
use AttractionsController
run ApplicationController
