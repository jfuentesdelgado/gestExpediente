# Load the Rails application.
require File.expand_path('../application', __FILE__)

# Initialize the Rails application.
GestExpediente::Application.initialize!

# JFD Para que reconozca el plural de mercancia
ActivoSupport::Inflector.inflections do |inflect|
	inflect.irregular 'mercancia', 'mercancias'
end