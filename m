Content-Type: multipart/mixed; boundary="===============3785659557022811980=="
MIME-Version: 1.0
From: kernel test robot <lkp@intel.com>
To: kbuild-all@lists.01.org
Subject: [djwong-xfs:reserve-rt-metadata-space 64/196] fs/xfs/scrub/symlink_repair.c:213:40: error: incompatible pointer types passing 'struct xfs_trans to parameter of type 'struct xfs_trans remove &
Date: Tue, 19 Jan 2021 10:19:22 +0800
Message-ID: <202101191016.1BeXnEnm-lkp@intel.com>
List-Id: <oe-kbuild-all.lists.linux.dev>

--===============3785659557022811980==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/djwong/xfs-linux.gi=
t reserve-rt-metadata-space
head:   cf302d785b20281da031865d0e18e4b50bff6bbf
commit: 1feff90cefef24e947c0d10d800d87d16a4602a7 [64/196] xfs: repair damag=
ed symlinks
config: powerpc64-randconfig-r005-20210118 (attached as .config)
compiler: clang version 12.0.0 (https://github.com/llvm/llvm-project 22b684=
40e1647e16b5ee24b924986207173c02d1)
reproduce (this is a W=3D1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/=
make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # install powerpc64 cross compiling tool for clang build
        # apt-get install binutils-powerpc64-linux-gnu
        # https://git.kernel.org/pub/scm/linux/kernel/git/djwong/xfs-linux.=
git/commit/?id=3D1feff90cefef24e947c0d10d800d87d16a4602a7
        git remote add djwong-xfs https://git.kernel.org/pub/scm/linux/kern=
el/git/djwong/xfs-linux.git
        git fetch --no-tags djwong-xfs reserve-rt-metadata-space
        git checkout 1feff90cefef24e947c0d10d800d87d16a4602a7
        # save the attached .config to linux build tree
        COMPILER_INSTALL_PATH=3D$HOME/0day COMPILER=3Dclang make.cross ARCH=
=3Dpowerpc64 =


If you fix the issue, kindly add following tag as appropriate
Reported-by: kernel test robot <lkp@intel.com>

All errors (new ones prefixed by >>):

   arch/powerpc/include/asm/io-defs.h:47:1: warning: performing pointer ari=
thmetic on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
   DEF_PCI_AC_NORET(insl, (unsigned long p, void *b, unsigned long c),
   ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   arch/powerpc/include/asm/io.h:616:3: note: expanded from macro 'DEF_PCI_=
AC_NORET'
                   __do_##name al;                                 \
                   ^~~~~~~~~~~~~~
   <scratch space>:190:1: note: expanded from here
   __do_insl
   ^
   arch/powerpc/include/asm/io.h:558:56: note: expanded from macro '__do_in=
sl'
   #define __do_insl(p, b, n)      readsl((PCI_IO_ADDR)_IO_BASE+(p), (b), (=
n))
                                          ~~~~~~~~~~~~~~~~~~~~~^
   In file included from fs/xfs/scrub/symlink_repair.c:6:
   In file included from fs/xfs/xfs.h:22:
   In file included from fs/xfs/xfs_linux.h:31:
   In file included from include/linux/blkdev.h:14:
   In file included from include/linux/pagemap.h:11:
   In file included from include/linux/highmem.h:10:
   In file included from include/linux/hardirq.h:10:
   In file included from arch/powerpc/include/asm/hardirq.h:6:
   In file included from include/linux/irq.h:20:
   In file included from include/linux/io.h:13:
   In file included from arch/powerpc/include/asm/io.h:619:
   arch/powerpc/include/asm/io-defs.h:49:1: warning: performing pointer ari=
