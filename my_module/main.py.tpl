#!/usr/bin/env python
""":mod:`${title}.main` -- Program entry point
"""

from __future__ import print_function
import sys
import argparse
from $title import metadata


def main(argv):
    """Program entry point.

    :param argv: command-line arguments
    :type argv: :class:`list`
    """
    author_strings = []
    for name, email in zip(metadata.authors, metadata.emails):
        author_strings.append('Author: {0} <{1}>'.format(name, email))

    epilog = '''
{title} {version}

{authors}
URL: <{url}>
'''.format(
        title=metadata.nice_title,
        version=metadata.version,
        authors='\n'.join(author_strings),
        url=metadata.url)

    arg_parser = argparse.ArgumentParser(
        formatter_class=argparse.RawDescriptionHelpFormatter,
        description=metadata.description,
        epilog=epilog)

    arg_parser.parse_args(args=argv[1:])

    print(epilog)

if __name__ == '__main__':
    raise SystemExit(main(sys.argv))