FROM ubuntu

WORKDIR /greple

# copy dictionary file pre-filtered to 5-char lowercase words
COPY words .

# copy scripts that build and run the custom grep commands
COPY new.sh has.sh no.sh go.sh ./

# start a new session; ie, reset the candidate words file
RUN ./new.sh

# set aliases and prompt
RUN echo 'alias new="/greple/new.sh"'        >> ~/.bashrc \
 && echo 'alias has="/greple/has.sh"'        >> ~/.bashrc \
 && echo 'alias  no="/greple/no.sh"'         >> ~/.bashrc \
 && echo 'PS1="\n\w \$(wc -l < leftover) > "'  >> ~/.bashrc

