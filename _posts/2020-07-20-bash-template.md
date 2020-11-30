---
layout: post
title:  "Bash Template"
date:   2020-07-20
excerpt: "Template for .sh files"
image: "https://i.imgur.com/5oG1tEW.png"
---

## Template

```bash
#!/usr/bin/env bash
set -euo pipefail

# Change directory to the directory with script
SCRIPT_DIR="$(dirname "$(readlink -f "$0")")"
cd ${SCRIPT_DIR}
```

---

Read more about `set -euo pipefail`: https://ashishb.net/all/the-first-two-statements-of-your-bash-script-should-be/
