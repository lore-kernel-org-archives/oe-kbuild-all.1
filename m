Content-Type: multipart/mixed; boundary="===============6727791412812823741=="
MIME-Version: 1.0
From: kbuild test robot <lkp@intel.com>
To: kbuild-all@lists.01.org
Subject: [djwong-xfs:djwong-wtf 224/234] fs/xfs/xfs_swaprange.c:202:12: warning: variable 'temp_blks' set but not used
Date: Sun, 24 May 2020 20:21:42 +0800
Message-ID: <202005242031.m3jNIMlF%lkp@intel.com>
List-Id: <oe-kbuild-all.lists.linux.dev>

--===============6727791412812823741==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/djwong/xfs-linux.gi=
t djwong-wtf
head:   dc36d6ffb18ee08b34171a9355b844bbd4534baa
commit: f3744d427b4da5d427216e5be41f7eac9c59c5ce [224/234] xfs: remove old =
swap extents implementation
config: parisc-randconfig-r005-20200524 (attached as .config)
compiler: hppa64-linux-gcc (GCC) 9.3.0
reproduce (this is a W=3D1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/=
make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        git checkout f3744d427b4da5d427216e5be41f7eac9c59c5ce
        # save the attached .config to linux build tree
        COMPILER_INSTALL_PATH=3D$HOME/0day COMPILER=3Dgcc-9.3.0 make.cross =
ARCH=3Dparisc =


If you fix the issue, kindly add following tag as appropriate
Reported-by: kbuild test robot <lkp@intel.com>

All warnings (new ones prefixed by >>, old ones prefixed by <<):

In file included from include/linux/mm.h:95,
from fs/xfs/kmem.h:11,
from fs/xfs/xfs_linux.h:24,
from fs/xfs/xfs.h:22,
from fs/xfs/xfs_swaprange.c:11:
include/asm-generic/pgtable.h: In function 'pte_clear_not_present_full':
arch/parisc/include/asm/pgtable.h:96:9: warning: variable 'old_pte' set but=
 not used [-Wunused-but-set-variable]
96 |   pte_t old_pte;              |         ^~~~~~~
arch/parisc/include/asm/pgtable.h:322:34: note: in expansion of macro 'set_=
pte_at'
322 | #define pte_clear(mm, addr, xp)  set_pte_at(mm, addr, xp, __pte(0))
|                                  ^~~~~~~~~~
include/asm-generic/pgtable.h:202:2: note: in expansion of macro 'pte_clear'
202 |  pte_clear(mm, address, ptep);
|  ^~~~~~~~~
include/asm-generic/pgtable.h: In function '__ptep_modify_prot_commit':
arch/parisc/include/asm/pgtable.h:96:9: warning: variable 'old_pte' set but=
 not used [-Wunused-but-set-variable]
96 |   pte_t old_pte;              |         ^~~~~~~
include/asm-generic/pgtable.h:641:2: note: in expansion of macro 'set_pte_a=
t'
641 |  set_pte_at(vma->vm_mm, addr, ptep, pte);
|  ^~~~~~~~~~
fs/xfs/xfs_swaprange.c: In function 'xfs_swap_extent_forks':
>> fs/xfs/xfs_swaprange.c:202:12: warning: variable 'temp_blks' set but not=
 used [-Wunused-but-set-variable]
202 |  int64_t   temp_blks;
|            ^~~~~~~~~

vim +/temp_blks +202 fs/xfs/xfs_swaprange.c

   191	=

   192	/* Swap the extents of two files by swapping data forks. */
   193	static int
   194	xfs_swap_extent_forks(
   195		struct xfs_trans	**tpp,
   196		struct xfs_swapext_req	*req)
   197	{
   198		struct xfs_inode	*ip =3D req->ip1;
   199		struct xfs_inode	*tip =3D req->ip2;
   200		xfs_filblks_t		aforkblks =3D 0;
   201		xfs_filblks_t		taforkblks =3D 0;
 > 202		int64_t			temp_blks;
   203		xfs_extnum_t		junk;
   204		uint64_t		tmp;
   205		unsigned int		reflink_state;
   206		int			src_log_flags =3D XFS_ILOG_CORE;
   207		int			target_log_flags =3D XFS_ILOG_CORE;
   208		int			error;
   209	=

   210		reflink_state =3D xfs_swapext_reflink_prep(req);
   211	=

   212		/*
   213		 * Count the number of extended attribute blocks
   214		 */
   215		if ( ((XFS_IFORK_Q(ip) !=3D 0) && (ip->i_d.di_anextents > 0)) &&
   216		     (ip->i_d.di_aformat !=3D XFS_DINODE_FMT_LOCAL)) {
   217			error =3D xfs_bmap_count_blocks(*tpp, ip, XFS_ATTR_FORK, &junk,
   218					&aforkblks);
   219			if (error)
   220				return error;
   221		}
   222		if ( ((XFS_IFORK_Q(tip) !=3D 0) && (tip->i_d.di_anextents > 0)) &&
   223		     (tip->i_d.di_aformat !=3D XFS_DINODE_FMT_LOCAL)) {
   224			error =3D xfs_bmap_count_blocks(*tpp, tip, XFS_ATTR_FORK, &junk,
   225					&taforkblks);
   226			if (error)
   227				return error;
   228		}
   229	=

   230		/*
   231		 * Btree format (v3) inodes have the inode number stamped in the bm=
bt
   232		 * block headers. We can't start changing the bmbt blocks until the
   233		 * inode owner change is logged so recovery does the right thing in=
 the
   234		 * event of a crash. Set the owner change log flags now and leave t=
he
   235		 * bmbt scan as the last step.
   236		 */
   237		if (xfs_sb_version_has_v3inode(&ip->i_mount->m_sb)) {
   238			if (ip->i_d.di_format =3D=3D XFS_DINODE_FMT_BTREE)
   239				target_log_flags |=3D XFS_ILOG_DOWNER;
   240			if (tip->i_d.di_format =3D=3D XFS_DINODE_FMT_BTREE)
   241				src_log_flags |=3D XFS_ILOG_DOWNER;
   242		}
   243	=

   244		/*
   245		 * Swap the data forks of the inodes
   246		 */
   247		swap(ip->i_df, tip->i_df);
   248	=

   249		/* Update quota accounting. */
   250		temp_blks =3D tip->i_d.di_nblocks - taforkblks + aforkblks;
   251		xfs_trans_mod_dquot_byino(*tpp, ip, XFS_TRANS_DQ_BCOUNT,
   252				temp_blks - ip->i_d.di_nblocks);
   253	=

   254		temp_blks =3D ip->i_d.di_nblocks + taforkblks - aforkblks;
   255		xfs_trans_mod_dquot_byino(*tpp, tip, XFS_TRANS_DQ_BCOUNT,
   256				temp_blks - tip->i_d.di_nblocks);
   257	=

   258		/*
   259		 * Fix the on-disk inode values
   260		 */
   261		tmp =3D (uint64_t)ip->i_d.di_nblocks;
   262		ip->i_d.di_nblocks =3D tip->i_d.di_nblocks - taforkblks + aforkblks;
   263		tip->i_d.di_nblocks =3D tmp + taforkblks - aforkblks;
   264	=

   265		swap(ip->i_d.di_nextents, tip->i_d.di_nextents);
   266		swap(ip->i_d.di_format, tip->i_d.di_format);
   267	=

   268		/*
   269		 * The extents in the source inode could still contain speculative
   270		 * preallocation beyond EOF (e.g. the file is open but not modified
   271		 * while defrag is in progress). In that case, we need to copy over=
 the
   272		 * number of delalloc blocks the data fork in the source inode is
   273		 * tracking beyond EOF so that when the fork is truncated away when=
 the
   274		 * temporary inode is unlinked we don't underrun the i_delayed_blks
   275		 * counter on that inode.
   276		 */
   277		ASSERT(tip->i_delayed_blks =3D=3D 0);
   278		tip->i_delayed_blks =3D ip->i_delayed_blks;
   279		ip->i_delayed_blks =3D 0;
   280	=

   281		switch (ip->i_d.di_format) {
   282		case XFS_DINODE_FMT_EXTENTS:
   283			src_log_flags |=3D XFS_ILOG_DEXT;
   284			break;
   285		case XFS_DINODE_FMT_BTREE:
   286			ASSERT(!xfs_sb_version_has_v3inode(&ip->i_mount->m_sb) ||
   287			       (src_log_flags & XFS_ILOG_DOWNER));
   288			src_log_flags |=3D XFS_ILOG_DBROOT;
   289			break;
   290		}
   291	=

   292		switch (tip->i_d.di_format) {
   293		case XFS_DINODE_FMT_EXTENTS:
   294			target_log_flags |=3D XFS_ILOG_DEXT;
   295			break;
   296		case XFS_DINODE_FMT_BTREE:
   297			target_log_flags |=3D XFS_ILOG_DBROOT;
   298			ASSERT(!xfs_sb_version_has_v3inode(&ip->i_mount->m_sb) ||
   299			       (target_log_flags & XFS_ILOG_DOWNER));
   300			break;
   301		}
   302	=

   303		xfs_swapext_reflink_finish(*tpp, req, reflink_state);
   304	=

   305		xfs_trans_log_inode(*tpp, ip,  src_log_flags);
   306		xfs_trans_log_inode(*tpp, tip, target_log_flags);
   307	=

   308		/*
   309		 * The extent forks have been swapped, but crc=3D1,rmapbt=3D0 files=
ystems
   310		 * have inode number owner values in the bmbt blocks that still ref=
er to
   311		 * the old inode. Scan each bmbt to fix up the owner values with the
   312		 * inode number of the current inode.
   313		 */
   314		if (src_log_flags & XFS_ILOG_DOWNER) {
   315			error =3D xfs_swap_change_owner(tpp, ip, tip);
   316			if (error)
   317				return error;
   318		}
   319		if (target_log_flags & XFS_ILOG_DOWNER) {
   320			error =3D xfs_swap_change_owner(tpp, tip, ip);
   321			if (error)
   322				return error;
   323		}
   324	=

   325		return 0;
   326	}
   327	=


---
0-DAY CI Kernel Test Service, Intel Corporation
https://lists.01.org/hyperkitty/list/kbuild-all(a)lists.01.org

--===============6727791412812823741==
Content-Type: application/gzip
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: attachment; filename="config.gz"

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
--===============6727791412812823741==--

