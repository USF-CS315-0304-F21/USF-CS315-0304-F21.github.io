import chevron
import os
import sys
import toml

def main():
    if len(sys.argv) != 2:
        print("usage: " + sys.argv[0] + 'template.mustache')
        return -1

    # Accumulate all the row data from the toml files
    rows = {'rows': []}
    template_fname = sys.argv[1]
    dir_fname = os.path.splitext(template_fname)[0]
    for toml_fname in sorted(os.listdir(dir_fname), reverse=True):
        toml_path = os.path.join(dir_fname, toml_fname)
        row = toml.load(toml_path)
        rows['rows'].append(row)

    # Render the HTML file using the mustache template and table data
    with open(template_fname) as f:
        print(chevron.render(f, rows))

if __name__ == '__main__':
    main()
