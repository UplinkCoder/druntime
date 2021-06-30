module core.reflect.reflect;

public import core.reflect.node;
public import core.reflect.decl;
public import core.reflect.expr;
public import core.reflect.sym;
public import core.reflect.type;
public import core.reflect.stmt;
public import core.reflect.func;
public import core.reflect.dscope;

abstract class Visitor
{
   void visit(Node N);
   void visit(Declaration D);
   void visit(VariableDeclaration V);
   void visit(FunctionDeclaration F);
   void visit(EnumDeclaration E);
   void visit(StructDeclaration S);
   void visit(ClassDeclaration C);
   void visit(AggregateDeclaration A);
   void visit(EnumMember E);
   void visit(Expression E);
   void visit(VariableExpression V);
   void visit(ParenthesisExpression P);
   void visit(BinaryExpression B);
   void visit(Literal L);
   void visit(FunctionLiteral F);
   void visit(IntegerLiteral I);
   void visit(StringLiteral S);
   void visit(StructLiteral S);
   void visit(Symbol S);
   void visit(ScopeDsymbol S);
   void visit(Type T);
   void visit(TypeBasic T);
   void visit(TypeNext T);
   void visit(TypePointer T);
   void visit(TypeRef T);
   void visit(TypeSlice T);
   void visit(TypeEnum T);
   void visit(TypeArray T);
   void visit(TypeAArray T);
   void visit(FunctionType F);
   void visit(TypeClass T);
   void visit(TypeStruct T);
   void visit(Statement S);
   void visit(BlockStatement B);
   void visit(ReturnStatement R);
   void visit(FunctionParameter F);
   void visit(Function F);
   void visit(Scope S);
}

