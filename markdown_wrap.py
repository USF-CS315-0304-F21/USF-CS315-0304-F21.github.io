import markdown
import sys

ext_configs = {
    'codehilite': {
        'linenums': 'True'
    }
}

with open(sys.argv[1], "r") as input_file:
    md = input_file.read()
    print(markdown.markdown(md, extensions=['codehilite', 'tables', 'attr_list'], extension_configs=ext_configs))
