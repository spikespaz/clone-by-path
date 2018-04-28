import std.stdio : writeln, stdin, stdout, stderr;
import std.array : join, split;
import std.file : getcwd;
import std.path : dirSeparator;
import std.process : spawnShell, wait;

int main(string[] args) {
    if (args.length == 1) { // Only the executable name is an arg
        stderr.writeln("Error: Must pass at least the repository name.");
        return 1; // Exit with error
    }

    string[] curr_path = split(getcwd(), dirSeparator); // Get cwd path segments
    string[] repo_name = split(args[1], '/'); // Get repo path segments
    string[] repo_path;

    if (repo_name.length > 3) repo_path = repo_name; // Includes more than domain, owner, repo
    else repo_path = curr_path[$ - 3 + repo_name.length .. $] ~ repo_name; // Incomplete path, use parts of cwd

    string repo_url = "https://" ~ join(repo_path, '/') ~ ".git"; // Build the url of the repo from path

    const int start_arg = (args.length > 2 && args[2][0] != '-') + 1; // IF a clone path is provided second arg
    string git_cmd = "git clone " ~ join(repo_url ~ args[start_arg .. $], ' '); // Build the command

    writeln("> " ~ git_cmd); // Tell the user what the result is

    auto git_pid = spawnShell(git_cmd, stdin, stdout, stderr); // Call that and get the pid

    return wait(git_pid); // Wait for the clone to complete and return with pid exit status
}
