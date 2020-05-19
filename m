Content-Type: multipart/mixed; boundary="===============7148994195576240804=="
MIME-Version: 1.0
From: kbuild test robot <lkp@intel.com>
To: kbuild-all@lists.01.org
Subject: [nvdimm:libnvdimm-pending 284/291] include/linux/fs.h:908:29: error: storage class specified for parameter 'I_BDEV'
Date: Tue, 19 May 2020 18:47:03 +0800
Message-ID: <202005191847.czwoVCVS%lkp@intel.com>
List-Id: <oe-kbuild-all.lists.linux.dev>

--===============7148994195576240804==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/djbw/nvdimm.git lib=
nvdimm-pending
head:   4e2f899e682d1e6c647651bc36bcdba3b3577485
commit: 0b25105d34e381fafc7eb9395007727bbb4661a4 [284/291] x86, powerpc: Re=
name memcpy_mcsafe() to copy_mc_to_{user,kernel}()
config: powerpc-rhel-kconfig (attached as .config)
compiler: powerpc64le-linux-gcc (GCC) 9.3.0
reproduce:
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/=
make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        git checkout 0b25105d34e381fafc7eb9395007727bbb4661a4
        # save the attached .config to linux build tree
        COMPILER_INSTALL_PATH=3D$HOME/0day COMPILER=3Dgcc-9.3.0 make.cross =
ARCH=3Dpowerpc =


If you fix the issue, kindly add following tag as appropriate
Reported-by: kbuild test robot <lkp@intel.com>

All error/warnings (new ones prefixed by >>, old ones prefixed by <<):

