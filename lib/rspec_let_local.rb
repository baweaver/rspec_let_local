require "rspec_let_local/version"

module RSpec
  module Core
    module MemoizedHelpers
      module ClassMethods

        def let_local(name, &block)
          # We have to pass the block directly to `define_method` to
          # allow it to use method constructs like `super` and `return`.
          raise "#let_local called without a block" if block.nil?

          # Whoever calls it gets it
          current_example = caller[0]

          # Attempt to find ivar, if not, make it. Freeze the object to prevent misuse
          meth = -> {
            current_example.instance_variable_get("@#{name}") || 
            current_example.instance_variable_set("@#{name}", block.call)
          }

          MemoizedHelpers.module_for(self).send(:define_method, name, meth)

          before(:all) { __send__(name) }
        end
      end
    end
  end
end
