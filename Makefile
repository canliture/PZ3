include config.mk

.PHONY: all
all: pz3$(EXE_EXT)

pz3$(EXE_EXT): core$(CXX_EXT) contextManager$(OBJ_EXT) dist/dist$(OBJ_EXT)
	@$(CXX) $(CXXFLAGS) $(LINK_OUT_FLAG) pz3$(EXE_EXT) $^ $(LINK_EXTRA_FLAGS)
	@echo compiled core.cpp
	@echo generation complete

contextManager$(OBJ_EXT): contextManager$(CXX_EXT)
	@$(CXX) $(CXXFLAGS) $(CXX_OUT_FLAG) $<
	@echo compiled contextManager.cpp

dist/dist$(OBJ_EXT): 
	$(MAKE) --directory=./dist

.PHONY: clean
clean:
	@rm -f *$(OBJ_EXT) *~ pz3$(EXE_EXT)
	$(MAKE) --directory=./dist clean
	@echo clean complete