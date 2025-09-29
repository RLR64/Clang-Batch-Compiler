@echo off
echo Cleaning up development files...

:: Remove .exe files
for %%F in (*.exe) do (
    del "%%F"
    echo Removed: %%F
)

:: Remove .ilk files (incremental linker files)
for %%F in (*.ilk) do (
    del "%%F"
    echo Removed: %%F
)

:: Remove .pdb files (program database files)  
for %%F in (*.pdb) do (
    del "%%F"
    echo Removed: %%F
)

:: Remove .obj files (object files) - common in C and C++ development
for %%F in (*.obj) do (
    del "%%F"
    echo Removed: %%F
)

echo Cleanup complete!
