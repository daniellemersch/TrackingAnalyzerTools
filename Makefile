CPP = g++
CPPFLAGS = -Wall -O3
LIBS = -lants

# list of all executables
PROGRAMS = controldat define_death heatmap3_tofile time_investment trackconverter trajectory zone_converter interaction_close_front_contacts interaction_any_overlap interaction_all_close_contacts filter_interactions_no_cut filter_interactions_cut_immobile

# Default target
all: $(PROGRAMS)

# Rules to compile from C++ sources (.cpp & .cc) to object files
%.o: %.cc
	@echo "  [cc]" $<
	@$(CPP) $(CPPFLAGS) -o $@ -c $<

%.o: %.cpp
	@echo "  [cc]" $<
	@$(CPP) $(CPPFLAGS) -o $@ -c $<

%:
	@echo [link] $@
	@$(CPP) $(OUTFLAGS) $(CPPFLAGS) -o $@ $^ $(LIBS)


rebuild: clean all

clean:
	@/bin/echo -n "Cleaning... "
	@-rm -f *.o
	@-rm -f $(PROGRAMS)
	@echo done.

# controldat
controldat: controldat.o

# define_death
define_death: define_death.o

# heatmap3_tofile
heatmap3_tofile: heatmap3_tofile.o

# time_investment
time_investment: time_investment.o

# trackconverter
trackconverter: trackconverter_modular.o trackconverter_functions.o

# trajectory
trajectory: trajectory.o

# zone_converter
zone_converter: zone_converter.o

# interaction_close_front_contacts
interaction_close_front_contacts: interaction_close_front_contacts.o

# interaction_any_overlap
interaction_any_overlap: interaction_any_overlap.o

# interaction_all_close_contacts
interaction_all_close_contacts: interaction_all_close_contacts.o

# filter_interactions_no_cut
filter_interactions_no_cut: filter_interactions_no_cut.o

# filter_interactions_cut_immobile
filter_interactions_cut_immobile: filter_interactions_cut_immobile.o


# List of non-file targets
.PHONY: all rebuild clean
