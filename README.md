# Folding-Text-Scripts
Scripts to extend Folding Text 

Most of these are Applescript files with some hacky Javascript worked in where necessary. 
To install scripts, see here: http://support.hogbaysoftware.com/t/how-to-install-a-script/75
(TLDR: open Applescript editor, paste, run.) 

I tend to use Fastscripts or TextExpander to call upon frequently used scripts, depending on whatever the most appropriate trigger is. 

# Startup Checks

This is a script to run on a document at start-up, or at the beginning of each new day, which is likely to be more useful if most of your tasks are contained in a single document. The script replaces any @tomorrow tags with @today tags, checks for any due dates that match today's date (and if so, tags any associated tasks with @today) and checks for any due dates that have passed (and on finding them, tags any associated tasks with @overdue). 

The final case deals with recurring tasks. If a task tagged @lastdone([date/time]) is found and the date/time value in the tag falls before today's date + a period of lenience, the script marks that task as overdue. You can adjust lenience according to your own needs— I've allowed 2 days to give me a little leeway for weekends. 

Note: Much of the automated functionality for dealing with recurring tasks is contained within a hacked version of the archive script, which places a copy of a completed recurring task in the archive, but also places a fresh copy in a new project titled "tomorrow", capturing date/time within a "@lastdone" tag automatically. 
