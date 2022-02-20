FROM alpine

WORKDIR /greple

# enable login shell
ENV ENV="/etc/profile"

# copy dictionary file pre-filtered to 5-char lowercase words
COPY words .

# copy scripts that build and run the custom grep commands
COPY         new.sh has.sh no.sh go.sh ./
RUN chmod +x new.sh has.sh no.sh go.sh

# start a new session; ie, reset the candidate words file
RUN ./new.sh

# set aliases and prompt
RUN echo 'alias new="/greple/new.sh"'          >> /etc/profile \
 && echo 'alias has="/greple/has.sh"'          >> /etc/profile \
 && echo 'alias  no="/greple/no.sh"'           >> /etc/profile \
 && echo 'PS1="\n\w \$(wc -l < leftover) > "'  >> /etc/profile

