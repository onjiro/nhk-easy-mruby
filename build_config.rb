MRuby::Build.new do |conf|
  toolchain :gcc

  #conf.gem :core => 'mruby-string-utf8'
  #conf.gem :core => 'mruby-numeric-ext'
  #conf.gem :core => 'mruby-string-ext'
  conf.gem :mgem => 'mruby-io'
  conf.gem :mgem => 'mruby-mtest'
  conf.gem :mgem => 'mruby-simplehttp'
  #conf.gem :mgem => 'mruby-json'
  conf.gem :github => 'zzak/mruby-json'
  conf.gem :mgem => 'mruby-onig-regexp'

  conf.gem File.expand_path(File.dirname(__FILE__))
end
