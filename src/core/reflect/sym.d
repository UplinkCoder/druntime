module core.reflect.sym;
import core.reflect.expr;
import core.reflect.node;
import core.reflect.dscope;

import core.reflect.reflect : Visitor;

abstract class Symbol : Node
{
    override void accept(Visitor v) { return v.visit(this); }

//    string mangle;// not currently implemented
    Scope _scope;
    /// may be null
    string identifier;
    Symbol parent;
}

enum Visibility
{
    Undefined,
    NoAccess,
    Private,
    Package,
    Protected,
    Public,
    Export,
}

class Import : Symbol
{
    override void accept(Visitor v) { return v.visit(this); }

    string[] packages;
    string moduleIdentifier;
    bool isStatic;
    Visibility visibility;
    Module mod;
}

class ScopeSymbol : Symbol
{
    override void accept(Visitor v) { return v.visit(this); }

    Symbol[] members;
}

class Package : ScopeSymbol
{
    override void accept(Visitor v) { return v.visit(this); }
}

class Module : ScopeSymbol
{
    override void accept(Visitor v) { return v.visit(this); }

    string source_filename;
    string[] string_import_filenames;
    Symbol[] declDefs;
}
