# This file was extracted from the blueprint project and then modified.
require File.join(Compass.lib_directory, 'compass', 'core_ext')

module Compass
  # Validates generated CSS against the W3 using Java
  class Validator
    VALIDATOR_DIR = File.join(File.dirname(__FILE__), 'java_validator')
    VALIDATOR_FILE = File.join(VALIDATOR_DIR, 'css-validator.jar')
    attr_reader :error_count
    attr_reader :css_directory
    
    def initialize(css_directory)
      @css_directory = css_directory
      @error_count = 0
    end

    # Validates all three CSS files
    def validate
      java_path = `which java`.rstrip
      raise "You do not have a Java installed, but it is required." if java_path.blank?
    
      output_header
    
      Dir.glob(File.join(css_directory, "**", "*.css")).each do |file_name|
        @error_count += 1 if !validate_css_file(java_path, file_name)
      end
    
      output_footer
    end
    
    private
    def validate_css_file(java_path, css_file)
      puts "\n\nTesting #{css_file}"
      jars = Dir.glob("#{VALIDATOR_DIR}/*.jar") - [VALIDATOR_FILE]
      cmd = "#{java_path} -jar '#{VALIDATOR_FILE}' -classpath '#{jars.join(File::PATH_SEPARATOR)}' -e '#{css_file}'"
      puts "Running: #{cmd}\n"
      puts "Output ============================================================\n\n"
      system("#{java_path} -jar '#{VALIDATOR_FILE}' -classpath '#{Dir.glob("#{VALIDATOR_DIR}/*.jar").join(":")}' -e '#{css_file}'")
    end
    
    def output_header
      puts "\n\n"
      puts "************************************************************"
      puts "**"
      puts "**   Compass CSS Validator"
      puts "**   Validates output CSS files"
      puts "**"
      puts "************************************************************"
    end

    def output_footer
      puts "\n\n"
      puts "************************************************************"
      puts "**"
      puts "**   Done!"
      puts "**   Your CSS files are#{" not" if error_count > 0} valid.#{"  You had #{error_count} error(s) within your files" if error_count > 0}"
      puts "**"
      puts "************************************************************"
    end
  end
end