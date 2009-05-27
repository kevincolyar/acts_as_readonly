# Include hook code here
require 'acts_as_readonly'

ActiveRecord::Base.send(:include, KevinColyar::Acts::ReadOnly)
