# env_vars_to_bzl_vars
Allows accessing environment variables within Bazel Build files


# Usage
Simply add the following to your `WORKSPACE` file:
```
env_vars_to_bzl_vars_version = "d67a600bb0917cd0e1c7a17ee78a3e2110fdbde2"
http_archive(
  name = "env_vars_to_bzl_vars",
  sha256 = "f0f7077a83590ff566c8ef17b74ca02728592f6f400eecb6d3ccef8997a9f41d",
  type = "zip",
  strip_prefix ="env_vars_to_bzl_vars-{}".format(env_vars_to_bzl_vars_version),
  url = "https://github.com/SrodriguezO/env_vars_to_bzl_vars/archive/{}.zip".format(env_vars_to_bzl_vars_version)
)

load("@env_vars_to_bzl_vars//:env_vars_loader.bzl", "load_env_vars")
load_env_vars(
  name = "env_vars",
  env_vars = ["FOO", "BAR", ...]
)
```

You can then access the environment variables from your BUILD files by loading them:
```
load("@env_vars//:env_vars.bzl", "FOO", "BAR", ...)
```