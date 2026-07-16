# VS Code Workspace configuration for remote debugging

After getting tired of always setting up VS Code for remote debugging sessions between projects, I decided to simplify the configuration in a portable way.

This repo is meant to be cloned as **git subtree** into the project you want to remote debug as a `.vscode` directory.

Checkout [examples_vscode_remote_debug](https://github.com/filhoDaMain/examples_vscode_remote_debug) for a complete example of how to include this repo into an existing project.
</br>

This workspace configuration offers:
- **Portability**: only a single file needs to be changed between projects;
- **Automated** upload of binary and libraries to debug into remote target;
- **Start** of `gdbserver` in remote target with optional command line arguments;
- **Session cleanup**: after debug, `gdbserver` is closed and uploaded files are removed.


## Usage

**NOTE:** If not installed yet, install a VS Code debugging extension. </br>
I use [Native Debug](https://marketplace.visualstudio.com/items?itemName=webfreak.debug) which works as a nice graphical frontend for gdb.
</br>

### 1. Clone this repo into existing project as a .vscode directory
> [!CAUTION]
> Backup your existing `.vscode/` folder if you don't want to lose current settings

```bash
# At the project's root directory
$ git subtree add --prefix .vscode https://github.com/filhoDaMain/vscode_remote_debug main --squash
```

### 2. Set-up ENV file appropriately for the project to debug
The [ENV](https://github.com/filhoDaMain/vscode_remote_debug/blob/main/ENV) file is **the only file you have to change** between projects.

It specifies which application to debug, which remote target to use, the cross-debugger location, among other settings.

The complete `ENV` variable documentation is at the [end](#env-variables-reference) of this page.

### 3. Start debug
In VS Code start the debug session:

`Run and Debug` > `Start Debugging: Launch (remote)`

If all goes well, you should see VS Code automatically connecting to the `gdbserver` running in target and be able to debug your application and libraries.

</br>

## ENV variables reference
<details>
<summary>ENV_DEBUGGEE_APPLICATION</summary>

```Text
Local path to the executable application to remotely debug.
The path can be specified both as an absolute path or as relative to project's base directory (one level above .vscode/)

E.g. as a relative path:
export ENV_DEBUGGEE_APPLICATION=out/debug/bin/helloworld
```
</details>

<details>
<summary>ENV_DEBUGGEE_CMDLINE_ARGS</summary>

```Text
Command line arguments to pass to the executable application when it is launched in remote target.
```
</details>

<details>
<summary>ENV_APPLICATION_UPLOAD_PATH</summary>

```Text
Path (remote target) where to upload the executable application, specified as a 'scp' destination.

If the path does not exist in remote target it will be created on demand.

E.g. upload to ${HOME}/debug/bin/
export ENV_APPLICATION_UPLOAD_PATH="debug/bin/"

E.g. upload to /usr/bin/
export ENV_APPLICATION_UPLOAD_PATH="/usr/bin/"
```
</details>

<details>
<summary>ENV_DEBUGGEE_LIBS_PATH</summary>

```Text
Local path to a directory containing shared libraries to remotely debug.
The path can be specified both as an absolute path or as relative to project's base directory (one level above .vscode/)

Leave blank if no libraries are required to upload to remote target.

E.g. no libraries to upload:
export ENV_DEBUGGEE_LIBS_PATH=""

E.g. upload all libraries from this directory (relative path):
export ENV_DEBUGGEE_LIBS_PATH="out/debug/lib/"
```
</details>

<details>
<summary>ENV_LIBS_UPLOAD_PATH</summary>

```Text
Path (remote target) where to upload the libraries, specified as a 'scp' destination.

If the path does not exist in remote target it will be created on demand.

If no path was specified for 'ENV_DEBUGGEE_LIBS_PATH', this variable will be ignored.

E.g. upload to ${HOME}/debug/lib/
export ENV_APPLICATION_UPLOAD_PATH="debug/lib/"

E.g. upload to /usr/lib/
export ENV_APPLICATION_UPLOAD_PATH="/usr/lib/"
```
</details>

<details>
<summary>ENV_TARGET_SSH_HOST</summary>

```Text
A target as specified in ~/.ssh/config

HINT: setup ssh key login in target
```
</details>

<details>
<summary>ENV_TARGET_IPADDR</summary>

```Text
Remote target's hostname (/etc/hosts) or as an IP address.

NOTE: I usually setup the ssh targets (~/.ssh/config) and hostnames (/etc/hosts) with the same name, so you will likely find in my examples 'ENV_TARGET_IPADDR' and 'ENV_TARGET_SSH_HOST' with same value.
```
</details>

<details>
<summary>ENV_STOP_AT</summary>

```Text
Optional breakpoint. Leave blank if you don't want gdb to stop at entry.

E.g. Stop at libc's _start()
export ENV_STOP_AT="_start"

E.g. Stop at program's main()
export ENV_STOP_AT="main"
```
</details>

<details>
<summary>ENV_DEBUGGER</summary>

```Text
Absolute path to a cross-debugger.

E.g.
export ENV_DEBUGGER=/opt/pokytos/1.0.0/sysroots/aarch64-pokytossdk-linux/usr/bin/arm-poky-linux-gnueabi/arm-poky-linux-gnueabi-gdb
```
</details>

<details>
<summary>ENV_DEBUGGER_SYSROOT</summary>

```Text
Absolute path to target's sysroot.

E.g.
export ENV_DEBUGGER_SYSROOT="/opt/pokytos/1.0.0/sysroots/cortexa7t2hf-neon-vfpv4-poky-linux-gnueabi/"
```
</details>

<details>
<summary>ENV_DEBUGGER_GDBSERVER_PORT</summary>

```Text
The portnumber gdbserver will listen to.
Any available port number is fine.

E.g.
export ENV_DEBUGGER_GDBSERVER_PORT=1234
```
</details>
