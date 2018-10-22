from setuptools import setup

with open("README.md") as readme:
    long_description = readme.read()

setup(
    name="cbp",
    version="1.1.1",
    author="spikespaz",
    author_email="support@spikespaz.com",
    description="A small CLI tool to infer the clone URL by the current path and arguments.",
    long_description=long_description,
    long_description_content_type="text/markdown",
    url="https://github.com/spikespaz/clone-by-path",
    classifiers=(
        "Environment :: Console",
        "Intended Audience :: Developers",
        "License :: OSI Approved :: MIT License",
        "Programming Language :: Python",
        "Topic :: Software Development :: Version Control :: Git",
        "Topic :: Utilities"
    ),
    py_modules=("cbp",),
    entry_points={
        "console_scripts": (
            "cbp=cbp:main"
        )
    }
)
