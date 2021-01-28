Content-Type: multipart/mixed; boundary="===============3223465791131482209=="
MIME-Version: 1.0
From: kernel test robot <lkp@intel.com>
To: kbuild-all@lists.01.org
Subject: fs/f2fs/gc.c:1358:12: warning: stack frame size of 1056 bytes in function 'gc_data_segment'
Date: Thu, 28 Jan 2021 10:22:10 +0800
Message-ID: <202101281058.QUzWxzF7-lkp@intel.com>
List-Id: <oe-kbuild-all.lists.linux.dev>

--===============3223465791131482209==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git =
master
head:   76c057c84d286140c6c416c3b4ba832cd1d8984e
commit: cdf8a76fda4ae3b53c5a09e5a8c79e27b7b65d68 ubsan: move cc-option test=
s into Kconfig
date:   6 weeks ago
config: powerpc64-randconfig-r031-20210128 (attached as .config)
compiler: clang version 13.0.0 (https://github.com/llvm/llvm-project 48bdd6=
76a1d1338c10541460bf5beb69ac17e451)
reproduce (this is a W=3D1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/=
make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # install powerpc64 cross compiling tool for clang build
        # apt-get install binutils-powerpc64-linux-gnu
        # https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.gi=
t/commit/?id=3Dcdf8a76fda4ae3b53c5a09e5a8c79e27b7b65d68
        git remote add linus https://git.kernel.org/pub/scm/linux/kernel/gi=
t/torvalds/linux.git
        git fetch --no-tags linus master
        git checkout cdf8a76fda4ae3b53c5a09e5a8c79e27b7b65d68
        # save the attached .config to linux build tree
        COMPILER_INSTALL_PATH=3D$HOME/0day COMPILER=3Dclang make.cross ARCH=
=3Dpowerpc64 =


If you fix the issue, kindly add following tag as appropriate
Reported-by: kernel test robot <lkp@intel.com>

All warnings (new ones prefixed by >>):

   arch/powerpc/include/asm/io-defs.h:45:1: warning: performing pointer ari=
thmetic on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
   DEF_PCI_AC_NORET(insw, (unsigned long p, void *b, unsigned long c),
   ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   arch/powerpc/include/asm/io.h:601:3: note: expanded from macro 'DEF_PCI_=
AC_NORET'
                   __do_##name al;                                 \
                   ^~~~~~~~~~~~~~
   <scratch space>:142:1: note: expanded from here
   __do_insw
   ^
   arch/powerpc/include/asm/io.h:542:56: note: expanded from macro '__do_in=
sw'
   #define __do_insw(p, b, n)      readsw((PCI_IO_ADDR)_IO_BASE+(p), (b), (=
n))
                                          ~~~~~~~~~~~~~~~~~~~~~^
   In file included from fs/f2fs/gc.c:10:
   In file included from include/linux/backing-dev.h:15:
   In file included from include/linux/blkdev.h:14:
   In file included from include/linux/pagemap.h:11:
   In file included from include/linux/highmem.h:10:
   In file included from include/linux/hardirq.h:10:
   In file included from arch/powerpc/include/asm/hardirq.h:6:
   In file included from include/linux/irq.h:20:
   In file included from include/linux/io.h:13:
   In file included from arch/powerpc/include/asm/io.h:604:
   arch/powerpc/include/asm/io-defs.h:47:1: warning: performing pointer ari=
thmetic on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
   DEF_PCI_AC_NORET(insl, (unsigned long p, void *b, unsigned long c),
   ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   arch/powerpc/include/asm/io.h:601:3: note: expanded from macro 'DEF_PCI_=
AC_NORET'
                   __do_##name al;                                 \
                   ^~~~~~~~~~~~~~
   <scratch space>:146:1: note: expanded from here
   __do_insl
   ^
   arch/powerpc/include/asm/io.h:543:56: note: expanded from macro '__do_in=
sl'
   #define __do_insl(p, b, n)      readsl((PCI_IO_ADDR)_IO_BASE+(p), (b), (=
n))
                                          ~~~~~~~~~~~~~~~~~~~~~^
   In file included from fs/f2fs/gc.c:10:
   In file included from include/linux/backing-dev.h:15:
   In file included from include/linux/blkdev.h:14:
   In file included from include/linux/pagemap.h:11:
   In file included from include/linux/highmem.h:10:
   In file included from include/linux/hardirq.h:10:
   In file included from arch/powerpc/include/asm/hardirq.h:6:
   In file included from include/linux/irq.h:20:
   In file included from include/linux/io.h:13:
   In file included from arch/powerpc/include/asm/io.h:604:
   arch/powerpc/include/asm/io-defs.h:49:1: warning: performing pointer ari=
