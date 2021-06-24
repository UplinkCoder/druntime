module core.reflect.type;
import core.reflect.node;
import core.reflect.func;
import core.reflect.sym;
import core.reflect.decl;

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
    Type nextOf;
}

class TypePointer : TypeNext
{}

class TypeRef : TypeNext
{}

class TypeSlice : TypeNext
{}

class TypeEnum : TypeNext
{
    EnumDeclaration sym;
}

class TypeArray : TypeNext
{
    int dim;
}

class TypeAArray : TypeNext
{
    Type indexType;
}

class FunctionType : Type
{
    Type returnType;
    FunctionParameter[] parameterTypes;
}

class TypeAggregate : Type
{
    Symbol[] members;
    bool hasPointers;
}

class TypeClass : TypeAggregate
{
    ClassDeclaration sym;
    ulong instanceSize;
    bool isScopeClass;
}

class TypeStruct : TypeAggregate
{
    StructDeclaration sym;
}
