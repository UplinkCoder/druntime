module core.reflect.decl;
import core.reflect.expr;
import core.reflect.node;
import core.reflect.type;
import core.reflect.stmt;
import core.reflect.sym;
import core.reflect.reflect : Visitor;

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

    EnumMember,
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
    override void accept(Visitor v) { v.visit(this); }

    string name;
    Node[] attributes;
    Linkage linkage;
    string comment;

    abstract immutable DeclarationKind kind() pure;
}

class VariableDeclaration : Declaration
{
    override void accept(Visitor v) { v.visit(this); }

    Type type;
    Expression _init;

    final override immutable DeclarationKind kind() pure { return DeclarationKind.VariableDeclaration; }
}

class FunctionDeclaration : Declaration
{
    override void accept(Visitor v) { v.visit(this); }

    FunctionType type;
    VariableDeclaration[] parameters;
    Statement fbody;

    final override immutable DeclarationKind kind() pure { return DeclarationKind.FunctionDeclaration; }
}

class EnumMember : Declaration
{
    override void accept(Visitor v) { return v.visit(this); }

    Expression value;

    final override immutable DeclarationKind kind() pure { return DeclarationKind.EnumMember; }
}

class EnumDeclaration : Declaration
{
    override void accept(Visitor v) { v.visit(this); }

    Type type;
    EnumMember[] members;

    final override immutable DeclarationKind kind() pure { return DeclarationKind.EnumDeclaration; }
}

class StructDeclaration : AggregateDeclaration
{
    override void accept(Visitor v) { v.visit(this); }

    final override immutable DeclarationKind kind() pure { return DeclarationKind.StructDeclaration; }
}

class ClassDeclaration : AggregateDeclaration
{
    override void accept(Visitor v) { v.visit(this); }

    bool onStack; /// is scope class
    final override immutable DeclarationKind kind() pure { return DeclarationKind.ClassDeclaration; }
}

abstract class AggregateDeclaration : Declaration
{
    override void accept(Visitor v) { v.visit(this); }

    VariableDeclaration[] fields;
}

immutable (Declaration)[] declarationsFromTokenString(@("tokenstring") string s);
Declaration isDeclaration(Node n) { return cast(Declaration) n; }
