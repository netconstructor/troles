# @author Kristian Mandrup
#
# Many roles strategy to operate on role as a comma seperated String
#
module Troles::Strategy
  module StringMany

    # What to add to the role subject class when this role strategy is included
    # @param [Class] the role subject class to  
    def self.included(base)
      base.send :include, BaseMany
    end

    # The storage strategy class
    # @return [Class] a storage subclass
    def storage 
      Troles::Storage::StringMany
    end      
  end
end