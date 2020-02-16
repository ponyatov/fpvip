CWD    = $(CURDIR)
MODULE = $(notdir $(CWD))

NOW = $(shell date +%d%m%y)
REL = $(shell git rev-parse --short=4 HEAD)


IP   = 127.0.0.1
PORT = 12345


.PHONY: all
all: fpvd fpvip
	./fpvd  $(IP) $(PORT) &
	./fpvip $(IP) $(PORT)



C_C = fpvip.cc
C_D = fpvd.cc
H = fpvip.hh

fpvip: $(C_C) $(H)
	$(CXX) $(CXXFLAGS) -o $@ $(C_C) $(L)
fpvd : $(C_D) $(H)
	$(CXX) $(CXXFLAGS) -o $@ $(C_D) $(L)



.PHONY: doxy
doxy:
	rm -rf docs ; doxygen doxy.gen 1>/dev/null



MERGE  = Makefile README.md doxy.gen doc fpvip.hh fpvip.cc fpvd.cc

.PHONY: merge release zip

merge:
	git checkout master
	git checkout shadow -- $(MERGE)
	$(MAKE) doxy

release:
	git tag $(NOW)-$(REL)
	git push -v && git push -v --tags
	git checkout shadow

zip:
	git archive --format zip --output $(MODULE)_src_$(NOW)_$(REL).zip HEAD
