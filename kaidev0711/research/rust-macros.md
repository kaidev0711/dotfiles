# Rust Macros You Should Know!

1. matches!
   -> The matches! macro is a convenient way to match against enums or patterns in an expression without having to write full match arms.

2. concat!
   -> Combine multiple string literals into a single string at compile-time. This can be helpful for building constant strings efficiently.

3. debug_assert!
   -> A debug-only version of assert!. It is only checked in debug builds, making it useful for runtime checks without affecting release performance.

4. log!
   -> The log! macro allows logging messages with different levels (info, warn, error). It can be customized with loggers, enabling powerful debugging capabilities.

5. lazy_static!
   -> For creating lazily initialized static variables. This is particularly useful for non-trivial initialization that you want to run only once.
