#!/usr/bin/env ruby
require 'rubygems' unless defined?(Gem)
require 'slim'                                       # slim
require 'nokogiri'                                   # nokogiri
require 'active_support/core_ext/hash/keys'          # symbolize_keys
require 'active_support/core_ext/hash/reverse_merge' # reverse_merge

# if i need to export some pretty
# require 'nokogiri-pretty'

module Rlaszlo
  # @markup openlaszlo
  # @title Convert tools from custom slim to openlaszlo format
  # @author Carlo Bertini [WaYdotNET]
  #
  # @version 0.1
  class Parser

    # Error Handler
    #
    # @api public
    class SyntaxError < StandardError
      attr_reader :error

      def initialize(error)
        @error = error
      end

      def to_s
        @error
      end
    end

    # Initialize with params :D
    #
    # @param [String] file
    #   Input file to need convert into lsz file.
    # @params [Hash] options
    #   Options hash for rendering options.
    # @option options [String] :ext
    #  Extension file to output file
    # @option options [Boolean] :pretty
    #  Pretty function to export code
    # @options options [Boolean] :hack
    #  Apply custom hack to reformat code
    #
    # @return [String] The status of operation
    #
    # @example
    #   Rlaszlo::Parser.new('demo.rz')
    #   Rlaszlo::Parser.new('demo.rz', ext: 'bar')
    #   Rlaszlo::Parser.new('demo.rz', pretty: false)
    #
    # @api public
    def initialize(file, options={})
      default_options = {
        file:   file,
        ext:    'lzx',
        code:   nil,
        pretty: true,
        hack: true
      }
      options = options.reverse_merge!(default_options)
      options[:output] = "#{File.basename(options[:file], '.*')}.#{options[:ext]}" if options[:output].nil?

      syntax_error!('Missing file input....') if options[:file].nil?

      @options = options

    end

    # call this to covert rslazlo to correct openlaszlo's' file format
    #
    # @return [String] The status of operation
    #
    # @api public
    def to_laszlo
      render
      pretty if @options[:pretty]
      hack if @options[:hack]
      export_to_file
      STDOUT.puts 'Finish conversion... enjoy with OpenLaszlo now :D'
    end

    private

    # open file and convert slim to html
    #
    # @api private
    def render
      @options[:code] = Slim::Template.new(@options[:file]).render
    end

    # TODO: insert hack system to modify custom tag :D
    #       into new class :D
    #
    # @api private
    def hack
      # first hack
      # replace cdata tag with relative <![CDATA[ ... ]]>
      @options[:code].gsub!(/<cdata>/, "<![CDATA[")
      @options[:code].gsub!(/<\/cdata>/, "]]>")

      # example custom tag (Author)
      @options[:author] = "Carlo Bertini [WaYdotNET]"
      @options[:code].gsub!(/<author><\/author>/, "<!-- author: #{@options[:author]} -->")

      # author with code inject into file
      author =  @options[:code].match(/author name="(.*).*"/)
      @options[:author] = author[1] unless author.nil?
      @options[:code].gsub!(/author name="(.*).*"/, "author><\/author")
      @options[:code].gsub!(/<author><\/author>/, "<!-- author: #{@options[:author]} -->")

      # return code
      @options[:code] = @options[:code]
    end

    # reformat code with nokogiri to pretty export
    #
    # @api private
    def pretty
      @options[:code] = Nokogiri::XML(@options[:code],&:noblanks).to_xhtml
      # use nokogiri-pretty, replace before string with
      # @options[:code] = Nokogiri::XML(@options[:code],&:noblanks).human
    end

    # save file to disk
    #
    # @api private
    def export_to_file
      File.open(@options[:output], 'w') {|f| f.write(@options[:code]) }
    end

    # Helper for raising exceptions
    #
    # @api private
    def syntax_error!(message)
      raise SyntaxError.new(message)
    end
  end

end

# call
Rlaszlo::Parser.new(ARGV[0]).to_laszlo
