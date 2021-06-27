module core.reflect.sym;
import core.reflect.expr;
import core.reflect.node;
import core.reflect.reflect : Visitor;

class Symbol : Node 
{
    override void accept(Visitor v) { return v.visit(this); }
//    string mangle;// not currently implemented
}

class ScopeDsymbol : Symbol
{
    override void accept(Visitor v) { return v.visit(this); }

    Symbol[] members;
}
