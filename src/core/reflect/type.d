module core.reflect.type;
import core.reflect.node;
import core.reflect.func;
import core.reflect.sym;
import core.reflect.decl;
import core.reflect.reflect : Visitor;

enum TypeKind
{
    Invalid,

    Enum,

    Struct,
    Union,
    Class,
    Interface,
   
    AA,
    Array,
    Slice,
    Pointer,
    Ref,
    Function,

    Tuple,

    Null,

    NoReturn,
    Void,

    Char,
    Ubyte,
    Byte,

    Wchar,
    Ushort,
    Short,

    Dchar,
    Uint,
    Int,

    Ulong,
    Long,

    Ucent,
    Cent,

    Float,
    Double,
    Real,
}

class Type : Node
{
    override void accept(Visitor v) { return v.visit(this); }

    string kind;
    uint alignSize;
    ulong size;
    string identifier = null; /// optional Types may be anonymous
/+
pure nothrow:
    final bool isIntegral()
    {
        return kind >= TypeKind.Char && kind <= TypeKind.Long;
    }

    final bool isChar()
    {
        return kind == TypeKind.Char || kind == TypeKind.Wchar || kind == TypeKind.Dchar;
    }

    final bool isFloating()
    {
        return kind >= TypeKind.Float && kind <= TypeKind.Real;
    }

    final bool isUnsigned()
    {
        return isChar() 
            || kind == TypeKind.Ubyte
            || kind == TypeKind.Uint
            || kind == TypeKind.Ulong
            || kind == TypeKind.Ucent; 
    }

    final bool isSigned()
    {
        return isIntegral() && !isUnsigned();
    }

    final bool isBasic()
    {
        return kind >= TypeKind.Null && kind <= TypeKind.Real;
    }
+/
}


class TypeNext : Type
{
    override void accept(Visitor v) { return v.visit(this); }

    Type nextOf;
}

class TypePointer : TypeNext
{
    override void accept(Visitor v) { return v.visit(this); }
}

class TypeRef : TypeNext
{
    override void accept(Visitor v) { return v.visit(this); }
}

class TypeSlice : TypeNext
{
    override void accept(Visitor v) { return v.visit(this); }
}

class TypeArray : TypeNext
{
    override void accept(Visitor v) { return v.visit(this); }

    uint dim;
}

class TypeAArray : TypeNext
{
    override void accept(Visitor v) { return v.visit(this); }

    Type indexType;
}

class TypeEnum : Type
{
    override void accept(Visitor v) { return v.visit(this); }

    EnumDeclaration sym;
}

class FunctionType : Type
{
    override void accept(Visitor v) { return v.visit(this); }

    Type returnType;
    FunctionParameter[] parameterTypes;
}

class TypeAggregate : Type
{
    override void accept(Visitor v) { return v.visit(this); }

    Symbol[] members;
    bool hasPointers;
}

class TypeClass : TypeAggregate
{
    override void accept(Visitor v) { return v.visit(this); }

    ClassDeclaration sym;
    ulong instanceSize;
    bool isScopeClass;
}

class TypeStruct : TypeAggregate
{
    override void accept(Visitor v) { return v.visit(this); }

    StructDeclaration sym;
}
