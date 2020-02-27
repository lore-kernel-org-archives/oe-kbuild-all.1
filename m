Content-Type: multipart/mixed; boundary="===============0127079809059192737=="
MIME-Version: 1.0
From: kbuild test robot <lkp@intel.com>
To: kbuild-all@lists.01.org
Subject: [jolsa-perf:poke 8/15] kernel/trace/ftrace.c:6192:5: sparse: sparse: symbol 'ftrace_get_trampoline_kallsym' was not declared. Should it be static?
Date: Thu, 27 Feb 2020 11:36:16 +0800
Message-ID: <202002271156.94LzyueR%lkp@intel.com>
List-Id: <oe-kbuild-all.lists.linux.dev>

--===============0127079809059192737==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/jolsa/perf.git poke
head:   7cd4fcf02099f2bdc6373d364007d2f330077df1
commit: c1cddc854dc6f8b93cfd53ec32de52affe02c068 [8/15] ftrace: Add symbols=
 for ftrace trampolines
reproduce:
        # apt-get install sparse
        # sparse version: v0.6.1-173-ge0787745-dirty
        git checkout c1cddc854dc6f8b93cfd53ec32de52affe02c068
        make ARCH=3Dx86_64 allmodconfig
        make C=3D1 CF=3D'-fdiagnostic-prefix -D__CHECK_ENDIAN__'

If you fix the issue, kindly add following tag
Reported-by: kbuild test robot <lkp@intel.com>


sparse warnings: (new ones prefixed by >>)

   kernel/trace/ftrace.c:1467:39: sparse:    expected struct ftrace_hash *h=
ash
   kernel/trace/ftrace.c:1467:39: sparse:    got struct ftrace_hash [nodere=
f] <asn:4> *filter_hash
   kernel/trace/ftrace.c:1468:40: sparse: sparse: incorrect type in argumen=
t 1 (different address spaces)
   kernel/trace/ftrace.c:1468:40: sparse:    expected struct ftrace_hash *h=
ash
   kernel/trace/ftrace.c:1468:40: sparse:    got struct ftrace_hash [nodere=
f] <asn:4> *filter_hash
   kernel/trace/ftrace.c:1469:40: sparse: sparse: incorrect type in argumen=
t 1 (different address spaces)
   kernel/trace/ftrace.c:1469:40: sparse:    expected struct ftrace_hash *h=
ash
   kernel/trace/ftrace.c:1469:40: sparse:    got struct ftrace_hash [nodere=
f] <asn:4> *notrace_hash
   kernel/trace/ftrace.c:1470:42: sparse: sparse: incorrect type in argumen=
t 1 (different address spaces)
   kernel/trace/ftrace.c:1470:42: sparse:    expected struct ftrace_hash *h=
ash
   kernel/trace/ftrace.c:1470:42: sparse:    got struct ftrace_hash [nodere=
f] <asn:4> *notrace_hash
   kernel/trace/ftrace.c:1622:18: sparse: sparse: incorrect type in assignm=
ent (different address spaces)
   kernel/trace/ftrace.c:1622:18: sparse:    expected struct ftrace_ops *ops
   kernel/trace/ftrace.c:1622:18: sparse:    got struct ftrace_ops [noderef=
] <asn:4> *[addressable] [toplevel] ftrace_ops_list
   kernel/trace/ftrace.c:1623:43: sparse: sparse: incorrect type in assignm=
ent (different address spaces)
   kernel/trace/ftrace.c:1623:43: sparse:    expected struct ftrace_ops *ops
   kernel/trace/ftrace.c:1623:43: sparse:    got struct ftrace_ops [noderef=
] <asn:4> *next
   kernel/trace/ftrace.c:1669:22: sparse: sparse: incorrect type in assignm=
ent (different address spaces)
   kernel/trace/ftrace.c:1669:22: sparse:    expected struct ftrace_hash *h=
ash
   kernel/trace/ftrace.c:1669:22: sparse:    got struct ftrace_hash [nodere=
f] <asn:4> *filter_hash
   kernel/trace/ftrace.c:1670:28: sparse: sparse: incorrect type in assignm=
ent (different address spaces)
   kernel/trace/ftrace.c:1670:28: sparse:    expected struct ftrace_hash *o=
ther_hash
   kernel/trace/ftrace.c:1670:28: sparse:    got struct ftrace_hash [nodere=
f] <asn:4> *notrace_hash
   kernel/trace/ftrace.c:1675:22: sparse: sparse: incorrect type in assignm=
ent (different address spaces)
   kernel/trace/ftrace.c:1675:22: sparse:    expected struct ftrace_hash *h=
