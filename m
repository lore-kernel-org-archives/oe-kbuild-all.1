Content-Type: multipart/mixed; boundary="===============4667270464659717834=="
MIME-Version: 1.0
From: kbuild test robot <lkp@intel.com>
To: kbuild-all@lists.01.org
Subject: [hch-misc:i_ino-u64 1/1] fs/notify/fdinfo.c:124:33: warning: format '%lx' expects argument of type 'long unsigned int', but argument 3 has type 'u64' {aka 'long long unsigned int'}
Date: Tue, 05 May 2020 20:31:28 +0800
Message-ID: <202005052015.KjP63yDf%lkp@intel.com>
List-Id: <oe-kbuild-all.lists.linux.dev>

--===============4667270464659717834==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

tree:   git://git.infradead.org/users/hch/misc.git i_ino-u64
head:   af34aa4178efe95f96741b91b94b3569a0d4a22a
commit: af34aa4178efe95f96741b91b94b3569a0d4a22a [1/1] fs: make i_ino a u64
config: arm-aspeed_g4_defconfig (attached as .config)
compiler: arm-linux-gnueabi-gcc (GCC) 9.3.0
reproduce:
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/=
make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        git checkout af34aa4178efe95f96741b91b94b3569a0d4a22a
        # save the attached .config to linux build tree
        COMPILER_INSTALL_PATH=3D$HOME/0day GCC_VERSION=3D9.3.0 make.cross A=
RCH=3Darm =


If you fix the issue, kindly add following tag as appropriate
Reported-by: kbuild test robot <lkp@intel.com>

All warnings (new ones prefixed by >>):

   fs/notify/fdinfo.c: In function 'fanotify_fdinfo':
