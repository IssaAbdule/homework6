#Name: Issa Abdule
#Course#:CS/SE 3377.005
#Email: iaa170130@cs1.utdallas.edu

PROJECTNAME = CS3376.502.Program_5

#Settings for gcc
CXX = g++
CFLAGS = -Wall -c
LFLAGS = -Wall
#Name of Executable
SRC = hello-world.cc
EXECNAME = hello-world
OBJECTS = $(SRC:cc=o)


#List of Objects need to create executable
OBJS = hello-world.o

#Location of libraries to link in
LDFLAGS = -L/scratch/perkins/lib    

#Name of libraries needed
LDLIBS = -l cdk -lcurses
CLIBS = -I /scratch/perkins/include

all: $(EXECNAME) clean
$(EXECNAME): $(OBJS)
	$(CXX) -o $(EXECNAME) $(LFLAGS) $(OBJS) $(LDFLAGS) $(LDLIBS) 

hello-world.o: hello-world.cc
	$(CXX) $(CFLAGS) hello-world.cc $(CLIBS) -o $@


clean:
	@rm -f $(OBJS) *~ \#*

clean-all: clean
	@rm -f $(EXECNAME)
	rm *.o
tar:
	tar -cvf $(EXECNAME).tar.gz *

backup:
	@mkdir -p ~/backups; chmod 700 ~/backups
	@$(eval CURDIRNAME := $(shell basename `pwd`))
	@$(eval MKBKUPNAME := ~/backups/$(PROJECTNAME)-$(shell date +'%Y.%m.%d-%H:%M:%S').tar.gz)
	@echo
	@echo Writing Backup file to: $(MKBKUPNAME)
	@echo
	@-tar zcfv $(MKBKUPNAME) ../$(CURDIRNAME)
	@chmod 600 $(MKBKUPNAME)
	@echo
	@echo Done!