thmetic on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
   DEF_PCI_AC_NORET(outsb, (unsigned long p, const void *b, unsigned long c=
),
   ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~=
~~
   arch/powerpc/include/asm/io.h:616:3: note: expanded from macro 'DEF_PCI_=
AC_NORET'
                   __do_##name al;                                 \
                   ^~~~~~~~~~~~~~
   <scratch space>:192:1: note: expanded from here
   __do_outsb
   ^
   arch/powerpc/include/asm/io.h:559:58: note: expanded from macro '__do_ou=
tsb'
   #define __do_outsb(p, b, n)     writesb((PCI_IO_ADDR)_IO_BASE+(p),(b),(n=
))
                                           ~~~~~~~~~~~~~~~~~~~~~^
   In file included from fs/xfs/scrub/symlink_repair.c:6:
   In file included from fs/xfs/xfs.h:22:
   In file included from fs/xfs/xfs_linux.h:31:
   In file included from include/linux/blkdev.h:14:
   In file included from include/linux/pagemap.h:11:
   In file included from include/linux/highmem.h:10:
   In file included from include/linux/hardirq.h:10:
   In file included from arch/powerpc/include/asm/hardirq.h:6:
   In file included from include/linux/irq.h:20:
   In file included from include/linux/io.h:13:
   In file included from arch/powerpc/include/asm/io.h:619:
   arch/powerpc/include/asm/io-defs.h:51:1: warning: performing pointer ari=
thmetic on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
   DEF_PCI_AC_NORET(outsw, (unsigned long p, const void *b, unsigned long c=
),
   ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~=
~~
   arch/powerpc/include/asm/io.h:616:3: note: expanded from macro 'DEF_PCI_=
AC_NORET'
                   __do_##name al;                                 \
                   ^~~~~~~~~~~~~~
   <scratch space>:194:1: note: expanded from here
   __do_outsw
   ^
   arch/powerpc/include/asm/io.h:560:58: note: expanded from macro '__do_ou=
tsw'
   #define __do_outsw(p, b, n)     writesw((PCI_IO_ADDR)_IO_BASE+(p),(b),(n=
))
                                           ~~~~~~~~~~~~~~~~~~~~~^
   In file included from fs/xfs/scrub/symlink_repair.c:6:
   In file included from fs/xfs/xfs.h:22:
   In file included from fs/xfs/xfs_linux.h:31:
   In file included from include/linux/blkdev.h:14:
   In file included from include/linux/pagemap.h:11:
   In file included from include/linux/highmem.h:10:
   In file included from include/linux/hardirq.h:10:
   In file included from arch/powerpc/include/asm/hardirq.h:6:
   In file included from include/linux/irq.h:20:
   In file included from include/linux/io.h:13:
   In file included from arch/powerpc/include/asm/io.h:619:
   arch/powerpc/include/asm/io-defs.h:53:1: warning: performing pointer ari=
thmetic on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
   DEF_PCI_AC_NORET(outsl, (unsigned long p, const void *b, unsigned long c=
),
   ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~=
~~
   arch/powerpc/include/asm/io.h:616:3: note: expanded from macro 'DEF_PCI_=
AC_NORET'
                   __do_##name al;                                 \
                   ^~~~~~~~~~~~~~
   <scratch space>:196:1: note: expanded from here
   __do_outsl
   ^
   arch/powerpc/include/asm/io.h:561:58: note: expanded from macro '__do_ou=
tsl'
   #define __do_outsl(p, b, n)     writesl((PCI_IO_ADDR)_IO_BASE+(p),(b),(n=
))
                                           ~~~~~~~~~~~~~~~~~~~~~^
   In file included from fs/xfs/scrub/symlink_repair.c:22:
   fs/xfs/xfs_quota.h:176:39: error: incompatible pointer types passing 'st=
