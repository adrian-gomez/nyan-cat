require 'simplecov'

$LOAD_PATH << '.'

SimpleCov.start do
  add_filter "/spec/"
end