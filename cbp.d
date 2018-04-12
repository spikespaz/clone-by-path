import std.stdio : writeln, stderr;
import std.array : join, split;
import std.file : getcwd;
import std.path : dirSeparator;

int main(string[] args) {
    if (args.length == 1) {
        stderr.writeln("Error: Must pass at least the repository name.");
        return 1;
    }

    string[] curr_path = split(getcwd(), dirSeparator);
    string[] repo_name = split(args[1], "/");
    string[] repo_path;

    if (repo_name.length > 3) repo_path = repo_name;
    else
        repo_path = curr_path[$ - 3 + repo_name.length .. $] ~ repo_name;

    writeln(repo_path);

    return 0;
}
