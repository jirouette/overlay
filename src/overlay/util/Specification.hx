package overlay.util;

class Specification<T>
{
	@:isVar public var parent(get, set):Null<Specification<T>>;
	public var treatedAs(default, set):Null<Specification<T>>;
	public var value(get, null):Null<T>;
	public var values:Array<Null<T>>;
	public var printed_value(get, null):Null<T>;

	public function new(value:T, ?printed_value:Null<T>)
	{
		this.value = value;
		this.values = [value];

		this.printed_value = if (printed_value != null) printed_value else value;
	}

	public function get_value():Null<T>
	{
		if (treatedAs != null)
			return treatedAs.get_value();
		return this.value;
	}

	public function get_parent():Null<Specification<T>>
	{
		if (parent != null)
			return parent;
		return this;
	}

	public function set_parent(parent:Null<Specification<T>>):Null<Specification<T>>
	{
		this.parent = parent;
		return get_parent();
	}

	public function set_treatedAs(treatedAs:Null<Specification<T>>):Null<Specification<T>>
	{
		if (treatedAs == null)
			this.treatedAs = null;
		else if (this.treatedAs != null)
		{
			this.treatedAs.treatedAs = treatedAs;
			return this.treatedAs.treatedAs;
		}
		else if (treatedAs != null)
		{
			this.treatedAs = treatedAs;
			this.treatedAs.parent = this;
		}
		return treatedAs;
	}

	public function get_printed_value():Null<T>
	{
		if (parent != null)
			return parent.printed_value;
		return printed_value;
	}

	public function cancelTreatedAs(full:Bool = false)
	{
		if (treatedAs != null && !full && treatedAs.treatedAs != null)
			treatedAs.cancelTreatedAs(full);
		else
			this.treatedAs = null;
	}

	public function getOriginalValue():Null<T>
	{
		if (parent != null)
			return parent.getOriginalValue();
		return value;
	}
}
