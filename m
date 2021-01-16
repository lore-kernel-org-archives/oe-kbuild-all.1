Content-Type: multipart/mixed; boundary="===============6293489057414567910=="
MIME-Version: 1.0
From: kernel test robot <lkp@intel.com>
To: kbuild-all@lists.01.org
Subject: [djwong-xfs:realtime-rmap 206/228] fs/xfs/libxfs/xfs_rmap.c:41:23: warning: Same value in both branches of ternary operator.
Date: Sat, 16 Jan 2021 16:20:16 +0800
Message-ID: <202101161613.LTTWuCkz-lkp@intel.com>
List-Id: <oe-kbuild-all.lists.linux.dev>

--===============6293489057414567910==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/djwong/xfs-linux.gi=
t realtime-rmap
head:   675c5e606c13fa435f99318e0fbd566930c6524b
commit: eda5b6623581d67df9b4241ce32f9da5ea5beca1 [206/228] xfs: prepare rma=
p functions to deal with rtrmapbt
compiler: csky-linux-gcc (GCC) 9.3.0

If you fix the issue, kindly add following tag as appropriate
Reported-by: kernel test robot <lkp@intel.com>


"cppcheck warnings: (new ones prefixed by >>)"
   In file included from fs/xfs/libxfs/xfs_rmap.c:
>> fs/xfs/libxfs/xfs_rmap.c:41:23: warning: Same value in both branches of =
ternary operator. [duplicateValueTernary]
      XFS_RTRMAP_LEN_MAX : XFS_RMAP_LEN_MAX;
                         ^

cppcheck possible warnings: (new ones prefixed by >>, may not real problems)

   In file included from fs/xfs/libxfs/xfs_rmap.c:
   fs/xfs/libxfs/xfs_format.h:342:2: warning: Non-boolean value returned fr=
om function returning bool [returnNonBoolInBooleanFunction]
    return (sbp->sb_versionnum & XFS_SB_VERSION_ATTRBIT);
    ^
   fs/xfs/libxfs/xfs_format.h:352:2: warning: Non-boolean value returned fr=
om function returning bool [returnNonBoolInBooleanFunction]
    return (sbp->sb_versionnum & XFS_SB_VERSION_QUOTABIT);
    ^
   fs/xfs/libxfs/xfs_format.h:368:2: warning: Non-boolean value returned fr=
om function returning bool [returnNonBoolInBooleanFunction]
    return (sbp->sb_versionnum & XFS_SB_VERSION_DALIGNBIT);
    ^
   fs/xfs/libxfs/xfs_format.h:379:2: warning: Non-boolean value returned fr=
om function returning bool [returnNonBoolInBooleanFunction]
    return (sbp->sb_versionnum & XFS_SB_VERSION_SECTORBIT);
    ^
   fs/xfs/libxfs/xfs_format.h:384:2: warning: Non-boolean value returned fr=
om function returning bool [returnNonBoolInBooleanFunction]
    return (sbp->sb_versionnum & XFS_SB_VERSION_BORGBIT);
    ^

vim +41 fs/xfs/libxfs/xfs_rmap.c

    34	=

    35	/* Return the maximum length of an rmap record. */
    36	static xfs_filblks_t
    37	xfs_rmap_len_max(
    38		struct xfs_btree_cur	*cur)
    39	{
    40		return cur->bc_btnum =3D=3D XFS_BTNUM_RTRMAP ?
  > 41				XFS_RTRMAP_LEN_MAX : XFS_RMAP_LEN_MAX;
    42	}
    43	=


---
0-DAY CI Kernel Test Service, Intel Corporation
https://lists.01.org/hyperkitty/list/kbuild-all(a)lists.01.org
--===============6293489057414567910==--

