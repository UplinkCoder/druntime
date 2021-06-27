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
   void visit(Literal L);
   void visit(IntegerLiteral I);
   void visit(StringLiteral S);
   void visit(StructLiteral S);
   void visit(Symbol S);
   void visit(ScopeDsymbol S);
   void visit(Type T);
   void visit(TypeNext T);
   void visit(TypePointer T);
   void visit(TypeRef T);
   void visit(TypeSlice T);
   void visit(TypeEnum T);
   void visit(TypeArray T);
   void visit(TypeAArray T);
   void visit(FunctionType F);
   void visit(TypeAggregate T);
   void visit(TypeClass T);
   void visit(TypeStruct T);
   void visit(Statement S);
   void visit(BlockStatement B);
   void visit(FunctionParameter F);
   void visit(Function F);
   void visit(Scope S);
}
