MRuby::Gem::Specification.new('nhk-easy-mruby') do |spec|
  spec.license = 'MIT'
  spec.author  = 'zzak'
  spec.summary = "Ruby client library for NHK News Web Easy."

  #spec.add_dependency 'mruby-string-utf8', core: 'mruby-string-utf8'
  #spec.add_dependency 'mruby-numeric-ext', core: 'mruby-numeric-ext'
  #spec.add_dependency 'mruby-string-ext', core: 'mruby-string-ext'
  spec.add_dependency 'mruby-io', mgem: 'mruby-io'
  spec.add_dependency 'mruby-mtest', mgem: 'mruby-mtest'
  spec.add_dependency 'mruby-simplehttp', mgem: 'mruby-simplehttp'
  spec.add_dependency 'mruby-json', mgem: 'mruby-json'
  spec.add_dependency 'mruby-onig-regexp', mgem: 'mruby-onig-regexp'
end