thmetic on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
   DEF_PCI_AC_NORET(outsb, (unsigned long p, const void *b, unsigned long c=
),
   ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~=
~~
   arch/powerpc/include/asm/io.h:601:3: note: expanded from macro 'DEF_PCI_=
AC_NORET'
                   __do_##name al;                                 \
                   ^~~~~~~~~~~~~~
   <scratch space>:150:1: note: expanded from here
   __do_outsb
   ^
   arch/powerpc/include/asm/io.h:544:58: note: expanded from macro '__do_ou=
tsb'
   #define __do_outsb(p, b, n)     writesb((PCI_IO_ADDR)_IO_BASE+(p),(b),(n=
))
                                           ~~~~~~~~~~~~~~~~~~~~~^
   In file included from fs/f2fs/gc.c:10:
   In file included from include/linux/backing-dev.h:15:
   In file included from include/linux/blkdev.h:14:
   In file included from include/linux/pagemap.h:11:
   In file included from include/linux/highmem.h:10:
   In file included from include/linux/hardirq.h:10:
   In file included from arch/powerpc/include/asm/hardirq.h:6:
   In file included from include/linux/irq.h:20:
   In file included from include/linux/io.h:13:
   In file included from arch/powerpc/include/asm/io.h:604:
   arch/powerpc/include/asm/io-defs.h:51:1: warning: performing pointer ari=
thmetic on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
   DEF_PCI_AC_NORET(outsw, (unsigned long p, const void *b, unsigned long c=
),
   ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~=
~~
   arch/powerpc/include/asm/io.h:601:3: note: expanded from macro 'DEF_PCI_=
AC_NORET'
                   __do_##name al;                                 \
                   ^~~~~~~~~~~~~~
   <scratch space>:154:1: note: expanded from here
   __do_outsw
   ^
   arch/powerpc/include/asm/io.h:545:58: note: expanded from macro '__do_ou=
tsw'
   #define __do_outsw(p, b, n)     writesw((PCI_IO_ADDR)_IO_BASE+(p),(b),(n=
))
                                           ~~~~~~~~~~~~~~~~~~~~~^
   In file included from fs/f2fs/gc.c:10:
   In file included from include/linux/backing-dev.h:15:
   In file included from include/linux/blkdev.h:14:
   In file included from include/linux/pagemap.h:11:
   In file included from include/linux/highmem.h:10:
   In file included from include/linux/hardirq.h:10:
   In file included from arch/powerpc/include/asm/hardirq.h:6:
   In file included from include/linux/irq.h:20:
   In file included from include/linux/io.h:13:
   In file included from arch/powerpc/include/asm/io.h:604:
   arch/powerpc/include/asm/io-defs.h:53:1: warning: performing pointer ari=
thmetic on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
   DEF_PCI_AC_NORET(outsl, (unsigned long p, const void *b, unsigned long c=
),
   ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~=
~~
   arch/powerpc/include/asm/io.h:601:3: note: expanded from macro 'DEF_PCI_=
AC_NORET'
                   __do_##name al;                                 \
                   ^~~~~~~~~~~~~~
   <scratch space>:158:1: note: expanded from here
   __do_outsl
   ^
   arch/powerpc/include/asm/io.h:546:58: note: expanded from macro '__do_ou=
tsl'
   #define __do_outsl(p, b, n)     writesl((PCI_IO_ADDR)_IO_BASE+(p),(b),(n=
))
                                           ~~~~~~~~~~~~~~~~~~~~~^
