# ActsAsReadonly
module KevinColyar
  module Acts
    module ReadOnly
      def self.included(base)
        base.extend(ClassMethods)
      end

      module ClassMethods
        def acts_as_readonly
          ['save', 'save!', 'destroy', 'destroy_all', 'create', 'create!'].each do |method|
            define_method(method) do
              raise "You can't call #{method} on a read-only model."
            end
          end
          self.column_names.each do |column_name|
            define_method("#{column_name}=") do 
              raise "You can't set the read-only attribute '#{column_name}'."
            end
          end
        end
      end
    end
  end
end
