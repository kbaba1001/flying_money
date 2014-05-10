module ActionView
  module Helpers
    class CustomFormBuilder < FormBuilder
      def error_messages_on(field_name)
        return unless error_messages = object.errors.full_messages_for(field_name).presence

        @template.content_tag(:small, error_messages.join(' '), class: 'error')
      end
    end

    module FormHelper
      def form_for_with_application(record, options = {}, &block)
        form_for_without_application(record, options.merge(custom_options), &block)
      end

      def fields_for_with_application(record_name, record_object = nil, options = {}, &block)
        fields_for_without_application(record_name, record_object, options.merge(custom_options), &block)
      end

      alias_method_chain :form_for, :application
      alias_method_chain :fields_for, :application

      private

      def custom_options
        {builder: CustomFormBuilder, html: {novalidate: 'novalidate'}}
      end
    end
  end
end
