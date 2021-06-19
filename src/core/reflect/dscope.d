module core.reflect.dscope;
import core.reflect.node;

class Scope : Node
{
    private void* internalPointer; /// compiler internal pointer.
                                   /// Do not use in user code!
}

immutable(Scope) currentScope();
