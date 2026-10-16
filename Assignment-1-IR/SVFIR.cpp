#include "Graphs/SVFG.h"
#include "Graphs/CallGraph.h"
#include "SVF-LLVM/SVFIRBuilder.h"

#include <cassert>
#include <iostream>
#include <string>
#include <vector>

using namespace SVF;
using namespace llvm;
using namespace std;

int main(int argc, char** argv)
{
    if (argc < 2)
    {
        cerr << "Usage: " << argv[0] << " <input.ll or input.bc>" << endl;
        return 1;
    }

    int arg_num = 0;
    const int extraArgc = 4;
    vector<char*> arg_value;
    arg_value.reserve(argc + extraArgc);

    for (; arg_num < argc; ++arg_num)
    {
        arg_value.push_back(argv[arg_num]);
    }

    const int orgArgNum = arg_num;
    arg_value.push_back((char*)"-model-arrays=true");
    arg_value.push_back((char*)"-pre-field-sensitive=false");
    arg_value.push_back((char*)"-model-consts=true");
    arg_value.push_back((char*)"-stat=false");

    arg_num = static_cast<int>(arg_value.size());
    assert(arg_num == orgArgNum + extraArgc);

    vector<string> moduleNameVec = OptionBase::parseOptions(
        arg_num, arg_value.data(), "SVF IR",
        "[options] <input-bitcode...>");

    LLVMModuleSet::getLLVMModuleSet()->buildSVFModule(moduleNameVec);

    SVFIRBuilder builder;
    cout << "Generating SVFIR(PAG), call graph and ICFG ..."
         << endl;

    // Assignment 1 implementation.
    SVFIR* pag = builder.build();
    pag->dump("svfir");
    const_cast<CallGraph*>(pag->getCallGraph())->dump("callgraph");
    pag->getICFG()->dump("icfg");

    cout << "Wrote svfir.dot, callgraph.dot and icfg.dot"
         << endl;
    return 0;
}
