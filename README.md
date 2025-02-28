# env_vars_to_bzl_vars
Allows accessing environment variables within Bazel Build files


# Usage
Simply add the following to your `WORKSPACE` file:
```starlark
bazel_dep(name = "env_vars_to_bzl_vars")
env_vars_to_bzl_vars_version = "eb8e4a7957475467f6cb114de6cc1d49acce0028"

archive_override(
    module_name = "env_vars_to_bzl_vars",
    integrity = "sha256-liMeNqBLtUjG1P9mLwv839aHx8v/FUygMp6u86iY0pI=",
    strip_prefix = "env_vars_to_bzl_vars-{}".format(env_vars_to_bzl_vars_version),
    urls = ["https://github.com/SrodriguezO/env_vars_to_bzl_vars/archive/{}.zip".format(env_vars_to_bzl_vars_version)],
)

load_env_vars = use_repo_rule(
    "@env_vars_to_bzl_vars//:env_vars_loader.bzl",
    "load_env_vars",
)

load_env_vars(
    name = "env_vars",
    env_vars = ["FOO", "BAR", ...],
)
```

You can then access the environment variables from your BUILD files by loading them:
```
load("@env_vars//:env_vars.bzl", "FOO", "BAR", ...)
```