>> fs/f2fs/gc.c:1358:12: warning: stack frame size of 1056 bytes in functio=
n 'gc_data_segment' [-Wframe-larger-than=3D]
   static int gc_data_segment(struct f2fs_sb_info *sbi, struct f2fs_summary=
 *sum,
              ^
   7 warnings generated.
--
                   __do_##name al;                                 \
                   ^~~~~~~~~~~~~~
   <scratch space>:155:1: note: expanded from here
   __do_insw
   ^
   arch/powerpc/include/asm/io.h:542:56: note: expanded from macro '__do_in=
sw'
   #define __do_insw(p, b, n)      readsw((PCI_IO_ADDR)_IO_BASE+(p), (b), (=
n))
                                          ~~~~~~~~~~~~~~~~~~~~~^
   In file included from fs/xfs/libxfs/xfs_bmap.c:6:
   In file included from fs/xfs/xfs.h:22:
   In file included from fs/xfs/xfs_linux.h:31:
   In file included from include/linux/blkdev.h:14:
   In file included from include/linux/pagemap.h:11:
   In file included from include/linux/highmem.h:10:
   In file included from include/linux/hardirq.h:10:
   In file included from arch/powerpc/include/asm/hardirq.h:6:
   In file included from include/linux/irq.h:20:
   In file included from include/linux/io.h:13:
   In file included from arch/powerpc/include/asm/io.h:604:
   arch/powerpc/include/asm/io-defs.h:47:1: warning: performing pointer ari=
thmetic on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
   DEF_PCI_AC_NORET(insl, (unsigned long p, void *b, unsigned long c),
   ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   arch/powerpc/include/asm/io.h:601:3: note: expanded from macro 'DEF_PCI_=
AC_NORET'
                   __do_##name al;                                 \
                   ^~~~~~~~~~~~~~
   <scratch space>:159:1: note: expanded from here
   __do_insl
   ^
   arch/powerpc/include/asm/io.h:543:56: note: expanded from macro '__do_in=
sl'
   #define __do_insl(p, b, n)      readsl((PCI_IO_ADDR)_IO_BASE+(p), (b), (=
n))
                                          ~~~~~~~~~~~~~~~~~~~~~^
   In file included from fs/xfs/libxfs/xfs_bmap.c:6:
   In file included from fs/xfs/xfs.h:22:
   In file included from fs/xfs/xfs_linux.h:31:
   In file included from include/linux/blkdev.h:14:
   In file included from include/linux/pagemap.h:11:
   In file included from include/linux/highmem.h:10:
   In file included from include/linux/hardirq.h:10:
   In file included from arch/powerpc/include/asm/hardirq.h:6:
   In file included from include/linux/irq.h:20:
   In file included from include/linux/io.h:13:
   In file included from arch/powerpc/include/asm/io.h:604:
   arch/powerpc/include/asm/io-defs.h:49:1: warning: performing pointer ari=
thmetic on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
   DEF_PCI_AC_NORET(outsb, (unsigned long p, const void *b, unsigned long c=
),
   ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~=
~~
   arch/powerpc/include/asm/io.h:601:3: note: expanded from macro 'DEF_PCI_=
AC_NORET'
                   __do_##name al;                                 \
                   ^~~~~~~~~~~~~~
   <scratch space>:163:1: note: expanded from here
   __do_outsb
   ^
   arch/powerpc/include/asm/io.h:544:58: note: expanded from macro '__do_ou=
tsb'
   #define __do_outsb(p, b, n)     writesb((PCI_IO_ADDR)_IO_BASE+(p),(b),(n=
))
                                           ~~~~~~~~~~~~~~~~~~~~~^
   In file included from fs/xfs/libxfs/xfs_bmap.c:6:
   In file included from fs/xfs/xfs.h:22:
   In file included from fs/xfs/xfs_linux.h:31:
   In file included from include/linux/blkdev.h:14:
   In file included from include/linux/pagemap.h:11:
   In file included from include/linux/highmem.h:10:
   In file included from include/linux/hardirq.h:10:
   In file included from arch/powerpc/include/asm/hardirq.h:6:
   In file included from include/linux/irq.h:20:
   In file included from include/linux/io.h:13:
   In file included from arch/powerpc/include/asm/io.h:604:
   arch/powerpc/include/asm/io-defs.h:51:1: warning: performing pointer ari=