ash
   kernel/trace/ftrace.c:1675:22: sparse:    got struct ftrace_hash [nodere=
f] <asn:4> *notrace_hash
   kernel/trace/ftrace.c:1676:28: sparse: sparse: incorrect type in assignm=
ent (different address spaces)
   kernel/trace/ftrace.c:1676:28: sparse:    expected struct ftrace_hash *o=
ther_hash
   kernel/trace/ftrace.c:1676:28: sparse:    got struct ftrace_hash [nodere=
f] <asn:4> *filter_hash
   kernel/trace/ftrace.c:1941:50: sparse: sparse: incorrect type in initial=
izer (different address spaces)
   kernel/trace/ftrace.c:1941:50: sparse:    expected struct ftrace_hash *h=
ash
   kernel/trace/ftrace.c:1941:50: sparse:    got struct ftrace_hash [nodere=
f] <asn:4> *filter_hash
   kernel/trace/ftrace.c:1952:50: sparse: sparse: incorrect type in initial=
izer (different address spaces)
   kernel/trace/ftrace.c:1952:50: sparse:    expected struct ftrace_hash *h=
ash
   kernel/trace/ftrace.c:1952:50: sparse:    got struct ftrace_hash [nodere=
f] <asn:4> *filter_hash
   kernel/trace/ftrace.c:3224:14: sparse: sparse: incorrect type in assignm=
ent (different address spaces)
   kernel/trace/ftrace.c:3224:14: sparse:    expected struct ftrace_hash *h=
ash
   kernel/trace/ftrace.c:3224:14: sparse:    got struct ftrace_hash [nodere=
f] <asn:4> *filter_hash
   kernel/trace/ftrace.c:3241:22: sparse: sparse: incorrect type in assignm=
ent (different address spaces)
   kernel/trace/ftrace.c:3241:22: sparse:    expected struct ftrace_hash *h=
ash
   kernel/trace/ftrace.c:3241:22: sparse:    got struct ftrace_hash [nodere=
f] <asn:4> *filter_hash
   kernel/trace/ftrace.c:3716:22: sparse: sparse: incorrect type in assignm=
ent (different address spaces)
   kernel/trace/ftrace.c:3716:22: sparse:    expected struct ftrace_hash *h=
ash
   kernel/trace/ftrace.c:3716:22: sparse:    got struct ftrace_hash [nodere=
f] <asn:4> *notrace_hash
   kernel/trace/ftrace.c:3719:22: sparse: sparse: incorrect type in assignm=
ent (different address spaces)
   kernel/trace/ftrace.c:3719:22: sparse:    expected struct ftrace_hash *h=
ash
   kernel/trace/ftrace.c:3719:22: sparse:    got struct ftrace_hash [nodere=
f] <asn:4> *filter_hash
   kernel/trace/ftrace.c:4121:27: sparse: sparse: incorrect type in assignm=
ent (different address spaces)
   kernel/trace/ftrace.c:4121:27: sparse:    expected struct ftrace_hash **=
orig_hash
   kernel/trace/ftrace.c:4121:27: sparse:    got struct ftrace_hash [nodere=
f] <asn:4> **
   kernel/trace/ftrace.c:4123:27: sparse: sparse: incorrect type in assignm=
ent (different address spaces)
   kernel/trace/ftrace.c:4123:27: sparse:    expected struct ftrace_hash **=
orig_hash
   kernel/trace/ftrace.c:4123:27: sparse:    got struct ftrace_hash [nodere=
f] <asn:4> **
   kernel/trace/ftrace.c:4495:19: sparse: sparse: incorrect type in assignm=
ent (different address spaces)
   kernel/trace/ftrace.c:4495:19: sparse:    expected struct ftrace_hash **=
orig_hash
   kernel/trace/ftrace.c:4495:19: sparse:    got struct ftrace_hash [nodere=
f] <asn:4> **
   kernel/trace/ftrace.c:4637:19: sparse: sparse: incorrect type in assignm=
ent (different address spaces)
   kernel/trace/ftrace.c:4637:19: sparse:    expected struct ftrace_hash **=
orig_hash
   kernel/trace/ftrace.c:4637:19: sparse:    got struct ftrace_hash [nodere=
f] <asn:4> **
   kernel/trace/ftrace.c:4643:34: sparse: sparse: incorrect type in assignm=
ent (different address spaces)
   kernel/trace/ftrace.c:4643:34: sparse:    expected struct ftrace_hash [n=
oderef] <asn:4> *filter_hash
   kernel/trace/ftrace.c:4643:34: sparse:    got struct ftrace_hash *[assig=
ned] old_hash
   kernel/trace/ftrace.c:4895:27: sparse: sparse: incorrect type in assignm=
