module core.reflect.dscope;
import core.reflect.node;
import core.reflect.reflect : Visitor;

class Scope : Node
{
    override void accept(Visitor v) { return v.visit(this); }
}

immutable(Scope) currentScope();
