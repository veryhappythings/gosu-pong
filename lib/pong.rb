require 'rubygems'
require 'gosu'
ROOT = File.dirname(File.expand_path(__FILE__))

require "#{ROOT}/pong/lib/require_all"

require_all "#{ROOT}/pong"
