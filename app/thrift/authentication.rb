#
# Autogenerated by Thrift Compiler (0.9.0)
#
# DO NOT EDIT UNLESS YOU ARE SURE THAT YOU KNOW WHAT YOU ARE DOING
#

require 'thrift'
require 'myauth_types'

module MyAuth
  module Authentication
    class Client
      include ::Thrift::Client

      def say_hello()
        send_say_hello()
        return recv_say_hello()
      end

      def send_say_hello()
        send_message('say_hello', Say_hello_args)
      end

      def recv_say_hello()
        result = receive_message(Say_hello_result)
        return result.success unless result.success.nil?
        raise ::Thrift::ApplicationException.new(::Thrift::ApplicationException::MISSING_RESULT, 'say_hello failed: unknown result')
      end

      def login(cred)
        send_login(cred)
        return recv_login()
      end

      def send_login(cred)
        send_message('login', Login_args, :cred => cred)
      end

      def recv_login()
        result = receive_message(Login_result)
        return result.success unless result.success.nil?
        raise ::Thrift::ApplicationException.new(::Thrift::ApplicationException::MISSING_RESULT, 'login failed: unknown result')
      end

    end

    class Processor
      include ::Thrift::Processor

      def process_say_hello(seqid, iprot, oprot)
        args = read_args(iprot, Say_hello_args)
        result = Say_hello_result.new()
        result.success = @handler.say_hello()
        write_result(result, oprot, 'say_hello', seqid)
      end

      def process_login(seqid, iprot, oprot)
        args = read_args(iprot, Login_args)
        result = Login_result.new()
        result.success = @handler.login(args.cred)
        write_result(result, oprot, 'login', seqid)
      end

    end

    # HELPER FUNCTIONS AND STRUCTURES

    class Say_hello_args
      include ::Thrift::Struct, ::Thrift::Struct_Union

      FIELDS = {

      }

      def struct_fields; FIELDS; end

      def validate
      end

      ::Thrift::Struct.generate_accessors self
    end

    class Say_hello_result
      include ::Thrift::Struct, ::Thrift::Struct_Union
      SUCCESS = 0

      FIELDS = {
        SUCCESS => {:type => ::Thrift::Types::STRING, :name => 'success'}
      }

      def struct_fields; FIELDS; end

      def validate
      end

      ::Thrift::Struct.generate_accessors self
    end

    class Login_args
      include ::Thrift::Struct, ::Thrift::Struct_Union
      CRED = 1

      FIELDS = {
        CRED => {:type => ::Thrift::Types::STRUCT, :name => 'cred', :class => ::MyAuth::User}
      }

      def struct_fields; FIELDS; end

      def validate
      end

      ::Thrift::Struct.generate_accessors self
    end

    class Login_result
      include ::Thrift::Struct, ::Thrift::Struct_Union
      SUCCESS = 0

      FIELDS = {
        SUCCESS => {:type => ::Thrift::Types::I32, :name => 'success', :enum_class => ::MyAuth::LoginStatus}
      }

      def struct_fields; FIELDS; end

      def validate
        unless @success.nil? || ::MyAuth::LoginStatus::VALID_VALUES.include?(@success)
          raise ::Thrift::ProtocolException.new(::Thrift::ProtocolException::UNKNOWN, 'Invalid value of field success!')
        end
      end

      ::Thrift::Struct.generate_accessors self
    end

  end

end
