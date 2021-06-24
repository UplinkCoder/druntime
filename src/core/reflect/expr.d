module core.reflect.expr;
import core.reflect.node;
import core.reflect.type;

class Expression : Node
{
    Type type; /// may be null if not fully resolved
}

class Literal : Expression {}

class IntegerLiteral : Literal
{
    ulong value; // should be ucent .... but ah well
}

class StringLiteral : Literal
{
pure nothrow:

    string string_;
/+
    ubyte codeUnitSize()  /// 1, 2, or 4
    {
        assert(type.kind == TypeKind.Slice || type.kind == TypeKind.Array);
        auto elementType = (cast(TypeNext) type).nextOf;
        switch(elementType.kind)
        {
            case TypeKind.Char : return 1;
            case TypeKind.Wchar : return 2;
            case TypeKind.Dchar : return 4;
            default: assert(0); // can't ever happen
        }
    }

    string toUTF8()
    {
        final switch(codeUnitSize())
        {
            case 1 : return string_;
            case 2 : return cast(string) wstring_;
            case 4 : return cast(string) dstring_;
        }
        assert(0);
    }
+/
}

class StructLiteral : Literal
{
   Expression[] elements;
}
