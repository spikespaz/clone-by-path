import std.stdio : writeln, stdin, stdout, stderr;
import std.array : join, split;
import std.file : getcwd;
import std.path : dirSeparator;
import std.process : spawnShell, wait;

int main(string[] args) {
    if (args.length == 1) {
        stderr.writeln("Error: Must pass at least the repository name.");
        return 1;
    }

    string[] curr_path = split(getcwd(), dirSeparator);
    string[] repo_name = split(args[1], '/');
    string[] repo_path;

    if (repo_name.length > 3) repo_path = repo_name;
    else
        repo_path = curr_path[$ - 3 + repo_name.length .. $] ~ repo_name;

    string repo_url = "https://" ~ join(repo_path, '/') ~ ".git";
    string git_cmd = "git clone " ~ join(repo_url ~ args[1 .. $], " ");

    writeln(git_cmd);

    auto git_pid = spawnShell(git_cmd, stdin, stdout, stderr);

    return wait(git_pid);
}
