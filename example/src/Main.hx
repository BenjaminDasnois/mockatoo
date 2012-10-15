import example.List;
import mockatoo.Mockatoo;
import mockatoo.Mock;

typedef StringList = SimpleList<String>;
typedef StringListInterface = List<String>;
typedef StringListWithConstructorArg = SimpleListWithConstructorArg<String>;

class Main
{
	public static function main()
	{
		var list= new SimpleList<String>();
		list.add("first");
		trace(list.get(0));
		list.clear();


		mockFromClassWithConstructorArg();
		// mockFromClass();
		// mockFromInterface();
	}

	static function mockFromClassWithConstructorArg()
	{
		var args:Array<String> = ["one", "two", "three"];
		var mockList = Mockatoo.mock(StringListWithConstructorArg, args);

		trace(mockList);
		trace(Type.getClassName(Type.getClass(mockList)));

		mockList.add("first");
		trace(mockList.get(0));
		mockList.clear();

		trace(Std.is(mockList, Mock));
		trace(Std.is(mockList, List));
		trace(Std.is(mockList, StringListWithConstructorArg));
	}

	static function mockFromClass()
	{
		var mockList = Mockatoo.mock(StringList);

		trace(mockList);
		trace(Type.getClassName(Type.getClass(mockList)));

		mockList.add("first");
		trace(mockList.get(0));
		mockList.clear();

		trace(Std.is(mockList, Mock));
		trace(Std.is(mockList, List));
		trace(Std.is(mockList, StringList));
	}

	static function mockFromInterface()
	{
		var mockList = Mockatoo.mock(StringListInterface);

		trace(mockList);

		trace(Type.getClassName(Type.getClass(mockList)));

		mockList.add("first");
		trace(mockList.get(0));
		mockList.clear();

		trace(Std.is(mockList, Mock));
		trace(Std.is(mockList, List));
		trace(Std.is(mockList, StringListInterface));
	}
}
