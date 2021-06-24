module core.reflect.sym;
import core.reflect.node;

class Symbol : Node 
{
//    string mangle;// not currently implemented
}

class ScopeDsymbol : Symbol
{
    Symbol[] members;
}
