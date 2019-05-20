---
layout: page
title: Collaborating with Git and GitHub
visible: true
tags:
  - git
  - intermediate
---

 - **Authors**: Ahmed Hasan and James Santangelo
 - **Research field**: Biology
 - **Lesson topic**: Collaborating with Git and GitHub
 - **Lesson content URL**: <https://github.com/utm-coders/studyGroup/tree/gh-pages/lessons/git/collaboration>

In this tutorial, we will cover using Git and GitHub for collaboration, working
through an example collaborative workflow. This lesson is best taught with
attendees pairing up at the start. While not necessary, it is _very highly
recommended_ that attendees who have not attended the previous [Intro
Git][intro-git] lesson work through the material prior to this lesson. 

**Preparation for this lesson**: To follow along with this lesson, you will
need to have `bash` installed. For Linux and OSX users, `bash` is included as
part of the operating system. In OSX, it can be accessed with `terminal`.

You will also need to have Git installed. For Windows users: We recommend
downloading `git bash`, which is packaged with [git](https://git-scm.com/) (a
common version control system).  This contains both Git and a `bash`
terminal. To install Git on a Mac, you will need to install XCode from the Mac
App Store.

**Warning**: XCode is a _very_ large download, and one you'll likely want
to do well before the lesson!

Alternatively, if you have macOS 10.9
(Mavericks) or higher, simply open a Terminal instance and run

```
git --version
```

to commence the Git installation process.

Linux users can install Git using `apt-get` at the command line:

```
sudo apt-get install git
```

Finally, you will **need to make a free [GitHub][github] account** for this
lesson.

# Why collaborate with Git?

In our [previous Git lesson][intro-git], we covered the philosophy and basics
of version control with command line Git. We wrapped up the lesson by uploading
our version-controlled folder, or _Git repository_, onto GitHub, and looked at
how to keep the GitHub version of a repo up to date with its local copy.

In addition to all that, however, Git and GitHub offer a host of incredibly
powerful tools for collaborative work. Git's version-controlled framework
offers a robust and reliable environment with which to work with others, where
all changes to files are tracked and reviewed by other collaborators as they
come in. While there is some initial overhead in getting used to the extra
steps involved in Git collaboration versus working on real-time collaborative
software such as Google Docs, the Git collaborative workflow ensures that all
materials are backed up, well documented, and with all changes reviewed and
approved by other collaborators. It has also made the development of these
workshops incredibly seamless!

Finally, it is worth noting that the vast majority of open source development
takes place on GitHub, and understanding the GitHub collaboration workflow is
all that is needed to get started with contributing to these projects. For
instance, the source code for the R packages `dplyr` and `ggplot2` is available
in its entirety on GitHub, and members of the community are welcome to submit
bug fixes and added features for review by the developers if they so choose.
Git-based collaboration is more or less the norm in the tech (and scientific
programming) world, and a valuable skill for anyone doing any sort of
programming in their work.  

Today, we are going to cover a simple collaborative workflow via Git/GitHub.
We'll be using relatively simple `bash` operations to navigate and work with
files throughout: if you need a more detailed refresher on these, feel free to
refer back to our [Intro Bash][bash-intro] material.

At the start of the lesson, we will be pairing up into pairs of collaborators.
Although the two collaborators in a pair will still be working through most of
the lesson individually, there will be steps in which they will take turns to
see both sides of certain parts of the workflow. Please also make sure to have
made a [free GitHub account][github] before this lesson. 

# Configuring Git

First-time users will have to do a bit of configuring before getting started
with Git. If you attended the previous lesson or worked through its material on
its own time, you will have done this step already, and can skip down to the
next section. 

First, let's set a username and email:

```bash
git config --global user.name "Luke Skywalker"
git config --global user.email "l.skywalker@tattooinet.org"
```

Git will use `vim` as its default text editor. If you're more inclined to use
`nano` or `emacs`, the editor can be changed as well:

```bash
git config --global core.editor nano
```

