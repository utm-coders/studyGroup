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

Today, we are going to cover a basic Git workflow via the command line.
We'll be using relatively simple `bash` operations to navigate and
work with files throughout: if you need a more detailed refresher,
feel free to refer back to our [Intro Bash][bash-intro] material.

Later, as time allows, we'll briefly cover how to bring your Git-controlled
files to GitHub, a web service that both hosts Git-controlled folders (also
known as _repositories_) and facilitates collaboration on code-based projects.

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

# Our first repo

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

This is an incredibly useful command that returns a host of
important information about our repo:

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
will instead wait to be told that `bio.txt` is something we'd like to track.

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
edits we've made. Git will _insist_ that you add on a message -- commits
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

next:
- add github stuff - ie pushing this repo to github
- collaboration stuff? ie forking/branching/PRs 
- add appendix on reverting commits



[bash-intro]: https://github.com/utm-coders/studyGroup/blob/gh-pages/lessons/misc/intro-bash/lesson.md
