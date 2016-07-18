from subprocess import check_output
from subprocess import check_output
import json

INDENT_CHAR = '\t'
SPLIT_VERTICAL = 1
SPLIT_HORIZONTAL = 2


def get_tree ():
    return json.loads(check_output(['bspc', 'wm', '-d']).decode())


def _path_to_window (node, w_id):
    if node is None:
        return
    elif node['id'] == w_id:
        return []
    else:
        for k in ('firstChild', 'secondChild'):
            parents = _path_to_window(node[k], w_id)
            if parents is not None:
                return [k] + parents


def path_to_window (tree, w_id):
    for i, m in enumerate(tree['monitors']):
        for j, d in enumerate(m['desktops']):
            parents = _path_to_window(d['root'], w_id)
            if parents is not None:
                return ['monitors', i, 'desktops', j, 'root'] + parents


def follow_path (tree, path):
    result = tree
    for k in path:
        result = result[k]
    return result
