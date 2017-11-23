package overlay.cards.specifications;

import overlay.util.Specification;
import overlay.cards.specifications.Scale;
import overlay.cards.specifications.Text;

class Pendulum extends Specification<Pendulum>
{
	public var scale(default, null):Scale;
	public var text(default, null):Text;

	public function new(scale:UInt, ?text:Null<String>)
	{
		super(this);
		this.scale = new Scale(scale);
		this.text = new Text(text);
	}
}
