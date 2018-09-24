# cannabis
### Hooks for the editor to set the default target

current: target
-include target.mk

##################################################################

## Defs

# stuff

Sources += Makefile .ignore README.md
Ignore += .gitignore

msrepo = https://github.com/dushoff
ms = makestuff
Ignore += local.mk
-include local.mk
-include $(ms)/os.mk

-include $(ms)/python.def

Ignore += $(ms)
## Sources += $(ms)
Makefile: $(ms) $(ms)/Makefile
$(ms):
	git clone $(msrepo)/$(ms)

######################################################################

Sources += base.txt
base.search.txt: search.py base.txt

base.list.txt: list.py

base.curr.md: 

##############################

## Borrowing from HIV_treatment_Africa
## If it works well, put it into makestuff
## Search stuff

Ignore += *.search.txt
.PRECIOUS: %.search.txt
%.search.txt: %.txt search.py
	$(PITHOUT)
%.search.pkl: %.search.txt ;

## Get records from a list of ids
## Producing a text dump and a pkl file with details
## Our goal is to produce human-usable files: an html file for browsing abstracts and articles, and a csv file for entering notes and codes

%.list.txt: %.search.pkl list.py
	$(PITHOUT)
%.list.pkl: %.list.txt ;

## First try at human-friendly output
## Not working (used to, compatibility)
%.curr.md: %.list.pkl curr.py
	$(PITHOUT)

######################################################################

### Makestuff

-include $(ms)/git.mk
-include $(ms)/visual.mk

# -include $(ms)/wrapR.mk

