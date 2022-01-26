# PushInterfacePOC
A proof of concept flutter plugin structure that enables adding third party message providers as separate plugins

There are three packages
1. push_provider -> Pure dart package that act as glue between third party providers and our plugin
2. our_plugin -> This is a package that represents our plugin and can be configured with one or more push_provider plugin
3. default_android_provider -> This is a plugin that supports Android only



