module core.reflect.func;
import core.reflect.node;
import core.reflect.type;
import core.reflect.decl;
import core.reflect.stmt;
import core.reflect.sym;

class FunctionParameter : Node
{
    Type type;
    string identifier;

}

class Function : Symbol
{
    FunctionDeclaration decl;
    
}
