module core.reflect.expr;
import core.reflect.node;
import core.reflect.type;
import core.reflect.decl;

import core.reflect.reflect : Visitor;

abstract class Expression : Node
{
    override void accept(Visitor v) { return v.visit(this); }

    Type type; /// may be null if not fully resolved
}

class CallExpression : Expression
{
    override void accept(Visitor v) { return v.visit(this); }

    Declaration callee;
    Expression[] arguments;
}

class VariableExpression : Expression
{
    override void accept(Visitor v) { return v.visit(this); }

    Declaration var;
}

class NullExpression : Expression
{
    override void accept(Visitor v) { return v.visit(this); }

}

///
enum BinaryOp
{
    Add = "+",
    Sub = "-",
    Mul = "*",
    Div = "/",
    Mod = "%",
    Shl = "<<",
    Shr = ">>",

    BinaryAnd = "&",
    LogicalAnd = "&&",

    BinaryOr = "|",
    LogicalOr = "||",

    BinaryXOr = "^",

    Pow = "^^",
    Cat = "~",

    In = "in",

    Eq = "==",
    Neq = "!=",

    Is = "is",
    Nis = "!is",
}

class ParenthesisExpression : Expression
{
    override void accept(Visitor v) { return v.visit(this); }

    Expression exp;
}

class BinaryExpression : Expression
{
    override void accept(Visitor v) { return v.visit(this); }

    BinaryOp op;

    Expression left;
    Expression right;
}

abstract class Literal : Expression
{
    override void accept(Visitor v) { return v.visit(this); }
}

class IntegerLiteral : Literal
{
    override void accept(Visitor v) { return v.visit(this); }

    ulong value; // should be ucent .... but ah well
}

class FunctionLiteral : Literal
{
    override void accept(Visitor v) { return v.visit(this); }

    typeof(FunctionDeclaration.parameters) parameters;
    typeof(FunctionDeclaration.fbody) fbody;
}

class StringLiteral : Literal
{
    override void accept(Visitor v) { return v.visit(this); }
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
   override void accept(Visitor v) { return v.visit(this); }

   Expression[] elements;
}
