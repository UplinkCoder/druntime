module core.reflect.stmt;
import core.reflect.node;
import core.reflect.expr;

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

class ReturnStatement : Statement
{
    override void accept(Visitor v) { return v.visit(this); }

    Expression exp; /// may be null in case of return ;
}
