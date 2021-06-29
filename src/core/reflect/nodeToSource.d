module nodeToSource;

import core.reflect.reflect;

private class NodeToSourceVisitor : Visitor
{
    __gshared string[void*] cache;
   
    string result;
   
    uint indent_level;
    string indent;
   
    this(uint indent_level)
    {
        if (indent_level)
        {
            char[] m_indent = new char[](indent_level * 4);
            m_indent[] = ' ';
            indent = cast(string) m_indent;
        }
        this.indent_level = indent_level;
    }

    private void increaseIndent()
    {
        indent ~= "    ";
    }

    private void decreaseIndent()
    {
        indent = indent[0 .. $-4];
    }
   
    static void clearCache()
    {
        cache.clear();
    }
   
    override void visit(Node N)
    {
        assert(0, "abstract Node has no source representation");
    }

    override void visit(Declaration D)
    {
        assert(0, "abstract Declaration has no source representation");
    }

    override void visit(VariableDeclaration V)
    {
        result ~= nodeToSource(V.type, indent_level) ~ " " ~ V.name;
        if (V._init)
        {
            result ~= " = " ~ nodeToSource(V._init, indent_level) ~ ";\n";
        }
    }

    private void putParameters(typeof(FunctionDeclaration.parameters) parameters)
    {
        result ~= "(";
        if (parameters.length)
        {
            foreach(p;parameters)
            {
                result ~= nodeToSource(p, indent_level) ~ ", ";
            }
            result = result[0 .. $-2];
        }
        result ~= ")";
    }

    private void putBody(typeof(FunctionDeclaration.fbody) fbody)
    {
        if (cast(BlockStatement)fbody)
        {
            fbody.accept(this);
        }
        else
        {
            result ~= "{\n";
            increaseIndent();
            {
                fbody.accept(this);
            }
            decreaseIndent();
            result ~= indent ~ "}\n";
        }
    }

    override void visit(FunctionDeclaration F)
    {
        result ~= indent ~ nodeToSource(F.type.returnType, indent_level) ~ " "
            ~ F.name ~ " ";
        putParameters(F.parameters);
        if (F.fbody)
        {
            putBody(F.fbody);
        }
        else
        {
            result ~= ";";
        }
    }

    override void visit(EnumDeclaration E)
    {
        result = indent ~ "enum " ~ nodeToSource(E.type, indent_level);
        {
            result ~= " {\n";
            increaseIndent();
            {
                foreach(m;E.members)
                {
                    result ~= indent ~ m.name ~ " = " ~ nodeToSource(m.value, indent_level) ~",\n";
                }
            }
            decreaseIndent();
            result ~= indent ~ "}\n";
        }
    }

    private void putFields(AggregateDeclaration A)
    {
        increaseIndent();
        {
            foreach(f;A.fields)
            {
                result ~= indent ~ nodeToSource(f, indent_level) ~ ",\n";
            }
        }       
        decreaseIndent();
    }

    override void visit(StructDeclaration S)
    {
        result = indent ~ "struct " ~ nodeToSource(S.type, indent_level);
        {
            result ~= " {\n";
            putFields(S);
            //TODO needs methods and aliases too.
            result ~= indent ~ "}\n";
        }
    }

    override void visit(ClassDeclaration C)
    {
        const string scope_ = (C.onStack ? "scope " : "");
        result = indent ~ scope_ ~ "class " ~ nodeToSource(C.type, indent_level);
        {
            result ~= " {\n";
            putFields(C);
            //TODO needs methods and aliases too.
            result ~= indent ~ "}\n";
        }
    }

    override void visit(AggregateDeclaration A)
    {
        assert(0, "abstract AggregateDeclaration has no source representation");
    }

    override void visit(EnumMember E)
    {
        assert(0, "I don't think we ever need to recurse into EnumMember");
    }

    override void visit(Expression E)
    {
        assert(0, "abstract Expression has no source representation");
    }

    override void visit(VariableExpression V)
    {
        result ~= V.var.name;
    }

    override void visit(Literal L)
    {
        assert(0, "abstract Literal has no source representation");
    }

