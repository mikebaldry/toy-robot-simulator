# frozen_string_literal: true

$LOAD_PATH.unshift(File.expand_path(File.join(__dir__, 'lib')))

require 'runner'

Runner.from_file('./testcase.txt')
