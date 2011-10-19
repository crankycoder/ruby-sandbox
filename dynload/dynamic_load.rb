# This script demonstrates dynamically loading of a module and
# patching of the LOAD_PATH
#
# Basic requirements - you'll need the json gem install, and rubygems
# installed for that matter.
#
# To run this script, you'll need jruby 1.6 running with ruby 1.9
# compatibility mode turned on.
#
# $ jruby -rubygems --1.9 dynamic_load.rb
#


require 'minitest/autorun'

class TestDynamicModuleLoad < MiniTest::Unit::TestCase
    def setup
        # This should dynamically load the json library
        mylib = 'json'
        require mylib
    end

    def test_json_load
        # check that the JSON module is now visible after the setup
        # has run
        Module.const_defined? 'JSON'
    end

    def test_dyn_class_load
        # We want to grab a pointer to the module and just use it
        # without having a hardcoded name.  Basically, we want the
        # equialent of __import__ in python
        source_string = '{"sample": "Hello, world!"}'
        
        # Note that this may not actually be a class
        
        # This isn't entirely obvious.  Ruby keeps classes and module
        # names as constants. So you can also pass in the :JSON symbol
        # You also have no idea if you've got a module or a class
        cls = Kernel.const_get('JSON')

        # Same as this:
        # cls = Kernel.const_get(:JSON)

        obj = cls.parse(source_string)
        assert_equal obj['sample'], "Hello, world!"
    end

    def test_patch_import_path
        begin
            some_path = File.expand_path('~/no/way/in/hell/does/this/path/exist/lib')
            refute_includes $LOAD_PATH, some_path

            if !$LOAD_PATH.include?(some_path)
                $LOAD_PATH.unshift(some_path)
            end
            assert_includes $LOAD_PATH, some_path
        ensure
            $LOAD_PATH.shift
        end
    end

    def test_load_new_code
        begin
            some_path = File.expand_path('newlib')
            if !$LOAD_PATH.include?(some_path)
                $LOAD_PATH.unshift(some_path)
            end

            require 'foobar'
            mymod = Kernel.const_get('FooBar')
            mymethod = mymod.method('test_method')
            assert_equal 25, mymethod.call(5)
        ensure
            $LOAD_PATH.shift
        end
    end

end