>> fs/notify/fdinfo.c:124:33: warning: format '%lx' expects argument of typ=
e 'long unsigned int', but argument 3 has type 'u64' {aka 'long long unsign=
ed int'} [-Wformat=3D]
     124 |   seq_printf(m, "fanotify ino:%lx sdev:%x mflags:%x mask:%x igno=
red_mask:%x ",
         |                               ~~^
         |                                 |
         |                                 long unsigned int
         |                               %llx
     125 |       inode->i_ino, inode->i_sb->s_dev,
         |       ~~~~~~~~~~~~               =

         |            |
         |            u64 {aka long long unsigned int}
--
   fs/ubifs/journal.c: In function 'ubifs_jnl_truncate':
>> fs/ubifs/journal.c:1556:52: warning: format '%lu' expects argument of ty=
pe 'long unsigned int', but argument 4 has type 'u64' {aka 'const long long=
 unsigned int'} [-Wformat=3D]
    1556 |     ubifs_err(c, "bad data node (block %u, inode %lu)",
         |                                                  ~~^
         |                                                    |
         |                                                    long unsigned=
 int
         |                                                  %llu
    1557 |        blk, inode->i_ino);
         |             ~~~~~~~~~~~~                            =

         |                  |
         |                  u64 {aka const long long unsigned int}
   In file included from include/linux/kernel.h:15,
                    from include/linux/list.h:9,
                    from include/linux/wait.h:7,
                    from include/linux/wait_bit.h:8,
                    from include/linux/fs.h:6,
                    from fs/ubifs/ubifs.h:16,
                    from fs/ubifs/journal.c:49:
   fs/ubifs/journal.c: In function 'ubifs_jnl_change_xattr':
>> fs/ubifs/debug.h:158:11: warning: format '%lu' expects argument of type =
'long unsigned int', but argument 5 has type 'u64' {aka 'const long long un=
signed int'} [-Wformat=3D]
     158 |  pr_debug("UBIFS DBG " type " (pid %d): " fmt "\n", current->pid=
,       \
         |           ^~~~~~~~~~~~
   include/linux/printk.h:283:21: note: in definition of macro 'pr_fmt'
     283 | #define pr_fmt(fmt) fmt
         |                     ^~~
>> include/linux/dynamic_debug.h:143:2: note: in expansion of macro '__dyna=
mic_func_call'
     143 |  __dynamic_func_call(__UNIQUE_ID(ddebug), fmt, func, ##__VA_ARGS=
__)
         |  ^~~~~~~~~~~~~~~~~~~
   include/linux/dynamic_debug.h:153:2: note: in expansion of macro '_dynam=
ic_func_call'
     153 |  _dynamic_func_call(fmt, __dynamic_pr_debug,  \
         |  ^~~~~~~~~~~~~~~~~~
>> include/linux/printk.h:330:2: note: in expansion of macro 'dynamic_pr_de=
bug'
     330 |  dynamic_pr_debug(fmt, ##__VA_ARGS__)
         |  ^~~~~~~~~~~~~~~~
>> fs/ubifs/debug.h:158:2: note: in expansion of macro 'pr_debug'
     158 |  pr_debug("UBIFS DBG " type " (pid %d): " fmt "\n", current->pid=
,       \
         |  ^~~~~~~~
>> fs/ubifs/debug.h:172:29: note: in expansion of macro 'ubifs_dbg_msg'
     172 | #define dbg_jnl(fmt, ...)   ubifs_dbg_msg("jnl", fmt, ##__VA_ARG=
S__)
         |                             ^~~~~~~~~~~~~
>> fs/ubifs/journal.c:1798:2: note: in expansion of macro 'dbg_jnl'
    1798 |  dbg_jnl("ino %llu, ino %lu", host->i_ino, inode->i_ino);
         |  ^~~~~~~
   fs/ubifs/journal.c:1798:27: note: format string is defined here
    1798 |  dbg_jnl("ino %llu, ino %lu", host->i_ino, inode->i_ino);
         |                         ~~^
         |                           |
         |                           long unsigned int
         |                         %llu
--
   fs/ubifs/file.c: In function 'read_block':
>> fs/ubifs/file.c:93:49: warning: format '%lu' expects argument of type 'l=
ong unsigned int', but argument 4 has type 'u64' {aka 'long long unsigned i=
nt'} [-Wformat=3D]
      93 |  ubifs_err(c, "bad data node (block %u, inode %lu)",
         |                                               ~~^
         |                                                 |
         |                                                 long unsigned int
         |                                               %llu
      94 |     block, inode->i_ino);
         |            ~~~~~~~~~~~~                          =

         |                 |
         |                 u64 {aka long long unsigned int}
   In file included from include/linux/kernel.h:15,
                    from include/linux/list.h:9,
                    from include/linux/wait.h:7,
                    from include/linux/wait_bit.h:8,
                    from include/linux/fs.h:6,
                    from fs/ubifs/ubifs.h:16,
                    from fs/ubifs/file.c:40:
   fs/ubifs/file.c: In function 'do_readpage':
>> fs/ubifs/debug.h:158:11: warning: format '%lu' expects argument of type =
'long unsigned int', but argument 4 has type 'u64' {aka 'long long unsigned=
 int'} [-Wformat=3D]
     158 |  pr_debug("UBIFS DBG " type " (pid %d): " fmt "\n", current->pid=
,       \
         |           ^~~~~~~~~~~~
   include/linux/printk.h:283:21: note: in definition of macro 'pr_fmt'
     283 | #define pr_fmt(fmt) fmt
         |                     ^~~
>> include/linux/dynamic_debug.h:143:2: note: in expansion of macro '__dyna=
mic_func_call'
     143 |  __dynamic_func_call(__UNIQUE_ID(ddebug), fmt, func, ##__VA_ARGS=
__)
         |  ^~~~~~~~~~~~~~~~~~~
   include/linux/dynamic_debug.h:153:2: note: in expansion of macro '_dynam=
ic_func_call'
     153 |  _dynamic_func_call(fmt, __dynamic_pr_debug,  \
         |  ^~~~~~~~~~~~~~~~~~
>> include/linux/printk.h:330:2: note: in expansion of macro 'dynamic_pr_de=
bug'
     330 |  dynamic_pr_debug(fmt, ##__VA_ARGS__)
         |  ^~~~~~~~~~~~~~~~
>> fs/ubifs/debug.h:158:2: note: in expansion of macro 'pr_debug'
     158 |  pr_debug("UBIFS DBG " type " (pid %d): " fmt "\n", current->pid=
,       \
         |  ^~~~~~~~
   fs/ubifs/debug.h:170:29: note: in expansion of macro 'ubifs_dbg_msg'
     170 | #define dbg_gen(fmt, ...)   ubifs_dbg_msg("gen", fmt, ##__VA_ARG=
S__)
         |                             ^~~~~~~~~~~~~
>> fs/ubifs/file.c:109:2: note: in expansion of macro 'dbg_gen'
     109 |  dbg_gen("ino %lu, pg %lu, i_size %lld, flags %#lx",
         |  ^~~~~~~
   fs/ubifs/file.c:109:17: note: format string is defined here
     109 |  dbg_gen("ino %lu, pg %lu, i_size %lld, flags %#lx",
         |               ~~^
         |                 |
         |                 long unsigned int
         |               %llu
   fs/ubifs/file.c:166:49: warning: format '%lu' expects argument of type '=
long unsigned int', but argument 4 has type 'u64' {aka 'long long unsigned =
int'} [-Wformat=3D]
     166 |   ubifs_err(c, "cannot read page %lu of inode %lu, error %d",
         |                                               ~~^
         |                                                 |
         |                                                 long unsigned int
         |                                               %llu
     167 |      page->index, inode->i_ino, err);
         |                   ~~~~~~~~~~~~                   =

         |                        |
         |                        u64 {aka long long unsigned int}
   In file included from include/linux/kernel.h:15,
                    from include/linux/list.h:9,
                    from include/linux/wait.h:7,
                    from include/linux/wait_bit.h:8,
                    from include/linux/fs.h:6,
                    from fs/ubifs/ubifs.h:16,
                    from fs/ubifs/file.c:40:
   fs/ubifs/file.c: In function 'write_begin_slow':
>> fs/ubifs/debug.h:158:11: warning: format '%lu' expects argument of type =
'long unsigned int', but argument 4 has type 'u64' {aka 'long long unsigned=
 int'} [-Wformat=3D]
     158 |  pr_debug("UBIFS DBG " type " (pid %d): " fmt "\n", current->pid=
,       \
         |           ^~~~~~~~~~~~
   include/linux/printk.h:283:21: note: in definition of macro 'pr_fmt'
     283 | #define pr_fmt(fmt) fmt
         |                     ^~~
>> include/linux/dynamic_debug.h:143:2: note: in expansion of macro '__dyna=
mic_func_call'
     143 |  __dynamic_func_call(__UNIQUE_ID(ddebug), fmt, func, ##__VA_ARGS=
__)
         |  ^~~~~~~~~~~~~~~~~~~
   include/linux/dynamic_debug.h:153:2: note: in expansion of macro '_dynam=
ic_func_call'
     153 |  _dynamic_func_call(fmt, __dynamic_pr_debug,  \
         |  ^~~~~~~~~~~~~~~~~~
>> include/linux/printk.h:330:2: note: in expansion of macro 'dynamic_pr_de=
bug'
     330 |  dynamic_pr_debug(fmt, ##__VA_ARGS__)
         |  ^~~~~~~~~~~~~~~~
>> fs/ubifs/debug.h:158:2: note: in expansion of macro 'pr_debug'
     158 |  pr_debug("UBIFS DBG " type " (pid %d): " fmt "\n", current->pid=
,       \
         |  ^~~~~~~~
   fs/ubifs/debug.h:170:29: note: in expansion of macro 'ubifs_dbg_msg'
     170 | #define dbg_gen(fmt, ...)   ubifs_dbg_msg("gen", fmt, ##__VA_ARG=
S__)
         |                             ^~~~~~~~~~~~~
   fs/ubifs/file.c:228:2: note: in expansion of macro 'dbg_gen'
     228 |  dbg_gen("ino %lu, pos %llu, len %u, i_size %lld",
         |  ^~~~~~~
   fs/ubifs/file.c:228:17: note: format string is defined here
     228 |  dbg_gen("ino %lu, pos %llu, len %u, i_size %lld",
         |               ~~^
         |                 |
         |                 long unsigned int
         |               %llu
   In file included from include/linux/kernel.h:15,
                    from include/linux/list.h:9,
                    from include/linux/wait.h:7,
                    from include/linux/wait_bit.h:8,
                    from include/linux/fs.h:6,
                    from fs/ubifs/ubifs.h:16,
                    from fs/ubifs/file.c:40:
   fs/ubifs/file.c: In function 'ubifs_write_end':
>> fs/ubifs/debug.h:158:11: warning: format '%lu' expects argument of type =
'long unsigned int', but argument 4 has type 'u64' {aka 'long long unsigned=
 int'} [-Wformat=3D]
     158 |  pr_debug("UBIFS DBG " type " (pid %d): " fmt "\n", current->pid=
,       \
         |           ^~~~~~~~~~~~
   include/linux/printk.h:283:21: note: in definition of macro 'pr_fmt'
     283 | #define pr_fmt(fmt) fmt
         |                     ^~~
>> include/linux/dynamic_debug.h:143:2: note: in expansion of macro '__dyna=
mic_func_call'
     143 |  __dynamic_func_call(__UNIQUE_ID(ddebug), fmt, func, ##__VA_ARGS=
__)
         |  ^~~~~~~~~~~~~~~~~~~
   include/linux/dynamic_debug.h:153:2: note: in expansion of macro '_dynam=
ic_func_call'
     153 |  _dynamic_func_call(fmt, __dynamic_pr_debug,  \
         |  ^~~~~~~~~~~~~~~~~~
>> include/linux/printk.h:330:2: note: in expansion of macro 'dynamic_pr_de=
bug'
     330 |  dynamic_pr_debug(fmt, ##__VA_ARGS__)
         |  ^~~~~~~~~~~~~~~~
>> fs/ubifs/debug.h:158:2: note: in expansion of macro 'pr_debug'
     158 |  pr_debug("UBIFS DBG " type " (pid %d): " fmt "\n", current->pid=
,       \
         |  ^~~~~~~~
   fs/ubifs/debug.h:170:29: note: in expansion of macro 'ubifs_dbg_msg'
     170 | #define dbg_gen(fmt, ...)   ubifs_dbg_msg("gen", fmt, ##__VA_ARG=
S__)
         |                             ^~~~~~~~~~~~~
   fs/ubifs/file.c:546:2: note: in expansion of macro 'dbg_gen'
     546 |  dbg_gen("ino %lu, pos %llu, pg %lu, len %u, copied %d, i_size %=
lld",
         |  ^~~~~~~
   fs/ubifs/file.c:546:17: note: format string is defined here
     546 |  dbg_gen("ino %lu, pos %llu, pg %lu, len %u, copied %d, i_size %=
lld",
         |               ~~^
         |                 |
         |                 long unsigned int
         |               %llu
   In file included from include/linux/kernel.h:15,
                    from include/linux/list.h:9,
                    from include/linux/wait.h:7,
                    from include/linux/wait_bit.h:8,
                    from include/linux/fs.h:6,
                    from fs/ubifs/ubifs.h:16,
                    from fs/ubifs/file.c:40:
   fs/ubifs/file.c: In function 'populate_page':
>> fs/ubifs/debug.h:158:11: warning: format '%lu' expects argument of type =
'long unsigned int', but argument 4 has type 'u64' {aka 'long long unsigned=
 int'} [-Wformat=3D]
     158 |  pr_debug("UBIFS DBG " type " (pid %d): " fmt "\n", current->pid=
,       \
         |           ^~~~~~~~~~~~
   include/linux/printk.h:283:21: note: in definition of macro 'pr_fmt'
     283 | #define pr_fmt(fmt) fmt
         |                     ^~~
>> include/linux/dynamic_debug.h:143:2: note: in expansion of macro '__dyna=
mic_func_call'
     143 |  __dynamic_func_call(__UNIQUE_ID(ddebug), fmt, func, ##__VA_ARGS=
__)
         |  ^~~~~~~~~~~~~~~~~~~
   include/linux/dynamic_debug.h:153:2: note: in expansion of macro '_dynam=
ic_func_call'
     153 |  _dynamic_func_call(fmt, __dynamic_pr_debug,  \
         |  ^~~~~~~~~~~~~~~~~~
>> include/linux/printk.h:330:2: note: in expansion of macro 'dynamic_pr_de=
bug'
     330 |  dynamic_pr_debug(fmt, ##__VA_ARGS__)
         |  ^~~~~~~~~~~~~~~~
>> fs/ubifs/debug.h:158:2: note: in expansion of macro 'pr_debug'
     158 |  pr_debug("UBIFS DBG " type " (pid %d): " fmt "\n", current->pid=
,       \
         |  ^~~~~~~~
   fs/ubifs/debug.h:170:29: note: in expansion of macro 'ubifs_dbg_msg'
     170 | #define dbg_gen(fmt, ...)   ubifs_dbg_msg("gen", fmt, ##__VA_ARG=
S__)
         |                             ^~~~~~~~~~~~~
   fs/ubifs/file.c:616:2: note: in expansion of macro 'dbg_gen'
     616 |  dbg_gen("ino %lu, pg %lu, i_size %lld, flags %#lx",
         |  ^~~~~~~
   fs/ubifs/file.c:616:17: note: format string is defined here
     616 |  dbg_gen("ino %lu, pg %lu, i_size %lld, flags %#lx",
         |               ~~^
         |                 |
         |                 long unsigned int
         |               %llu
   fs/ubifs/file.c:704:49: warning: format '%lu' expects argument of type '=
long unsigned int', but argument 4 has type 'u64' {aka 'long long unsigned =
int'} [-Wformat=3D]
     704 |  ubifs_err(c, "bad data node (block %u, inode %lu)",
         |                                               ~~^
         |                                                 |
         |                                                 long unsigned int
         |                                               %llu
     705 |     page_block, inode->i_ino);
         |                 ~~~~~~~~~~~~                     =

         |                      |
         |                      u64 {aka long long unsigned int}
   fs/ubifs/file.c: In function 'do_writepage':
   fs/ubifs/file.c:938:50: warning: format '%lu' expects argument of type '=
long unsigned int', but argument 4 has type 'u64' {aka 'long long unsigned =
int'} [-Wformat=3D]
     938 |   ubifs_err(c, "cannot write page %lu of inode %lu, error %d",
         |                                                ~~^
         |                                                  |
         |                                                  long unsigned i=
nt
         |                                                %llu
     939 |      page->index, inode->i_ino, err);
         |                   ~~~~~~~~~~~~                    =

         |                        |
         |                        u64 {aka long long unsigned int}
   In file included from include/linux/kernel.h:15,
                    from include/linux/list.h:9,
                    from include/linux/wait.h:7,
                    from include/linux/wait_bit.h:8,
                    from include/linux/fs.h:6,
                    from fs/ubifs/ubifs.h:16,
                    from fs/ubifs/file.c:40:
   fs/ubifs/file.c: In function 'ubifs_writepage':
>> fs/ubifs/debug.h:158:11: warning: format '%lu' expects argument of type =
'long unsigned int', but argument 4 has type 'u64' {aka 'long long unsigned=
 int'} [-Wformat=3D]
     158 |  pr_debug("UBIFS DBG " type " (pid %d): " fmt "\n", current->pid=
,       \
         |           ^~~~~~~~~~~~
   include/linux/printk.h:283:21: note: in definition of macro 'pr_fmt'
     283 | #define pr_fmt(fmt) fmt
         |                     ^~~
>> include/linux/dynamic_debug.h:143:2: note: in expansion of macro '__dyna=
mic_func_call'
     143 |  __dynamic_func_call(__UNIQUE_ID(ddebug), fmt, func, ##__VA_ARGS=
__)
         |  ^~~~~~~~~~~~~~~~~~~
   include/linux/dynamic_debug.h:153:2: note: in expansion of macro '_dynam=
ic_func_call'
     153 |  _dynamic_func_call(fmt, __dynamic_pr_debug,  \
         |  ^~~~~~~~~~~~~~~~~~
   include/linux/printk.h:330:2: note: in expansion of macro 'dynamic_pr_de=
bug'
     330 |  dynamic_pr_debug(fmt, ##__VA_ARGS__)
         |  ^~~~~~~~~~~~~~~~
   fs/ubifs/debug.h:158:2: note: in expansion of macro 'pr_debug'
     158 |  pr_debug("UBIFS DBG " type " (pid %d): " fmt "\n", current->pid=
,       \
         |  ^~~~~~~~
   fs/ubifs/debug.h:170:29: note: in expansion of macro 'ubifs_dbg_msg'
     170 | #define dbg_gen(fmt, ...)   ubifs_dbg_msg("gen", fmt, ##__VA_ARG=
S__)
         |                             ^~~~~~~~~~~~~
   fs/ubifs/file.c:1015:2: note: in expansion of macro 'dbg_gen'
    1015 |  dbg_gen("ino %lu, pg %lu, pg flags %#lx",
         |  ^~~~~~~
   fs/ubifs/file.c:1015:17: note: format string is defined here
    1015 |  dbg_gen("ino %lu, pg %lu, pg flags %#lx",
         |               ~~^
         |                 |
         |                 long unsigned int
         |               %llu
   In file included from include/linux/kernel.h:15,
                    from include/linux/list.h:9,
                    from include/linux/wait.h:7,
                    from include/linux/wait_bit.h:8,
                    from include/linux/fs.h:6,
                    from fs/ubifs/ubifs.h:16,
                    from fs/ubifs/file.c:40:
   fs/ubifs/file.c: In function 'ubifs_setattr':
   fs/ubifs/debug.h:158:11: warning: format '%lu' expects argument of type =
'long unsigned int', but argument 4 has type 'u64' {aka 'long long unsigned=
 int'} [-Wformat=3D]
     158 |  pr_debug("UBIFS DBG " type " (pid %d): " fmt "\n", current->pid=
,       \
         |           ^~~~~~~~~~~~
   include/linux/printk.h:283:21: note: in definition of macro 'pr_fmt'
     283 | #define pr_fmt(fmt) fmt
         |                     ^~~
   include/linux/dynamic_debug.h:143:2: note: in expansion of macro '__dyna=
mic_func_call'
     143 |  __dynamic_func_call(__UNIQUE_ID(ddebug), fmt, func, ##__VA_ARGS=
__)
         |  ^~~~~~~~~~~~~~~~~~~
   include/linux/dynamic_debug.h:153:2: note: in expansion of macro '_dynam=
ic_func_call'
     153 |  _dynamic_func_call(fmt, __dynamic_pr_debug,  \
         |  ^~~~~~~~~~~~~~~~~~
   include/linux/printk.h:330:2: note: in expansion of macro 'dynamic_pr_de=
bug'
     330 |  dynamic_pr_debug(fmt, ##__VA_ARGS__)
         |  ^~~~~~~~~~~~~~~~
   fs/ubifs/debug.h:158:2: note: in expansion of macro 'pr_debug'
     158 |  pr_debug("UBIFS DBG " type " (pid %d): " fmt "\n", current->pid=
,       \
         |  ^~~~~~~~
   fs/ubifs/debug.h:170:29: note: in expansion of macro 'ubifs_dbg_msg'
     170 | #define dbg_gen(fmt, ...)   ubifs_dbg_msg("gen", fmt, ##__VA_ARG=
S__)
         |                             ^~~~~~~~~~~~~
   fs/ubifs/file.c:1266:2: note: in expansion of macro 'dbg_gen'
    1266 |  dbg_gen("ino %lu, mode %#x, ia_valid %#x",
         |  ^~~~~~~
   fs/ubifs/file.c:1266:17: note: format string is defined here
    1266 |  dbg_gen("ino %lu, mode %#x, ia_valid %#x",
         |               ~~^
         |                 |
         |                 long unsigned int
         |               %llu
   fs/ubifs/file.c: In function 'ubifs_vm_page_mkwrite':
   fs/ubifs/file.c:1556:65: warning: format '%lu' expects argument of type =
'long unsigned int', but argument 3 has type 'u64' {aka 'long long unsigned=
 int'} [-Wformat=3D]
    1556 |    ubifs_warn(c, "out of space for mmapped file (inode number %l=
u)",
         |                                                               ~~^
         |                                                                 |
         |                                                                 =
long unsigned int
         |                                                               %l=
lu
    1557 |        inode->i_ino);
         |        ~~~~~~~~~~~~                                              =

         |             |
         |             u64 {aka long long unsigned int}
..

vim +124 fs/notify/fdinfo.c

be77196b809cdc Cyrill Gorcunov 2012-12-17  111  =

a3816ab0e8fe54 Joe Perches     2014-09-29  112  static void fanotify_fdinfo=
(struct seq_file *m, struct fsnotify_mark *mark)
be77196b809cdc Cyrill Gorcunov 2012-12-17  113  {
e6dbcafb744ab9 Cyrill Gorcunov 2012-12-17  114  	unsigned int mflags =3D 0;
be77196b809cdc Cyrill Gorcunov 2012-12-17  115  	struct inode *inode;
be77196b809cdc Cyrill Gorcunov 2012-12-17  116  =

e6dbcafb744ab9 Cyrill Gorcunov 2012-12-17  117  	if (mark->flags & FSNOTIFY=
_MARK_FLAG_IGNORED_SURV_MODIFY)
e6dbcafb744ab9 Cyrill Gorcunov 2012-12-17  118  		mflags |=3D FAN_MARK_IGNO=
RED_SURV_MODIFY;
e6dbcafb744ab9 Cyrill Gorcunov 2012-12-17  119  =

d6f7b98bc8147a Amir Goldstein  2018-04-20  120  	if (mark->connector->type =
=3D=3D FSNOTIFY_OBJ_TYPE_INODE) {
36f10f55ff1d28 Amir Goldstein  2018-06-23  121  		inode =3D igrab(fsnotify_=
conn_inode(mark->connector));
be77196b809cdc Cyrill Gorcunov 2012-12-17  122  		if (!inode)
a3816ab0e8fe54 Joe Perches     2014-09-29  123  			return;
a3816ab0e8fe54 Joe Perches     2014-09-29 @124  		seq_printf(m, "fanotify i=
no:%lx sdev:%x mflags:%x mask:%x ignored_mask:%x ",
be77196b809cdc Cyrill Gorcunov 2012-12-17  125  			   inode->i_ino, inode->=
i_sb->s_dev,
e6dbcafb744ab9 Cyrill Gorcunov 2012-12-17  126  			   mflags, mark->mask, m=
ark->ignored_mask);
a3816ab0e8fe54 Joe Perches     2014-09-29  127  		show_mark_fhandle(m, inod=
e);
a3816ab0e8fe54 Joe Perches     2014-09-29  128  		seq_putc(m, '\n');
be77196b809cdc Cyrill Gorcunov 2012-12-17  129  		iput(inode);
d6f7b98bc8147a Amir Goldstein  2018-04-20  130  	} else if (mark->connector=
->type =3D=3D FSNOTIFY_OBJ_TYPE_VFSMOUNT) {
36f10f55ff1d28 Amir Goldstein  2018-06-23  131  		struct mount *mnt =3D fsn=
otify_conn_mount(mark->connector);
be77196b809cdc Cyrill Gorcunov 2012-12-17  132  =

a3816ab0e8fe54 Joe Perches     2014-09-29  133  		seq_printf(m, "fanotify m=
nt_id:%x mflags:%x mask:%x ignored_mask:%x\n",
a3816ab0e8fe54 Joe Perches     2014-09-29  134  			   mnt->mnt_id, mflags, =
mark->mask, mark->ignored_mask);
1e6cb72399fd58 Amir Goldstein  2018-09-01  135  	} else if (mark->connector=
->type =3D=3D FSNOTIFY_OBJ_TYPE_SB) {
1e6cb72399fd58 Amir Goldstein  2018-09-01  136  		struct super_block *sb =
=3D fsnotify_conn_sb(mark->connector);
1e6cb72399fd58 Amir Goldstein  2018-09-01  137  =

1e6cb72399fd58 Amir Goldstein  2018-09-01  138  		seq_printf(m, "fanotify s=
dev:%x mflags:%x mask:%x ignored_mask:%x\n",
1e6cb72399fd58 Amir Goldstein  2018-09-01  139  			   sb->s_dev, mflags, ma=
rk->mask, mark->ignored_mask);
be77196b809cdc Cyrill Gorcunov 2012-12-17  140  	}
be77196b809cdc Cyrill Gorcunov 2012-12-17  141  }
be77196b809cdc Cyrill Gorcunov 2012-12-17  142  =


:::::: The code at line 124 was first introduced by commit
:::::: a3816ab0e8fe542a89a53b82506a8ddac063fbe3 fs: Convert show_fdinfo fun=
ctions to void

:::::: TO: Joe Perches <joe@perches.com>
:::::: CC: Steven Rostedt <rostedt@goodmis.org>

---
0-DAY CI Kernel Test Service, Intel Corporation
https://lists.01.org/hyperkitty/list/kbuild-all(a)lists.01.org

--===============4667270464659717834==
Content-Type: application/gzip
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: attachment; filename="config.gz"

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
OsBBNFlbj2XO+B/Ra8CVSqIBAA==
--===============4667270464659717834==--

