# frozen_string_literal: true

# rubocop:disable Style/EvalWithLocation, Security/Eval
module Spec
  module Support
    module Helpers
      def capture(stream)
        begin
          stream = stream.to_s
          eval "$#{stream} = StringIO.new"
          yield
          result = eval("$#{stream}").string
        ensure
          eval("$#{stream} = #{stream.upcase}")
        end
        result
      end
    end
  end
end
# rubocop:enable Style/EvalWithLocation, Security/Eval
