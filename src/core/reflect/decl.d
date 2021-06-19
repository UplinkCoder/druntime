module core.reflect.decl;
import core.reflect.node;
import core.reflect.type;
import core.reflect.stmt;

enum DeclarationKind
{
    FunctionDeclaration,
    StructDeclaration,
    UnionDeclarartion,
    ClassDeclarartion,
    VariableDeclaration,
    AliasDeclaration,
    TemplateDeclaration,
}

enum Linkage
{
    D,
    extern_C,
    extern_CPP,
    extern_objc,
    extern_system,
    extern_D,
}

class Declaration : Node
{
    string name;
    Node[] attributes;
    Linkage linkage;
    string comment;

    abstract immutable DeclarationKind kind() pure;
}

class VariableDeclaration : Declaration
{
    Type type;
    final override immutable DeclarationKind kind() pure { return DeclarationKind.VariableDeclaration; }
}

class FunctionDeclaration : Declaration
{
    FunctionType type;
    VariableDeclaration[] parameters;
    Statement fbody;
    final override immutable DeclarationKind kind() pure { return DeclarationKind.FunctionDeclaration; }
}

immutable (Declaration)[] declarationsFromTokenString(@("tokenstring") string s);
Declaration isDeclaration(Node n) { return cast(Declaration) n; }