Any text editor can be added in here provided you have the respective command
line utility. For instance, Sublime Text can be added in using `git config
--global core.editor subl` provided one has `subl` in the `$PATH`.

# Setup

After pairing off, one person in each pair will be designated the 'owner' and
the other the 'collaborator'. After we have gone through the collaborative
workflow once, these roles will reverse, so deciding who takes which role first
is relatively arbitrary. Take a moment now to decide who will be what for
the first half before we switch sides. 

It is worth noting that many projects (including this workshop series) are
hosted on a decentralized repo instead of a repo owned by one person. This just
means that adding to that repo will involve the 'collaborator' workflow instead
of the 'owner' workflow, while the 'owner' workflow will only apply if one is a
maintainer/admin of the decentralized repo. 

# Getting started with collaboration - the 'GitHub flow'

Collaboration on GitHub generally centres around the 'GitHub flow'. This makes
use of some new features, such as forks and branches, which we may have noticed
before but have yet to interact with.

Without using Git jargon, the GitHub flow is:

1. The collaborator makes a copy of the owner's repo.
2. On the collaborator's personal copy of the repo, they make _another_ copy to
   work in.
3. The collaborator makes changes on this second copy. The first copy remains
   identical to the owner's repo.
4. Once the collaborator is done, they package their changes and submit them
   for review.
5. The owner then reviews the changes and makes suggestions as needed.
6. Once the new material is ready to be incorporated, the owner approves the
   collaborator's changes.
7. The new changes are merged into the owner's repo.
8. The collaborator then syncs their _original_ copy with the current (updated)
   state of the owner's repo.
9. The collaborator deletes their _second_ copy (with the changes).

This process ensures some redundancy in material, meaning that there is always
an existing code base to fall back on if any new changes end up negatively
affecting the repo (i.e. deleting important text, breaking code, etc). 

To get started, both the 'collaborators' and the 'owners' in each pair can now
open up [GitHub][github] in a browser. Use the `+` icon on the top right of the
screen and select `New repository`. Then, make a new repo with the name
`workshop-project-1` if you are the _owner_ and `workshop-project-2` if you are
the _collaborator_. _It is very important that both your repos do not have the
same name!_ That can and will cause errors later in this lesson. Feel free to
get more creative with names if you wish -- just make sure that they are
different from your partner's. 

In this case, also make sure to check off 'Initialize this repository with a
README'. This will create a README file in your repo containing just the name
of the repo.

## Cloning

Once both the collaborator and owner have done this, we'll now turn our
attention to just the owner's repo first. We will later switch roles and
repeat this process. Both the owner and collaborator should navigate to the
owner's repo. What each person will do from here differs slightly:

**Owner**: Click on the green `Clone or download` button on the top left of the
repo page. Copy the link onto your clipboard and then open up a bash window.
In the bash window, type in:

```bash
git clone [link]
```

with just the link (no square brackets) pasted in instead of `[link]`. Git
will make a copy of your repo on your local computer. 

On your local computer, create a new file called `code.sh` using your favourite
text editor. For instance:

```bash
cd [repo name]
nano code.sh
```

and in the file, write:

```bash
echo "I was here!"
```

with your name in place of 'I'.

Then, add and commit this change using the commands from last time:

```bash
git add code.sh
git commit -m 'mention I was here'
```

Since this repo was 'cloned' from GitHub, it is already linked to the
GitHub repo. This can be checked using `git remote -v`, which should
return two links labelled 'origin'. This means that these changes can
immediately be pushed to GitHub:

```bash
git push origin master
``` 

## Forking

**Collaborator**: Once the owner is done above, instead of cloning, click on
the `Fork` button on the very top right of the page. This will make a copy of
the owner's repo. This copy is linked to the owner's repo, but now belongs to
you -- any changes made in your copy will not automatically affect the owner's
repo. You will also notice that GitHub will indicate underneath the repo's name
that this repo has been 'forked from' elsewhere. A **fork** is a copy of a repo
on GitHub, and one of two new key Git concepts we'll be using for collaboration
today.

