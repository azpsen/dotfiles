#!/usr/bin/env python3

import json
import sys
import subprocess as sp

copyq_script_getAll = r"""
var result=[];
for ( var i = 0; i < size(); ++i ) {
    var obj = {};
    obj.row = i;
    obj.mimetypes = str(read("?", i)).split("\n");
    obj.mimetypes.pop();
    obj.text = str(read(i));
    result.push(obj);
}
JSON.stringify(result);
"""

if __name__ == '__main__':
    if (len(sys.argv) > 2):
        num = sys.argv[2].split(" - ")[0]
        sp.run(f'copyq select({num});'.split(),
               encoding='utf-8', stdout=sp.PIPE, stderr=sp.PIPE)
    else:
        p = sp.run('copyq -'.split(), input=copyq_script_getAll,
                   encoding='utf-8', stdout=sp.PIPE, stderr=sp.PIPE)
        json_arr = json.loads(p.stdout)

        num = 0
        items = []
        for json_obj in json_arr:
            text = json_obj['text']
            text = " ".join(filter(None, text.replace("\n", " ").split(" ")))
            items.append(str(num) + " - " + text)
            num += 1

        print('\n'.join(x for x in items))
