module core.reflect.decl;
import core.reflect.expr;
import core.reflect.node;
import core.reflect.type;
import core.reflect.stmt;
import core.reflect.sym;

enum DeclarationKind
{
    Invalid,
    EnumDeclaration,
    FunctionDeclaration,
    StructDeclaration,
    UnionDeclaration,
    ClassDeclaration,
    VariableDeclaration,
    AliasDeclaration,
    TemplateDeclaration,
}

enum Linkage
{
    Default, /// maybe invalid?

    D,
    C,
    CPP,
    Windows,
    ObjC,
    System,
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
    Expression _init;

    final override immutable DeclarationKind kind() pure { return DeclarationKind.VariableDeclaration; }
}

class FunctionDeclaration : Declaration
{
    FunctionType type;
    VariableDeclaration[] parameters;
    Statement fbody;

    final override immutable DeclarationKind kind() pure { return DeclarationKind.FunctionDeclaration; }
}

class EnumDeclaration : Declaration
{
    final override immutable DeclarationKind kind() pure { return DeclarationKind.EnumDeclaration; }
}

class StructDeclaration : AggregateDeclaration
{
    final override immutable DeclarationKind kind() pure { return DeclarationKind.StructDeclaration; }
}

class ClassDeclaration : AggregateDeclaration
{
    bool onStack; /// is scope class
    final override immutable DeclarationKind kind() pure { return DeclarationKind.ClassDeclaration; }
}

abstract class AggregateDeclaration : Declaration
{
    VariableDeclaration[] fields;
}

immutable (Declaration)[] declarationsFromTokenString(@("tokenstring") string s);
Declaration isDeclaration(Node n) { return cast(Declaration) n; }
