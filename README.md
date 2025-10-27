# squeakvm.org
This is a git mirror of the upstream squeakvm Subversion repository at http://squeakvm.org/svn/squeak/trunk. The repository is hosted at squeakvm.org and provided by Ian Piumarta, who is the original author of the unix VM support code and much of the code in this repository.

Commits are expected to originate from the upstream respository and are copied to git via git-svn.

The squeakvm branch attempts to maintain a linear history matching that of the upstream SVN repository.

Merges and pull requests should be done in master, preferably after committing to the upstream SVN repository and pulling to git using git-svn. The squeakvm branch is updated (merge or cherry pick) from master.

Note that the version naming of compiled unix VMs is derived from the SVN version file, which currently requires use of Subversion in the local repository.

This repository provides support code for the classic VM (AKA portable VM or interpreter VM) suitable for Squeak versions through 4.6, see https://squeak.org for up to date information. Questions regarding the classic Squeak VM should be raised on the vm-dev mailing list at https://lists.squeakfoundation.org/mailman3/lists/vm-dev.lists.squeakfoundation.org/
