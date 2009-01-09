package wrapperSuite.tests
{
  import luaAlchemy.lua_wrapper;

  import flash.utils.ByteArray;
  import net.digitalprimates.fluint.tests.TestCase;

  public class TestAS3LuaInterface extends CommonTestCase
  {
    /* TODO: Test New, New2, Class and Class2 with bad arguments */

    public function testAS3NewArray():void
    {
      var script:String = ( <![CDATA[
        v = as3.new("Array")
        return v
        ]]> ).toString();
      var stack:Array = lua_wrapper.luaDoString(luaState, script);
      assertTrue(stack[0]);
      assertTrue(stack[1] is Array);
      assertEquals(2, stack.length);
    }

    public function testAS3New2ArrayEmptyStr():void
    {
      var script:String = ( <![CDATA[
        v = as3.new2("", "Array")
        return v
        ]]> ).toString();
      var stack:Array = lua_wrapper.luaDoString(luaState, script);
      assertTrue(stack[0]);
      assertTrue(stack[1] is Array);
      assertEquals(2, stack.length);
    }

    public function testAS3New2ArrayNil():void
    {
      var script:String = ( <![CDATA[
        v = as3.new2(nil, "Array")
        return v
        ]]> ).toString();
      var stack:Array = lua_wrapper.luaDoString(luaState, script);
      assertTrue(stack[0]);
      assertTrue(stack[1] is Array);
      assertEquals(2, stack.length);
    }

    public function testAS3New2ArrayFalse():void
    {
      var script:String = ( <![CDATA[
        v = as3.new2(false, "Array")
        return v
        ]]> ).toString();
      var stack:Array = lua_wrapper.luaDoString(luaState, script);
      assertTrue(stack[0]);
      assertTrue(stack[1] is Array);
      assertEquals(2, stack.length);
    }

    public function testAS3NewByteArray():void
    {
      var script:String = ( <![CDATA[
        v = as3.new("flash.utils::ByteArray")
        return v
        ]]> ).toString();
      var stack:Array = lua_wrapper.luaDoString(luaState, script);
      assertTrue(stack[0]);
      assertTrue(stack[1] is ByteArray);
      assertEquals(2, stack.length);
    }

    public function testAS3New2ByteArray():void
    {
      var script:String = ( <![CDATA[
        v = as3.new2("flash.utils", "ByteArray")
        return v
        ]]> ).toString();
      var stack:Array = lua_wrapper.luaDoString(luaState, script);
      assertTrue(stack[0]);
      assertTrue("expected ByteArray", stack[1] is ByteArray);
      assertEquals(2, stack.length);
    }

    public function testAS3Release():void
    {
      var script:String = ( <![CDATA[
        v = as3.new("flash.utils::ByteArray")
        as3.release(v)
        return v
        ]]> ).toString();
      var stack:Array = lua_wrapper.luaDoString(luaState, script);
      assertTrue(stack[0]);
      assertNull(stack[1]);
      assertEquals(2, stack.length);
    }

    public function testAS3ToLuaTypeNumber():void
    {
      var script:String = ( <![CDATA[
        n1 = as3.new("int", 7)
        n2 = as3.new("Number", 6)
        return as3.tolua(n1) + as3.tolua(n2)
        ]]> ).toString();
      var stack:Array = lua_wrapper.luaDoString(luaState, script);
      assertTrue(stack[0]);
      assertEquals(13, stack[1]);
      assertEquals(2, stack.length);
    }

    public function testAS3ToLuaPassthrough():void
    {
      var script:String = ( <![CDATA[
        v = as3.new("flash.utils::ByteArray")
        assert(as3.tolua(v) == v)
        ]]> ).toString();
      var stack:Array = lua_wrapper.luaDoString(luaState, script);
      assertTrue(stack[0]);
      assertEquals(1, stack.length);
    }

    public function testAS3ToLuaNoargs():void
    {
      var script:String = ( <![CDATA[
        assert(as3.tolua() == nil)
        ]]> ).toString();
      var stack:Array = lua_wrapper.luaDoString(luaState, script);
      assertTrue(stack[0]);
      assertEquals(1, stack.length);
    }

    public function testAS3ToLuaNil():void
    {
      var script:String = ( <![CDATA[
        assert(as3.tolua(nil) == nil)
        ]]> ).toString();
      var stack:Array = lua_wrapper.luaDoString(luaState, script);
      assertTrue(stack[0]);
      assertEquals(1, stack.length);
    }

    public function testAS3Class():void
    {
      var script:String = ( <![CDATA[
        v = as3.class("String")
        return v
        ]]> ).toString();
      var stack:Array = lua_wrapper.luaDoString(luaState, script);
      assertTrue(stack[0]);
      assertTrue(stack[1] is Class);

      assertEquals(2, stack.length);
    }

    public function testAS3Class2StringNil():void
    {
      var script:String = ( <![CDATA[
        v = as3.class2(nil, "String")
        return v
        ]]> ).toString();
      var stack:Array = lua_wrapper.luaDoString(luaState, script);
      assertTrue(stack[0]);
      assertTrue(stack[1] is Class);

      assertEquals(2, stack.length);
    }

    public function testAS3Class2StringFalse():void
    {
      var script:String = ( <![CDATA[
        v = as3.class2(false, "String")
        return v
        ]]> ).toString();
      var stack:Array = lua_wrapper.luaDoString(luaState, script);
      assertTrue(stack[0]);
      assertTrue(stack[1] is Class);

      assertEquals(2, stack.length);
    }

    public function testAS3Class2StringEmptyString():void
    {
      var script:String = ( <![CDATA[
        v = as3.class2("", "String")
        return v
        ]]> ).toString();
      var stack:Array = lua_wrapper.luaDoString(luaState, script);
      assertTrue(stack[0]);
      assertTrue(stack[1] is Class);

      assertEquals(2, stack.length);
    }

    public function testAS3ClassByteArray():void
    {
      var script:String = ( <![CDATA[
        v = as3.class("flash.utils::ByteArray")
        return v
        ]]> ).toString();
      var stack:Array = lua_wrapper.luaDoString(luaState, script);
      assertTrue(stack[0]);
      assertTrue(stack[1] is Class);
      assertEquals(2, stack.length);
    }

    public function testAS3Class2ByteArray():void
    {
      var script:String = ( <![CDATA[
        v = as3.class2("flash.utils", "ByteArray")
        return v
        ]]> ).toString();
      var stack:Array = lua_wrapper.luaDoString(luaState, script);
      assertTrue(stack[0]);
      assertTrue(stack[1] is Class);
      assertEquals(2, stack.length);
    }

    public function testAS3Get():void
    {
      var script:String = ( <![CDATA[
        v = as3.new("Array")
        return as3.get(v, "length")
        ]]> ).toString();
      var stack:Array = lua_wrapper.luaDoString(luaState, script);
      assertTrue(stack[0]);
      assertTrue(stack[1] is int);
      assertEquals(0, stack[1]);

      assertEquals(2, stack.length);
    }

    // TODO test getting every possible type defined in push_as3_to_lua_stack(),
    // also check type on Lua end

    public function testAS3SetPublicString():void
    {
      var script:String = ( <![CDATA[
        v = as3.new("wrapperSuite.tests::TestWrapperHelper")
        as3.set(v, "string1", "hello")
        return v, as3.get(v, "string1")
        ]]> ).toString();
      var stack:Array = lua_wrapper.luaDoString(luaState, script);

      assertTrue(stack[0]);

      assertTrue(stack[1] is TestWrapperHelper);
      var helper:TestWrapperHelper = stack[1] as TestWrapperHelper;
      assertEquals("hello", helper.string1);

      assertEquals("hello", stack[2]);

      assertEquals(3, stack.length);
    }

    public function testAS3StringGetterSetter():void
    {
      var script:String = ( <![CDATA[
        v = as3.new("wrapperSuite.tests::TestWrapperHelper")
        as3.set(v, "string2", "hello")
        return v, as3.get(v, "string2")
        ]]> ).toString();
      var stack:Array = lua_wrapper.luaDoString(luaState, script);

      assertTrue(stack[0]);

      assertTrue(stack[1] is TestWrapperHelper);
      var helper:TestWrapperHelper = stack[1] as TestWrapperHelper;
      assertEquals("hello", helper.string2);

      assertEquals("hello", stack[2]);

      assertEquals(3, stack.length);
    }

    public function testAS3CallSetNameAge():void
    {
      var script:String = ( <![CDATA[
        v = as3.new("wrapperSuite.tests::TestWrapperHelper")
        as3.call(v, "setNameAge", "Robert", 38)
        return as3.get(v, "nameAge")
        ]]> ).toString();
      var stack:Array = lua_wrapper.luaDoString(luaState, script);

      assertTrue(stack[0]);
      assertEquals("Name: Robert age: 38", stack[1]);
      assertEquals(2, stack.length);
    }

    public function testAS3CallStaticNameAge():void
    {
      var script:String = ( <![CDATA[
        v = as3.class("wrapperSuite.tests::TestWrapperHelper")
        return as3.call(v, "staticNameAge", "Jessie James", 127)
        ]]> ).toString();
      var stack:Array = lua_wrapper.luaDoString(luaState, script);

      assertTrue(stack[0]);
      assertEquals("Name: Jessie James age: 127", stack[1]);
      assertEquals(2, stack.length);
    }

    public function testAS3FlYield():void
    {
      var script:String = ( <![CDATA[
        as3.flyield()
        ]]> ).toString();
      var stack:Array = lua_wrapper.luaDoString(luaState, script);

      assertTrue(stack[0]);
      assertEquals(1, stack.length);
    }

    public function testAS3Trace():void
    {
      var script:String = ( <![CDATA[
        as3.trace("trace test", 1, 2, "boo", {}, function() end)
        ]]> ).toString();
      var stack:Array = lua_wrapper.luaDoString(luaState, script);

      trace(stack);
      assertTrue(stack[0]);
      assertEquals(1, stack.length);
    }

    public function testAS3Metatable():void
    {
      var script:String = ( <![CDATA[
        as3.get(io.stdin, "bad")
        ]]> ).toString();
      var stack:Array = lua_wrapper.luaDoString(luaState, script);

      assertFalse(stack[0]);
      assertEquals("luaDoString:2: bad argument #1 to 'get' (LuaAlchemy.as3 expected, got userdata)\nstack traceback:\n\t[C]: in function 'get'\n\tluaDoString:2: in main chunk", stack[1]);
      assertEquals(2, stack.length);
    }

    public function testAS3NamespaceCall():void
    {
      var script:String = ( <![CDATA[
        v = as3.new("wrapperSuite.tests::TestWrapperHelper")
        return as3.namespacecall("flash.utils", "getQualifiedClassName", v)
        ]]> ).toString();
      var stack:Array = lua_wrapper.luaDoString(luaState, script);
      assertTrue(stack[0]);
      assertEquals("wrapperSuite.tests::TestWrapperHelper", stack[1]);
      assertEquals(2, stack.length);
    }

    public function testAS3SetGlobal():void
    {
      var myHelper:TestWrapperHelper = new TestWrapperHelper();
      lua_wrapper.setGlobal(luaState, "testHelper", myHelper);

      var script:String = ( <![CDATA[
        assert(testHelper)
        as3.call(testHelper, "setNameAge", "Bubba Joe Bob Brain", 13)
        ]]> ).toString();
      var stack:Array = lua_wrapper.luaDoString(luaState, script);

      assertTrue(stack[0]);
      assertEquals(1, stack.length);

      assertEquals("Name: Bubba Joe Bob Brain age: 13", myHelper.nameAge);
    }

    /*
        // TODO: as3.stage() currently returns AS3 void. Fix this
        public function testAS3Stage():void
        {
          var script:String = ( <![CDATA[
            return as3.stage()
            ]]> ).toString();
          var stack:Array = lua_wrapper.luaDoString(luaState, script);

          assertTrue(stack[0] is Stage);
          assertEquals(1, stack.length);
        }
    */

    public function testAS3Type():void
    {
      // TODO: FIXME: Test all available AS3 types (including ones that wouldn't work)
      var script:String = ( <![CDATA[
        local ba = as3.new("flash.utils::ByteArray")
        local s = as3.new("String")
        return as3.type(ba), as3.type(s)
        ]]> ).toString();
      var stack:Array = lua_wrapper.luaDoString(luaState, script);
      assertTrue(stack[0]);
      assertEquals("flash.utils::ByteArray", stack[1]);
      assertEquals("String", stack[2]);
      assertEquals(3, stack.length);
    }

    public function testAS3TypeNoArgs():void
    {
      var script:String = ( <![CDATA[
        return as3.type()
        ]]> ).toString();
      var stack:Array = lua_wrapper.luaDoString(luaState, script);
      assertTrue(stack[0]);
      assertEquals(null, stack[1]);
      assertEquals(2, stack.length);
    }

    public function testAS3TypeInvalid():void
    {
      var script:String = ( <![CDATA[
        assert(as3.type(5) == nil)
        ]]> ).toString();
      var stack:Array = lua_wrapper.luaDoString(luaState, script);
      assertTrue(stack[0]);
      assertEquals(1, stack.length);
    }

    public function testAS3TypeInvalidUserdata():void
    {
      var script:String = ( <![CDATA[
        assert(as3.type(newproxy()) == nil)
        ]]> ).toString();
      var stack:Array = lua_wrapper.luaDoString(luaState, script);
      assertTrue(stack[0]);
      assertEquals(1, stack.length);
    }

    public function testAS3TypeInvalidUserdataMt():void
    {
      // Have to use debug library since common setmetatable works on tables only
      var script:String = ( <![CDATA[
        local value = newproxy()
        debug.setmetatable(value, {})
        assert(as3.type(value) == nil)
        ]]> ).toString();
      var stack:Array = lua_wrapper.luaDoString(luaState, script);
      assertTrue(stack[0]);
      assertEquals(1, stack.length);
    }

    /*
        TODO public function testAS3Assign():void
        {
        }
    */

    public function testAS3IsAS3Value():void
    {
      // TODO: FIXME: Test all available AS3 types (including ones that wouldn't work)
      var script:String = ( <![CDATA[
        local ba = as3.new("flash.utils::ByteArray")
        local s = as3.new("String")
        return as3.is_as3_value(ba), as3.is_as3_value(s)
        ]]> ).toString();
      var stack:Array = lua_wrapper.luaDoString(luaState, script);
      assertTrue(stack[0]);
      assertTrue(stack[1]);
      assertTrue(stack[2]);
      assertEquals(3, stack.length);
    }

    public function testAS3IsAS3ValueNoArgs():void
    {
      var script:String = ( <![CDATA[
        return as3.is_as3_value()
        ]]> ).toString();
      var stack:Array = lua_wrapper.luaDoString(luaState, script);
      assertTrue(stack[0]);
      assertEquals(null, stack[1]);
      assertEquals(2, stack.length);
    }

    public function testAS3IsAS3ValueInvalid():void
    {
      var script:String = ( <![CDATA[
        assert(as3.is_as3_value(5) == nil)
        ]]> ).toString();
      var stack:Array = lua_wrapper.luaDoString(luaState, script);
      assertTrue(stack[0]);
      assertEquals(1, stack.length);
    }

    public function testAS3IsAS3ValueInvalidUserdata():void
    {
      var script:String = ( <![CDATA[
        assert(as3.is_as3_value(newproxy()) == nil)
        ]]> ).toString();
      var stack:Array = lua_wrapper.luaDoString(luaState, script);
      assertTrue(stack[0]);
      assertEquals(1, stack.length);
    }

    public function testAS3IsAS3ValueInvalidUserdataMt():void
    {
      // Have to use debug library since common setmetatable works on tables only
      var script:String = ( <![CDATA[
        local value = newproxy()
        debug.setmetatable(value, {})
        assert(as3.is_as3_value(value) == nil)
        ]]> ).toString();
      var stack:Array = lua_wrapper.luaDoString(luaState, script);
      assertTrue(stack[0]);
      assertEquals(1, stack.length);
    }

    public function testAS3ToAS3Nil():void
    {
      var script:String = ( <![CDATA[
        local v = as3.toas3(nil)
        assert(as3.type(v) == "null")
        ]]> ).toString();
      var stack:Array = lua_wrapper.luaDoString(luaState, script);
      assertTrue(stack[0]);
      assertEquals(1, stack.length);
    }

    public function testAS3ToAS3BooleanTrue():void
    {
      var script:String = ( <![CDATA[
        local v = as3.toas3(true)
        assert(as3.type(v) == "Boolean")
        assert(as3.tolua(v) == true)
        ]]> ).toString();
      var stack:Array = lua_wrapper.luaDoString(luaState, script);
      assertTrue(stack[0]);
      assertEquals(1, stack.length);
    }

    public function testAS3ToAS3BooleanFalse():void
    {
      var script:String = ( <![CDATA[
        local v = as3.toas3(false)
        assert(as3.type(v) == "Boolean")
        assert(as3.tolua(v) == false)
        ]]> ).toString();
      var stack:Array = lua_wrapper.luaDoString(luaState, script);
      assertTrue(stack[0]);
      assertEquals(1, stack.length);
    }

    public function testAS3ToAS3NumberInteger():void
    {
      var script:String = ( <![CDATA[
        local v = as3.toas3(42)
        assert(as3.type(v) == "int")
        assert(as3.tolua(v) == 42)
        ]]> ).toString();
      var stack:Array = lua_wrapper.luaDoString(luaState, script);
      assertTrue(stack[0]);
      assertEquals(1, stack.length);
    }

    public function testAS3ToAS3NumberPi():void
    {
      var script:String = ( <![CDATA[
        local v = as3.toas3(math.pi)
        assert(as3.type(v) == "Number")
        assert(as3.tolua(v) == math.pi)
        ]]> ).toString();
      var stack:Array = lua_wrapper.luaDoString(luaState, script);
      assertTrue(stack[0]);
      assertEquals(1, stack.length);
    }

    public function testAS3ToAS3NumberPosInf():void
    {
      var script:String = ( <![CDATA[
        local v = as3.toas3(1/0)
        assert(as3.type(v) == "Number")
        assert(as3.tolua(v) == 1/0)
        ]]> ).toString();
      var stack:Array = lua_wrapper.luaDoString(luaState, script);
      assertTrue(stack[0]);
      assertEquals(1, stack.length);
    }

    public function testAS3ToAS3NumberNegInf():void
    {
      var script:String = ( <![CDATA[
        local v = as3.toas3(-1/0)
        assert(as3.type(v) == "Number")
        assert(as3.tolua(v) == -1/0)
        ]]> ).toString();
      var stack:Array = lua_wrapper.luaDoString(luaState, script);
      assertTrue(stack[0]);
      assertEquals(1, stack.length);
    }

    public function testAS3ToAS3NumberNaN():void
    {
      var script:String = ( <![CDATA[
        local v = as3.toas3(0/0)
        assert(as3.type(v) == "Number")
        assert(as3.tolua(v) ~= as3.tolua(v))
        ]]> ).toString();
      var stack:Array = lua_wrapper.luaDoString(luaState, script);
      assertTrue(stack[0]);
      assertEquals(1, stack.length);
    }

    public function testAS3ToAS3StringEmpty():void
    {
      var script:String = ( <![CDATA[
        local v = as3.toas3("")
        assert(as3.type(v) == "String")
        assert(as3.tolua(v) == "")
        ]]> ).toString();
      var stack:Array = lua_wrapper.luaDoString(luaState, script);
      assertTrue(stack[0]);
      assertEquals(1, stack.length);
    }

    public function testAS3ToAS3StringNonempty():void
    {
      var script:String = ( <![CDATA[
        local v = as3.toas3("Lua Alchemy")
        assert(as3.type(v) == "String")
        assert(as3.tolua(v) == "Lua Alchemy")
        ]]> ).toString();
      var stack:Array = lua_wrapper.luaDoString(luaState, script);
      assertTrue(stack[0]);
      assertEquals(1, stack.length);
    }

    public function testAS3ToAS3StringEmbeddedZero():void
    {
      var script:String = ( <![CDATA[
        local s = "Embedded\0Zero"
        assert(#s == 13)
        local v = as3.toas3(s)
        assert(as3.type(v) == "String")
        -- TODO: Wrong! String must unmodified! Replace with assertions below.
        assert(as3.tolua(v) == "Embedded")
        assert(#as3.tolua(v) == 8)
        --assert(as3.tolua(v) == s)
        --assert(#as3.tolua(v) == #s)
        ]]> ).toString();
      var stack:Array = lua_wrapper.luaDoString(luaState, script);
      assertTrue(stack[0]);
      assertEquals(1, stack.length);
    }

    public function testAS3ToAS3Table():void
    {
      var script:String = ( <![CDATA[
        local v = as3.toas3({})
        assert(v)
        -- TODO: Must be black-boxed object, not string!
        assert(as3.type(v) == "String")
        assert(as3.tolua(v) == "table")
        ]]> ).toString();
      var stack:Array = lua_wrapper.luaDoString(luaState, script);
      assertTrue(stack[0]);
      assertEquals(1, stack.length);
    }

    public function testAS3ToAS3Coroutine():void
    {
      var script:String = ( <![CDATA[
        local v = as3.toas3(coroutine.create(function() end))
        assert(v)
        -- TODO: Must be black-boxed object, not string!
        assert(as3.type(v) == "String")
        assert(as3.tolua(v) == "thread")
        ]]> ).toString();
      var stack:Array = lua_wrapper.luaDoString(luaState, script);
      assertTrue(stack[0]);
      assertEquals(1, stack.length);
    }

    public function testAS3ToAS3Function():void
    {
      var script:String = ( <![CDATA[
        local i = 3
        local f = function(p) assert(type(p) == "number") i = i + p; return 42 end
        local v = as3.toas3(f)
        assert(v)
        assert(as3.type(v):match("^Function%-%d+$"))
        -- TODO: Wrong! Value must be unboxed! (Or must it?)
        assert(as3.tolua(v) == v)
        --assert(as3.tolua(v) == f)
        assert(i == 3)
        assert(as3.call(v, "call", v, 7) == 42)
        assert(i == 10)
        ]]> ).toString();
      var stack:Array = lua_wrapper.luaDoString(luaState, script);
      assertTrue(stack[0]);
      assertEquals(1, stack.length);
    }

    public function testAS3CallbackToLua():void
    {
      var script:String = ( <![CDATA[
        local called = false
        local v = as3.toas3(
            function(a, b, c)
              called = true
              as3.trace("arguments", a, b, c)
              assert(a == 42)
              assert(b == nil)
              assert(c == "Lua Alchemy")
              return c, a, b
            end
          )

        assert(as3.type(v):match("^Function%-%d+$"))
        local r = as3.call(v, "call", v, 42, nil, "Lua Alchemy")
        assert(called, "function must be called")
        as3.trace("ZZZ2", as3.call(r, "join"), r, type(r), tostring(r), as3.type(r))
        assert(as3.type(r) == "Array")
        assert(as3.get(r, 0) == "Lua Alchemy")
        assert(as3.get(r, 1) == 42)
        assert(as3.get(r, 2) == nil)
        ]]> ).toString();
      var stack:Array = lua_wrapper.luaDoString(luaState, script);
      assertTrue(stack[0]);
      assertEquals(1, stack.length);
    }

    public function testAS3ToAS3Multiarg():void
    {
      var script:String = ( <![CDATA[
        local a, b, c = as3.tolua(as3.toas3(42, nil, "Lua Alchemy"))
        assert(a == 42)
        assert(b == nil)
        assert(c == "Lua Alchemy")
        ]]> ).toString();
      var stack:Array = lua_wrapper.luaDoString(luaState, script);
      assertTrue(stack[0]);
      assertEquals(1, stack.length);
    }

    public function testAS3ToAS3As3Values():void
    {
      var script:String = ( <![CDATA[
        local ba = as3.new("flash.utils::ByteArray")
        local s = as3.new("String")
        local n = as3.new("Number", 42)
        assert(as3.toas3(ba) == ba)
        assert(as3.toas3(s) == s)
        assert(as3.toas3(n) == n)
        return ba, s, n
        ]]> ).toString();
      var stack:Array = lua_wrapper.luaDoString(luaState, script);
      assertTrue(stack[0]);
      assertTrue(stack[1] is ByteArray);
      assertEquals("", stack[2]);
      assertEquals(42, stack[3]);
      assertEquals(4, stack.length);
    }

    public function testAS3ToAS3NoArgs():void
    {
      var script:String = ( <![CDATA[
        assert(as3.toas3() == nil)
        ]]> ).toString();
      var stack:Array = lua_wrapper.luaDoString(luaState, script);
      assertTrue(stack[0]);
      assertEquals(1, stack.length);
    }

    public function testAS3ToAS3ForeignUserdata():void
    {
      var script:String = ( <![CDATA[
        local p = newproxy()
        local v = as3.toas3(p)
        assert(v)
        -- TODO: Must be black-boxed object, not string!
        assert(as3.type(v) == "String")
        assert(as3.tolua(v) == "userdata")
        ]]> ).toString();
      var stack:Array = lua_wrapper.luaDoString(luaState, script);
      assertTrue(stack[0]);
      assertEquals(1, stack.length);
    }

    public function testAS3ToAS3ForeignUserdataMt():void
    {
      // Have to use debug library since common setmetatable works on tables only
      var script:String = ( <![CDATA[
        local p = newproxy()
        debug.setmetatable(p, {})
        local v = as3.toas3(p)
        -- TODO: Must be black-boxed object, not string!
        assert(as3.type(v) == "String")
        assert(as3.tolua(v) == "userdata")
        ]]> ).toString();
      var stack:Array = lua_wrapper.luaDoString(luaState, script);
      assertTrue(stack[0]);
      assertEquals(1, stack.length);
    }
  }
}