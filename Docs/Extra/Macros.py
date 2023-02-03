"""
Basic example of a Mkdocs-macros module
"""

import math

def define_env(env):

    Optional = "<small>Optional</small>"
    env.variables.Optional = Optional

    def Smallerize(Text: str):
        return f"<small>{Text}</small>"

    @env.macro
    def FormatPL(Number: int, Prefix = ":material-source-pull:", ApplySmallTag = True):
        Inside = f"{Prefix}{Number}"
        if ApplySmallTag:
            Inside = Smallerize(Inside)
        return f"<a class=\"md-pull-request-number\" href=\"https://github.com/EgizianoEG/String-Plus/pull/{Number}\" target=\"_self\">{Inside}</a>"

    @env.macro
    def FormatCommit(Shortcut: str, Prefix = "", ApplySmallTag = True):
        LinkText = f"{Prefix}{Shortcut}"
        if ApplySmallTag:
            LinkText = Smallerize(LinkText)
        return f"<a class=\"md-pull-request-number\" href=\"https://github.com/EgizianoEG/String-Plus/commit/{Shortcut}\" target=\"_self\">{LinkText}</a>"

    @env.macro
    def FormatType(ToDisplay: str, Type = ""):
        Additions = ["boolean", "number", "string", "table", "enum", "tuple", "function"]
        if not Type or Type == "":
            Type = ToDisplay
        if Type.lower() in Additions:
            Type = Type.lower() + "s"
        else:
            Type = Type.lower()
        return f"<a href='https://create.roblox.com/docs/scripting/luau/{Type}' target='_blank'>{ToDisplay}</a>"


    @env.macro
    def FormatVariableHeader(VariableName: str, Type: str):
        Additions = ["boolean", "number", "string", "table", "enum", "tuple"]
        LType = ""
        if Type.lower() in Additions:
            LType = Type.lower() + "s"
        else:
            LType = Type.lower()
        return f"{VariableName} <a href='https://create.roblox.com/docs/scripting/luau/{LType}' target='_blank'><small>{Type}</small></a> {{ #{VariableName.lower()} data-toc-label='{VariableName}'}}"
    
