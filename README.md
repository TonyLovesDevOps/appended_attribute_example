These cookbooks show that array attributes are appended to rather than replaced when set at a higher precedence level.

To test:
```
$ cd force_default-cookbook
$ kitchen test
```

Given `default-cookbook/attributes/default.rb` with contents:
```
node.default['string']  = 'default_string'
node.default['array']   = %w( default_array )
```

and `force_default-cookbook/attributes/default.rb` with contents:
```
node.force_default['string'] = 'force_default_string'
node.force_default['array'] = %w( force_default_array )
```

and `force_default-cookbook/recipes/default.rb` recipe, with contents:
```
file '/tmp/string_attribute' do
  content node['string']
end

file '/tmp/array_attribute' do
  content node['array'].join
end
```

the recipe will render the following file contents:
```
$ cat /tmp/string_attribute
force_default_string # EXPECTED
$ cat /tmp/array_attribute
default_arrayforce_default_array # UNEXPECTED, expected 'force_default_array'
```

