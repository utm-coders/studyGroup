---
layout: page
title: Introduction to Git
visible: true
tags:
  - misc
  - beginner
---

 - **Authors**: Ahmed Hasan and James Santangelo, based very heavily on [material by Luke Johnston](https://github.com/UofTCoders/studyGroup/blob/gh-pages/lessons/git/intro/lesson.md). 
 - **Research field**: Biology
 - **Lesson topic**: Introduction to Git and GitHub
 - **Lesson content URL**: <https://github.com/utm-coders/studyGroup/tree/gh-pages/lessons/misc/git-intro/>

In this tutorial, we cover the basics of version control with Git and touch on using GitHub for collaboration.


**Preparation for this lesson**: To follow along with this lesson, you will
need to have `bash` installed. For Linux and OSX users, `bash` is included as
part of the operating system. In OSX, it can be accessed with `terminal`.

You will also need to have Git installed. For Windows users: We recommend
downloading `git bash`, which is packaged with [git](https://git-scm.com/) (a
common version control system).  This contains both Git and a a `bash`
terminal. To install Git on a Mac, you will need to install XCode from the Mac
App Store. Warning: XCode is a very large download, and one you'll likely want
to do well before the lesson!  Alternatively, if you have macOS 10.9
(Mavericks) or higher, simply open a Terminal instance and run

```
git --version
```

to commence the Git installation process. 

Finally, Linux users can install Git using `apt-get` at the command line:

```
sudo apt-get install git
```

Finally, you will need to make a free [GitHub][github] account for the latter
half of this lesson. 

# Why version control?

Version control is a means of tracking changes made to files. These changes are
tracked alongside detailed metadata on the nature of the change, when it was
made, and who made it. This is extremely useful, especially when working in
teams or even for your own records 6 months in the future (because you _will_
forget things!)

To understand how incredibly powerful version control is, think about these
questions: How many files of different versions of a manuscript or thesis do
you have laying around after getting feedback from your supervisor or
co-authors? Have you ever wanted to experiment with your code or your
manuscript and need to make a new file so that the original is not touched?
Have you ever deleted something and wish you hadn't? Have you ever forgotten
what you were doing on a project? All these problems are fixed by using version
control (git)!

Today, we are going to cover a basic Git workflow via the command line.  We'll
be using relatively simple `bash` operations to navigate and work with files
throughout: if you need a more detailed refresher on these, feel free to refer
back to our [Intro Bash][bash-intro] material.

Later, as time allows, we'll briefly cover how to bring your Git-controlled
files to GitHub, a web service that both hosts Git-controlled folders (also
known as _repositories_, or repos for short) and facilitates collaboration on
code-based projects.

# Configuring Git

To start off, we have to provide Git with some basic information about ourselves.

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

# Getting started with Git

## Initializing a repo - `git init`

To use Git, we have to first designate an existing folder as a 'Git
repository', which will tell Git to start tracking files within it. This will
create a hidden folder called `.git` in the folder that stores Git-specific
information.

Let's create a new folder and initialize a Git repo.  This is done using the
`git init` command. It's worth noting that _all_ Git commands begin with the
word `git` -- so expect to be typing those three letters a whole lot!

```bash
mkdir aboutme/
cd aboutme/
git init # creates the repository
```

If done correctly, Git will tell us that our repo has been initialized:

```
Initialized empty Git repository in /Users/Ahmed/Desktop/aboutme/.git/
```

## Editing and tracking files

Now, let's create a file and get Git to track it:

```bash
touch bio.txt # creates empty file called bio.txt
ls # check to see that file has been made
```

Let's check on the state of our repo. 

```bash
git status
```

`git status` is an incredibly useful command that returns a host of important
information about our repo. It's worth running it very liberally whenever one
is working within a Git repo just to make sure everything looks the way it's
expected to. 

```
$ git status
On branch master

No commits yet

Untracked files:
  (use "git add <file>..." to include in what will be committed)

        bio.txt

nothing added to commit but untracked files present (use "git add" to track)
```

Right now, all we have to be concerned about is the 'Untracked files' section.
Notice that `bio.txt` is listed down there -- it may even be color coded as
red. This is because Git does not track everything in a folder willy-nilly, and
will instead wait to be told that `bio.txt` is something the user would like to
track.

We can tell Git exactly that by using `git add`:

```bash
git add bio.txt
git status
```

`git status` now lists `bio.txt` under 'Changes to be committed'. 
A _commit_ is the Git term for a save point. Let's do just that
using the `git commit` command:

```bash
git commit -m 'initial commit'
git status
```

Here, we use the `-m` flag to denote the message we want to save alongside the
edits we've made. Git will _insist_ that a message is added on -- commits
without messages are not permitted!  This might seem a bit pushy, but it's
really Git trying to save you from yourself in making sure each change is
documented.

Let's now edit `bio.txt` a bit and see how Git responds.  Open `bio.txt` with
vim in the command line (or whatever your editor of choice may be):

```bash
vim bio.txt
```

Press 'i' to enter insert mode in vim, and then add:

- Your name
- Your program and year
- Your favourite programming language
- One programming language you'd like to learn one day

Remember to then hit ESC and type ':wq' to exit vim. 

Let's check the status of our repo:

```bash
git status
```

Git's noticed we've changed the file. Not only that, but it can tell us what's
been changed since the last commit via the `git diff` command:

```bash
git diff bio.txt
```

If we're happy with our changes, we have to once again use `git add` to prime
(or 'stage') this file before committing.

```bash
git add bio.txt
git commit -m 'added bio'
```

Let's check on all the changes we've made so far!

```bash
git log
```

# Getting our repo onto GitHub

Next, we'll go into how to add this repo to GitHub. You will need to make a
free account on GitHub in order to do this.

Once logged in, select the `+` dropdown on the top right of the screen and
select 'New repository'. Give your repo an informative name -- in this case,
we'll call it `aboutme` to match our local folder. 

Make sure to _NOT_ check the 'Initialize this repository with a README' box at
the bottom of the page. This is used when creating an entirely new repo on
GitHub itself, and not when importing an existing local repo.

Copy the link shown at the top of the page to your clipboard,
and head back to bash. 

```bash
pwd # make sure we're in the repo directory
git remote add origin [link]
git push -u origin master
```

Here, `origin` refers to the GitHub version of our repo, while `master` refers
to the branch currently being worked in. We won't worry too much about branches
for the purpose of this lesson -- that'll be covered in more depth when we
discuss collaboration with GitHub. 

Let's now refresh the GitHub page. `bio.txt` now appears on GitHub!  Not only
that, but the latest commit message is listed just above the file tree.

## Pushing and pulling

Click on `bio.txt` in the file tree to open it on GitHub. On the right hand
side of the page are a few icons; let's click on the pencil (edit) icon to make
some new changes. Underneath the existing info about yourself, list your
favourite colour. Once done, head to the bottom of the page to add a message
and commit these changes.

Great -- let's now head back to the command line and look at the local copy of `bio.txt`.

```bash
cat bio.txt
```

The edit we just made on GitHub doesn't seem to be there! 

To sync our local repo with the GitHub repo, we have to _pull_
the changes that are currently on GitHub. 

```bash
git pull
```

This will download the changes we made on GitHub earlier.

Conversely, if changes are made locally, we would have to _push_ to GitHub.
Let's do just that with `bio.txt`. Open the file and add the brand of computer
you have at the bottom of the file.

Before we can push our changes, we have to go through the motions of committing
them first:

```bash
git add bio.txt
git commit -m 'added laptop brand'
```

and then we can push our changes. When pushing, remember that we
have to specify these changes are heading to the GitHub repo (`origin`)
and that they're going to the master branch for now:

```bash
git push origin master
```

And now we're all synced up on GitHub!

# Wrapping up

We've covered some really important fundamentals for working with Git and GitHub today:

- Command line Git and its core commands
    - `init`
    - `add`
    - `commit`
    - `diff`
    - `status`
    - `log`
- Syncing a repository on GitHub
    - `remote`
    - `push`
    - `pull`

These are sufficient for getting started with Git and maintaining a personal
codebase in a given repo. Although this is just one relatively simple use case
for Git and GitHub, it is incredibly valuable to version control your code and
make sure all the changes that have been made over time are documented and
accounted for. It also means that removing/deleting code (accidentally or
otherwise) isn't a one way street -- at any point in time, earlier versions of
scripts (or entirely deleted scripts) can be easily accessed and recovered if
need be. 

However, one of the particular strengths of Git relates specifically to its
power to facilitate collaboration -- usually on code-based projects, but
potentially even on manuscripts and material for courses! The same philosophy
of making sure every change is accounted for is just as useful in that context,
and GitHub in particular features a whole host of extra features for
collaborative work. We'll be covering collaborating with GitHub more in a
future lesson.


## Appendix: reverting commits

(To cover if time allows -- otherwise written up here for reference)

### `git reset`

The current state of a repo is also known as the current HEAD in Git lingo.
What this means is that if we want to go back one commit, we have to do so
relative to the current HEAD.

To go back one commit:

```bash
git reset --hard HEAD~1
```

`HEAD~1` refers to us moving 'one commit back in time', while the `--hard` flag
does so _completely_, bringing the repo back to the exact state it was one
commit ago with no indication that that commit ever happened. Similarly,
`HEAD~2` will bring us back to two commits ago, and so on. Normally, those
changes would be irrevocably* lost -- however, in our case, we can simply `git
pull` them back from the GitHub repo.

There are less brute-force ways to move back one or more commits, but we won't
be covering them in much detail here. A more thorough guide for the various
flavours of `git reset` (`--soft`, `--mixed`, etc) can be found in the [Git
documentation][reset-docs].

(* There _is_ a way to undo a hard reset via `git reflog`, but only very
shortly after the reset has happened. Otherwise, Git will quietly clear out
evidence that that reset ever happened after a few days/weeks.  Best to just
assume that what's gone is gone and only use `--hard` if absolutely sure)

### Detached `HEAD` state via `git checkout`

Git also allows us to wander through prior states of our repo 'time machine'
style without altering the repo's current state. To do so, use `git log`
to see the list of existing commits, and then copy the _commit hash_ for a 
desired commit to your clipboard. The commit hash is the long string of
seemingly meaningless letters and numbers listed above each commit.
Copying the first 6-8 characters should also suffice -- don't worry
about copying the whole thing.

To go to the state of the repo when this commit was made:

```bash
git checkout [hash]
```

`git checkout` is a very powerful command with a variety of uses, many of which
we will cover when discussing collaboration in Git. Here, we're just using it
to go back to a given commit. This will put us in 'detached HEAD state'; in other
words, the current HEAD is unaltered, but we have 'detached' ourselves from it
and floated over to a past version of this repo. 

To return to the current state of the repo (and exit detached HEAD state):

```bash
git checkout master
```

[bash-intro]: https://github.com/utm-coders/studyGroup/blob/gh-pages/lessons/misc/intro-bash/lesson.md
[github]: https://github.com
[reset-docs]: https://git-scm.com/docs/git-reset
