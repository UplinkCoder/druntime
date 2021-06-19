module core.reflect.node;
import core.reflect.dscope;
class Node {}
immutable (Node) nodeFromName(string name, immutable Scope lookupScope = currentScope());