| ^
include/linux/fs.h:540:1: error: expected '=3D', ',', ';', 'asm' or '__attr=
ibute__' before '{' token
540 | {
| ^
include/linux/fs.h:545:1: error: expected '=3D', ',', ';', 'asm' or '__attr=
ibute__' before '{' token
545 | {
| ^
include/linux/fs.h:553:1: error: expected '=3D', ',', ';', 'asm' or '__attr=
ibute__' before '{' token
553 | {
| ^
include/linux/fs.h:567:1: error: expected '=3D', ',', ';', 'asm' or '__attr=
ibute__' before '{' token
567 | {
| ^
include/linux/fs.h:572:1: error: expected '=3D', ',', ';', 'asm' or '__attr=
ibute__' before '{' token
572 | {
| ^
include/linux/fs.h:578:1: error: expected '=3D', ',', ';', 'asm' or '__attr=
ibute__' before '{' token
578 | {
| ^
include/linux/fs.h:583:1: error: expected '=3D', ',', ';', 'asm' or '__attr=
ibute__' before '{' token
583 | {
| ^
include/linux/fs.h:589:1: error: expected '=3D', ',', ';', 'asm' or '__attr=
ibute__' before '{' token
589 | {
| ^
include/linux/fs.h:604:1: warning: empty declaration
604 | struct posix_acl;
| ^~~~~~
include/linux/fs.h:610:1: error: expected '=3D', ',', ';', 'asm' or '__attr=
ibute__' before '{' token
610 | {
| ^
include/linux/fs.h:616:1: error: expected '=3D', ',', ';', 'asm' or '__attr=
ibute__' before '{' token
616 | {
| ^
include/linux/fs.h:626:1: warning: empty declaration
626 | struct fsnotify_mark_connector;
| ^~~~~~
include/linux/fs.h:668:20: error: field 'i_atime' has incomplete type
668 |  struct timespec64 i_atime;
|                    ^~~~~~~
include/linux/fs.h:669:20: error: field 'i_mtime' has incomplete type
669 |  struct timespec64 i_mtime;
|                    ^~~~~~~
include/linux/fs.h:670:20: error: field 'i_ctime' has incomplete type
670 |  struct timespec64 i_ctime;
|                    ^~~~~~~
include/linux/fs.h:633:1: warning: empty declaration
633 | struct inode {
| ^~~~~~
include/linux/fs.h:749:1: error: expected '=3D', ',', ';', 'asm' or '__attr=
ibute__' before '{' token
749 | {
| ^
include/linux/fs.h:754:1: error: expected '=3D', ',', ';', 'asm' or '__attr=
ibute__' before '{' token
754 | {
| ^
include/linux/fs.h:765:1: error: expected '=3D', ',', ';', 'asm' or '__attr=
ibute__' before '{' token
765 | {
| ^
include/linux/fs.h:785:1: warning: empty declaration
785 | enum inode_i_mutex_lock_class
| ^~~~
include/linux/fs.h:796:1: error: expected '=3D', ',', ';', 'asm' or '__attr=
ibute__' before '{' token
796 | {
| ^
include/linux/fs.h:801:1: error: expected '=3D', ',', ';', 'asm' or '__attr=
ibute__' before '{' token
801 | {
| ^
include/linux/fs.h:806:1: error: expected '=3D', ',', ';', 'asm' or '__attr=
ibute__' before '{' token
806 | {
| ^
include/linux/fs.h:811:1: error: expected '=3D', ',', ';', 'asm' or '__attr=
ibute__' before '{' token
811 | {
| ^
include/linux/fs.h:816:1: error: expected '=3D', ',', ';', 'asm' or '__attr=
ibute__' before '{' token
816 | {
| ^
include/linux/fs.h:821:1: error: expected '=3D', ',', ';', 'asm' or '__attr=
ibute__' before '{' token
821 | {
| ^
include/linux/fs.h:826:1: error: expected '=3D', ',', ';', 'asm' or '__attr=
ibute__' before '{' token
826 | {
| ^
include/linux/fs.h:831:1: error: expected '=3D', ',', ';', 'asm' or '__attr=
ibute__' before '{' token
831 | {
| ^
include/linux/fs.h:836:1: error: expected '=3D', ',', ';', 'asm' or '__attr=
ibute__' before '{' token
836 | {
| ^
include/linux/fs.h:854:1: error: expected '=3D', ',', ';', 'asm' or '__attr=
ibute__' before '{' token
854 | {
| ^
include/linux/fs.h:882:1: error: expected '=3D', ',', ';', 'asm' or '__attr=
ibute__' before '{' token
882 | {
| ^
include/linux/fs.h:899:1: error: expected '=3D', ',', ';', 'asm' or '__attr=
ibute__' before '{' token
899 | {
| ^
include/linux/fs.h:904:1: error: expected '=3D', ',', ';', 'asm' or '__attr=
ibute__' before '{' token
904 | {
| ^
>> include/linux/fs.h:908:29: error: storage class specified for parameter =
'I_BDEV'
908 | extern struct block_device *I_BDEV(struct inode *inode);
|                             ^~~~~~
>> include/linux/fs.h:913:16: error: field 'pid_type' has incomplete type
913 |  enum pid_type pid_type; /* Kind of process group SIGIO should be sen=
t to */
|                ^~~~~~~~
include/linux/fs.h:910:1: warning: empty declaration
910 | struct fown_struct {
| ^~~~~~
include/linux/fs.h:921:1: warning: empty declaration
921 | struct file_ra_state {
| ^~~~~~
include/linux/fs.h:936:1: error: expected '=3D', ',', ';', 'asm' or '__attr=
ibute__' before '{' token
936 | {
| ^
include/linux/fs.h:978:2: error: expected specifier-qualifier-list before '=
errseq_t'
978 |  errseq_t  f_wb_err;
|  ^~~~~~~~
include/linux/fs.h:941:1: warning: empty declaration
941 | struct file {
| ^~~~~~
include/linux/fs.h:982:1: warning: empty declaration
982 | struct file_handle {
| ^~~~~~
include/linux/fs.h:990:1: error: expected '=3D', ',', ';', 'asm' or '__attr=
ibute__' before '{' token
990 | {
| ^
>> include/linux/fs.h:1031:15: error: storage class specified for parameter=
 'fl_owner_t'
1031 | typedef void *fl_owner_t;
|               ^~~~~~~~~~
include/linux/fs.h:1033:1: warning: empty declaration
1033 | struct file_lock;
| ^~~~~~
include/linux/fs.h:1035:1: warning: empty declaration
1035 | struct file_lock_operations {
| ^~~~~~
>> include/linux/fs.h:1041:2: error: expected specifier-qualifier-list befo=
re 'fl_owner_t'
1041 |  fl_owner_t (*lm_get_owner)(fl_owner_t);
|  ^~~~~~~~~~
include/linux/fs.h:1040:1: warning: empty declaration
1040 | struct lock_manager_operations {
| ^~~~~~
include/linux/fs.h:1050:1: warning: empty declaration
1050 | struct lock_manager {
| ^~~~~~
include/linux/fs.h:1059:1: warning: empty declaration
1059 | struct net;
| ^~~~~~
In file included from include/linux/fs.h:1066,
from include/linux/compat.h:17,
from arch/powerpc/kernel/asm-offsets.c:14:
include/linux/nfs_fs_i.h:5:1: warning: empty declaration
5 | struct nlm_lockowner;
| ^~~~~~
include/linux/nfs_fs_i.h:10:1: warning: empty declaration
10 | struct nfs_lock_info {
| ^~~~~~
include/linux/nfs_fs_i.h:16:1: warning: empty declaration
16 | struct nfs4_lock_state;
| ^~~~~~
include/linux/nfs_fs_i.h:17:1: warning: empty declaration
17 | struct nfs4_lock_info {
| ^~~~~~
In file included from include/linux/compat.h:17,
from arch/powerpc/kernel/asm-offsets.c:14:
include/linux/fs.h:1095:2: error: expected specifier-qualifier-list before =
'fl_owner_t'
1095 |  fl_owner_t fl_owner;
|  ^~~~~~~~~~
include/linux/fs.h:1085:1: warning: empty declaration
1085 | struct file_lock {
| ^~~~~~
include/linux/fs.h:1123:1: warning: empty declaration
1123 | struct file_lock_context {
| ^~~~~~
>> include/linux/fs.h:1137:13: error: storage class specified for parameter=
 'send_sigio'
1137 | extern void send_sigio(struct fown_struct *fown, int fd, int band);
|             ^~~~~~~~~~
>> include/linux/fs.h:1142:12: error: storage class specified for parameter=
 'fcntl_getlk'
1142 | extern int fcntl_getlk(struct file *, unsigned int, struct flock *);
|            ^~~~~~~~~~~
>> include/linux/fs.h:1143:12: error: storage class specified for parameter=
 'fcntl_setlk'
1143 | extern int fcntl_setlk(unsigned int, struct file *, unsigned int,
|            ^~~~~~~~~~~
>> include/linux/fs.h:1152:12: error: storage class specified for parameter=
 'fcntl_setlease'
1152 | extern int fcntl_setlease(unsigned int fd, struct file *filp, long a=
rg);
|            ^~~~~~~~~~~~~~
>> include/linux/fs.h:1153:12: error: storage class specified for parameter=
 'fcntl_getlease'
1153 | extern int fcntl_getlease(struct file *filp);
|            ^~~~~~~~~~~~~~
>> include/linux/fs.h:1158:13: error: storage class specified for parameter=
 'locks_init_lock'
1158 | extern void locks_init_lock(struct file_lock *);
|             ^~~~~~~~~~~~~~~
>> include/linux/fs.h:1159:27: error: storage class specified for parameter=
 'locks_alloc_lock'
1159 | extern struct file_lock * locks_alloc_lock(void);
|                           ^~~~~~~~~~~~~~~~
>> include/linux/fs.h:1160:13: error: storage class specified for parameter=
 'locks_copy_lock'
1160 | extern void locks_copy_lock(struct file_lock *, struct file_lock *);
|             ^~~~~~~~~~~~~~~
>> include/linux/fs.h:1161:13: error: storage class specified for parameter=
 'locks_copy_conflock'
1161 | extern void locks_copy_conflock(struct file_lock *, struct file_lock=
 *);
|             ^~~~~~~~~~~~~~~~~~~
>> include/linux/fs.h:1162:47: error: expected declaration specifiers or '.=
..' before 'fl_owner_t'
1162 | extern void locks_remove_posix(struct file *, fl_owner_t);
|                                               ^~~~~~~~~~
>> include/linux/fs.h:1163:13: error: storage class specified for parameter=
 'locks_remove_file'
1163 | extern void locks_remove_file(struct file *);
|             ^~~~~~~~~~~~~~~~~
>> include/linux/fs.h:1164:13: error: storage class specified for parameter=
 'locks_release_private'
1164 | extern void locks_release_private(struct file_lock *);
|             ^~~~~~~~~~~~~~~~~~~~~
>> include/linux/fs.h:1165:13: error: storage class specified for parameter=
 'posix_test_lock'
1165 | extern void posix_test_lock(struct file *, struct file_lock *);
|             ^~~~~~~~~~~~~~~
>> include/linux/fs.h:1166:12: error: storage class specified for parameter=
 'posix_lock_file'
1166 | extern int posix_lock_file(struct file *, struct file_lock *, struct=
 file_lock *);
|            ^~~~~~~~~~~~~~~
>> include/linux/fs.h:1167:12: error: storage class specified for parameter=
 'locks_delete_block'
1167 | extern int locks_delete_block(struct file_lock *);
|            ^~~~~~~~~~~~~~~~~~
>> include/linux/fs.h:1168:12: error: storage class specified for parameter=
 'vfs_test_lock'
1168 | extern int vfs_test_lock(struct file *, struct file_lock *);
|            ^~~~~~~~~~~~~
include/linux/fs.h:1169:12: error: storage class specified for parameter 'v=
fs_lock_file'
1169 | extern int vfs_lock_file(struct file *, unsigned int, struct file_lo=
ck *, struct file_lock *);
|            ^~~~~~~~~~~~~
include/linux/fs.h:1170:12: error: storage class specified for parameter 'v=
fs_cancel_lock'
1170 | extern int vfs_cancel_lock(struct file *filp, struct file_lock *fl);
|            ^~~~~~~~~~~~~~~
include/linux/fs.h:1171:12: error: storage class specified for parameter 'l=
ocks_lock_inode_wait'
1171 | extern int locks_lock_inode_wait(struct inode *inode, struct file_lo=
ck *fl);
|            ^~~~~~~~~~~~~~~~~~~~~
include/linux/fs.h:1172:12: error: storage class specified for parameter '_=
_break_lease'
1172 | extern int __break_lease(struct inode *inode, unsigned int flags, un=
signed int type);
|            ^~~~~~~~~~~~~
include/linux/fs.h:1173:13: error: storage class specified for parameter 'l=
ease_get_mtime'
1173 | extern void lease_get_mtime(struct inode *, struct timespec64 *time);
|             ^~~~~~~~~~~~~~~
include/linux/fs.h:1174:12: error: storage class specified for parameter 'g=
eneric_setlease'
1174 | extern int generic_setlease(struct file *, long, struct file_lock **=
, void **priv);
|            ^~~~~~~~~~~~~~~~
include/linux/fs.h:1175:12: error: storage class specified for parameter 'v=
fs_setlease'
1175 | extern int vfs_setlease(struct file *, long, struct file_lock **, vo=
id **);
|            ^~~~~~~~~~~~
include/linux/fs.h:1176:12: error: storage class specified for parameter 'l=
ease_modify'
1176 | extern int lease_modify(struct file_lock *, int, struct list_head *);
|            ^~~~~~~~~~~~
include/linux/fs.h:1178:1: warning: empty declaration
1178 | struct notifier_block;
| ^~~~~~
include/linux/fs.h:1179:12: error: storage class specified for parameter 'l=
ease_register_notifier'
1179 | extern int lease_register_notifier(struct notifier_block *);
|            ^~~~~~~~~~~~~~~~~~~~~~~
include/linux/fs.h:1180:13: error: storage class specified for parameter 'l=
ease_unregister_notifier'
1180 | extern void lease_unregister_notifier(struct notifier_block *);
|             ^~~~~~~~~~~~~~~~~~~~~~~~~
include/linux/fs.h:1182:1: warning: empty declaration
1182 | struct files_struct;
| ^~~~~~
include/linux/fs.h:1183:13: error: storage class specified for parameter 's=
how_fd_locks'
1183 | extern void show_fd_locks(struct seq_file *f,
|             ^~~~~~~~~~~~~
include/linux/fs.h:1323:1: error: expected '=3D', ',', ';', 'asm' or '__att=
ribute__' before '{' token
1323 | {
| ^
include/linux/fs.h:1328:1: error: expected '=3D', ',', ';', 'asm' or '__att=
ribute__' before '{' token
1328 | {
| ^
include/linux/fs.h:1333:1: error: expected '=3D', ',', ';', 'asm' or '__att=
ribute__' before '{' token
1333 | {
| ^
include/linux/fs.h:1337:1: warning: empty declaration
1337 | struct fasync_struct {
| ^~~~~~
include/linux/fs.h:1349:12: error: storage class specified for parameter 'f=
async_helper'
1349 | extern int fasync_helper(int, struct file *, int, struct fasync_stru=
ct **);
|            ^~~~~~~~~~~~~
include/linux/fs.h:1350:30: error: storage class specified for parameter 'f=
async_insert_entry'
1350 | extern struct fasync_struct *fasync_insert_entry(int, struct file *,=
 struct fasync_struct **, struct fasync_struct *);
|                              ^~~~~~~~~~~~~~~~~~~
include/linux/fs.h:1351:12: error: storage class specified for parameter 'f=
async_remove_entry'
1351 | extern int fasync_remove_entry(struct file *, struct fasync_struct *=
*);
|            ^~~~~~~~~~~~~~~~~~~
include/linux/fs.h:1352:30: error: storage class specified for parameter 'f=
async_alloc'
1352 | extern struct fasync_struct *fasync_alloc(void);
|                              ^~~~~~~~~~~~
include/linux/fs.h:1353:13: error: storage class specified for parameter 'f=
async_free'
1353 | extern void fasync_free(struct fasync_struct *);
|             ^~~~~~~~~~~
include/linux/fs.h:1356:13: error: storage class specified for parameter 'k=
ill_fasync'
1356 | extern void kill_fasync(struct fasync_struct **, int, int);
|             ^~~~~~~~~~~
include/linux/fs.h:1358:13: error: storage class specified for parameter '_=
_f_setown'
1358 | extern void __f_setown(struct file *filp, struct pid *, enum pid_typ=
e, int force);
|             ^~~~~~~~~~
include/linux/fs.h:1359:12: error: storage class specified for parameter 'f=
_setown'
1359 | extern int f_setown(struct file *filp, unsigned long arg, int force);
|            ^~~~~~~~
include/linux/fs.h:1360:13: error: storage class specified for parameter 'f=
_delown'
1360 | extern void f_delown(struct file *filp);
|             ^~~~~~~~
include/linux/fs.h:1361:14: error: storage class specified for parameter 'f=
_getown'
1361 | extern pid_t f_getown(struct file *filp);
|              ^~~~~~~~
include/linux/fs.h:1362:12: error: storage class specified for parameter 's=
end_sigurg'
1362 | extern int send_sigurg(struct fown_struct *fown);
|            ^~~~~~~~~~~
include/linux/fs.h:1413:1: warning: empty declaration
1413 | enum {
| ^~~~
include/linux/fs.h:1424:1: warning: empty declaration
1424 | struct sb_writers {
| ^~~~~~
include/linux/fs.h:1488:2: error: expected specifier-qualifier-list before =
'uuid_t'
1488 |  uuid_t   s_uuid;  /* UUID */
|  ^~~~~~
include/linux/fs.h:1430:1: warning: empty declaration
1430 | struct super_block {
| ^~~~~~
include/linux/fs.h:1565:1: error: expected '=3D', ',', ';', 'asm' or '__att=
ribute__' before '{' token
1565 | {

vim +/I_BDEV +908 include/linux/fs.h

^1da177e4c3f4152 Linus Torvalds       2005-04-16   875  =

7762f5a0b709b415 Miklos Szeredi       2006-10-17   876  /*
7762f5a0b709b415 Miklos Szeredi       2006-10-17   877   * NOTE: unlike i_s=
ize_read(), i_size_write() does need locking around it
7762f5a0b709b415 Miklos Szeredi       2006-10-17   878   * (normally i_mute=
x), otherwise on 32bit/SMP an update of i_size_seqcount
7762f5a0b709b415 Miklos Szeredi       2006-10-17   879   * can be lost, res=
ulting in subsequent i_size_read() calls spinning forever.
7762f5a0b709b415 Miklos Szeredi       2006-10-17   880   */
^1da177e4c3f4152 Linus Torvalds       2005-04-16   881  static inline void =
i_size_write(struct inode *inode, loff_t i_size)
^1da177e4c3f4152 Linus Torvalds       2005-04-16  @882  {
^1da177e4c3f4152 Linus Torvalds       2005-04-16   883  #if BITS_PER_LONG=
=3D=3D32 && defined(CONFIG_SMP)
74e3d1e17b2e11d1 Fan Du               2013-04-30   884  	preempt_disable();
^1da177e4c3f4152 Linus Torvalds       2005-04-16   885  	write_seqcount_beg=
in(&inode->i_size_seqcount);
^1da177e4c3f4152 Linus Torvalds       2005-04-16   886  	inode->i_size =3D =
i_size;
^1da177e4c3f4152 Linus Torvalds       2005-04-16   887  	write_seqcount_end=
(&inode->i_size_seqcount);
74e3d1e17b2e11d1 Fan Du               2013-04-30   888  	preempt_enable();
2496396fcb44404e Thomas Gleixner      2019-10-15   889  #elif BITS_PER_LONG=
=3D=3D32 && defined(CONFIG_PREEMPTION)
^1da177e4c3f4152 Linus Torvalds       2005-04-16   890  	preempt_disable();
^1da177e4c3f4152 Linus Torvalds       2005-04-16   891  	inode->i_size =3D =
i_size;
^1da177e4c3f4152 Linus Torvalds       2005-04-16   892  	preempt_enable();
^1da177e4c3f4152 Linus Torvalds       2005-04-16   893  #else
^1da177e4c3f4152 Linus Torvalds       2005-04-16   894  	inode->i_size =3D =
i_size;
^1da177e4c3f4152 Linus Torvalds       2005-04-16   895  #endif
^1da177e4c3f4152 Linus Torvalds       2005-04-16   896  }
^1da177e4c3f4152 Linus Torvalds       2005-04-16   897  =

48ed214d10ae3c39 Jan Engelhardt       2006-12-06   898  static inline unsig=
ned iminor(const struct inode *inode)
^1da177e4c3f4152 Linus Torvalds       2005-04-16  @899  {
^1da177e4c3f4152 Linus Torvalds       2005-04-16   900  	return MINOR(inode=
->i_rdev);
^1da177e4c3f4152 Linus Torvalds       2005-04-16   901  }
^1da177e4c3f4152 Linus Torvalds       2005-04-16   902  =

48ed214d10ae3c39 Jan Engelhardt       2006-12-06   903  static inline unsig=
ned imajor(const struct inode *inode)
^1da177e4c3f4152 Linus Torvalds       2005-04-16   904  {
^1da177e4c3f4152 Linus Torvalds       2005-04-16   905  	return MAJOR(inode=
->i_rdev);
^1da177e4c3f4152 Linus Torvalds       2005-04-16   906  }
^1da177e4c3f4152 Linus Torvalds       2005-04-16   907  =

^1da177e4c3f4152 Linus Torvalds       2005-04-16  @908  extern struct block=
_device *I_BDEV(struct inode *inode);
^1da177e4c3f4152 Linus Torvalds       2005-04-16   909  =

^1da177e4c3f4152 Linus Torvalds       2005-04-16   910  struct fown_struct {
^1da177e4c3f4152 Linus Torvalds       2005-04-16   911  	rwlock_t lock;    =
      /* protects pid, uid, euid fields */
609d7fa9565c7544 Eric W. Biederman    2006-10-02   912  	struct pid *pid;	/=
* pid or -pgrp where SIGIO should be sent */
609d7fa9565c7544 Eric W. Biederman    2006-10-02  @913  	enum pid_type pid_=
type;	/* Kind of process group SIGIO should be sent to */
92361636e0153bd0 Eric W. Biederman    2012-02-08   914  	kuid_t uid, euid;	=
/* uid/euid of process setting the owner */
^1da177e4c3f4152 Linus Torvalds       2005-04-16   915  	int signum;		/* po=
six.1b rt signal to be delivered on IO */
^1da177e4c3f4152 Linus Torvalds       2005-04-16   916  };
^1da177e4c3f4152 Linus Torvalds       2005-04-16   917  =

^1da177e4c3f4152 Linus Torvalds       2005-04-16   918  /*
^1da177e4c3f4152 Linus Torvalds       2005-04-16   919   * Track a single f=
ile's readahead state
^1da177e4c3f4152 Linus Torvalds       2005-04-16   920   */
^1da177e4c3f4152 Linus Torvalds       2005-04-16   921  struct file_ra_stat=
e {
f9acc8c7b35a100f Fengguang Wu         2007-07-19   922  	pgoff_t start;			/=
* where readahead started */
937085aa35cc873d Fengguang Wu         2007-10-16   923  	unsigned int size;=
		/* # of readahead pages */
937085aa35cc873d Fengguang Wu         2007-10-16   924  	unsigned int async=
_size;	/* do asynchronous readahead when
f9acc8c7b35a100f Fengguang Wu         2007-07-19   925  					   there are o=
nly # of pages ahead */
5ce1110b92b31d07 Fengguang Wu         2007-07-19   926  =

937085aa35cc873d Fengguang Wu         2007-10-16   927  	unsigned int ra_pa=
ges;		/* Maximum readahead window */
1ebf26a9b338534d Wu Fengguang         2009-06-16   928  	unsigned int mmap_=
miss;		/* Cache miss stat for mmap accesses */
f4e6b498d6e06742 Fengguang Wu         2007-10-16   929  	loff_t prev_pos;		=
/* Cache last read() position */
^1da177e4c3f4152 Linus Torvalds       2005-04-16   930  };
^1da177e4c3f4152 Linus Torvalds       2005-04-16   931  =

5ce1110b92b31d07 Fengguang Wu         2007-07-19   932  /*
5ce1110b92b31d07 Fengguang Wu         2007-07-19   933   * Check if @index =
falls in the readahead windows.
5ce1110b92b31d07 Fengguang Wu         2007-07-19   934   */
5ce1110b92b31d07 Fengguang Wu         2007-07-19   935  static inline int r=
a_has_index(struct file_ra_state *ra, pgoff_t index)
5ce1110b92b31d07 Fengguang Wu         2007-07-19   936  {
f9acc8c7b35a100f Fengguang Wu         2007-07-19   937  	return (index >=3D=
 ra->start &&
f9acc8c7b35a100f Fengguang Wu         2007-07-19   938  		index <  ra->star=
t + ra->size);
5ce1110b92b31d07 Fengguang Wu         2007-07-19   939  }
5ce1110b92b31d07 Fengguang Wu         2007-07-19   940  =

^1da177e4c3f4152 Linus Torvalds       2005-04-16  @941  struct file {
2f51201662b28dbf Eric Dumazet         2005-10-30   942  	union {
4f5e65a1cc90bbb1 Oleg Nesterov        2013-07-08   943  		struct llist_node=
	fu_llist;
2f51201662b28dbf Eric Dumazet         2005-10-30   944  		struct rcu_head 	=
fu_rcuhead;
2f51201662b28dbf Eric Dumazet         2005-10-30   945  	} f_u;
0f7fc9e4d03987fe Josef "Jeff" Sipek   2006-12-08   946  	struct path		f_pat=
h;
dd37978c50bc8b35 Al Viro              2013-03-01   947  	struct inode		*f_i=
node;	/* cached value */
99ac48f54a91d021 Arjan van de Ven     2006-03-28   948  	const struct file_=
operations	*f_op;
ef3d0fd27e90f67e Andi Kleen           2011-09-15   949  =

ef3d0fd27e90f67e Andi Kleen           2011-09-15   950  	/*
9c225f2655e36a47 Linus Torvalds       2014-03-03   951  	 * Protects f_ep_l=
inks, f_flags.
ef3d0fd27e90f67e Andi Kleen           2011-09-15   952  	 * Must not be tak=
en from IRQ context.
ef3d0fd27e90f67e Andi Kleen           2011-09-15   953  	 */
ef3d0fd27e90f67e Andi Kleen           2011-09-15   954  	spinlock_t		f_lock;
c75b1d9421f80f41 Jens Axboe           2017-06-27   955  	enum rw_hint		f_wr=
ite_hint;
516e0cc5646f377a Al Viro              2008-07-26   956  	atomic_long_t		f_c=
ount;
^1da177e4c3f4152 Linus Torvalds       2005-04-16   957  	unsigned int 		f_f=
lags;
aeb5d727062a0238 Al Viro              2008-09-02   958  	fmode_t			f_mode;
9c225f2655e36a47 Linus Torvalds       2014-03-03   959  	struct mutex		f_po=
s_lock;
^1da177e4c3f4152 Linus Torvalds       2005-04-16   960  	loff_t			f_pos;
^1da177e4c3f4152 Linus Torvalds       2005-04-16   961  	struct fown_struct=
	f_owner;
d76b0d9b2d87cfc9 David Howells        2008-11-14   962  	const struct cred	=
*f_cred;
^1da177e4c3f4152 Linus Torvalds       2005-04-16   963  	struct file_ra_sta=
te	f_ra;
^1da177e4c3f4152 Linus Torvalds       2005-04-16   964  =

2b47c3611de05c58 Mathieu Desnoyers    2007-10-16   965  	u64			f_version;
50462062a02226a6 Alexey Dobriyan      2006-09-29   966  #ifdef CONFIG_SECUR=
ITY
^1da177e4c3f4152 Linus Torvalds       2005-04-16   967  	void			*f_security;
50462062a02226a6 Alexey Dobriyan      2006-09-29   968  #endif
^1da177e4c3f4152 Linus Torvalds       2005-04-16   969  	/* needed for tty =
driver, and maybe others */
^1da177e4c3f4152 Linus Torvalds       2005-04-16   970  	void			*private_da=
ta;
^1da177e4c3f4152 Linus Torvalds       2005-04-16   971  =

^1da177e4c3f4152 Linus Torvalds       2005-04-16   972  #ifdef CONFIG_EPOLL
^1da177e4c3f4152 Linus Torvalds       2005-04-16   973  	/* Used by fs/even=
tpoll.c to link all the hooks to this file */
^1da177e4c3f4152 Linus Torvalds       2005-04-16   974  	struct list_head	f=
_ep_links;
28d82dc1c4edbc35 Jason Baron          2012-01-12   975  	struct list_head	f=
_tfile_llink;
^1da177e4c3f4152 Linus Torvalds       2005-04-16   976  #endif /* #ifdef CO=
NFIG_EPOLL */
^1da177e4c3f4152 Linus Torvalds       2005-04-16   977  	struct address_spa=
ce	*f_mapping;
5660e13d2fd6af19 Jeff Layton          2017-07-06   978  	errseq_t		f_wb_err;
3859a271a003aba0 Kees Cook            2016-10-28   979  } __randomize_layout
3859a271a003aba0 Kees Cook            2016-10-28   980    __attribute__((al=
igned(4)));	/* lest something weird decides that 2 is OK */
^1da177e4c3f4152 Linus Torvalds       2005-04-16   981  =

990d6c2d7aee921e Aneesh Kumar K.V     2011-01-29   982  struct file_handle {
990d6c2d7aee921e Aneesh Kumar K.V     2011-01-29   983  	__u32 handle_bytes;
990d6c2d7aee921e Aneesh Kumar K.V     2011-01-29   984  	int handle_type;
990d6c2d7aee921e Aneesh Kumar K.V     2011-01-29   985  	/* file identifier=
 */
990d6c2d7aee921e Aneesh Kumar K.V     2011-01-29   986  	unsigned char f_ha=
ndle[0];
990d6c2d7aee921e Aneesh Kumar K.V     2011-01-29   987  };
990d6c2d7aee921e Aneesh Kumar K.V     2011-01-29   988  =

cb0942b81249798e Al Viro              2012-08-27   989  static inline struc=
t file *get_file(struct file *f)
cb0942b81249798e Al Viro              2012-08-27   990  {
cb0942b81249798e Al Viro              2012-08-27   991  	atomic_long_inc(&f=
->f_count);
cb0942b81249798e Al Viro              2012-08-27   992  	return f;
cb0942b81249798e Al Viro              2012-08-27   993  }
091141a42e15fe47 Jens Axboe           2018-11-21   994  #define get_file_rc=
u_many(x, cnt)	\
091141a42e15fe47 Jens Axboe           2018-11-21   995  	atomic_long_add_un=
less(&(x)->f_count, (cnt), 0)
091141a42e15fe47 Jens Axboe           2018-11-21   996  #define get_file_rc=
u(x) get_file_rcu_many((x), 1)
516e0cc5646f377a Al Viro              2008-07-26   997  #define file_count(=
x)	atomic_long_read(&(x)->f_count)
^1da177e4c3f4152 Linus Torvalds       2005-04-16   998  =

^1da177e4c3f4152 Linus Torvalds       2005-04-16   999  #define	MAX_NON_LFS=
	((1UL<<31) - 1)
^1da177e4c3f4152 Linus Torvalds       2005-04-16  1000  =

^1da177e4c3f4152 Linus Torvalds       2005-04-16  1001  /* Page cache limit=
. The filesystems should put that into their s_maxbytes =

^1da177e4c3f4152 Linus Torvalds       2005-04-16  1002     limits, otherwis=
e bad things can happen in VM. */ =

^1da177e4c3f4152 Linus Torvalds       2005-04-16  1003  #if BITS_PER_LONG=
=3D=3D32
0cc3b0ec23ce4c69 Linus Torvalds       2017-08-27  1004  #define MAX_LFS_FIL=
ESIZE	((loff_t)ULONG_MAX << PAGE_SHIFT)
^1da177e4c3f4152 Linus Torvalds       2005-04-16  1005  #elif BITS_PER_LONG=
=3D=3D64
0cc3b0ec23ce4c69 Linus Torvalds       2017-08-27  1006  #define MAX_LFS_FIL=
ESIZE 	((loff_t)LLONG_MAX)
^1da177e4c3f4152 Linus Torvalds       2005-04-16  1007  #endif
^1da177e4c3f4152 Linus Torvalds       2005-04-16  1008  =

^1da177e4c3f4152 Linus Torvalds       2005-04-16  1009  #define FL_POSIX	1
^1da177e4c3f4152 Linus Torvalds       2005-04-16  1010  #define FL_FLOCK	2
617588d5186c887e J. Bruce Fields      2011-07-01  1011  #define FL_DELEG	4	=
/* NFSv4 delegation */
^1da177e4c3f4152 Linus Torvalds       2005-04-16  1012  #define FL_ACCESS	8=
	/* not trying to lock, just looking */
f475ae957db66650 Trond Myklebust      2006-06-29  1013  #define FL_EXISTS	1=
6	/* when unlocking, test for existence */
^1da177e4c3f4152 Linus Torvalds       2005-04-16  1014  #define FL_LEASE	32=
	/* lease held on this file */
75e1fcc0b18df0a6 Miklos Szeredi       2006-06-23  1015  #define FL_CLOSE	64=
	/* unlock on close */
^1da177e4c3f4152 Linus Torvalds       2005-04-16  1016  #define FL_SLEEP	12=
8	/* A blocking lock */
778fc546f749c588 J. Bruce Fields      2011-07-26  1017  #define FL_DOWNGRAD=
E_PENDING	256 /* Lease is being downgraded */
778fc546f749c588 J. Bruce Fields      2011-07-26  1018  #define FL_UNLOCK_P=
ENDING	512 /* Lease is being broken */
cff2fce58b2b0f59 Jeff Layton          2014-04-22  1019  #define FL_OFDLCK	1=
024	/* lock is "owned" by struct file */
11afe9f76e121e96 Christoph Hellwig    2015-01-21  1020  #define FL_LAYOUT	2=
048	/* outstanding pNFS layout */
^1da177e4c3f4152 Linus Torvalds       2005-04-16  1021  =

50f2112cf7a3e62a Benjamin Coddington  2017-04-11  1022  #define FL_CLOSE_PO=
SIX (FL_POSIX | FL_CLOSE)
50f2112cf7a3e62a Benjamin Coddington  2017-04-11  1023  =

bde74e4bc64415b1 Miklos Szeredi       2008-07-25  1024  /*
bde74e4bc64415b1 Miklos Szeredi       2008-07-25  1025   * Special return v=
alue from posix_lock_file() and vfs_lock_file() for
bde74e4bc64415b1 Miklos Szeredi       2008-07-25  1026   * asynchronous loc=
king.
bde74e4bc64415b1 Miklos Szeredi       2008-07-25  1027   */
bde74e4bc64415b1 Miklos Szeredi       2008-07-25  1028  #define FILE_LOCK_D=
EFERRED 1
bde74e4bc64415b1 Miklos Szeredi       2008-07-25  1029  =

7ca76311fe6c397e Jeff Layton          2014-09-01  1030  /* legacy typedef, =
should eventually be removed */
17fa388ddceb89e9 Christoph Hellwig    2014-07-13 @1031  typedef void *fl_ow=
ner_t;
^1da177e4c3f4152 Linus Torvalds       2005-04-16  1032  =

a7231a97467d5a0c Jeff Layton          2015-01-16  1033  struct file_lock;
a7231a97467d5a0c Jeff Layton          2015-01-16  1034  =

^1da177e4c3f4152 Linus Torvalds       2005-04-16  1035  struct file_lock_op=
erations {
^1da177e4c3f4152 Linus Torvalds       2005-04-16  1036  	void (*fl_copy_loc=
k)(struct file_lock *, struct file_lock *);
^1da177e4c3f4152 Linus Torvalds       2005-04-16  1037  	void (*fl_release_=
private)(struct file_lock *);
^1da177e4c3f4152 Linus Torvalds       2005-04-16  1038  };
^1da177e4c3f4152 Linus Torvalds       2005-04-16  1039  =

^1da177e4c3f4152 Linus Torvalds       2005-04-16  1040  struct lock_manager=
_operations {
cae80b305e1c3944 Jeff Layton          2015-04-03 @1041  	fl_owner_t (*lm_ge=
t_owner)(fl_owner_t);
cae80b305e1c3944 Jeff Layton          2015-04-03  1042  	void (*lm_put_owne=
r)(fl_owner_t);
8fb47a4fbf858a16 J. Bruce Fields      2011-07-20  1043  	void (*lm_notify)(=
struct file_lock *);	/* unblock callback */
d0449b90f80f263e Joe Perches          2014-08-22  1044  	int (*lm_grant)(st=
ruct file_lock *, int);
4d01b7f5e7576858 Jeff Layton          2014-09-01  1045  	bool (*lm_break)(s=
truct file_lock *);
7448cc37b1a6b620 Jeff Layton          2015-01-16  1046  	int (*lm_change)(s=
truct file_lock *, int, struct list_head *);
1c7dd2ff430fa14b Jeff Layton          2014-08-22  1047  	void (*lm_setup)(s=
truct file_lock *, void **);
^1da177e4c3f4152 Linus Torvalds       2005-04-16  1048  };
^1da177e4c3f4152 Linus Torvalds       2005-04-16  1049  =

af558e33bedab672 J. Bruce Fields      2007-09-06  1050  struct lock_manager=
 {
af558e33bedab672 J. Bruce Fields      2007-09-06  1051  	struct list_head l=
ist;
c87fb4a378f93f11 J. Bruce Fields      2015-08-06  1052  	/*
c87fb4a378f93f11 J. Bruce Fields      2015-08-06  1053  	 * NFSv4 and up al=
so want opens blocked during the grace period;
c87fb4a378f93f11 J. Bruce Fields      2015-08-06  1054  	 * NLM doesn't car=
e:
c87fb4a378f93f11 J. Bruce Fields      2015-08-06  1055  	 */
c87fb4a378f93f11 J. Bruce Fields      2015-08-06  1056  	bool block_opens;
af558e33bedab672 J. Bruce Fields      2007-09-06  1057  };
af558e33bedab672 J. Bruce Fields      2007-09-06  1058  =

5ccb0066f2d56154 Stanislav Kinsbursky 2012-07-25  1059  struct net;
5ccb0066f2d56154 Stanislav Kinsbursky 2012-07-25  1060  void locks_start_gr=
ace(struct net *, struct lock_manager *);
af558e33bedab672 J. Bruce Fields      2007-09-06  1061  void locks_end_grac=
e(struct lock_manager *);
003278e431bffa40 Corentin Labbe       2017-09-26  1062  bool locks_in_grace=
(struct net *);
003278e431bffa40 Corentin Labbe       2017-09-26  1063  bool opens_in_grace=
(struct net *);
af558e33bedab672 J. Bruce Fields      2007-09-06  1064  =

^1da177e4c3f4152 Linus Torvalds       2005-04-16  1065  /* that will die - =
we need it for nfs_lock_info */
^1da177e4c3f4152 Linus Torvalds       2005-04-16  1066  #include <linux/nfs=
_fs_i.h>
^1da177e4c3f4152 Linus Torvalds       2005-04-16  1067  =

1cb360125966cb6c Jeff Layton          2013-06-21  1068  /*
1cb360125966cb6c Jeff Layton          2013-06-21  1069   * struct file_lock=
 represents a generic "file lock". It's used to represent
1cb360125966cb6c Jeff Layton          2013-06-21  1070   * POSIX byte range=
 locks, BSD (flock) locks, and leases. It's important to
1cb360125966cb6c Jeff Layton          2013-06-21  1071   * note that the sa=
me struct is used to represent both a request for a lock and
1cb360125966cb6c Jeff Layton          2013-06-21  1072   * the lock itself,=
 but the same object is never used for both.
1cb360125966cb6c Jeff Layton          2013-06-21  1073   *
1cb360125966cb6c Jeff Layton          2013-06-21  1074   * FIXME: should we=
 create a separate "struct lock_request" to help distinguish
1cb360125966cb6c Jeff Layton          2013-06-21  1075   * these two uses?
1cb360125966cb6c Jeff Layton          2013-06-21  1076   *
8116bf4cb62d337c Jeff Layton          2015-01-21  1077   * The varous i_flc=
tx lists are ordered by:
1cb360125966cb6c Jeff Layton          2013-06-21  1078   *
8116bf4cb62d337c Jeff Layton          2015-01-21  1079   * 1) lock owner
8116bf4cb62d337c Jeff Layton          2015-01-21  1080   * 2) lock range st=
art
8116bf4cb62d337c Jeff Layton          2015-01-21  1081   * 3) lock range end
1cb360125966cb6c Jeff Layton          2013-06-21  1082   *
1cb360125966cb6c Jeff Layton          2013-06-21  1083   * Obviously, the l=
ast two criteria only matter for POSIX locks.
1cb360125966cb6c Jeff Layton          2013-06-21  1084   */
^1da177e4c3f4152 Linus Torvalds       2005-04-16 @1085  struct file_lock {
ada5c1da8660ecae NeilBrown            2018-11-30  1086  	struct file_lock *=
fl_blocker;	/* The lock, that is blocking us */
6dee60f69d48fcef Jeff Layton          2015-01-16  1087  	struct list_head f=
l_list;	/* link into file_lock_context */
139ca04ee572fea6 Jeff Layton          2013-06-21  1088  	struct hlist_node =
fl_link;	/* node in global lists */
ada5c1da8660ecae NeilBrown            2018-11-30  1089  	struct list_head f=
l_blocked_requests;	/* list of requests with
ada5c1da8660ecae NeilBrown            2018-11-30  1090  						 * ->fl_block=
er pointing here
ada5c1da8660ecae NeilBrown            2018-11-30  1091  						 */
ada5c1da8660ecae NeilBrown            2018-11-30  1092  	struct list_head f=
l_blocked_member;	/* node in
ada5c1da8660ecae NeilBrown            2018-11-30  1093  						 * ->fl_block=
er->fl_blocked_requests
ada5c1da8660ecae NeilBrown            2018-11-30  1094  						 */
^1da177e4c3f4152 Linus Torvalds       2005-04-16 @1095  	fl_owner_t fl_owne=
r;
710b7216964d6455 J. Bruce Fields      2011-07-26  1096  	unsigned int fl_fl=
ags;
afc1246f917c664b Richard Kennedy      2008-07-11  1097  	unsigned char fl_t=
ype;
^1da177e4c3f4152 Linus Torvalds       2005-04-16  1098  	unsigned int fl_pi=
d;
7012b02a2b2c42bb Jeff Layton          2013-06-21  1099  	int fl_link_cpu;		=
/* what cpu's list is this on? */
^1da177e4c3f4152 Linus Torvalds       2005-04-16  1100  	wait_queue_head_t =
fl_wait;
^1da177e4c3f4152 Linus Torvalds       2005-04-16  1101  	struct file *fl_fi=
le;
^1da177e4c3f4152 Linus Torvalds       2005-04-16  1102  	loff_t fl_start;
^1da177e4c3f4152 Linus Torvalds       2005-04-16  1103  	loff_t fl_end;
^1da177e4c3f4152 Linus Torvalds       2005-04-16  1104  =

^1da177e4c3f4152 Linus Torvalds       2005-04-16  1105  	struct fasync_stru=
ct *	fl_fasync; /* for lease break notifications */
778fc546f749c588 J. Bruce Fields      2011-07-26  1106  	/* for lease break=
s: */
778fc546f749c588 J. Bruce Fields      2011-07-26  1107  	unsigned long fl_b=
reak_time;
778fc546f749c588 J. Bruce Fields      2011-07-26  1108  	unsigned long fl_d=
owngrade_time;
^1da177e4c3f4152 Linus Torvalds       2005-04-16  1109  =

6aed62853c72e29f Alexey Dobriyan      2009-09-21  1110  	const struct file_=
lock_operations *fl_ops;	/* Callbacks for filesystems */
7b021967c5e14639 Alexey Dobriyan      2009-09-21  1111  	const struct lock_=
manager_operations *fl_lmops;	/* Callbacks for lockmanagers */
^1da177e4c3f4152 Linus Torvalds       2005-04-16  1112  	union {
^1da177e4c3f4152 Linus Torvalds       2005-04-16  1113  		struct nfs_lock_i=
nfo	nfs_fl;
8d0a8a9d0ec79008 Trond Myklebust      2005-06-22  1114  		struct nfs4_lock_=
info	nfs4_fl;
e8d6c554126b8302 David Howells        2007-07-15  1115  		struct {
e8d6c554126b8302 David Howells        2007-07-15  1116  			struct list_head=
 link;	/* link in AFS vnode's pending_locks list */
e8d6c554126b8302 David Howells        2007-07-15  1117  			int state;		/* s=
tate of grant or error if -ve */
d46966013bb4f1fb David Howells        2019-04-25  1118  			unsigned int	deb=
ug_id;
e8d6c554126b8302 David Howells        2007-07-15  1119  		} afs;
^1da177e4c3f4152 Linus Torvalds       2005-04-16  1120  	} fl_u;
3859a271a003aba0 Kees Cook            2016-10-28  1121  } __randomize_layou=
t;
^1da177e4c3f4152 Linus Torvalds       2005-04-16  1122  =


:::::: The code at line 908 was first introduced by commit
:::::: 1da177e4c3f41524e886b7f1b8a0c1fc7321cac2 Linux-2.6.12-rc2

:::::: TO: Linus Torvalds <torvalds@ppc970.osdl.org>
:::::: CC: Linus Torvalds <torvalds@ppc970.osdl.org>

---
0-DAY CI Kernel Test Service, Intel Corporation
https://lists.01.org/hyperkitty/list/kbuild-all(a)lists.01.org

--===============7148994195576240804==
Content-Type: application/gzip
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: attachment; filename="config.gz"

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
jT0d/gfvEaYgAvUAAA==
--===============7148994195576240804==--

