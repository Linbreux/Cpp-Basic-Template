<div align="center" id="madewithlua">
    <img src="../.github/cpp_template_logo.png" width="110", height="100">
</div>

<h1 align="center">C++ Simple Template</h1>

This project is meant to be a starting point, to quickly start working on a C++ program. 
This can be ether way, *with* or *without* using *Nix*.

There are some libraries that are by default available:
- boost
- spdlog
- yaml-cpp
- nlohmann_json
- protobuf

## How to get started

Like already mentioned, you have two ways to run the program.

### Nix

> *(optional)* You can use [direnv](https://direnv.net/) to drop you instantly in a nix-shell session 
> when opening the project folder
> Just run `direnv allow .` one time in the project after installing `direnv`.

Open the `default.nix` file and edit `project_name` to the name you want.
This is also the main file where you would at libraries, change the compiler version, etc.

You should of course still add the libraries that you added to your `CMakeLists.txt` file.

To build the program, run:

```
nix-build
```

`nix-build` will create a new symbolic link, containing a link the program. 
To run the program:

```
./result/bin/<project_name>
```

You could also start a shell by running `nix-shell`. This will create a shell that has links to all the 
libraries/programs defined in `default.nix`. From there it's also possible to compile the program yourself.

> By doing this, you should set the `CMAKE_PROJECT_NAME` in the `CMakeLists.txt` to the project name you want.

```
mkdir build && cd build
cmake ../src/. . && cmake --build .
```

### Without Nix

If you are not using nix, you should first make sure that you have all the libraries and compilers you need.

> You can change the project name by changing `CMAKE_PROJECT_NAME` in the `CMakeLists.txt`.

After that you can just build the project manually:

```
mkdir build && cd build
cmake ../src/. . && cmake --build .
```