ent (different address spaces)
   kernel/trace/ftrace.c:4895:27: sparse:    expected struct ftrace_hash **=
orig_hash
   kernel/trace/ftrace.c:4895:27: sparse:    got struct ftrace_hash [nodere=
f] <asn:4> **
   kernel/trace/ftrace.c:4897:27: sparse: sparse: incorrect type in assignm=
ent (different address spaces)
   kernel/trace/ftrace.c:4897:27: sparse:    expected struct ftrace_hash **=
orig_hash
   kernel/trace/ftrace.c:4897:27: sparse:    got struct ftrace_hash [nodere=
f] <asn:4> **
   kernel/trace/ftrace.c:5541:35: sparse: sparse: incorrect type in assignm=
ent (different address spaces)
   kernel/trace/ftrace.c:5541:35: sparse:    expected struct ftrace_hash **=
orig_hash
   kernel/trace/ftrace.c:5541:35: sparse:    got struct ftrace_hash [nodere=
f] <asn:4> **
   kernel/trace/ftrace.c:5545:35: sparse: sparse: incorrect type in assignm=
ent (different address spaces)
   kernel/trace/ftrace.c:5545:35: sparse:    expected struct ftrace_hash **=
orig_hash
   kernel/trace/ftrace.c:5545:35: sparse:    got struct ftrace_hash [nodere=
f] <asn:4> **
   kernel/trace/ftrace.c:5664:29: sparse: sparse: incompatible types in com=
parison expression (different address spaces):
   kernel/trace/ftrace.c:5664:29: sparse:    struct ftrace_hash [noderef] <=
asn:4> *
   kernel/trace/ftrace.c:5664:29: sparse:    struct ftrace_hash *
   kernel/trace/ftrace.c:5667:29: sparse: sparse: incompatible types in com=
parison expression (different address spaces):
   kernel/trace/ftrace.c:5667:29: sparse:    struct ftrace_hash [noderef] <=
asn:4> *
   kernel/trace/ftrace.c:5667:29: sparse:    struct ftrace_hash *
   kernel/trace/ftrace.c:5785:21: sparse: sparse: incompatible types in com=
parison expression (different address spaces):
   kernel/trace/ftrace.c:5785:21: sparse:    struct ftrace_hash [noderef] <=
asn:4> *
   kernel/trace/ftrace.c:5785:21: sparse:    struct ftrace_hash *
   kernel/trace/ftrace.c:5813:21: sparse: sparse: incompatible types in com=
parison expression (different address spaces):
   kernel/trace/ftrace.c:5813:21: sparse:    struct ftrace_hash [noderef] <=
asn:4> *
   kernel/trace/ftrace.c:5813:21: sparse:    struct ftrace_hash *
   kernel/trace/ftrace.c:5864:36: sparse: sparse: incompatible types in com=
parison expression (different address spaces):
   kernel/trace/ftrace.c:5864:36: sparse:    struct ftrace_hash [noderef] <=
asn:4> *
   kernel/trace/ftrace.c:5864:36: sparse:    struct ftrace_hash *
   kernel/trace/ftrace.c:5866:25: sparse: sparse: incompatible types in com=
parison expression (different address spaces):
   kernel/trace/ftrace.c:5866:25: sparse:    struct ftrace_hash [noderef] <=
asn:4> *
   kernel/trace/ftrace.c:5866:25: sparse:    struct ftrace_hash *
   kernel/trace/ftrace.c:5868:36: sparse: sparse: incompatible types in com=
parison expression (different address spaces):
   kernel/trace/ftrace.c:5868:36: sparse:    struct ftrace_hash [noderef] <=
asn:4> *
   kernel/trace/ftrace.c:5868:36: sparse:    struct ftrace_hash *
   kernel/trace/ftrace.c:5870:25: sparse: sparse: incompatible types in com=
parison expression (different address spaces):
   kernel/trace/ftrace.c:5870:25: sparse:    struct ftrace_hash [noderef] <=
asn:4> *
   kernel/trace/ftrace.c:5870:25: sparse:    struct ftrace_hash *
>> kernel/trace/ftrace.c:6192:5: sparse: sparse: symbol 'ftrace_get_trampol=
ine_kallsym' was not declared. Should it be static?
   kernel/trace/ftrace.c:6223:18: sparse: sparse: incorrect type in assignm=
ent (different address spaces)
   kernel/trace/ftrace.c:6223:18: sparse:    expected struct ftrace_ops *ops
   kernel/trace/ftrace.c:6223:18: sparse:    got struct ftrace_ops [noderef=
] <asn:4> *[addressable] [toplevel] ftrace_ops_list
   kernel/trace/ftrace.c:6223:66: sparse: sparse: incorrect type in assignm=
