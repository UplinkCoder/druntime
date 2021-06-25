module core.reflect.func;
import core.reflect.node;
import core.reflect.type;
import core.reflect.decl;
import core.reflect.stmt;
import core.reflect.sym;
import core.reflect.reflect : Visitor;

class FunctionParameter : Node
{
    override void accept(Visitor v) { return v.visit(this); }

    Type type;
    string identifier;
}

class Function : Symbol
{
    override void accept(Visitor v) { return v.visit(this); }

    FunctionDeclaration decl;
}
