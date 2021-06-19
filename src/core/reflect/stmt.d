module core.reflect.stmt;
import core.reflect.node;

class Statement : Node {}
class BlockStatement : Statement 
{
    Statement[] statements;
}
