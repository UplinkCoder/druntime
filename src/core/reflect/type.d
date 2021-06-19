module core.reflect.type;
import core.reflect.node;
import core.reflect.func;
import core.reflect.sym;
/+
enum TypeKind
{
   Invalid,

   TypeBasic,
   TypeClass,
   TypeStruct,
   TypeUnion,

   TypeAA,
   TypeArray,
   TypeSlice,
   TypePointer,
   TypeRef,
   TypeFunction,

   TypeNoReturn,
   TypeTuple,

   Null,
}
+/
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

class TypeArray : TypeNext
{
    int dim;
}

class Type : Node
{
    string kind;
    uint alignSize;
    ulong size;
    string identifier = null; /// optional Types may be anonymous
}

class TypeAggregate : Type
{
    Symbol[] members;
    bool hasPointers;
}

class TypeClass : TypeAggregate
{
    ulong instanceSize;
    bool isScopeClass;
}

class FunctionType : Type
{
    Type returnType;
    Type[] parameterTypes;
}

