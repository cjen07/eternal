import IEx.Helpers
IEx.configure(default_prompt: "%counter/ ~>")
require Eternal.Life
Eternal.Life.gen_alias(20)
Eternal.Life.gen_imports_and_requires([3, 5])
