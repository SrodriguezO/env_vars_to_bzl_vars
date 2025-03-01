# Maps environment variables to variables accessible within Bazel Build files

def _impl(repository_ctx):
  env_vars = repository_ctx.attr.env_vars
  bzl_vars = ""
  for env_var in env_vars:
    bzl_var = repository_ctx.getenv(env_var)
    bzl_vars = bzl_vars + "\n{} = \"{}\"".format(env_var, bzl_var)

  repository_ctx.file("env_vars.bzl", bzl_vars)
  repository_ctx.file("BUILD.bazel", """
exports_files(["env_vars.bzl"])
  """)

load_env_vars = repository_rule(
  implementation = _impl,
  attrs = {
    "env_vars": attr.string_list(mandatory = True)
  }
)
