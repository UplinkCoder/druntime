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
   void visit(CallExpression C);
   void visit(NullExpression N);
   void visit(VariableExpression V);
   void visit(ParenthesisExpression P);
   void visit(BinaryExpression B);
   void visit(Literal L);
   void visit(FunctionLiteral F);
   void visit(IntegerLiteral I);
   void visit(StringLiteral S);
   void visit(StructLiteral S);
   void visit(Symbol S);
   void visit(Import I);
   void visit(ScopeSymbol S);
   void visit(Package P);
   void visit(Module M);
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
   void visit(ImportStatement I);
   void visit(FunctionParameter F);
   void visit(Function F);
   void visit(Scope S);
}

private class NodeToStringVisitor : Visitor
{

   string result;

   string[void*] cache;
   uint indent_level;

   this(string[void*] cache, uint indent_level)
   {
       this.cache = cache;
       this.indent_level = indent_level;
   }

   override void visit(Node N)
   {
       result = StructToString(N, cache, indent_level);
   }
   override void visit(Declaration D)
   {
       result = StructToString(D, cache, indent_level);
   }
   override void visit(VariableDeclaration V)
   {
       result = StructToString(V, cache, indent_level);
   }
   override void visit(FunctionDeclaration F)
   {
       result = StructToString(F, cache, indent_level);
   }
   override void visit(EnumDeclaration E)
   {
       result = StructToString(E, cache, indent_level);
   }
   override void visit(StructDeclaration S)
   {
       result = StructToString(S, cache, indent_level);
   }
   override void visit(ClassDeclaration C)
   {
       result = StructToString(C, cache, indent_level);
   }
   override void visit(AggregateDeclaration A)
   {
       result = StructToString(A, cache, indent_level);
   }
   override void visit(EnumMember E)
   {
       result = StructToString(E, cache, indent_level);
   }
   override void visit(Expression E)
   {
       result = StructToString(E, cache, indent_level);
   }
   override void visit(CallExpression C)
   {
       result = StructToString(C, cache, indent_level);
   }
   override void visit(NullExpression N)
   {
       result = StructToString(N, cache, indent_level);
   }
   override void visit(VariableExpression V)
   {
       result = StructToString(V, cache, indent_level);
   }
   override void visit(ParenthesisExpression P)
   {
       result = StructToString(P, cache, indent_level);
   }
   override void visit(BinaryExpression B)
   {
       result = StructToString(B, cache, indent_level);
   }
   override void visit(Literal L)
   {
       result = StructToString(L, cache, indent_level);
   }
   override void visit(FunctionLiteral F)
   {
       result = StructToString(F, cache, indent_level);
   }
   override void visit(IntegerLiteral I)
   {
       result = StructToString(I, cache, indent_level);
   }
   override void visit(StringLiteral S)
   {
       result = StructToString(S, cache, indent_level);
   }
   override void visit(StructLiteral S)
   {
       result = StructToString(S, cache, indent_level);
   }
   override void visit(Symbol S)
   {
       result = StructToString(S, cache, indent_level);
   }
   override void visit(Import I)
   {
       result = StructToString(I, cache, indent_level);
   }
   override void visit(ScopeSymbol S)
   {
       result = StructToString(S, cache, indent_level);
   }
   override void visit(Package P)
   {
       result = StructToString(P, cache, indent_level);
   }
   override void visit(Module M)
   {
       result = StructToString(M, cache, indent_level);
   }
   override void visit(Type T)
   {
       result = StructToString(T, cache, indent_level);
   }
   override void visit(TypeBasic T)
   {
       result = StructToString(T, cache, indent_level);
   }
   override void visit(TypeNext T)
   {
       result = StructToString(T, cache, indent_level);
   }
   override void visit(TypePointer T)
   {
       result = StructToString(T, cache, indent_level);
   }
   override void visit(TypeRef T)
   {
       result = StructToString(T, cache, indent_level);
   }
   override void visit(TypeSlice T)
   {
       result = StructToString(T, cache, indent_level);
   }
   override void visit(TypeEnum T)
   {
       result = StructToString(T, cache, indent_level);
   }
   override void visit(TypeArray T)
   {
       result = StructToString(T, cache, indent_level);
   }
   override void visit(TypeAArray T)
   {
       result = StructToString(T, cache, indent_level);
   }
   override void visit(FunctionType F)
   {
       result = StructToString(F, cache, indent_level);
   }
   override void visit(TypeClass T)
   {
       result = StructToString(T, cache, indent_level);
   }
   override void visit(TypeStruct T)
   {
       result = StructToString(T, cache, indent_level);
   }
   override void visit(Statement S)
   {
       result = StructToString(S, cache, indent_level);
   }
   override void visit(BlockStatement B)
   {
       result = StructToString(B, cache, indent_level);
   }
   override void visit(ReturnStatement R)
   {
       result = StructToString(R, cache, indent_level);
   }
   override void visit(ImportStatement I)
   {
       result = StructToString(I, cache, indent_level);
   }
   override void visit(FunctionParameter F)
   {
       result = StructToString(F, cache, indent_level);
   }
   override void visit(Function F)
   {
       result = StructToString(F, cache, indent_level);
   }
   override void visit(Scope S)
   {
       result = StructToString(S, cache, indent_level);
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

private string elemToString(E)(E e, string[void*] cache, uint indent_level = 1)
{
    string result;

    static if ( is(typeof(e) == struct) || is(typeof(e) == class) )
    {
        static if (is(typeof(e) : Node))
        {
            result ~= nodeToString(e, cache, indent_level + 1)[0 .. $-1] ~ ",\n";
        }
        else
        {
            result ~= StructToString(e, cache, indent_level + 1)[0 .. $-1] ~ ",\n";
        }
    }
    else static if (is(typeof(e) : const(char)[]))
    {
       result ~= "\"" ~ e ~ "\"" ~ ",\n";
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
        result = "unhandled,\n";
    }

    return result;
}

private string StructToString(S)(S _struct, string[void*] cache, uint indent_level = 1, bool forParentClass = false)
{
  char[] indent_m;
  indent_m.length = indent_level * 4;
  indent_m[] = ' ';

  string indent = cast(string) indent_m;

  string result = forParentClass ? "" : S.stringof ~ " = {\n";

  static if (is(S P == super) && P.length)
  {
      alias Base = P[0];
      result ~= StructToString(cast(Base)_struct, cache, indent_level, true);
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
                    result ~= indent ~ elem.elemToString(cache, indent_level + 1);
                }
                indent = indent[0 .. $ - 4];
                result ~= indent ~ "]\n";
            }
        }
        else
        {
            result ~= elemToString(e, cache, indent_level);
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

extern (D) string nodeToString(const Node N,  string[void*] cache, uint indent_level = 1)
{
    if (auto result = N.internalPointer in cache)
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

    scope v = new NodeToStringVisitor(cache, indent_level);
    // before we accept we put a dummy into the cache;
    cache[N.internalPointer] = null;
    (cast()N).accept(v);
    auto result = v.result;

    cache[N.internalPointer] = result;
    return result;
}
