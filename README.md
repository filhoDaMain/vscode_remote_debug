# VS Code workspace settings for remote debugging
Template for setting up a VS Code workspace to launch and remote debug a C/C++ application

</br>

:white_check_mark: Easily portable </br>
→ add it to your local repo as a [git submodule](https://git-scm.com/book/en/v2/Git-Tools-Submodules) checked out as `.vscode/` </br>
→ **all required customizations** self contained in **one single file** [ENV](https://github.com/filhoDaMain/vscode_remote_debug/blob/main/ENV) </br>
</br>

:white_check_mark: One button click </br>
→ project executable and optional libraries uploaded to target </br>
→ remote TARGET `gdbserver` launches executable with optional command line arguments </br>
→ local **gdb** connects to remote TARGET </br>
→ stop at optional entrypoint breakpoint, including pre-main() libc functions </br>
</br>

:white_check_mark: Cleaned up target </br>
→ closing debug section automatically removes debuggee executables and libraries </br>
</br>


## Quick reference
- If not installed yet, install a VS Code debugging extension. </br>
I use [Native Debug](https://marketplace.visualstudio.com/items?itemName=webfreak.debug) which works as a nice graphical frontend for gdb.

- Clone inside project's base directory (the one you want to remote debug) **this repo** as a submodule. Name it `.vscode/`
> [!CAUTION]
> Backup your existing `.vscode/` folder if you don't want to lose current settings

```bash
git submodule add https://github.com/filhoDaMain/vscode_remote_debug.git .vscode
```

- Edit contents of [ENV](https://github.com/filhoDaMain/vscode_remote_debug/blob/main/ENV)

- Start debugging session by launching <**Launch (remote)**> configuration, from VS Code's **Run and Debug** menu
