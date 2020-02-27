Content-Type: multipart/mixed; boundary="===============7642430930341572500=="
MIME-Version: 1.0
From: kbuild test robot <lkp@intel.com>
To: kbuild-all@lists.01.org
Subject: [RFC PATCH jolsa-perf] ftrace: ftrace_get_trampoline_kallsym() can be static
Date: Thu, 27 Feb 2020 11:36:17 +0800
Message-ID: <20200227033617.GA45869@e50d7db646c3>
In-Reply-To: <202002271156.94LzyueR%lkp@intel.com>
List-Id: <oe-kbuild-all.lists.linux.dev>

--===============7642430930341572500==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable


Fixes: c1cddc854dc6 ("ftrace: Add symbols for ftrace trampolines")
Signed-off-by: kbuild test robot <lkp@intel.com>
---
 ftrace.c |    6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/kernel/trace/ftrace.c b/kernel/trace/ftrace.c
index 697ab4759f0cf..95622c1b15922 100644
--- a/kernel/trace/ftrace.c
+++ b/kernel/trace/ftrace.c
@@ -6189,9 +6189,9 @@ void ftrace_remove_trampoline_from_kallsyms(struct ft=
race_ops *ops)
 	list_del_rcu(&ops->list);
 }
 =

-int ftrace_get_trampoline_kallsym(unsigned int symnum, unsigned long *valu=
e,
-				  char *type, char *name, char *module_name,
-				  int *exported)
+static int ftrace_get_trampoline_kallsym(unsigned int symnum, unsigned lon=
g *value,
+					 char *type, char *name, char *module_name,
+					 int *exported)
 {
 	struct ftrace_ops *op;
=20
--===============7642430930341572500==--

