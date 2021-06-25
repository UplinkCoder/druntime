module core.reflect.stmt;
import core.reflect.node;
import core.reflect.reflect : Visitor;

class Statement : Node
{
    override void accept(Visitor v) { return v.visit(this); }
}
class BlockStatement : Statement 
{
    override void accept(Visitor v) { return v.visit(this); }

    Statement[] statements;
}