thmetic on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
   DEF_PCI_AC_NORET(outsw, (unsigned long p, const void *b, unsigned long c=
),
   ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~=
~~
   arch/powerpc/include/asm/io.h:601:3: note: expanded from macro 'DEF_PCI_=
AC_NORET'
                   __do_##name al;                                 \
                   ^~~~~~~~~~~~~~
   <scratch space>:167:1: note: expanded from here
   __do_outsw
   ^
   arch/powerpc/include/asm/io.h:545:58: note: expanded from macro '__do_ou=
tsw'
   #define __do_outsw(p, b, n)     writesw((PCI_IO_ADDR)_IO_BASE+(p),(b),(n=
))
                                           ~~~~~~~~~~~~~~~~~~~~~^
   In file included from fs/xfs/libxfs/xfs_bmap.c:6:
   In file included from fs/xfs/xfs.h:22:
   In file included from fs/xfs/xfs_linux.h:31:
   In file included from include/linux/blkdev.h:14:
   In file included from include/linux/pagemap.h:11:
   In file included from include/linux/highmem.h:10:
   In file included from include/linux/hardirq.h:10:
   In file included from arch/powerpc/include/asm/hardirq.h:6:
   In file included from include/linux/irq.h:20:
   In file included from include/linux/io.h:13:
   In file included from arch/powerpc/include/asm/io.h:604:
   arch/powerpc/include/asm/io-defs.h:53:1: warning: performing pointer ari=
thmetic on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
   DEF_PCI_AC_NORET(outsl, (unsigned long p, const void *b, unsigned long c=
),
   ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~=
~~
   arch/powerpc/include/asm/io.h:601:3: note: expanded from macro 'DEF_PCI_=
AC_NORET'
                   __do_##name al;                                 \
                   ^~~~~~~~~~~~~~
   <scratch space>:171:1: note: expanded from here
   __do_outsl
   ^
   arch/powerpc/include/asm/io.h:546:58: note: expanded from macro '__do_ou=
tsl'
   #define __do_outsl(p, b, n)     writesl((PCI_IO_ADDR)_IO_BASE+(p),(b),(n=
))
                                           ~~~~~~~~~~~~~~~~~~~~~^