The next bit of the lesson only concerns collaborators -- sit tight, owners!

## Branches

Now, _on your fork of the repo_, get the link from the green `Clone or download`
box and clone the fork to your computer:

```bash
git clone [link]
```

After entering the folder with `cd`, a quick `git status` should return

```
On branch master
Your branch is up to date with 'origin/master'.
```

The `master` branch is considered the current 'official' state of the repo -- a
techier way of saying that is that 'the master branch is always deployable'
(i.e. fully functional, even if not may not be the newest version of that
repo). The takeaway from that is _you should never work in the `master` branch_!
It is extremely important to keep changes separate and make sure that the
fork's `master` branch is intact.

Let's create a new working branch:

```bash
git checkout -b patch-1
```

`git checkout` is a powerful command that has a lot of functionality that's a
bit beyond the scope of this lesson. The `-b` flag, however, tells Git to make
a new branch with the specified name. The list of existing branches can be
checked using `git branch`. If the above command has been run, `git branch`
should highlight the `patch-1` branch instead of `master`. If not, the current
branch can be switched with `git checkout patch-1`.

Now (finally!) the repo is ready for editing. In this development branch,
collaborators are free to make whatever changes they wish, with the knowledge
that the `master` branch is always there to fall back on. In all cases, it's
important to remember that so far, nothing that's been done here is affecting
either the fork on GitHub or the owner's original repo. 

On this new branch, open up `code.sh` using your favourite text editor and add:

```bash
echo "I was also here!"
```

with your name in place of 'I'. 

Then, add and commit this change:

```bash
git add code.sh
git commit -m 'a friend arrives!'
```

Now, push this branch to the fork on GitHub:

```bash
git push origin patch-1
```

## Pull requests

Navigate back to the owner's repo on GitHub. There should now be an
attention-grabbing yellow prompt mentioning the recently pushed branch. GitHub
has noticed that the fork has a new branch containing some committed edits, and
presents the option of creating a **pull request** (PR).

(If the yellow box is not visible, head back to your fork and use the dropdown
on the left side of the page to switch to the branch containing the edits.
Underneath the green `Clone or download` button, there should now also be a a
`Pull request` option.)

A pull request is essentially a means of bundling up all the changes that have
been made and presenting them to the owner/maintainer for merging.  GitHub will
nicely organize all the files that have been changed and what commits occurred
for the owner/maintainer to review.

When opening a pull request, provide a descriptive but short title and then
further details in the larger box below. 

**Owner**: Head over to your repo and click on the 'Pull Requests' tab near the
top of the page, where this recently made pull request should be waiting for
review.  You have the option of clicking on the commits and seeing what files
were changed; of adding comments to specific lines of said files; or of adding
general comments in the reply box below. All of these exist to facilitate
feedback to the collaborator if necessary.

### Incorporating feedback

Say you do have some feedback - you want the collaborator to add a third line
to `code.sh` that prints the current working directory (ie `pwd`). You can
indicate that using any of the methods mentioned above.

**Collaborator**: Navigate back to the folder in bash and make sure you are in
the right branch (`patch-1`) with `git branch`. Then, edit `code.sh` by adding
`pwd` underneath both the existing `echo` commands. 

Add, commit, and push your changes:

```bash
git add code.sh
git commit -m 'incorporate feedback'
git push origin patch-1
```

_Make sure to have `patch-1` in the final command_, and not `master`! 

**Owner**: Once the collaborator has done the above, the pull request page
should automatically update itself with the newly committed change.  If all now
looks good, click on 'Merge pull request' at the bottom of the page in order to
update your original repo. 

Then, navigate to your local copy and run

```bash
git pull
```

to sync the new changes to that as well. 


## Syncing your fork 

**Collaborator**: Although the changes have been merged, there are still
a few steps remaining to wrap things up.

First, head back to your repo in the bash interpreter. Since the owner's
`master` branch has been updated, you now have to sync your own fork
in order to make sure you are up to date. Switch back to the `master` branch:

```bash
git checkout master
```

