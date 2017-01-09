# Copyright (c) 2013-2016, The IMDEA Software Institute and
# Copyright (c) 2013-2016, Universidad Politécnica de Madrid

# See LICENSE.txt and AUTHORS.txt for licensing and authorship


NAME = arc 
RULESCOMP = stml2has

GHC_FLAGS = -fno-warn-tabs -XFlexibleContexts
GHC_OPT_FLAGS = -fforce-recomp -O2 -fvia-C -funbox-strict-fields -optc-O2 -fexcess-precision -optc-ffast-math -funfolding-keeness-factor=10

# make executable (Default option)
exe: 
	ghc -O2 -main-is Compilable Compilable.hs -o $(NAME) $(GHC_FLAGS)

# compile rules using a given file
# Usage: make rules FILE=rules_source_file.c
rules: 
	ghc -O2 -main-is CompileRules CompileRules.hs -o stml2has $(GHC_FLAGS)
	./stml2has $(FILE)

# compile rules using defaul rules set, i.e. "rules.c"
rules_def: 
	ghc -O2 -main-is CompileRules CompileRules.hs -o stml2has $(GHC_FLAGS)
	./stml2has "rules"

# make executable optimized
exe_op: 
	ghc $(GHC_OPT_FLAGS) -main-is Compilable Compilable.hs -o $(NAME) $(GHC_FLAGS)

# make executable with profiling
exe_pro: 
	ghc -prof -fprof-auto -rtsopts -main-is Compilable Compilable.hs -o $(NAME) $(GHC_FLAGS)

# make executable optimized and with profiling
exe_op_pro: 
	ghc -O2 -prof -fprof-auto -rtsopts -main-is Compilable Compilable.hs -o $(NAME) $(GHC_FLAGS)

# run profiling of a file
# Usage: make pro FILE=source_file.c
# Result store in $(NAME).prof
pro: 
	./$(NAME) $(FILE) +RTS -p $(GHC_FLAGS)	

# Do all the previous configuration needed before to build the executables
configure:
	cabal install
	rm -rf dist

clean: 
	@rm -rf $(NAME)
	@rm -rf $(RULESCOMP)
	@rm -rf *.hi
	@rm -rf *.dyn_o
	@rm -rf *.o
	@rm -rf *.dyn_hi
	@rm -rf *.ast
	@rm -rf *_temp*

