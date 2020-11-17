---
layout: page
title: Introduction to Bash
visible: true
tags:
  - misc
  - beginner
---

 - **Authors**: James Santangelo and Ahmed Hasan, based heavily on [material from John Ladan](https://github.com/UofTCoders/studyGroup/blob/gh-pages/lessons/misc/bash-intro/lesson.md) and a fourth year Genomics course bash primer written and delivered by Rob Ness and Ahmed Hasan. Updated Novemebr 2020 by Rose Mastin Wood for the Aquatic Ecology Journal club
 - **Research field**: Biology
 - **Lesson topic**: Introduction to shells and the command-line with bash.
 - **Lesson content URL**: <https://github.com/utm-coders/studyGroup/tree/gh-pages/lessons/bash/intro-bash>

In this tutorial, we cover the basics of interacting with a computer using Bash (the Bourne Again Shell). You may have heard the terms "command line", "terminal", "console", "shell", "interactive prompt", "git-bash", etc. To be imprecise, they all refer to using the keyboard to control your computer by typing commands.

**Preparation for this lesson**: To follow along with this lesson, you will need to have `bash` installed. For Linux and OSX users, `bash` is included as part of the operating system. In OSX, it can be accessed with `terminal`.

For Windows users, there are many options (e.g. [Cygwin](https://www.cygwin.com/), [Windoes Subsystem for Linux](https://msdn.microsoft.com/en-us/commandline/wsl/install_guide)). However, we recommend downloading `git bash`, which is bundles with with [git for windows](https://git-scm.com/download/win) 

# Why use a command line?

The command line is a very precise and powerful way to interact with a computer. Because it is a scripting language, you can automate and perform complex tasks without much overhead.

Shells are particularly well suited to interacting with files and running programs -- possibly your own! Not having a graphical interface turns out to be a strength, because it makes remote computing simple and reliable.

At first, typing in commands will feel a bit cumbersome, but like learning any language the only way to get better is with practice. Lucky for us, bash is based on English with a very simplified grammar.

# Starting the lesson

Let's go ahead and open up our shells. On Macs the program is called `Terminal` and it's installed by default in `/Applications/Utilities/`. You can also use Spotlight and search for `Terminal`. On Windows, search for `git-bash`

With your bash shell open, you can now start issuing commands.

# Bash command syntax

You can execute commands using the following syntax:  *commmand name* followed (optionally) by *arguments* or *flags*.

Let's issue a command to figure out our *current working directory*, which is where we currently are in the computer's directory structure. We can have bash remind us what (and where) this is using `pwd`, or *print working directory*:

```
pwd
```

Of course, we're probably more interested in the contents of a directory over just its name. The `ls` command *lists* the contents of our working directory.

```
ls
```

We can modify how we want the output of ls to look by adding what's called a *flag*. For instance, the `-l` flag will output the contents of a directory in a more detailed fashion.

```
ls -l
```

It's worth keeping in mind that nearly every shell command has its own set of flags/modifiers. We'll be going over the more generally useful ones as they come. If you want to see how to use a particular command along with its available flags, you can use the **man**ual command.

```
man ls
```

## Working with directories

Back to our folder here. While peeking at the contents of a directory is certainly useful, we'll often find ourselves wanting to switch our current directory. This is done using the `cd` (**c**hange **d**irectory) command. You should have downloaded a folder call `intro-bash-demo` and saved it somewhere practical (e.g. your Desktop or home folder) - let's use `cd` to navigate to it. I've a included a snippet of some useful `cd` commands below:

* `cd <directory name>`: Change ito directory. Relative to your current working directory.(relative path)
    * `cd intro-bash-demo/`: Change into `intro-bash-demo directory`
    * `cd ../`: Go back one directory from the previous one. Use `../../` to go back 2 directories.
    * `cd ~/`: Change to your home directory

**Tip:** You can press TAB to autocomplete directory and filenames. If a file in the working directory matches the start of the file or directory you've started typing, the shell with autocomplete its name. You can also double tap tab to list directory name options if you can't autocomplete it based on what you've typed in.

Once you've navigated to the `intro-bash-demo` folder, *list* the files in the folder to view its contents.

You notice some text files (e.g. animals.txt) and directories. We'll return to these shortly.

We can create directories with the `mkdir` command. Let's create a directory called `text-files`.

```
mkdir text-files
```

Similarly, you can remove directories with the `rmdir` command. Let's remove the `folder-to-delete` folder.

```
rmdir folder-to-delete
```

Hmmm...that didn't work. It turns out `rmdir` only works on empty directories. Let's make sure we don't actually need the files in that directory before trying again to delete it. You can pass directory names to `ls` as an argument to see its contents.

```
ls folder-to-delete
```

Now that we're sure we don't need that folder anymore, let's **f**orcefully and **r**ecursively delete it using the `rm` (for *remove*) command. Note, this command will not warn you and the content will be gone forever. Unlike Microsoft Word, there is no "undo" button here once you've done this!

```
rm -rf folder-to-delete
```

`rm` can also be used on files without the `-rf` flags. Try remove `to-delete.txt`

## Working with files

Beyond navigating directories, bash offers a suite of useful tools to do all sorts of things with files themselves.

Let's examine `hello_world.py` in greater detail. We can do this with `cat`, which simply spits out the contents of a file to the terminal's output. `hello_world.py` is a Python script that we'll run from bash later in the tutorial. At the end of the day, scripts are just plain text files that the computer can execute to perform tasks.

```
cat hello_world.py
```

When it comes to looking at individual files, however, `cat` is generally not very practical for anything but tiny files like this one. Generally, we would want to use `less`, a program known as a *pager* that is designed to let users scroll through files (no matter how large) by only generating a single 'page worth' at a time. As such, it has very little memory overhead. You can also use your arrow keys to navigate through the pages. Use `q` to quit. It can be a little confusing at first, and it will seem like you've lost your bash interface and can't find it again, but that is normal, so don't panic.

Let's use `less` to view the contents of the larger file, `animals.txt`.

```
less animals.txt
```
When you want to get out of the "pager" view, you can press 'q' to exit. 

Finally, bash features two useful tools that output the first ten lines (`head`) and last ten lines (`tail`) of a file. These are especially handy for large files that we don't want to open in their entirety.

```
head animals.txt
tail animals.txt
```

## Copying and moving files

`cp` is used to copy files. When using `cp`, you have to type out both the file you want to copy as well as the name of the file you want to make.

```
cp animals.txt animals_copy.txt
```

`cp` also allows you to copy into a folder by providing a folder name instead of a new file name.

```
cp animals.txt text-files/animals_copy.txt
ls text-files # Confirm that file is there
```

`mv` (**m**o**v**e) is somewhat similar, but requires you to type out the file you want to move as well as the directory you want to move it to. Let's move our copy of `animals.txt` into `text_files`.

```
mv animals.txt text-files/
ls text-files
```

To move `animals_copy.txt` into`text-files`, we should make sure to rename it, which can also be done with the mv` command. Here we are going to both rename `animals_copy.txt` to `animals_copy_2.txt` and place it in `text-files`. Otherwise, the version of `animals_copy.txt` already in `text-files` would be overwritten. **Note:** Bash will not warn you before overwritting a file if a file with the same name already exists in the directory.

```
mv animals_copy.txt text-files/animals_copy_2.txt
ls text-files
```

**Note on file naming:** Notice that none of the file or directory names have spaces in them. This is because spaces are used to separate *commands* and *arguments/flags* for command-line programs. In other words, if your directories or files have spaces in their names, they may be interepreted as commands or arguments. It's best to avoid spaces in files and directories.

When working with files you can also use special characters called *wildcards* that represent one or many unspecified characters. The use of *wild cards* to pattern match strings is sometimes referred to as *globbing*. Here are some common patterns for globbing:

- `*` Match any string of arbitrary length
- `?` Match any single character
- `[]` Match any of the characters within square brackets.

Let's move all of the Python scripts into the `scripts` folder.

```
mv *.py scripts/
```

Let's also remove the two copies of `animals.txt` in `text-files`.

```
rm text-files/*copy*
ls text-files
```

Here is a summary of some of the commands we've used until now.

* **hepful commands**
    * `pwd` - print the current working directory
    * `mkdir` - create a directory
    * `cd` - change directory
* **viewing files**
    * `cat` - 'concatenate' - prints contents of specified file(s) to screen
    * `less` - opens the less pager, which allows for safe viewing of larger files
    * `head` - prints first 10 lines of specified file
    * `tail` - prints last 10 lines of specified file
* **copying and moving files**
    * `cp` - copy files
    * `cp` [filename] [new filename] - create copy with different name in current working directory
    * `cp` [filename] [directory] - create copy with same name in specified directory
    * `mv` - move or rename files
    * `mv` [filename] [new filename] - rename file
    * `mv` [filename] [directory] - move file to directory
    * `mv` -v - bash prints out what it's moving and where - especially useful when using wildcards
* **removing files**
    * `rm` - irreversibly delete files
    * `rm` -rf [directory] - irreversibly delete a directory and all its files

# Bash pipes and redirects

Let's **c**hange **d**irectories into `text-files` and start looking at some more powerful uses of bash.

```
cd text-files
```

## Pipes (stdin/out)

Commands can be strung together with pipes `|`. Those of you using R may have seen the concept in the `dplyr` package. Commands typically have an input (stdin) and an output (stdout). The pipe attaches the first commands command into the input of the next.

Say we were interested in knowing how many fish are in `animals.txt`. Here we'll first use a powerful command called `grep` (**g**lobal **r**egular **e**xpression **p**rint) to search `animals.txt` for all of the occurences of *fish*.

```
grep 'fish' animals.txt
```

Notice that by default (and like most commands), `grep` prints its output to the shell window. Of course, this is not always what we want. In this case, we just want to count the occurences of *fish* rather that list them. In that case, we can *pipe* (`|`) the output of `grep` to the `wc` command (for **w**ord **c**ount) with the `-l` flag to count the number of lines from the `grep` output.

```
grep 'fish' animals.txt | wc -l
```

## Redirect

What if we wanted to create a separate file with the list of fish, called `fish.txt`. Here, we can use `>` to *redirect* the output of `grep` to a file called `fish.txt`

```
grep 'fish' animals.txt > fish.txt
```

Notice nothing is printed to the shell but a new file with all of the fish has appeared. Cool!

Importantly, using `>` and passing the output to a file that already exists will overwrite that file. If you just want to add to the end of the file, you can *append* using the `>>` operator. 

# Running programs from the command-line

It can be quite useful to write entire scripts and run them in their entirety. This is particularly helpful if running scripts (e.g. in R, Python, etc) on a server or computer cluster where Graphical User Interfaces (GUI's) are uncommon.

Before starting, let's change into our `scripts` folder. Note, we could run the scripts from any folder by specifying the full path to the file, but for now we'll change over.

```
cd ../scripts
```

We'll be executing the python script `hello_world.py`. First, let's make sure that we have Python and that the computer knows where to find it (more on this in a bit). `which` is a helpful command for this as it tells us which *executable file* is being run when we type a command in the shell.

```
which python
```

If successful, the shell will print the full path to the executable used in performing the command. Incidentally, these are the files that are executed when your using your computer for everyday use; their execution is simply hidden because you're often using a GUI.

Let's go ahead and run our script

```
python hello_world.py
```

We can similarly execute bash scripts in the same way. First, let's look at our script.

```
less print-numbers.sh
```

See! The script is just a plain text file~

Let's go ahead and execute this script.

```
bash print-numbers.sh
```

R scripts can be run using the `Rscript <script-name>` command.

# Environment variables

There are special variables called *environment variables* which are used by bash and other programs to affect behaviour. Here, we'll only cover two of them. The first is one of the most important: `$PATH`:

```
echo $PATH
```

That's a little tough to read. Let's put the directories in our `$PATH` on separate lines by piping the output of `$PATH` to the **tr**anslate characters command, which allows us to quickly substitute the `:` in `$PATH` with newline (`\n`) characters.

```
echo "$PATH" | tr ':' '\n'
```

Notice the `$` symbol. This is how variables are accessed in bash. *Environment variables* are always capitalized. The `$PATH` variable stores the directories you computer searches for programs, commands, and utilities that have been installed. If you installed something and can't get it to work on the command-line, it's likely because the *executable file* for the program is not in the computers `$PATH`. When we used the `which` command earlier, these are the directories that were searched. If the command is not in `$PATH`, nothing will be printed.

```
which made-up-command
```

Another useful environment variable is `$PYTHONPATH`. This is the directories that Python will search for installed Python modules.

```
echo $PYTHONPATH | tr ':' '\n'
```

# Bash profile and aliases

It turns out we can more finely tune our shell environment and add shortcuts and customizations to make our lives easier. This is done using `.bash_profile` or `.bashrc` configuration files. You can read about the differences between these [here](https://apple.stackexchange.com/questions/51036/what-is-the-difference-between-bash-profile-and-bashrc). These are shell configuration files that are executed every time you start shell and are executed just prior to the bash prompt appearing in the shell. Importantly, these files live in your computer's *home directory*; configuration files located anywhere else will not be read by the shell. Let's first see whether you have a configuration file.

```
cat ~/.bashrc
cat ~/.bash_profile
```

If the shell told you the files don't exist, you can make one (`.bash_profile`) using `vim`, a command-line editor. Run the following command

```
vi ~/.bash_profile
```

You will now be in a `vim` editor window. We'll only add a couple of *Aliases* to our configuration file. Aliases allow us to create short hands and custom commands to facilitate performing repetitive tasks or for configuring certain commands to always include certain flags (for example).

Press `i` to enter *insert* mode in `vim` and enter the following into the window.

```
alias ll="ls -alh"
alias ..="cd .."
```

Press ESCAPE and save and quit the file by typing `:wq` (don't ask).

Since we're still in a terminal, we need to re-execute the `.bash_profile` (remember it's executed *before* the terminal prompt). We can do this with the `source` command.

```
source ~/.bash_profile
```

Now you can use the aliases that we defined in place of the commands that we assigned to them. For example, `..` will go back one directory (no need to type `cd ..` everytime).

The `.bash_profile` file allows all manner of customizations (e.g. terminal prompt colouring, custom functions, permanently adding directories to you `$PATH`). Be careful, it's a slippery slope...



