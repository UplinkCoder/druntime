module core.reflect.expr;
import core.reflect.node;
import core.reflect.type;

class Expression : Node
{
    Type type; /// may be null if not fully resolved
}

class IntegerExpression : Expression
{
    ulong value; // should be ucent .... but ah well
}

class StringExpression : Expression
{
    ubyte codeUnitSize; /// 1, 2, or 4

    union
    {
        string string_;
        wstring wstring_;
        dstring dstring_;
    }
    string toUTF8()
    {
        
    }
}

class 
