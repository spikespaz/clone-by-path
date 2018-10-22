from sys import argv, stderr
from os.path import join, sep
from subprocess import call
from os import getcwd


def main():
    if len(argv) == 1:
        print("Error: Must pass at least the repository name.", file=stderr)
        exit(1)

    curr_path = getcwd().split(sep)
    repo_name = argv[1].split("/")
    repo_path = None

    if len(repo_name) == 1 and repo_name[0] == ".":
        repo_path = curr_path[-3:]
    elif len(repo_name) >= 3:
        repo_path = repo_name
    else:
        repo_path = curr_path[len(repo_name) - 3:] + repo_name

    repo_url = "https://" + "/".join(repo_path) + ".git"

    start_arg = (len(argv) > 2 and argv[2][0] != "-") + 1
    git_cmd = ("git", "clone", repo_url, *argv[start_arg:])

    print(">", *git_cmd)

    git_pid = call(git_cmd, shell=True)

    exit(git_pid)


if __name__ == "__main__":
    main()