    override void visit(FunctionLiteral F)
    {
        putParameters(F.parameters);
        result ~= " ";
        putBody(F.fbody);
        if (result[$-1] == '\n')
            result = result[0 .. $-1];
    }

    override void visit(IntegerLiteral I)
    {
        import core.internal.string;
/+ TODO FIXME uncomment this as soon as isUnsigned is implemented
        if (isUnsigned(I.type))
        {
            result ~= unsignedToTempString(I.value);
        }
        else
+/
        {
            result ~= signedToTempString(cast(long)I.value);
        }
    }

    override void visit(StringLiteral S)
    {
        result ~= "\"" ~ S.string_ ~ "\"";
    }

    override void visit(StructLiteral S)
    {
        assert(0, "TODO struct literal");
    }

    override void visit(Symbol S)
    {
        assert(0, "abstract Symbol has no source representation");
    }

    override void visit(ScopeDsymbol S)
    {
        assert(0, "TODO ScopeDsymbol");
    }

    private void putType(Type T)
    {
        result ~= T.identifier;
        //TODO maybe we need to do better than this
    }

    override void visit(Type T)
    {
        assert(0, "abstract Type has no source representation");
    }

    override void visit(TypeNext T)
    {
        assert(0, "abstract TypeNext has no source representation");
    }

    private void putParameterTypes(FunctionType F)
    {
        result ~= " (";
        foreach(pt;F.parameterTypes)
        {
            pt.accept(this);
            result ~= ", ";
        }
        result = result[0 .. $-2];
        result ~= ")";
    }


    override void visit(TypePointer T)
    {
        // special case pointer to function
        if (auto F = cast(FunctionType) T.nextOf)
        {
            F.returnType.accept(this);
            result ~= " function";
            putParameterTypes(F);
        }
        else
        {
            putType(T.nextOf);
            result ~= "*";
        }
    }

    override void visit(TypeRef T)
    {
        result ~= "ref ";
        T.nextOf.accept(this);
    }

    override void visit(TypeSlice T)
    {
        T.nextOf.accept(this);
        result ~= "[]";
    }

    override void visit(TypeEnum T)
    {
        putType(T);
    }

    override void visit(TypeArray T)
    {
        import core.internal.string;
        T.nextOf.accept(this);
        result ~= "[" ~ unsignedToTempString(T.dim) ~ "]";
    }

    override void visit(TypeAArray T)
    {
        T.nextOf.accept(this);
        result ~= "[";
        T.indexType.accept(this);
        result ~= "]";
    }

    override void visit(FunctionType F)
    {
        putType(F.returnType);
        putParameterTypes(F);
    }

    override void visit(TypeAggregate T)
    {
        assert(0, "abstract TypeAggregate has no source representation");
    }

    override void visit(TypeClass T)
    {
        putType(T);
    }

    override void visit(TypeStruct T)
    {
        putType(T);
    }

    override void visit(Statement S)
    {
        assert(0, "abstract Statement has no source representation");
    }

    override void visit(BlockStatement B)
    {
        result ~= indent ~ "{\n";
        {
            increaseIndent();
            foreach(s;B.statements)
            {
                s.accept(this);
            }
            decreaseIndent();
        }
        result ~= indent ~ "}\n";
    }

    override void visit(ReturnStatement R)
    {
        result ~= indent ~ "return ";
        if (R.exp)
            R.exp.accept(this);
        result ~= ";\n";
    }

    override void visit(FunctionParameter F)
    {
        F.type.accept(this);
        if (F.identifier)
        {
            result ~= " " ~ F.identifier;
        }
        // assert(0, "I don't think that we should ever hit FunctionParamter");
    }

    override void visit(Function F)
    {
        assert(0, "I don't think that we should ever hit Function");
    }

    override void visit(Scope S)
    {
        assert(0, "I don't think that we should ever hit Scope");
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

string nodeToSource(const Node N, uint indent_level = 0)
{
    scope toSourceVisitor = new NodeToSourceVisitor(indent_level);

    (cast(Node)N).accept(toSourceVisitor);

    return toSourceVisitor.result;
}