>> fs/xfs/libxfs/xfs_bmap.c:5256:1: warning: stack frame size of 1296 bytes=
 in function '__xfs_bunmapi' [-Wframe-larger-than=3D]
   __xfs_bunmapi(
   ^
   7 warnings generated.


vim +/gc_data_segment +1358 fs/f2fs/gc.c

7bc0900347e069 Jaegeuk Kim     2012-11-02  1350  =

0a8165d7c2cf13 Jaegeuk Kim     2012-11-29  1351  /*
7bc0900347e069 Jaegeuk Kim     2012-11-02  1352   * This function tries to =
get parent node of victim data block, and identifies
7bc0900347e069 Jaegeuk Kim     2012-11-02  1353   * data block validity. If=
 the block is valid, copy that with cold status and
7bc0900347e069 Jaegeuk Kim     2012-11-02  1354   * modify parent node.
7bc0900347e069 Jaegeuk Kim     2012-11-02  1355   * If the parent node is n=
ot valid or the data block address is different,
7bc0900347e069 Jaegeuk Kim     2012-11-02  1356   * the victim data block i=
s ignored.
7bc0900347e069 Jaegeuk Kim     2012-11-02  1357   */
48018b4cfd07dd Chao Yu         2018-09-13 @1358  static int gc_data_segment=
(struct f2fs_sb_info *sbi, struct f2fs_summary *sum,
7dda2af83b2b75 Changman Lee    2014-11-28  1359  		struct gc_inode_list *gc=
_list, unsigned int segno, int gc_type)
7bc0900347e069 Jaegeuk Kim     2012-11-02  1360  {
7bc0900347e069 Jaegeuk Kim     2012-11-02  1361  	struct super_block *sb =
=3D sbi->sb;
7bc0900347e069 Jaegeuk Kim     2012-11-02  1362  	struct f2fs_summary *entr=
y;
7bc0900347e069 Jaegeuk Kim     2012-11-02  1363  	block_t start_addr;
437275272f9e63 Jaegeuk Kim     2013-02-04  1364  	int off;
7bc0900347e069 Jaegeuk Kim     2012-11-02  1365  	int phase =3D 0;
48018b4cfd07dd Chao Yu         2018-09-13  1366  	int submitted =3D 0;
de881df97768d0 Aravind Ramesh  2020-07-16  1367  	unsigned int usable_blks_=
in_seg =3D f2fs_usable_blks_in_seg(sbi, segno);
7bc0900347e069 Jaegeuk Kim     2012-11-02  1368  =

7bc0900347e069 Jaegeuk Kim     2012-11-02  1369  	start_addr =3D START_BLOC=
K(sbi, segno);
7bc0900347e069 Jaegeuk Kim     2012-11-02  1370  =

7bc0900347e069 Jaegeuk Kim     2012-11-02  1371  next_step:
7bc0900347e069 Jaegeuk Kim     2012-11-02  1372  	entry =3D sum;
c718379b6b0954 Jaegeuk Kim     2013-04-24  1373  =

de881df97768d0 Aravind Ramesh  2020-07-16  1374  	for (off =3D 0; off < usa=
ble_blks_in_seg; off++, entry++) {
7bc0900347e069 Jaegeuk Kim     2012-11-02  1375  		struct page *data_page;
7bc0900347e069 Jaegeuk Kim     2012-11-02  1376  		struct inode *inode;
7bc0900347e069 Jaegeuk Kim     2012-11-02  1377  		struct node_info dni; /*=
 dnode info for the data */
7bc0900347e069 Jaegeuk Kim     2012-11-02  1378  		unsigned int ofs_in_node=
, nofs;
7bc0900347e069 Jaegeuk Kim     2012-11-02  1379  		block_t start_bidx;
7ea984b0604ac3 Chao Yu         2016-08-27  1380  		nid_t nid =3D le32_to_cp=
u(entry->nid);
7bc0900347e069 Jaegeuk Kim     2012-11-02  1381  =

803e74be04b32f Jaegeuk Kim     2019-11-22  1382  		/*
803e74be04b32f Jaegeuk Kim     2019-11-22  1383  		 * stop BG_GC if there i=
s not enough free sections.
803e74be04b32f Jaegeuk Kim     2019-11-22  1384  		 * Or, stop GC if the se=
gment becomes fully valid caused by
803e74be04b32f Jaegeuk Kim     2019-11-22  1385  		 * race condition along =
with SSR block allocation.
803e74be04b32f Jaegeuk Kim     2019-11-22  1386  		 */
803e74be04b32f Jaegeuk Kim     2019-11-22  1387  		if ((gc_type =3D=3D BG_G=
C && has_not_enough_free_secs(sbi, 0, 0)) ||
2bac07635ddf9e Jaegeuk Kim     2020-02-09  1388  				get_valid_blocks(sbi, =
segno, true) =3D=3D
2bac07635ddf9e Jaegeuk Kim     2020-02-09  1389  							BLKS_PER_SEC(sbi))
48018b4cfd07dd Chao Yu         2018-09-13  1390  			return submitted;
7bc0900347e069 Jaegeuk Kim     2012-11-02  1391  =

437275272f9e63 Jaegeuk Kim     2013-02-04  1392  		if (check_valid_map(sbi,=
 segno, off) =3D=3D 0)
7bc0900347e069 Jaegeuk Kim     2012-11-02  1393  			continue;
7bc0900347e069 Jaegeuk Kim     2012-11-02  1394  =

7bc0900347e069 Jaegeuk Kim     2012-11-02  1395  		if (phase =3D=3D 0) {
4d57b86dd86404 Chao Yu         2018-05-30  1396  			f2fs_ra_meta_pages(sbi,=
 NAT_BLOCK_OFFSET(nid), 1,
7ea984b0604ac3 Chao Yu         2016-08-27  1397  							META_NAT, true);
7ea984b0604ac3 Chao Yu         2016-08-27  1398  			continue;
7ea984b0604ac3 Chao Yu         2016-08-27  1399  		}
7ea984b0604ac3 Chao Yu         2016-08-27  1400  =

7ea984b0604ac3 Chao Yu         2016-08-27  1401  		if (phase =3D=3D 1) {
4d57b86dd86404 Chao Yu         2018-05-30  1402  			f2fs_ra_node_page(sbi, =
nid);
7bc0900347e069 Jaegeuk Kim     2012-11-02  1403  			continue;
7bc0900347e069 Jaegeuk Kim     2012-11-02  1404  		}
7bc0900347e069 Jaegeuk Kim     2012-11-02  1405  =

7bc0900347e069 Jaegeuk Kim     2012-11-02  1406  		/* Get an inode by ino w=
ith checking validity */
c1079892f4e8ec Nicholas Krause 2015-06-30  1407  		if (!is_alive(sbi, entry=
, &dni, start_addr + off, &nofs))
7bc0900347e069 Jaegeuk Kim     2012-11-02  1408  			continue;
7bc0900347e069 Jaegeuk Kim     2012-11-02  1409  =

7ea984b0604ac3 Chao Yu         2016-08-27  1410  		if (phase =3D=3D 2) {
4d57b86dd86404 Chao Yu         2018-05-30  1411  			f2fs_ra_node_page(sbi, =
dni.ino);
7bc0900347e069 Jaegeuk Kim     2012-11-02  1412  			continue;
7bc0900347e069 Jaegeuk Kim     2012-11-02  1413  		}
7bc0900347e069 Jaegeuk Kim     2012-11-02  1414  =

7bc0900347e069 Jaegeuk Kim     2012-11-02  1415  		ofs_in_node =3D le16_to_=
cpu(entry->ofs_in_node);
7bc0900347e069 Jaegeuk Kim     2012-11-02  1416  =

7ea984b0604ac3 Chao Yu         2016-08-27  1417  		if (phase =3D=3D 3) {
d4686d56ec912d Jaegeuk Kim     2013-01-31  1418  			inode =3D f2fs_iget(sb,=
 dni.ino);
4eea93e3ff98aa Jaegeuk Kim     2019-12-20  1419  			if (IS_ERR(inode) || is=
_bad_inode(inode)) {
4eea93e3ff98aa Jaegeuk Kim     2019-12-20  1420  				set_sbi_flag(sbi, SBI_=
NEED_FSCK);
7bc0900347e069 Jaegeuk Kim     2012-11-02  1421  				continue;
4eea93e3ff98aa Jaegeuk Kim     2019-12-20  1422  			}
7bc0900347e069 Jaegeuk Kim     2012-11-02  1423  =

bb06664a534ba4 Chao Yu         2017-11-03  1424  			if (!down_write_trylock(
b2532c694033fb Chao Yu         2018-04-24  1425  				&F2FS_I(inode)->i_gc_r=
wsem[WRITE])) {
bb06664a534ba4 Chao Yu         2017-11-03  1426  				iput(inode);
6f8d4455060dfb Jaegeuk Kim     2018-07-25  1427  				sbi->skipped_gc_rwsem+=
+;
bb06664a534ba4 Chao Yu         2017-11-03  1428  				continue;
bb06664a534ba4 Chao Yu         2017-11-03  1429  			}
bb06664a534ba4 Chao Yu         2017-11-03  1430  =

6aa58d8ad20a33 Chao Yu         2018-08-14  1431  			start_bidx =3D f2fs_sta=
rt_bidx_of_node(nofs, inode) +
6aa58d8ad20a33 Chao Yu         2018-08-14  1432  								ofs_in_node;
6aa58d8ad20a33 Chao Yu         2018-08-14  1433  =

6aa58d8ad20a33 Chao Yu         2018-08-14  1434  			if (f2fs_post_read_requ=
ired(inode)) {
6aa58d8ad20a33 Chao Yu         2018-08-14  1435  				int err =3D ra_data_bl=
ock(inode, start_bidx);
6aa58d8ad20a33 Chao Yu         2018-08-14  1436  =

6aa58d8ad20a33 Chao Yu         2018-08-14  1437  				up_write(&F2FS_I(inode=
)->i_gc_rwsem[WRITE]);
6aa58d8ad20a33 Chao Yu         2018-08-14  1438  				if (err) {
6aa58d8ad20a33 Chao Yu         2018-08-14  1439  					iput(inode);
6aa58d8ad20a33 Chao Yu         2018-08-14  1440  					continue;
6aa58d8ad20a33 Chao Yu         2018-08-14  1441  				}
6aa58d8ad20a33 Chao Yu         2018-08-14  1442  				add_gc_inode(gc_list, =
inode);
6aa58d8ad20a33 Chao Yu         2018-08-14  1443  				continue;
6aa58d8ad20a33 Chao Yu         2018-08-14  1444  			}
6aa58d8ad20a33 Chao Yu         2018-08-14  1445  =

4d57b86dd86404 Chao Yu         2018-05-30  1446  			data_page =3D f2fs_get_=
read_data_page(inode,
6aa58d8ad20a33 Chao Yu         2018-08-14  1447  						start_bidx, REQ_RAHE=
AD, true);
b2532c694033fb Chao Yu         2018-04-24  1448  			up_write(&F2FS_I(inode)=
->i_gc_rwsem[WRITE]);
31a3268839c1aa Changman Lee    2014-11-27  1449  			if (IS_ERR(data_page)) {
31a3268839c1aa Changman Lee    2014-11-27  1450  				iput(inode);
31a3268839c1aa Changman Lee    2014-11-27  1451  				continue;
31a3268839c1aa Changman Lee    2014-11-27  1452  			}
7bc0900347e069 Jaegeuk Kim     2012-11-02  1453  =

7bc0900347e069 Jaegeuk Kim     2012-11-02  1454  			f2fs_put_page(data_page=
, 0);
7dda2af83b2b75 Changman Lee    2014-11-28  1455  			add_gc_inode(gc_list, i=
node);
31a3268839c1aa Changman Lee    2014-11-27  1456  			continue;
31a3268839c1aa Changman Lee    2014-11-27  1457  		}
31a3268839c1aa Changman Lee    2014-11-27  1458  =

7ea984b0604ac3 Chao Yu         2016-08-27  1459  		/* phase 4 */
7dda2af83b2b75 Changman Lee    2014-11-28  1460  		inode =3D find_gc_inode(=
gc_list, dni.ino);
7bc0900347e069 Jaegeuk Kim     2012-11-02  1461  		if (inode) {
82e0a5aa5ddf79 Chao Yu         2016-07-13  1462  			struct f2fs_inode_info =
*fi =3D F2FS_I(inode);
82e0a5aa5ddf79 Chao Yu         2016-07-13  1463  			bool locked =3D false;
48018b4cfd07dd Chao Yu         2018-09-13  1464  			int err;
82e0a5aa5ddf79 Chao Yu         2016-07-13  1465  =

82e0a5aa5ddf79 Chao Yu         2016-07-13  1466  			if (S_ISREG(inode->i_mo=
de)) {
b2532c694033fb Chao Yu         2018-04-24  1467  				if (!down_write_tryloc=
k(&fi->i_gc_rwsem[READ]))
82e0a5aa5ddf79 Chao Yu         2016-07-13  1468  					continue;
82e0a5aa5ddf79 Chao Yu         2016-07-13  1469  				if (!down_write_tryloc=
k(
b2532c694033fb Chao Yu         2018-04-24  1470  						&fi->i_gc_rwsem[WRIT=
E])) {
6f8d4455060dfb Jaegeuk Kim     2018-07-25  1471  					sbi->skipped_gc_rwsem=
++;
b2532c694033fb Chao Yu         2018-04-24  1472  					up_write(&fi->i_gc_rw=
sem[READ]);
82e0a5aa5ddf79 Chao Yu         2016-07-13  1473  					continue;
82e0a5aa5ddf79 Chao Yu         2016-07-13  1474  				}
82e0a5aa5ddf79 Chao Yu         2016-07-13  1475  				locked =3D true;
73ac2f4e8256b9 Chao Yu         2017-08-23  1476  =

73ac2f4e8256b9 Chao Yu         2017-08-23  1477  				/* wait for all inflig=
ht aio data */
73ac2f4e8256b9 Chao Yu         2017-08-23  1478  				inode_dio_wait(inode);
82e0a5aa5ddf79 Chao Yu         2016-07-13  1479  			}
82e0a5aa5ddf79 Chao Yu         2016-07-13  1480  =

4d57b86dd86404 Chao Yu         2018-05-30  1481  			start_bidx =3D f2fs_sta=
rt_bidx_of_node(nofs, inode)
c879f90da96c63 Jaegeuk Kim     2015-04-24  1482  								+ ofs_in_node;
6dbb17961f46b2 Eric Biggers    2018-04-18  1483  			if (f2fs_post_read_requ=
ired(inode))
48018b4cfd07dd Chao Yu         2018-09-13  1484  				err =3D move_data_bloc=
k(inode, start_bidx,
48018b4cfd07dd Chao Yu         2018-09-13  1485  							gc_type, segno, off=
);
4375a33664de17 Jaegeuk Kim     2015-04-23  1486  			else
48018b4cfd07dd Chao Yu         2018-09-13  1487  				err =3D move_data_page=
(inode, start_bidx, gc_type,
d4c759ee5faa51 Jaegeuk Kim     2017-09-05  1488  								segno, off);
82e0a5aa5ddf79 Chao Yu         2016-07-13  1489  =

48018b4cfd07dd Chao Yu         2018-09-13  1490  			if (!err && (gc_type =
=3D=3D FG_GC ||
48018b4cfd07dd Chao Yu         2018-09-13  1491  					f2fs_post_read_requir=
ed(inode)))
48018b4cfd07dd Chao Yu         2018-09-13  1492  				submitted++;
48018b4cfd07dd Chao Yu         2018-09-13  1493  =

82e0a5aa5ddf79 Chao Yu         2016-07-13  1494  			if (locked) {
b2532c694033fb Chao Yu         2018-04-24  1495  				up_write(&fi->i_gc_rws=
em[WRITE]);
b2532c694033fb Chao Yu         2018-04-24  1496  				up_write(&fi->i_gc_rws=
em[READ]);
82e0a5aa5ddf79 Chao Yu         2016-07-13  1497  			}
82e0a5aa5ddf79 Chao Yu         2016-07-13  1498  =

e1235983e385af Changman Lee    2014-12-23  1499  			stat_inc_data_blk_count=
(sbi, 1, gc_type);
7bc0900347e069 Jaegeuk Kim     2012-11-02  1500  		}
7bc0900347e069 Jaegeuk Kim     2012-11-02  1501  	}
c718379b6b0954 Jaegeuk Kim     2013-04-24  1502  =

7ea984b0604ac3 Chao Yu         2016-08-27  1503  	if (++phase < 5)
7bc0900347e069 Jaegeuk Kim     2012-11-02  1504  		goto next_step;
48018b4cfd07dd Chao Yu         2018-09-13  1505  =

48018b4cfd07dd Chao Yu         2018-09-13  1506  	return submitted;
7bc0900347e069 Jaegeuk Kim     2012-11-02  1507  }
7bc0900347e069 Jaegeuk Kim     2012-11-02  1508  =


:::::: The code@line 1358 was first introduced by commit
:::::: 48018b4cfd07dd2df9a067fb3a6a3221c19eed11 f2fs: submit cached bio to =
avoid endless PageWriteback

:::::: TO: Chao Yu <yuchao0@huawei.com>
:::::: CC: Jaegeuk Kim <jaegeuk@kernel.org>

---
0-DAY CI Kernel Test Service, Intel Corporation
https://lists.01.org/hyperkitty/list/kbuild-all(a)lists.01.org

--===============3223465791131482209==
Content-Type: application/gzip
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: attachment; filename="config.gz"

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
HPvyf9+BDrDENQEA
--===============3223465791131482209==--