ruct xfs_trans **' to parameter of type 'struct xfs_trans *'; remove & [-We=
rror,-Wincompatible-pointer-types]
           return xfs_trans_reserve_quota_nblks(&tp, ip, -nblks, -ninos, fl=
ags,
                                                ^~~
   fs/xfs/xfs_quota.h:132:67: note: passing argument to parameter 'tp' here
   static inline int xfs_trans_reserve_quota_nblks(struct xfs_trans *tp,
                                                                     ^
   fs/xfs/xfs_quota.h:181:1: error: redefinition of 'xfs_quota_reserve_blkr=
es'
   xfs_quota_reserve_blkres(struct xfs_inode *ip, int64_t nblks,
   ^
   fs/xfs/xfs_quota.h:145:19: note: previous definition is here
   static inline int xfs_quota_reserve_blkres(struct xfs_inode *ip,
                     ^
   fs/xfs/xfs_quota.h:186:39: error: incompatible pointer types passing 'st=
ruct xfs_trans **' to parameter of type 'struct xfs_trans *'; remove & [-We=
rror,-Wincompatible-pointer-types]
           return xfs_trans_reserve_quota_nblks(&tp, ip, nblks, 0, flags, N=
ULL);
                                                ^~~
   fs/xfs/xfs_quota.h:132:67: note: passing argument to parameter 'tp' here
   static inline int xfs_trans_reserve_quota_nblks(struct xfs_trans *tp,
                                                                     ^
>> fs/xfs/scrub/symlink_repair.c:213:40: error: incompatible pointer types =
passing 'struct xfs_trans **' to parameter of type 'struct xfs_trans *'; re=
move & [-Werror,-Wincompatible-pointer-types]
           error =3D xfs_trans_reserve_quota_nblks(&sc->tp, sc->ip, resblks=
, 0,
                                                 ^~~~~~~
   fs/xfs/xfs_quota.h:132:67: note: passing argument to parameter 'tp' here
   static inline int xfs_trans_reserve_quota_nblks(struct xfs_trans *tp,
                                                                     ^
   12 warnings and 4 errors generated.


vim +213 fs/xfs/scrub/symlink_repair.c

   185	=

   186	/*
   187	 * Reinitialize a link target.  Caller must ensure the inode is join=
ed to
   188	 * the transaction.
   189	 */
   190	STATIC int
   191	xrep_symlink_reinitialize(
   192		struct xfs_scrub	*sc)
   193	{
   194		xfs_fsblock_t		fs_blocks;
   195		unsigned int		target_len;
   196		unsigned int		resblks;
   197		unsigned int		quota_flags =3D XFS_QMOPT_RES_REGBLKS;
   198		bool			quota_retry =3D false;
   199		int			error;
   200	=

   201		/* How many blocks do we need? */
   202		target_len =3D strlen(sc->buf);
   203		ASSERT(target_len !=3D 0);
   204		if (target_len =3D=3D 0 || target_len > XFS_SYMLINK_MAXLEN)
   205			return -EFSCORRUPTED;
   206	=

   207		if (sc->flags & XCHK_TRY_HARDER)
   208			quota_flags |=3D XFS_QMOPT_FORCE_RES;
   209	=

   210		/* Set up to reinitialize the target. */
   211		fs_blocks =3D xfs_symlink_blocks(sc->mp, target_len);
   212		resblks =3D XFS_SYMLINK_SPACE_RES(sc->mp, target_len, fs_blocks);
 > 213		error =3D xfs_trans_reserve_quota_nblks(&sc->tp, sc->ip, resblks, 0,
   214				quota_flags, &quota_retry);
   215		if (error)
   216			return error;
   217		if (quota_retry) {
   218			/* Release everything and try harder. */
   219			return -EDEADLOCK;
   220		}
   221	=

   222		/* Try to write the new target back out. */
   223		error =3D xfs_symlink_write_target(sc->tp, sc->ip, sc->buf, target_=
len,
   224				fs_blocks, resblks);
   225		if (error)
   226			return error;
   227	=

   228		/* Finish up any block mapping activities. */
   229		return xfs_defer_finish(&sc->tp);
   230	}
   231	=


---
0-DAY CI Kernel Test Service, Intel Corporation
https://lists.01.org/hyperkitty/list/kbuild-all(a)lists.01.org

--===============3785659557022811980==
Content-Type: application/gzip
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: attachment; filename="config.gz"

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
--===============3785659557022811980==--