ent (different address spaces)
   kernel/trace/ftrace.c:6223:66: sparse:    expected struct ftrace_ops *ops
   kernel/trace/ftrace.c:6223:66: sparse:    got struct ftrace_ops [noderef=
] <asn:4> *next
   kernel/trace/ftrace.c:6264:59: sparse: sparse: incorrect type in argumen=
t 2 (different address spaces)
   kernel/trace/ftrace.c:6264:59: sparse:    expected struct ftrace_hash *h=
ash
   kernel/trace/ftrace.c:6264:59: sparse:    got struct ftrace_hash [nodere=
f] <asn:4> *filter_hash
   kernel/trace/ftrace.c:6265:59: sparse: sparse: incorrect type in argumen=
t 2 (different address spaces)
   kernel/trace/ftrace.c:6265:59: sparse:    expected struct ftrace_hash *h=
ash
   kernel/trace/ftrace.c:6265:59: sparse:    got struct ftrace_hash [nodere=
f] <asn:4> *notrace_hash
   kernel/trace/ftrace.c:6635:62: sparse: sparse: incorrect type in argumen=
t 2 (different address spaces)
   kernel/trace/ftrace.c:6635:62: sparse:    expected struct ftrace_hash *h=
ash
   kernel/trace/ftrace.c:6635:62: sparse:    got struct ftrace_hash [nodere=
f] <asn:4> *filter_hash
   kernel/trace/ftrace.c:6636:62: sparse: sparse: incorrect type in argumen=
t 2 (different address spaces)
   kernel/trace/ftrace.c:6636:62: sparse:    expected struct ftrace_hash *h=
ash
   kernel/trace/ftrace.c:6636:62: sparse:    got struct ftrace_hash [nodere=
f] <asn:4> *notrace_hash
   kernel/trace/ftrace.c:6682:36: sparse: sparse: incompatible types in com=
parison expression (different address spaces):
   kernel/trace/ftrace.c:6682:36: sparse:    struct ftrace_ops [noderef] <a=
sn:4> *
   kernel/trace/ftrace.c:6682:36: sparse:    struct ftrace_ops *
   kernel/trace/ftrace.c:206:20: sparse: sparse: dereference of noderef exp=
ression
   kernel/trace/ftrace.c:206:20: sparse: sparse: dereference of noderef exp=
ression
   kernel/trace/ftrace.c:206:20: sparse: sparse: dereference of noderef exp=
ression
   kernel/trace/ftrace.c:3015:46: sparse: sparse: incorrect type in argumen=
t 1 (different address spaces)
   kernel/trace/ftrace.c:3015:46: sparse:    expected struct ftrace_hash *h=
ash
   kernel/trace/ftrace.c:3015:46: sparse:    got struct ftrace_hash [nodere=
f] <asn:4> *filter_hash
   kernel/trace/ftrace.c:3016:47: sparse: sparse: incorrect type in argumen=
t 1 (different address spaces)
   kernel/trace/ftrace.c:3016:47: sparse:    expected struct ftrace_hash *h=
ash
   kernel/trace/ftrace.c:3016:47: sparse:    got struct ftrace_hash [nodere=
f] <asn:4> *filter_hash
   kernel/trace/ftrace.c:3020:44: sparse: sparse: incorrect type in argumen=
t 1 (different address spaces)
   kernel/trace/ftrace.c:3020:44: sparse:    expected struct ftrace_hash *h=
ash
   kernel/trace/ftrace.c:3020:44: sparse:    got struct ftrace_hash [nodere=
f] <asn:4> *notrace_hash
   kernel/trace/ftrace.c:2992:48: sparse: sparse: incorrect type in argumen=
t 1 (different address spaces)
   kernel/trace/ftrace.c:2992:48: sparse:    expected struct ftrace_hash *h=
ash
   kernel/trace/ftrace.c:2992:48: sparse:    got struct ftrace_hash [nodere=
f] <asn:4> *filter_hash
   kernel/trace/ftrace.c:2993:49: sparse: sparse: incorrect type in argumen=
t 1 (different address spaces)
   kernel/trace/ftrace.c:2993:49: sparse:    expected struct ftrace_hash *h=
ash
   kernel/trace/ftrace.c:2993:49: sparse:    got struct ftrace_hash [nodere=
f] <asn:4> *notrace_hash

Please review and possibly fold the followup patch.

---
0-DAY CI Kernel Test Service, Intel Corporation
https://lists.01.org/hyperkitty/list/kbuild-all(a)lists.01.org
--===============0127079809059192737==--

