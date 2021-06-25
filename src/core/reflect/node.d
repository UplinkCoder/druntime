module core.reflect.node;
import core.reflect.dscope;
import core.reflect.reflect : Visitor;

class Node
{
    abstract void accept(Visitor v);
}

immutable (Node) nodeFromName(string name, immutable Scope lookupScope = currentScope());
