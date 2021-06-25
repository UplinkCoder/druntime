module core.reflect.dscope;
import core.reflect.node;
import core.reflect.reflect : Visitor;

class Scope : Node
{
    private void* internalPointer; /// compiler internal pointer.
                                   /// Do not use in user code!

    override void accept(Visitor v) { return v.visit(this); }
}

immutable(Scope) currentScope();