version (DruntimeLibraryBuild)
{
private class NodeToStringVisitor : Visitor
{
   __gshared string[void*] cache;

   string result;

   uint indent_level;

   this(uint indent_level)
   {
       this.indent_level = indent_level;
   }

   static void clearCache()
   {
       cache.clear();
   }

   override void visit(Node N)
   {
       result = StructToString(N, indent_level);
   }
   override void visit(Declaration D)
   {
       result = StructToString(D, indent_level);
   }
   override void visit(VariableDeclaration V)
   {
       result = StructToString(V, indent_level);
   }
   override void visit(FunctionDeclaration F)
   {
       result = StructToString(F, indent_level);
   }
   override void visit(EnumDeclaration E)
   {
       result = StructToString(E, indent_level);
   }
   override void visit(StructDeclaration S)
   {
       result = StructToString(S, indent_level);
   }
   override void visit(ClassDeclaration C)
   {
       result = StructToString(C, indent_level);
   }
   override void visit(AggregateDeclaration A)
   {
       result = StructToString(A, indent_level);
   }
   override void visit(EnumMember E)
   {
       result = StructToString(E, indent_level);
   }
   override void visit(Expression E)
   {
       result = StructToString(E, indent_level);
   }
   override void visit(VariableExpression V)
   {
       result = StructToString(V, indent_level);
   }
   override void visit(ParenthesisExpression P)
   {
       result = StructToString(P, indent_level);
   }
   override void visit(BinaryExpression B)
   {
       result = StructToString(B, indent_level);
   }
   override void visit(Literal L)
   {
       result = StructToString(L, indent_level);
   }
   override void visit(FunctionLiteral F)
   {
       result = StructToString(F, indent_level);
   }
   override void visit(IntegerLiteral I)
   {
       result = StructToString(I, indent_level);
   }
   override void visit(StringLiteral S)
   {
       result = StructToString(S, indent_level);
   }
   override void visit(StructLiteral S)
   {
       result = StructToString(S, indent_level);
   }
   override void visit(Symbol S)
   {
       result = StructToString(S, indent_level);
   }
   override void visit(ScopeDsymbol S)
   {
       result = StructToString(S, indent_level);
   }
   override void visit(Type T)
   {
       result = StructToString(T, indent_level);
   }
   override void visit(TypeBasic T)
   {
       result = StructToString(T, indent_level);
   }
   override void visit(TypeNext T)
   {
       result = StructToString(T, indent_level);
   }
   override void visit(TypePointer T)
   {
       result = StructToString(T, indent_level);
   }
   override void visit(TypeRef T)
   {
       result = StructToString(T, indent_level);
   }
   override void visit(TypeSlice T)
   {
       result = StructToString(T, indent_level);
   }
   override void visit(TypeEnum T)
   {
       result = StructToString(T, indent_level);
   }
   override void visit(TypeArray T)
   {
       result = StructToString(T, indent_level);
   }
   override void visit(TypeAArray T)
   {
       result = StructToString(T, indent_level);
   }
   override void visit(FunctionType F)
   {
       result = StructToString(F, indent_level);
   }
   override void visit(TypeClass T)
   {
       result = StructToString(T, indent_level);
   }
   override void visit(TypeStruct T)
   {
       result = StructToString(T, indent_level);
   }
   override void visit(Statement S)
   {
       result = StructToString(S, indent_level);
   }
   override void visit(BlockStatement B)
   {
       result = StructToString(B, indent_level);
   }
   override void visit(ReturnStatement B)
   {
       result = StructToString(B, indent_level);
   }
   override void visit(FunctionParameter F)
   {
       result = StructToString(F, indent_level);
   }
   override void visit(Function F)
   {
       result = StructToString(F, indent_level);
   }
   override void visit(Scope S)
   {
       result = StructToString(S, indent_level);
   }
}

string enumToString(E)(E v)
{
    static assert(is(E == enum),
        "emumToString is only meant for enums");
    final switch (v)
    {
        foreach(m; __traits(allMembers, E))
        {
            mixin("case E." ~ m ~ ": return \"" ~ m ~ "\";");
        }
   }
}

private string elemToString(E)(E e, uint indent_level = 1)
{
    string result;

    static if ( is(typeof(e) == struct) || is(typeof(e) == class) )
    {
        static if (is(typeof(e) : Node))
        {
            result ~= nodeToString(e, indent_level + 1)[0 .. $-1] ~ ",\n";
        }
        else
        {
            result ~= StructToString(e, indent_level + 1)[0 .. $-1] ~ ",\n";
        }
    }
    else static if (is(typeof(e) == enum))
    {
        result ~= enumToString(e) ~ ",\n";
    }
    else static if (is(typeof(e) == bool))
    {
        result ~= (e ? "true" : "false") ~ ",\n";
    }
    else static if (is(typeof(e) : uint))
    {
        import core.internal.string;
        static if (__traits(isUnsigned, typeof(e)))
        {
            result ~= unsignedToTempString(e) ~ ",\n";
        }
        else
        {
            result ~= signedToTempString(e) ~ ",\n";
        }
    }
    else static if (is(typeof(e) == ulong))
    {
        import core.internal.string;
        result ~= unsignedToTempString(cast(uint)e) ~ ",\n";
    }
    else static if (is(typeof(e) == void*))
    {
        import core.internal.string;
        result ~= unsignedToTempString(cast(uint)e) ~ ",\n";
    }
    else
    {
        pragma(msg, typeof(e), " is not handled ");
    }
    assert(result);

    return result;
}

private string StructToString(S)(S _struct, uint indent_level = 1, bool forParentClass = false)
{
  char[] indent_m;
  indent_m.length = indent_level * 4;
  indent_m[] = ' ';

  string indent = cast(string) indent_m;

  string result = forParentClass ? "" : S.stringof ~ " = {\n";

  static if (is(S P == super) && P.length)
  {
      alias Base = P[0];
      result ~= StructToString(cast(Base)_struct, indent_level, true);
  }

  foreach(i, e;_struct.tupleof)
  {
    auto name = __traits(identifier, _struct.tupleof[i]);
    result ~= indent ~ name ~ ": ";
    enum is_node = is(typeof(e) : Node);
    if (!is_node || e)
    {
        static if (is(typeof(e) : const(char)[]))
        {
           result ~= "\"" ~ e ~ "\"" ~ ",\n";
        }
        else static if (is(typeof(e) : E[], E))
        {
            if (!e.length)
            {
              result ~= "[]\n";
            }
            else
            {
                result ~= "[\n";
                indent ~= "    ";
                foreach(elem;e)
                {
                    result ~= indent ~ elem.elemToString(indent_level + 1);
                }
                indent = indent[0 .. $ - 4];
                result ~= indent ~ "]\n";
            }
        }
        else
        {
            result ~= elemToString(e, indent_level);
        }
    }
    else
    {
        result ~= "null,\n";
    }
  }
  result ~= forParentClass ? "" : indent[4 .. $] ~ "}\n";
  return result;
}

extern (D) void clearCache()
{
    NodeToStringVisitor.clearCache();
}

extern (D) string nodeToString(const Node N, uint indent_level = 1)
{
    if (auto result = (cast(void*) N) in NodeToStringVisitor.cache)
    {
       if (auto type = cast(Type)N)
       {
          return "TypeRef to '" ~ type.identifier ~ "'\n";
       }
       if (auto decl = cast(Declaration)N)
       {
          return "DeclarationRef to '" ~ decl.name ~ "'\n";
       }

       bool isDummy = *result is null;
       if (isDummy)
       {
           // we are hitting a dummy value ... damn those cycles!
           return "dummy\n";
       }
    }

    scope v = new NodeToStringVisitor(indent_level);
    // before we accept we put a dummy into the cache;
    NodeToStringVisitor.cache[cast(void*)N] = null;
    (cast()N).accept(v);
    auto result = v.result;

    NodeToStringVisitor.cache[cast(void*)N] = result;
    return result;
}
}
else
{
extern (D) string nodeToString(const Node N, uint indent_level = 1);
extern (D) void clearCache();
}