Next, you have to link your local repo to the owner's. This is a one-time
step. First, type in `git remote -v` -- you will notice that both the `origin`
links have your GitHub username in them, and refer to your fork on GitHub.
To also add the owner's repo, head over to their repo on GitHub, and copy
the link from the `Clone or download` box. Then, run:

```bash
git remote add upstream [link]
```

Now, `git remote -v` should return _four_ links, with the two newer ones
labelled `upstream`. 

To get the changes from the owner's repo, run:

```bash
git fetch upstream
git merge upstream/master
```

This will download any updates (i.e. your own edits!) to your `master`
branch and merge them.

Finally, your fork on GitHub needs to be updated as well -- remember
that Git will not automatically update anything! Fortunately,
this only requires one more command:

```bash
git push origin master
```

And you're all set! The development branch can now be deleted with

```bash
git branch --delete patch-1
```

And now both versions of your fork are all synced up, ready for your next batch
of edits, and eventually another pull request!

It's worth noting that if you ever return to a repo after some time with
the intention of making more changes and submitting a pull request,
always start out with these 'housekeeping' commands:

```bash
git remote -v # make sure you're in master
git checkout master # switch if needed
git fetch upstream
git merge upstream/master
git push origin master
```

# Switching up

Now (if time allows), we will switch up the owner/collaborator and repeat the above
steps for the other person's repo!  

# The GitHub flow, revisited

Earlier, we looked at the GitHub flow with minimal jargon. Here it is again:

1. The collaborator makes a copy of the owner's repo.
2. On the collaborator's personal copy of the repo, they make _another_ copy to
   work in.
3. The collaborator makes changes on this second copy. The first copy remains
   identical to the owner's repo.
4. Once the collaborator is done, they package their changes and submit them
   for review.
5. The owner then reviews the changes and makes suggestions as needed.
6. Once the new material is ready to be incorporated, the owner approves the
   collaborator's changes.
7. The new changes are merged into the owner's repo.
8. The collaborator then syncs their _original_ copy with the current (updated)
   state of the owner's repo.
9. The collaborator deletes their _second_ copy (with the changes).

Now, we can restate these steps as:

1. The collaborator forks the owner's repo.
2. The collaborator creates a working branch on their fork.
3. The collaborator makes and commits changes in this working branch.
4. The collaborator pushes the working branch to their GitHub fork and submits
   a pull request.
5. The owner reviews the PR and makes suggestions as needed.
6. Once the collaborator has incorporated and commit the changes, the owner
   approves the collaborator's changes.
7. The new changes are merged into the owner's repo.
8. The collaborator syncs their fork's `master` branch with the owner's repo.
9. The collaborator deletes their working branch. 

# Wrapping up

We went through many Git commands today, and used both command line Git
and GitHub in tandem. Here are the core commands we used:

- GitHub
    - Forking
    - Pull requests
- Command line Git
    - `clone`
    - `checkout`
    - `remote`
    - `push`
    - `pull`
    - `fetch`
    - `merge`

What we've covered today is essentially the vast majority of what you need to
know to get started with collaborating on Git and even contributing to existing
open source projects. There is of course more functionality (and even some
occasional headaches in the form of merge conflicts...) but by and large these
will be sufficient for both the cases we've mentioned above, and have absolutely
been sufficient for these workshops so far. Happy collaborating! 

## Additional resources:

- A [visual demo][vis-demo] of the GitHub flow
- A useful [Git command cheat sheet][cheat-sheet]
- Guide to a [good Git workflow][good-workflow]

[bash-intro]: https://github.com/utm-coders/studyGroup/blob/gh-pages/lessons/misc/intro-bash/lesson.md
[cheat-sheet]: https://services.github.com/on-demand/downloads/github-git-cheat-sheet.pdf
[github]: https://github.com
[good-workflow]: https://www.atlassian.com/git/tutorials/comparing-workflows
[intro-git]: https://utm-coders.github.io/studyGroup/lessons/git/intro-git/lesson/
[vis-demo]: https://guides.github.com/introduction/flow/
