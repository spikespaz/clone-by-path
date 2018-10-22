import os
import sys
import subprocess


def main():
    if len(sys.argv) == 1:
        print("Error: Must pass at least the repository name.", file=sys.stderr)
        sys.exit(1)

    curr_path = os.getcwd().split(os.path.sep)
    repo_name = sys.argv[1].split("/")

    if len(repo_name) == 1 and repo_name[0] == ".":
        repo_path = curr_path[-3:]
    elif len(repo_name) >= 3:
        repo_path = repo_name
    else:
        repo_path = curr_path[len(repo_name) - 3:] + repo_name

    repo_url = "https://" + "/".join(repo_path) + ".git"

    start_arg = (len(sys.argv) > 2 and sys.argv[2][0] != "-") + 1
    git_cmd = ("git", "clone", repo_url, *sys.argv[start_arg:])

    print(">", *git_cmd)

    git_pid = subprocess.call(git_cmd)

    sys.exit(git_pid)


if __name__ == "__main__":
    main()
