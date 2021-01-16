Content-Type: multipart/mixed; boundary="===============8184469376020611290=="
MIME-Version: 1.0
From: kernel test robot <lkp@intel.com>
To: kbuild-all@lists.01.org
Subject: [djwong-xfs:scrub-rtsummary 12/56] fs/xfs/xfs_quota.h:175:39: error: passing argument 1 of 'xfs_trans_reserve_quota_nblks' from incompatible pointer type
Date: Sat, 16 Jan 2021 13:24:27 +0800
Message-ID: <202101161321.Jt0Dztuh-lkp@intel.com>
List-Id: <oe-kbuild-all.lists.linux.dev>

--===============8184469376020611290==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/djwong/xfs-linux.gi=
t scrub-rtsummary
head:   30ed2e375306b1c5c8c622635a87595eec25a2d0
commit: cb3f81457960adfaad61877b8c86e78e5b608bf3 [12/56] xfs: flush eof/cow=
blocks if we can't reserve quota for file blocks
config: c6x-randconfig-r031-20210115 (attached as .config)
compiler: c6x-elf-gcc (GCC) 9.3.0
reproduce (this is a W=3D1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/=
make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # https://git.kernel.org/pub/scm/linux/kernel/git/djwong/xfs-linux.=
git/commit/?id=3Dcb3f81457960adfaad61877b8c86e78e5b608bf3
        git remote add djwong-xfs https://git.kernel.org/pub/scm/linux/kern=
el/git/djwong/xfs-linux.git
        git fetch --no-tags djwong-xfs scrub-rtsummary
        git checkout cb3f81457960adfaad61877b8c86e78e5b608bf3
        # save the attached .config to linux build tree
        COMPILER_INSTALL_PATH=3D$HOME/0day COMPILER=3Dgcc-9.3.0 make.cross =
ARCH=3Dc6x =


If you fix the issue, kindly add following tag as appropriate
Reported-by: kernel test robot <lkp@intel.com>

All errors (new ones prefixed by >>):

   In file included from fs/xfs/xfs_trace.c:25:
   fs/xfs/xfs_quota.h: In function 'xfs_trans_unreserve_quota_nblks':
>> fs/xfs/xfs_quota.h:175:39: error: passing argument 1 of 'xfs_trans_reser=
ve_quota_nblks' from incompatible pointer type [-Werror=3Dincompatible-poin=
ter-types]
     175 |  return xfs_trans_reserve_quota_nblks(&tp, ip, -nblks, -ninos, f=
lags,
         |                                       ^~~
         |                                       |
         |                                       struct xfs_trans **
   fs/xfs/xfs_quota.h:131:67: note: expected 'struct xfs_trans *' but argum=
ent is of type 'struct xfs_trans **'
     131 | static inline int xfs_trans_reserve_quota_nblks(struct xfs_trans=
 *tp,
         |                                                 ~~~~~~~~~~~~~~~~=
~~^~
   fs/xfs/xfs_quota.h: At top level:
   fs/xfs/xfs_quota.h:180:1: error: redefinition of 'xfs_quota_reserve_blkr=
es'
     180 | xfs_quota_reserve_blkres(struct xfs_inode *ip, int64_t nblks,
         | ^~~~~~~~~~~~~~~~~~~~~~~~
   fs/xfs/xfs_quota.h:144:19: note: previous definition of 'xfs_quota_reser=
ve_blkres' was here
     144 | static inline int xfs_quota_reserve_blkres(struct xfs_inode *ip,
         |                   ^~~~~~~~~~~~~~~~~~~~~~~~
   fs/xfs/xfs_quota.h: In function 'xfs_quota_reserve_blkres':
   fs/xfs/xfs_quota.h:185:39: error: passing argument 1 of 'xfs_trans_reser=
ve_quota_nblks' from incompatible pointer type [-Werror=3Dincompatible-poin=
ter-types]
     185 |  return xfs_trans_reserve_quota_nblks(&tp, ip, nblks, 0, flags, =
NULL);
         |                                       ^~~
         |                                       |
         |                                       struct xfs_trans **
   fs/xfs/xfs_quota.h:131:67: note: expected 'struct xfs_trans *' but argum=
ent is of type 'struct xfs_trans **'
     131 | static inline int xfs_trans_reserve_quota_nblks(struct xfs_trans=
 *tp,
         |                                                 ~~~~~~~~~~~~~~~~=
~~^~
   cc1: some warnings being treated as errors
--
   In file included from fs/xfs/libxfs/xfs_attr.c:24:
   fs/xfs/xfs_quota.h: In function 'xfs_trans_unreserve_quota_nblks':
>> fs/xfs/xfs_quota.h:175:39: error: passing argument 1 of 'xfs_trans_reser=
ve_quota_nblks' from incompatible pointer type [-Werror=3Dincompatible-poin=
ter-types]
     175 |  return xfs_trans_reserve_quota_nblks(&tp, ip, -nblks, -ninos, f=
lags,
         |                                       ^~~
         |                                       |
         |                                       struct xfs_trans **
   fs/xfs/xfs_quota.h:131:67: note: expected 'struct xfs_trans *' but argum=
ent is of type 'struct xfs_trans **'
     131 | static inline int xfs_trans_reserve_quota_nblks(struct xfs_trans=
 *tp,
         |                                                 ~~~~~~~~~~~~~~~~=
~~^~
   fs/xfs/xfs_quota.h: At top level:
   fs/xfs/xfs_quota.h:180:1: error: redefinition of 'xfs_quota_reserve_blkr=
es'
     180 | xfs_quota_reserve_blkres(struct xfs_inode *ip, int64_t nblks,
         | ^~~~~~~~~~~~~~~~~~~~~~~~
   fs/xfs/xfs_quota.h:144:19: note: previous definition of 'xfs_quota_reser=
ve_blkres' was here
     144 | static inline int xfs_quota_reserve_blkres(struct xfs_inode *ip,
         |                   ^~~~~~~~~~~~~~~~~~~~~~~~
   fs/xfs/xfs_quota.h: In function 'xfs_quota_reserve_blkres':
   fs/xfs/xfs_quota.h:185:39: error: passing argument 1 of 'xfs_trans_reser=
ve_quota_nblks' from incompatible pointer type [-Werror=3Dincompatible-poin=
ter-types]
     185 |  return xfs_trans_reserve_quota_nblks(&tp, ip, nblks, 0, flags, =
NULL);
         |                                       ^~~
         |                                       |
         |                                       struct xfs_trans **
   fs/xfs/xfs_quota.h:131:67: note: expected 'struct xfs_trans *' but argum=
ent is of type 'struct xfs_trans **'
     131 | static inline int xfs_trans_reserve_quota_nblks(struct xfs_trans=
 *tp,
         |                                                 ~~~~~~~~~~~~~~~~=
~~^~
   fs/xfs/libxfs/xfs_attr.c: In function 'xfs_attr_set':
>> fs/xfs/libxfs/xfs_attr.c:470:41: error: passing argument 1 of 'xfs_trans=
_reserve_quota_nblks' from incompatible pointer type [-Werror=3Dincompatibl=
e-pointer-types]
     470 |   error =3D xfs_trans_reserve_quota_nblks(&args->trans, dp,
         |                                         ^~~~~~~~~~~~
         |                                         |
         |                                         struct xfs_trans **
   In file included from fs/xfs/libxfs/xfs_attr.c:24:
   fs/xfs/xfs_quota.h:131:67: note: expected 'struct xfs_trans *' but argum=
ent is of type 'struct xfs_trans **'
     131 | static inline int xfs_trans_reserve_quota_nblks(struct xfs_trans=
 *tp,
         |                                                 ~~~~~~~~~~~~~~~~=
~~^~
   cc1: some warnings being treated as errors
--
   In file included from fs/xfs/libxfs/xfs_bmap.c:27:
   fs/xfs/xfs_quota.h: In function 'xfs_trans_unreserve_quota_nblks':
>> fs/xfs/xfs_quota.h:175:39: error: passing argument 1 of 'xfs_trans_reser=
ve_quota_nblks' from incompatible pointer type [-Werror=3Dincompatible-poin=
ter-types]
     175 |  return xfs_trans_reserve_quota_nblks(&tp, ip, -nblks, -ninos, f=
lags,
         |                                       ^~~
         |                                       |
         |                                       struct xfs_trans **
   fs/xfs/xfs_quota.h:131:67: note: expected 'struct xfs_trans *' but argum=
ent is of type 'struct xfs_trans **'
     131 | static inline int xfs_trans_reserve_quota_nblks(struct xfs_trans=
 *tp,
         |                                                 ~~~~~~~~~~~~~~~~=
~~^~
   fs/xfs/xfs_quota.h: At top level:
   fs/xfs/xfs_quota.h:180:1: error: redefinition of 'xfs_quota_reserve_blkr=
es'
     180 | xfs_quota_reserve_blkres(struct xfs_inode *ip, int64_t nblks,
         | ^~~~~~~~~~~~~~~~~~~~~~~~
   fs/xfs/xfs_quota.h:144:19: note: previous definition of 'xfs_quota_reser=
ve_blkres' was here
     144 | static inline int xfs_quota_reserve_blkres(struct xfs_inode *ip,
         |                   ^~~~~~~~~~~~~~~~~~~~~~~~
   fs/xfs/xfs_quota.h: In function 'xfs_quota_reserve_blkres':
   fs/xfs/xfs_quota.h:185:39: error: passing argument 1 of 'xfs_trans_reser=
ve_quota_nblks' from incompatible pointer type [-Werror=3Dincompatible-poin=
ter-types]
     185 |  return xfs_trans_reserve_quota_nblks(&tp, ip, nblks, 0, flags, =
NULL);
         |                                       ^~~
         |                                       |
         |                                       struct xfs_trans **
   fs/xfs/xfs_quota.h:131:67: note: expected 'struct xfs_trans *' but argum=
ent is of type 'struct xfs_trans **'
     131 | static inline int xfs_trans_reserve_quota_nblks(struct xfs_trans=
 *tp,
         |                                                 ~~~~~~~~~~~~~~~~=
~~^~
   fs/xfs/libxfs/xfs_bmap.c: In function 'xfs_bmap_add_attrfork':
>> fs/xfs/libxfs/xfs_bmap.c:1090:40: error: passing argument 1 of 'xfs_tran=
s_reserve_quota_nblks' from incompatible pointer type [-Werror=3Dincompatib=
le-pointer-types]
    1090 |  error =3D xfs_trans_reserve_quota_nblks(&tp, ip, blks, 0, rsvd ?
         |                                        ^~~
         |                                        |
         |                                        xfs_trans_t ** {aka struc=
t xfs_trans **}
   In file included from fs/xfs/libxfs/xfs_bmap.c:27:
   fs/xfs/xfs_quota.h:131:67: note: expected 'struct xfs_trans *' but argum=
ent is of type 'xfs_trans_t **' {aka 'struct xfs_trans **'}
     131 | static inline int xfs_trans_reserve_quota_nblks(struct xfs_trans=
 *tp,
         |                                                 ~~~~~~~~~~~~~~~~=
~~^~
   fs/xfs/libxfs/xfs_bmap.c: In function 'xfs_bmap_del_extent_real':
   fs/xfs/libxfs/xfs_bmap.c:5243:58: warning: suggest braces around empty b=
ody in an 'if' statement [-Wempty-body]
    5243 |   xfs_trans_mod_dquot_byino(tp, ip, qfield, (long)-nblks);
         |                                                          ^
   cc1: some warnings being treated as errors
--
   In file included from fs/xfs/xfs_bmap_util.c:25:
   fs/xfs/xfs_quota.h: In function 'xfs_trans_unreserve_quota_nblks':
>> fs/xfs/xfs_quota.h:175:39: error: passing argument 1 of 'xfs_trans_reser=
ve_quota_nblks' from incompatible pointer type [-Werror=3Dincompatible-poin=
ter-types]
     175 |  return xfs_trans_reserve_quota_nblks(&tp, ip, -nblks, -ninos, f=
lags,
         |                                       ^~~
         |                                       |
         |                                       struct xfs_trans **
   fs/xfs/xfs_quota.h:131:67: note: expected 'struct xfs_trans *' but argum=
ent is of type 'struct xfs_trans **'
     131 | static inline int xfs_trans_reserve_quota_nblks(struct xfs_trans=
 *tp,
         |                                                 ~~~~~~~~~~~~~~~~=
~~^~
   fs/xfs/xfs_quota.h: At top level:
   fs/xfs/xfs_quota.h:180:1: error: redefinition of 'xfs_quota_reserve_blkr=
es'
     180 | xfs_quota_reserve_blkres(struct xfs_inode *ip, int64_t nblks,
         | ^~~~~~~~~~~~~~~~~~~~~~~~
   fs/xfs/xfs_quota.h:144:19: note: previous definition of 'xfs_quota_reser=
ve_blkres' was here
     144 | static inline int xfs_quota_reserve_blkres(struct xfs_inode *ip,
         |                   ^~~~~~~~~~~~~~~~~~~~~~~~
   fs/xfs/xfs_quota.h: In function 'xfs_quota_reserve_blkres':
   fs/xfs/xfs_quota.h:185:39: error: passing argument 1 of 'xfs_trans_reser=
ve_quota_nblks' from incompatible pointer type [-Werror=3Dincompatible-poin=
ter-types]
     185 |  return xfs_trans_reserve_quota_nblks(&tp, ip, nblks, 0, flags, =
NULL);
         |                                       ^~~
         |                                       |
         |                                       struct xfs_trans **
   fs/xfs/xfs_quota.h:131:67: note: expected 'struct xfs_trans *' but argum=
ent is of type 'struct xfs_trans **'
     131 | static inline int xfs_trans_reserve_quota_nblks(struct xfs_trans=
 *tp,
         |                                                 ~~~~~~~~~~~~~~~~=
~~^~
   fs/xfs/xfs_bmap_util.c: In function 'xfs_alloc_file_space':
>> fs/xfs/xfs_bmap_util.c:822:41: error: passing argument 1 of 'xfs_trans_r=
eserve_quota_nblks' from incompatible pointer type [-Werror=3Dincompatible-=
pointer-types]
     822 |   error =3D xfs_trans_reserve_quota_nblks(&tp, ip, qblocks, 0,
         |                                         ^~~
         |                                         |
         |                                         xfs_trans_t ** {aka stru=
ct xfs_trans **}
   In file included from fs/xfs/xfs_bmap_util.c:25:
   fs/xfs/xfs_quota.h:131:67: note: expected 'struct xfs_trans *' but argum=
ent is of type 'xfs_trans_t **' {aka 'struct xfs_trans **'}
     131 | static inline int xfs_trans_reserve_quota_nblks(struct xfs_trans=
 *tp,
         |                                                 ~~~~~~~~~~~~~~~~=
~~^~
   fs/xfs/xfs_bmap_util.c: In function 'xfs_unmap_extent':
   fs/xfs/xfs_bmap_util.c:886:40: error: passing argument 1 of 'xfs_trans_r=
eserve_quota_nblks' from incompatible pointer type [-Werror=3Dincompatible-=
pointer-types]
     886 |  error =3D xfs_trans_reserve_quota_nblks(&tp, ip, resblks, 0,
         |                                        ^~~
         |                                        |
         |                                        struct xfs_trans **
   In file included from fs/xfs/xfs_bmap_util.c:25:
   fs/xfs/xfs_quota.h:131:67: note: expected 'struct xfs_trans *' but argum=
ent is of type 'struct xfs_trans **'
     131 | static inline int xfs_trans_reserve_quota_nblks(struct xfs_trans=
 *tp,
         |                                                 ~~~~~~~~~~~~~~~~=
~~^~
   cc1: some warnings being treated as errors
--
   In file included from fs/xfs/xfs_ioctl.c:23:
   fs/xfs/xfs_quota.h: In function 'xfs_trans_unreserve_quota_nblks':
>> fs/xfs/xfs_quota.h:175:39: error: passing argument 1 of 'xfs_trans_reser=
ve_quota_nblks' from incompatible pointer type [-Werror=3Dincompatible-poin=
ter-types]
     175 |  return xfs_trans_reserve_quota_nblks(&tp, ip, -nblks, -ninos, f=
lags,
         |                                       ^~~
         |                                       |
         |                                       struct xfs_trans **
   fs/xfs/xfs_quota.h:131:67: note: expected 'struct xfs_trans *' but argum=
ent is of type 'struct xfs_trans **'
     131 | static inline int xfs_trans_reserve_quota_nblks(struct xfs_trans=
 *tp,
         |                                                 ~~~~~~~~~~~~~~~~=
~~^~
   fs/xfs/xfs_quota.h: At top level:
   fs/xfs/xfs_quota.h:180:1: error: redefinition of 'xfs_quota_reserve_blkr=
es'
     180 | xfs_quota_reserve_blkres(struct xfs_inode *ip, int64_t nblks,
         | ^~~~~~~~~~~~~~~~~~~~~~~~
   fs/xfs/xfs_quota.h:144:19: note: previous definition of 'xfs_quota_reser=
ve_blkres' was here
     144 | static inline int xfs_quota_reserve_blkres(struct xfs_inode *ip,
         |                   ^~~~~~~~~~~~~~~~~~~~~~~~
   fs/xfs/xfs_quota.h: In function 'xfs_quota_reserve_blkres':
   fs/xfs/xfs_quota.h:185:39: error: passing argument 1 of 'xfs_trans_reser=
ve_quota_nblks' from incompatible pointer type [-Werror=3Dincompatible-poin=
ter-types]
     185 |  return xfs_trans_reserve_quota_nblks(&tp, ip, nblks, 0, flags, =
NULL);
         |                                       ^~~
         |                                       |
         |                                       struct xfs_trans **
   fs/xfs/xfs_quota.h:131:67: note: expected 'struct xfs_trans *' but argum=
ent is of type 'struct xfs_trans **'
     131 | static inline int xfs_trans_reserve_quota_nblks(struct xfs_trans=
 *tp,
         |                                                 ~~~~~~~~~~~~~~~~=
~~^~
   fs/xfs/xfs_ioctl.c: In function 'xfs_ioctl_setattr':
   fs/xfs/xfs_ioctl.c:1438:20: warning: variable 'olddquot' set but not use=
d [-Wunused-but-set-variable]
    1438 |  struct xfs_dquot *olddquot =3D NULL;
         |                    ^~~~~~~~
   cc1: some warnings being treated as errors
--
   In file included from fs/xfs/xfs_iomap.c:26:
   fs/xfs/xfs_quota.h: In function 'xfs_trans_unreserve_quota_nblks':
>> fs/xfs/xfs_quota.h:175:39: error: passing argument 1 of 'xfs_trans_reser=
ve_quota_nblks' from incompatible pointer type [-Werror=3Dincompatible-poin=
ter-types]
     175 |  return xfs_trans_reserve_quota_nblks(&tp, ip, -nblks, -ninos, f=
lags,
         |                                       ^~~
         |                                       |
         |                                       struct xfs_trans **
   fs/xfs/xfs_quota.h:131:67: note: expected 'struct xfs_trans *' but argum=
ent is of type 'struct xfs_trans **'
     131 | static inline int xfs_trans_reserve_quota_nblks(struct xfs_trans=
 *tp,
         |                                                 ~~~~~~~~~~~~~~~~=
~~^~
   fs/xfs/xfs_quota.h: At top level:
   fs/xfs/xfs_quota.h:180:1: error: redefinition of 'xfs_quota_reserve_blkr=
es'
     180 | xfs_quota_reserve_blkres(struct xfs_inode *ip, int64_t nblks,
         | ^~~~~~~~~~~~~~~~~~~~~~~~
   fs/xfs/xfs_quota.h:144:19: note: previous definition of 'xfs_quota_reser=
ve_blkres' was here
     144 | static inline int xfs_quota_reserve_blkres(struct xfs_inode *ip,
         |                   ^~~~~~~~~~~~~~~~~~~~~~~~
   fs/xfs/xfs_quota.h: In function 'xfs_quota_reserve_blkres':
   fs/xfs/xfs_quota.h:185:39: error: passing argument 1 of 'xfs_trans_reser=
ve_quota_nblks' from incompatible pointer type [-Werror=3Dincompatible-poin=
ter-types]
     185 |  return xfs_trans_reserve_quota_nblks(&tp, ip, nblks, 0, flags, =
NULL);
         |                                       ^~~
         |                                       |
         |                                       struct xfs_trans **
   fs/xfs/xfs_quota.h:131:67: note: expected 'struct xfs_trans *' but argum=
ent is of type 'struct xfs_trans **'
     131 | static inline int xfs_trans_reserve_quota_nblks(struct xfs_trans=
 *tp,
         |                                                 ~~~~~~~~~~~~~~~~=
~~^~
   fs/xfs/xfs_iomap.c: In function 'xfs_iomap_write_direct':
>> fs/xfs/xfs_iomap.c:251:40: error: passing argument 1 of 'xfs_trans_reser=
ve_quota_nblks' from incompatible pointer type [-Werror=3Dincompatible-poin=
ter-types]
     251 |  error =3D xfs_trans_reserve_quota_nblks(&tp, ip, qblocks, 0, qu=
ota_flag,
         |                                        ^~~
         |                                        |
         |                                        struct xfs_trans **
   In file included from fs/xfs/xfs_iomap.c:26:
   fs/xfs/xfs_quota.h:131:67: note: expected 'struct xfs_trans *' but argum=
ent is of type 'struct xfs_trans **'
     131 | static inline int xfs_trans_reserve_quota_nblks(struct xfs_trans=
 *tp,
         |                                                 ~~~~~~~~~~~~~~~~=
~~^~
   fs/xfs/xfs_iomap.c: In function 'xfs_iomap_write_unwritten':
   fs/xfs/xfs_iomap.c:566:41: error: passing argument 1 of 'xfs_trans_reser=
ve_quota_nblks' from incompatible pointer type [-Werror=3Dincompatible-poin=
ter-types]
     566 |   error =3D xfs_trans_reserve_quota_nblks(&tp, ip, resblks, 0,
         |                                         ^~~
         |                                         |
         |                                         xfs_trans_t ** {aka stru=
ct xfs_trans **}
   In file included from fs/xfs/xfs_iomap.c:26:
   fs/xfs/xfs_quota.h:131:67: note: expected 'struct xfs_trans *' but argum=
ent is of type 'xfs_trans_t **' {aka 'struct xfs_trans **'}
     131 | static inline int xfs_trans_reserve_quota_nblks(struct xfs_trans=
 *tp,
         |                                                 ~~~~~~~~~~~~~~~~=
~~^~
   cc1: some warnings being treated as errors
--
   In file included from fs/xfs/xfs_iops.c:15:
   fs/xfs/xfs_quota.h: In function 'xfs_trans_unreserve_quota_nblks':
>> fs/xfs/xfs_quota.h:175:39: error: passing argument 1 of 'xfs_trans_reser=
ve_quota_nblks' from incompatible pointer type [-Werror=3Dincompatible-poin=
ter-types]
     175 |  return xfs_trans_reserve_quota_nblks(&tp, ip, -nblks, -ninos, f=
lags,
         |                                       ^~~
         |                                       |
         |                                       struct xfs_trans **
   fs/xfs/xfs_quota.h:131:67: note: expected 'struct xfs_trans *' but argum=
ent is of type 'struct xfs_trans **'
     131 | static inline int xfs_trans_reserve_quota_nblks(struct xfs_trans=
 *tp,
         |                                                 ~~~~~~~~~~~~~~~~=
~~^~
   fs/xfs/xfs_quota.h: At top level:
   fs/xfs/xfs_quota.h:180:1: error: redefinition of 'xfs_quota_reserve_blkr=
es'
     180 | xfs_quota_reserve_blkres(struct xfs_inode *ip, int64_t nblks,
         | ^~~~~~~~~~~~~~~~~~~~~~~~
   fs/xfs/xfs_quota.h:144:19: note: previous definition of 'xfs_quota_reser=
ve_blkres' was here
     144 | static inline int xfs_quota_reserve_blkres(struct xfs_inode *ip,
         |                   ^~~~~~~~~~~~~~~~~~~~~~~~
   fs/xfs/xfs_quota.h: In function 'xfs_quota_reserve_blkres':
   fs/xfs/xfs_quota.h:185:39: error: passing argument 1 of 'xfs_trans_reser=
ve_quota_nblks' from incompatible pointer type [-Werror=3Dincompatible-poin=
ter-types]
     185 |  return xfs_trans_reserve_quota_nblks(&tp, ip, nblks, 0, flags, =
NULL);
         |                                       ^~~
         |                                       |
         |                                       struct xfs_trans **
   fs/xfs/xfs_quota.h:131:67: note: expected 'struct xfs_trans *' but argum=
ent is of type 'struct xfs_trans **'
     131 | static inline int xfs_trans_reserve_quota_nblks(struct xfs_trans=
 *tp,
         |                                                 ~~~~~~~~~~~~~~~~=
~~^~
   fs/xfs/xfs_iops.c: In function 'xfs_setattr_nonsize':
   fs/xfs/xfs_iops.c:662:39: warning: variable 'olddquot2' set but not used=
 [-Wunused-but-set-variable]
     662 |  struct xfs_dquot *olddquot1 =3D NULL, *olddquot2 =3D NULL;
         |                                       ^~~~~~~~~
   fs/xfs/xfs_iops.c:662:20: warning: variable 'olddquot1' set but not used=
 [-Wunused-but-set-variable]
     662 |  struct xfs_dquot *olddquot1 =3D NULL, *olddquot2 =3D NULL;
         |                    ^~~~~~~~~
   cc1: some warnings being treated as errors
--
   In file included from fs/xfs/xfs_reflink.c:27:
   fs/xfs/xfs_quota.h: In function 'xfs_trans_unreserve_quota_nblks':
>> fs/xfs/xfs_quota.h:175:39: error: passing argument 1 of 'xfs_trans_reser=
ve_quota_nblks' from incompatible pointer type [-Werror=3Dincompatible-poin=
ter-types]
     175 |  return xfs_trans_reserve_quota_nblks(&tp, ip, -nblks, -ninos, f=
lags,
         |                                       ^~~
         |                                       |
         |                                       struct xfs_trans **
   fs/xfs/xfs_quota.h:131:67: note: expected 'struct xfs_trans *' but argum=
ent is of type 'struct xfs_trans **'
     131 | static inline int xfs_trans_reserve_quota_nblks(struct xfs_trans=
 *tp,
         |                                                 ~~~~~~~~~~~~~~~~=
~~^~
   fs/xfs/xfs_quota.h: At top level:
   fs/xfs/xfs_quota.h:180:1: error: redefinition of 'xfs_quota_reserve_blkr=
es'
     180 | xfs_quota_reserve_blkres(struct xfs_inode *ip, int64_t nblks,
         | ^~~~~~~~~~~~~~~~~~~~~~~~
   fs/xfs/xfs_quota.h:144:19: note: previous definition of 'xfs_quota_reser=
ve_blkres' was here
     144 | static inline int xfs_quota_reserve_blkres(struct xfs_inode *ip,
         |                   ^~~~~~~~~~~~~~~~~~~~~~~~
   fs/xfs/xfs_quota.h: In function 'xfs_quota_reserve_blkres':
   fs/xfs/xfs_quota.h:185:39: error: passing argument 1 of 'xfs_trans_reser=
ve_quota_nblks' from incompatible pointer type [-Werror=3Dincompatible-poin=
ter-types]
     185 |  return xfs_trans_reserve_quota_nblks(&tp, ip, nblks, 0, flags, =
NULL);
         |                                       ^~~
         |                                       |
         |                                       struct xfs_trans **
   fs/xfs/xfs_quota.h:131:67: note: expected 'struct xfs_trans *' but argum=
ent is of type 'struct xfs_trans **'
     131 | static inline int xfs_trans_reserve_quota_nblks(struct xfs_trans=
 *tp,
         |                                                 ~~~~~~~~~~~~~~~~=
~~^~
   fs/xfs/xfs_reflink.c: In function 'xfs_reflink_allocate_cow':
>> fs/xfs/xfs_reflink.c:403:40: error: passing argument 1 of 'xfs_trans_res=
erve_quota_nblks' from incompatible pointer type [-Werror=3Dincompatible-po=
inter-types]
     403 |  error =3D xfs_trans_reserve_quota_nblks(&tp, ip, resblks, 0,
         |                                        ^~~
         |                                        |
         |                                        struct xfs_trans **
   In file included from fs/xfs/xfs_reflink.c:27:
   fs/xfs/xfs_quota.h:131:67: note: expected 'struct xfs_trans *' but argum=
ent is of type 'struct xfs_trans **'
     131 | static inline int xfs_trans_reserve_quota_nblks(struct xfs_trans=
 *tp,
         |                                                 ~~~~~~~~~~~~~~~~=
~~^~
   fs/xfs/xfs_reflink.c: In function 'xfs_reflink_remap_extent':
   fs/xfs/xfs_reflink.c:1099:41: error: passing argument 1 of 'xfs_trans_re=
serve_quota_nblks' from incompatible pointer type [-Werror=3Dincompatible-p=
ointer-types]
    1099 |   error =3D xfs_trans_reserve_quota_nblks(&tp, ip, qres, 0,
         |                                         ^~~
         |                                         |
         |                                         struct xfs_trans **
   In file included from fs/xfs/xfs_reflink.c:27:
   fs/xfs/xfs_quota.h:131:67: note: expected 'struct xfs_trans *' but argum=
ent is of type 'struct xfs_trans **'
     131 | static inline int xfs_trans_reserve_quota_nblks(struct xfs_trans=
 *tp,
         |                                                 ~~~~~~~~~~~~~~~~=
~~^~
   cc1: some warnings being treated as errors
..


vim +/xfs_trans_reserve_quota_nblks +175 fs/xfs/xfs_quota.h

   170	=

   171	static inline int
   172	xfs_trans_unreserve_quota_nblks(struct xfs_trans *tp, struct xfs_ino=
de *ip,
   173			int64_t nblks, long ninos, unsigned int flags)
   174	{
 > 175		return xfs_trans_reserve_quota_nblks(&tp, ip, -nblks, -ninos, flags,
   176				NULL);
   177	}
   178	=


---
0-DAY CI Kernel Test Service, Intel Corporation
https://lists.01.org/hyperkitty/list/kbuild-all(a)lists.01.org

--===============8184469376020611290==
Content-Type: application/gzip
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: attachment; filename="config.gz"

H4sICFduAmAAAy5jb25maWcAnDzbcts2sO/9Ck760s40rSTHjj1n/ACBoIiKJGgAuuWFo8pKqqkt
50hy2/z92QVvAAk6nZOHRNxd3HYXewOQH3/4MSCvl5fn7eWw2z49fQu+7I/70/ayfww+H572/xOE
IsiEDljI9a9AnByOr//+trv5N7j+dTz+dfT+tLsK5vvTcf8U0Jfj58OXV2h9eDn+8OMPVGQRnxWU
FksmFRdZodla37+D1u/3T5/ff9ntgp9mlP4c3P169evondWAqwIQ999q0Kzt5P5udDUa1YgkbOCT
qw8j86fpJyHZrEG3Taw2I2vMmKiCqLSYCS3akS0EzxKeMQslMqXlgmohVQvl8qFYCTkHCPDgx2Bm
GPoUnPeX168tV6ZSzFlWAFNUmlutM64Lli0LImGmPOX6/moCvTRDpjlPGDBS6eBwDo4vF+y4WZqg
JKnX9u5d285GFGShhafxdMGBM4okGptWwJBFZJFoMy8POBZKZyRl9+9+Or4c9z83BGqjljy3JJgL
xddF+rBgC2RhM7MV0TQuDNieU4NfKJbwqWe6ZAEqWTMZmB6cX/84fztf9s8tk2csY5JTIxMVi5Wl
UBaGZ78zqpFlXjSNee6KNxQp4ZkLUzz1ERUxZ5JIGm9arMqJVAyJ/AOGbLqYRcpwaX98DF4+d9bX
bURBvHO2ZJlWNUP04Xl/Ovt4ojmdg9ox4Idux48/FTn0JUJObelkAjE8TPzCMWiPbGI+iwvJFAyW
MumspDextrdcMpbmGnrN/MPVBEuRLDJN5MYzdEVjKV7ViApo0wOXUjcso/niN709/xVcYIrBFqZ7
vmwv52C72728Hi+H45cOE6FBQajpl2czm21TFcIAgjKlkMK3VTVRc6WJtiwHgkD4CdmYRnaHBrXu
dtUyRnEXXjH7PyzJLF3SRaA8qgI8KgDXZ2YJbMaHz4KtQYF8K1VOD6bPDghZYfqoFNqD6oEWIfPB
tSS0g8COgdNJgtYztXc5YjLGwOixGZ0mXGlbU12mtIvl8/KHVxJ8HjMSgs7bWMNjtftz//j6tD8F
n/fby+tpfzbgajAPtnEzMykWubL5nbKUznwmPJlX5JaXMt+FojELW2hEuCxcTOtkIlVMSRaueKhj
7yqlttt6JlINmvNQ9WYiw5Q4w5XgCBTjE5Pe8SqSkC05ZcPDgbpXG8eFT/PIM6Axsz59FXTe0BDt
zBV9HZhv2Nj+ecaMznPBM43WD+IC32QNz4wT7kgKfCZwPmSwySjRrky6uGI58UsGzYcXg7oBDDSe
XIZ+EiHQTg4qN8RCAkxmyj+xIhISPQb8k5LML5QOtYIf7WJLmVQfpe1ov1OILTh4fmkxZ8Z0ilYQ
OAGxTNJlWwtuphvFoMSJb2plMGI5p8a8gejm3thoZs02iYBL0gljpgQ8erRIEk/jaAFxr7X18BO2
ht2c5cLbVPFZRpLI2rhm0pGjG8bzR75tSLgVyXJRLGTpqGp0uOQw7Yp11k4F+zIlUnJbAHMk2aSq
DykccTRQwxLUR82XruD7MkRZpwJMeiiBWLrUoPOJIO6S0ykLQ+ZX45yORx969rdKUvL96fPL6Xl7
3O0D9vf+CN6QgAmm6A8hMLFt8n9sUU91mZaSKCONjmapZDEdtDgY1RMNKcHcbUJ8cS/25JKJqZcN
2B4kKWesDte9vQERml70foWEDSOsONbFxkSG4KAtZVTxIoogHckJDAIChSwDjJ6lRynJDXxVLDI0
PJwkYAVCZ/Nqlho7i0kZjzh0UQZl1q4UEYfUa+aNcdz8qmHpjbXjmjgZRp9KMJ9llNUniFcMIlfd
Rzj7H/oupqjpTGbMUmKahpggohntQyHtfTmeX57295fLNzX65frjzWhkZWh1Y7CUfmsKwSYOyrKQ
EyuGMfRFStbFJwibBUhI3o+vSpXPTy+7/fn8cgou376W8Z8Te7QOr9CpupqM6M2H62u/Mjk0H79P
89Hvn1yaD9+lufl462FGyXlQ17S0MiQMwd+q+9G/t6OqBtD0BvnLeDTyDgSoyfXI0z8grkYjWwfL
Xvy091Y9onTuscQEwQ4m3xKFUybYnnZ/Hi77HaLeP+6/QnswOcHLVyyqnNvYXDFdRJYxjskS+ACJ
ZhkCx0LMLUOP8KvJlOtCRFFhe1oRLhJI1MAAG7+G9toK92eaTGF/J2DYwD9MOgar7BE9ks0qTEZt
S9gPhWdULN//sT3vH4O/Shv79fTy+fDkpFhI1G6xdru/1bZrE77DzCYP0BBxgFNmFj+NXqkUvdTY
ZRY65cLEPX0+OkF6SV1uUHRgHuWpaBZZ18E5jUu0v3lV1PGNDFlWU/LxRhftenyta+PyZsOiE3NZ
GBWTsXfbuTSTid8KdKiub/4D1dXth7dnCzTX40lXbAYVExXfvzv/uQWCd70BUOPRxLw1idLRpVwp
8FVtqlDwNBdS+5suMth5kIBu0qlIlGfyWvK0ppq78ZcNLVYx18ZNW1W6KW5FS6UhA1BUcdjkDwum
tIups7MVViVcFKYNUzXzAsGj9uEQRbOZ5HrzBqrQ49H9cz8/QTfm0/Uar2MptE6cQLaPgw23cuJz
XGHlYk35TQ4MsZr6+cIFBLIso5terzWeCm9Ntuq0SB+684WgoohUtz8UqchJ4lUXJCjL0BAIULkx
Bayefc23p8sBTVygwdlYTgNWrrk2BiFcYtpmRWIEUpqspRhEFHQBGR8ZxjOmxHoYzakaRpLQZUgX
n4sVJIqMepnTJZZcUb72pkVr30KFihxw23HKZ6RF+QfXRPLv0KSE+ilqvAqF8k8BK4ohV3MIyJnX
lEN0vS7UYuptrUB5gRvF+vbmzQlAkL5eEcnaoVruJGHqnxoieplNO/RsgCv1kAlYOK841CLzDzgn
4Hvf7JRF3NvjRi1vbv2dWsbBJ8E6jOvsLHtDpw/FkkNj4e5zAFcVr/KkQrS1PicKBzouyvAxZMRM
xq9ELd18M/XasRo/jR4cCxs9FLWx6hXu2qMGZ4LNllHZ2PY8lRFSOc9MeEKb8y727373etn+8bQ3
J4iByZ0vzlKnPItSbeLNKMy5fzdXRIpKnvvsqolp8WiuIowSx219B1iIJOwhPnnJIWaQwEwvDpy9
Va3GolC4MMd5DTuH2GH4ke6fX07fgnR73H7ZP3vjfBw2ZVZObmafYa0EwGBS7AJinkA8nmsTgUPC
qO7vzB+rrCPkBkJbCFTsfWHSd8kwSnHcaibSdFFUeXsZibA1Hmq0IbEpn+dMmvx0njo7KmHgYggo
mle+n3JIkz1y/TRd2HVqyPFYsWS0rCu0NQEmcURzguLtfgZq3j0lbYQyzPd2XZaw1XwKCwfvX0fa
RnjZ/vLPy+kvSDwsqbUTJHTO/Kc1aGW9CO2NANeRtMSPX5jEVQmDDSXJTHRApob67IDAR4AbTbgb
yRgUuDmsjgzMwTAbAkzHgZcDx50xIPC1tAgy1TlzRqtAvgFbx5H67cI6zE2Jnmkfs3gpuPY8Ji+L
yZR4gzNA15FQAZZRM9lpHPEpKj57Q9PqIXI8l8d02TuvvOy/IiU6tgqzNQ6ytalQzMHkWd6ZEkCK
MKa5fxTEYh3f10oS6WuF0uA5z1shlpAZBgIsXay7iEIvMqfy1dDb7kZtIFYUYs69DCmbLDV3e1mE
/t4jsXBnAYB2Jvb1C0TaCmkAjkLWkGYbWZOucZCmuBx2KXiOCeGA/vUWYIAhJ7MOCIaowW73yAVE
DE9AklWPojsaCE9pKZydh0PCz1mj9r6Us6ahi6l9GFtf+qjx9+92r38cdu/c3tPwWg0djubLgSw+
1159hpXgVRrIiWhK5NxViVzneMUHsu1o42BMkzzemMoU7Ns07xzPA03EEz1w2DjN+8h2H4WU5h3l
QlApx+fSMyAgoJSH56E7UVVHBRJNyujZ2fUN8moAPNRGR5IWTk7uYOpWjSccnGq7kOoYJN7u/nIK
dHXH/j47rRxbpKj2SVvah8Xwgepkiw1BQ0coGi8bWfsYvyHeAangZhpoUJgM2vKZBlhJ0srsUt9V
q4lrYvG7vrnjVStDsLzyncFoS6Omkocz1v0u+CwFvmVC5G7ho8Sm0plLBaVR6p3JMiFZcTuajB88
kwkZRRf67H63zrFeTUJbGviYtF+QCSdzu4NlQXJwji6Y52GYO5YXAVjVID5xrSfX1ngkn7ZfeSyc
GXPGGK7u+oPTfQMtsqT6YY6dwUZkmvgiUatJGXC0Y0Am3x8C+eTJq2o+UN9pXpgpvCog8HKeJXTQ
OWKKNI5YG2j9c+k3YBZdQnwlqZYgdJKaFp7RgZGHM32Rs2ypVlzT2DPmsorZbIbVsGFf11BAwpJP
IaT29WySbnsAP6K+/mOHEZDEznsbPs29cTiKN1NW3BYr2fEqRbl8UPmB9skVqI6CnYTbou3pQWrp
fkH468QlBgZxhadfg0pj3lXFjLq3wipUVa80HlSaYkX3YgyiSsfqiw6MNVgX04XaYB5hhTnTB+co
wBz0a8lI6qm42hlUcNmf3et1ZnJzPWOZWVTlV3rkHYSdiVkndySVJOTCq1+U+Ct1U2/FIYKFS9fP
1LDqEinoqfLpTkPWOsvaqa3n3qMdaDGnaausDiet/BjyE9k9eVpxyZKhwwoZzbn3NAiZftdJAu7y
uqbVUa674ftTlHDrag9+dYMVA4Neyj1gCQPAC+W/zUBZHhf+m8BZZPki+IANPeNg0p05Azijvv2A
mJhytwcVhwltE/3tKYgO+ye89PH8/Ho87EyMFPwEpD8Hj/u/Dzu7ym464KnbIxZXxqNRB5hdf/jg
ARV8QruzB8TV1SB7Wgpo+ibFpFgQ6S9MIEnKqRSgamG3I3txejKGf0mHZxW0mXyzO/8T+xp3riBg
T5irhzxyUstkVaZYPoeqwHhh0cm6xCEFqI9zwSkiPBGly23vFOlYC5HUbqFnrUIz0SA8Hf4uS7f1
hCkl0jHWOU0pJ70Ocvp+tz09Bn+cDo9fjMK0J/+HXdVxIPq1pEV5mh6zJB/IWWAn6TQfiDwhBcpC
knRuVddzlWXnEZepKf2bZwC16keH0/M/29M+eHrZPu5PVllyZY60HVNUg0w9MYSOnBt+WpJmEOuM
sm2FtapqjbZV8BKAAJNkIB5oG9SHtnZy0l1R3WpFgAkYq1pF3NoUm3NdP64DtQSCp3vlbTZvlG3Q
bCldy13CsW5ZtYXgMAVF9ZcLkYyoTUZr4lyKqU/Iks2cQnH5XW1UF6YSnoJv79GqPOU94tW4R5em
9gFIPZD91KHukFIriA9TUhfaQW8iW68QFUFewMqbLbYwB7aOUd3p67lvmiFMKsrVtdFeCfIFttUo
dk+NCxNgf0xR2tr3s2zogoD2ufhQW8UVEdm/sUastXNGD0As/eP9eQfIiEw2ftRcTH93AOEmIyl3
Rm3uTtkwR14CbwXB1luCbJyTiBKBqYvNT4CiZR26hgwBDLrC4QP+7nk47rBskST44Ys2QilSXxvM
GN64RhDKqXPhBr+L+q1T9R7ojebZ1D4+qoCSWE7fAlZvT8Y3Ppy5Fv1hdHfjrAjDXxourUEccLVJ
1P2tFSE5BKvhkxe8a4kiQo/nz7rKxKnD8B6HgWP9kH6ZskC9fv36crpYERFAyyvTdlCDwKYc7g9I
kCRepV5RGGREphIPJLr9Rt7YBTGayJmdyltAUE6ldCytxyM2FjXK3y6ivQlUmF4VuQ6KbD6VZ4GH
865vsEh4PbleF2EurClbQNeGgxdKN+7uBebcXU3Uh9G4JQNjCnnKApw9bmtOmZU0kzxUd7ejCUkc
pnKVTO5GI1/5qkRNrNBWsUwJqQoNmOtrD2Iajz9+9MDN4Hcj68AhTunN1bVVXQrV+ObW+la46drj
KLwnvC5UGDHLyuEpbSG1svrNlznJbEsYc8XhLzyVghi7JaQTNFd1ZZcxcLFpcO4qeAmHnTWxwvkK
mLAZoZseOCXrm9uP104EWmLuruj6xsPoCs1DXdzexTkz6+k2ZgyyjA9enetMvnwnuP93ew748Xw5
vT6bu+3nPyE6egwup+3xjHTB0+G4Dx5BOw9f8af9CA5CSzvS/390ZiZBni770zaI8hkJPtfx2ePL
P0eM0YLnF7yLEPx02v/v6+G0hwEm9Gc7PCZYrScY5ua+jIDRWFiVu1oXKjG3Z8L2/itfbGEBpYT0
JW4u0qXC8SGS8LBAP+wrAWAD60gZm5fXQmxIlXs4d3cQjo8Ji8jzqAynWM2tvFn8EzD3r1+Cy/br
/peAhu9B4j9br44r062cfIXGsoS+4ZZho1mbom4w88CodfhmJt+YG+d0EDEUX1CTbOBg1ZAkYjbr
XP230YpiXRJj4DplMSzRtcKdOxJTOS8l1GE85K8+MDd/+zAKH4UPwBM+hX88CHwu7b73LlEyb/pq
XwR21tHjy8rcyh5iTBh3lS0uZEhoT7UAHkM0vhruqGCptxlJFsRraHwbp/Ev2iobKAxFkClWslU+
BMFz8IJJab8mQZS5kWytDGG5YWhpEV6Ol9PLE15dCv45XP6EuR3fqygKjtsLpAjBAZ/sfN7u9s77
B+yExBS2GUTReLPbV49DPGVL4lT/EPggJH8YDLRwcG9K4D15LYOG6nFZDaRg88urvM82LOIJ48KF
5cbKtAclVdW8DnraqMDIsIHapb3ykaV/R0LU0jNB/Pj19dI3k9Zxdb7QvVbx9vRozDz/TQTdjYoP
0e3gAD7x78oRt3IzCNhsuZr4tNegJVn121Qe4612gMPY1NNW0jcbkhzn0283y8tefXcg6xW3mSRJ
WTdNaraXj3fN7T2fNEpxgCve7kD9+0Gm1s4dgeXwtaW72yLXG597K6Mcg7VOCRtglQJNrps0JwnR
E+Mz2OoqU2m9IZ/fPgWP3SIbcogkZbJLnTudJeJ2cj3q8rwC269mhbkwPeBurCbjG4hbwRARAA26
J4s+wmvtvvTUJkpZVqR20cNGZtLUZdX9Bx9W4v8xAFnFGyTmglrovK2zxybZxtSglR9PVI43+ZY4
wBAfTX0Gs4vvrDNkGo9CyjTE25NUvmNJp4+Vc4nBRQ1NUOrJ7a3vwndFJKLGwtcBfQb+AdsCtVE8
E0j1g72yPTIn4Zr1JFgjWimOOxSuSbeAJgYSSR+peOS8m3XAVqsuJxSl2dpX+Wjw4xuuPq7XHi42
uMFThIqwMqC/azLrniZ4CSu1GsRhNlRqZ1e3baIpWYR4X/B+PL6e2G/8Ktoq+8tV74ij06ekHsah
Ya/Y+mZTFHI5166QI5UUST6wheCLrU2Rmc84BaPnqwtXtGgpPo2vrnssQyUz/XfVokaYl6D17LpT
aIg8y2yDN9cCd2dGtUyML+vNLSuD+RAPQ9r6SWFO0hramUjCiKu48jkeaFXQ7G2LrJgp+0wNS4LY
SRv/lP/1R3lRpQNVmFS1RYUl7T00rxZhXjUtrHrI/zF2Ld1t40r6r3jZ98z0NAG+wMUsKJKy2SEl
RqBkJhsdX1u322ccO2M7fZP59YMC+MCjwPQix1F9RTwLhQJQKECJVFgAzSKbaepm5H/Pk9q4czYV
XvN2aeuzCkdwsKigkaY4EwYd9ifUPUrTlXPGeH/AV0aSR9lx8r7VYQv75ma2upmoCEKzWCQZm6nc
X9slhks4+63JvcEyXA7hb8e75ehZyMnYVha/PxgE6euouktzwBkUvTpx3aroC/Gv0+REEmo+7T6a
VJdN6D1w+KoaHKoFZVfpTiQ6ujue9r0NTqlpTpJgYnUtLOoHLITRlCTvw/Bzp+8o2Yh9TiwUYPNJ
iC86sF0DUN+5gM4Rg+UoFqjgPqxO0FxjX0wLzuxobEFCO2z2QgeIpjKcSwBQ94YxiQVQxhc4mUkp
72O1Qfrt6f3x69Plu6gBlKP48/ErWhihpDfK3BZJNk210/3pxkQtFbZQDXfnidz0RRQGibEhOkJd
kWdxhF90NXm+e+otOeodKFYsg0PlcaalhfLOnj5eSb5thqJrSmO7a601zVzGI1dP2Djg4K3SmbOM
5E9/vLyK9feXN6tnmuv9pu7NFgZiV2wxYq4X2Up4zmxeD8FB3SIQi8DKCE5X/4RjPDWrXf3y5eXt
/enH1eXLPy8PD5eHq99Grl+FPXgvmuIfZrkLOCEcRcbqAQjRIg/OVzYPgLNqqxM164glKOVWP4dC
7QTg/FC1qk812h7UHDdpohV1s9fIjdetdZtSA5U5NW99fxeq41lYBgL6TXS4aM27h7uvUp/MqzWz
beDO7O589JiSwHLYb/b99vj583kvph8vW5/vuZgKcXdWyVDvPtm+MbI4+/c/lYCPRdaEQA/14hUj
Q8r748ZsWt7kuok+k8bNeIRZHtrD4a6JqXN/O6jQgsBoWNECwOJT+7rK1r4LPfZ9h/lImYf/N9z8
Yeh7tbvD66v7ZStuGoyS/PQIJwO6rEASoPwx75ROW6+KH7Yn2a7vRh7lYdPxKQN3ZoDPi6YGZ5cP
MoqS4bKzgHJjAi/LxCIHrpbnGDT15dXRP13fiRK93P8PUh5RdhIzpsI3TslVz/KuYHfzCZzdIE6I
70bD1fuLKN7lSki4GIkP8lqqGJ4yt7f/8uUDx0eMdmGonYU5DEWr6123DvOX47S1GPJjvJwROM+h
65YPYILF+GGe2h538uDd/AL+h2ehAMt7xj8dTqUSa00aZFoDjPQyz4LE2LqbkLboaMgDho6ZiQnC
PngCZc4sfbvFNigm/PCBBbFbsH1RNXq0zrlY4KwH8UnPXBfJgxDHt7u3q6+Pz/fvr0+YwvOxODmA
GZi7JSp4lDYkdoskAaYBUDBjL2ckiEmO93DyP4a5jckcXma/nUaY9Ul9+GhGY1U97jKroHAWrTB8
rmfS+UQsqhOGUlLFkiMNg8UcVXdIv9x9/SrsB+DA5kH5ZRoNg3SMQmVDsqhtDj9eiH7Aw+xJuLyF
KxE/rI+2PfwJCBa2SK8oah4ohoOsmOfzm+a2tBqp2V/Xxclpug1LeDrY1Gr3mdBU2xyQPZe3eVxS
IVD7zdGpktr+8hUI4soZYXyBeFuUWRjZmY/GjUnM2/K8leeX9lVhrJtnA1NSL9+/Cm2NdX9edrFQ
r75C5+Wus9rg+vZsmHaa/AVOH0k6xbSKOnKAxUc4WImNVCsI8YzozhkjdcvidHAy77u6oIwEXtPD
ahs1dLal22Z6qptSFIG0tycnP2X0+sdJ04VZhHmpjChLnaawVdzcqGkS283Qd1wQWYK0gwAowSeI
hSMj2PmPwj+2A5LwbcuyDPfnQJpRNi/YwYhIjl8hqIRPj6/v34T9sKrJ8utrsR7N8UWJajhhQhw7
fQShCU/f6B6kt+RcLOGYya//fhyN8fbu7d0qjeCdLtJwGmV4fDeTiWFNr7OQW81iXwBzp2Ch8+ta
ryZSXr0e/OnuL/3MTaQzLghuqoOZr6JzYw9sJkNNAsNryIQwNWNwkNCXauIBqOcLw1QxvggDH0C8
JQ+xUWtyMN/HcYCpP50jZQFeiZQRT+2qIMJrwSqSIj0/9vBsEMEuqfScNfZvNfLZM7faLDKWsLHp
r3M0fUGzmOJg2yeh3n06JgbysTHjdZrwlCladjXV4sauwzZvGaO+6TLsMER/NU5N1Ica6nHobK0U
jELwY9c1n+wKKqp7F6src8WBKbfRVMrLAq5DCgWgHz2AJ7780nSrAv+Kg5z/g4QgiY4JnYtbGhBt
ME10kM8kwOm6QBt04uGnLp1vtL2iqbgGEUJ9LcTFBXhMYPORpsOARzORq6zB26AAizXn9liJZWJ+
NO48j6mLSZikQRRgOY8YptMNFkoGvYunSgp7RvQJqnMmlpp3kIPmgT0CIl2WBaELgHmh27MT3Vyf
LMnIpnXZmz5MYoLmS6I4TTEZU2fu+5Ep8URL1FKS1s3fYMrWmqjtaEIzrDxCMCIS44Jh8GTY4kTn
oDHSogCkYezJObZyRjhEB6KpxhlDAN5uwggpxmj1pa7oSolWujlCBuR04GlcXBixQx8Hq4J56LMo
jt3SHAtOgoAi9SqzLIu12Uy61Fs/z6facApVxHFjUiy6XVd/5VKHuOqMztxlGhEtU4POMHpLAkp8
QOwDEh+QeQDTCNEhknoiGy88mTCU0IP7iaNPB4K5tgsgIgGeM0D4EZLBk3hiKus86c9KF6VYS/IQ
9cfnRZpQvLmG+rzNIcLPrj/s8WiVSzLgXLRWrn7okI6Xh769WPEhEE+wGwdwOwAToW1KhLW6xQFG
t9cYEodpzBGgF+b/sc/7CgGvm5gw3U9BA2iAAmKGz1EyRajqdGjnIjf1TUJCpEnqTZtXSL6C3lUD
QoeNnVE/OD1Z9yxd6cffiwgptLAADoRSVPYhiqCYBVfSVDo0Rj+WUOq5qWxwZUjLKAApMBz3khgR
IwAoQcaPBKgnKRr5vkjwUgkAyRxmdppi7QBIEiTxSiNIFoJoRAkkiDoGIEtRekhSTNLgRgs6+iQQ
4pknSUQ9dUoSNDi7wZH5GkSUETUtZpaiC9HZpi+SGJm12mq3pWTTFvbkOTMcUjHCQ1RO2wSN+zPD
qeezdK1LBYx0j6Aindm0DBO1lnkyZusZMzTjDB/hYspcTSzzlEEsakMsnLfBEWGjVALImOsKlobY
mAMgokildn2hNmhqbt31nTmKXgyfte4FjhSbdAUgVnGo9AOUBWu133VFq5w4nbpsWZxpzdKNzhlO
JhL4mb1DaIKvJQyeVUHdiBVeZwZw0Cahc7HdduiFqYlnx7ujWI51vEMm3PoQxhQbxwJgQRKhuR46
HkfBusVV8yZhJFyb7pqWikVkgoovzC3o2xUaR8iwuWTU5mjJlbYOsL0EjYUGPv0sEGxeU/qS4YUJ
oyjCU2MJwyaOTtQcG31tkiZRj46ibqjE9LSmrz/GEf+dBCxHJlmxDIuCCJt+BRKHSZpheR6LMsOf
9NA5aIDUfSi7imD5fW4SEqBqsLttwXBbFTm+6e2H/GyOm554HmhZOOiaeAg8/I4VUADF2odlW4lp
H51uq7YgkXk3GOOhBL0/rHEksA/mtipveRGl7QqSoVpUoZswWxvEvLiJk2FYooO5yQAH/WkaIbIQ
5X3P1YhDCtcmqyZbXhaEspLha2WeMooBohEZqg53ueHzoNPtuwAzEtJVWeqLFLGU+pu2wC59921H
AmyMAj300JEqCnqESQnQ8bWqQGKyJnqnnlCCJHnLwjQNkcUhAIyUWGYAZQQ/ojR46N/gWSu0ZED0
rKKDsjF9czS8Ebq+R20CBSb2W1sulxgQN9h2vslS3Wz1XKQphcZanF3Nf9gUJ27EDOz2t/mn/RG/
rTZzKa979bZhtYP4zNhOxMwOUQylm5VIeHkeeoYnvxK5A3Z7937/58PLH1fd6wVeWH359n51/fLX
5fX5Rd8Qmz/uDtWY8vl6f0KqajKItmzQiltsOzzSiY9dXh5YxAZjmyL9Lux2jX3BsPh+2yP3Bgyy
lpPmyQO+VyHyqXLKQgB1PL6Q53ZalmoTirQOOJ8ESYakO94icoHPdX2AI0AsTwnwbi3H0YUHq+It
QoTlbThg5RCtd0TIyjXifFvqcUqFMOeUjMTJO2B8P2vuzOLu9cEMOMY3XbFSFc4hhjzn9ca4uMY3
xo8pKpV5/LEp4PEO52MgW0zqtvzejEQKAN82Occjxkh8yhfeWylaT4RHnRE/h1Us4yHhcgXhX9+e
72X8uvGWrbMB3m5Lx5UXaHnRsyyKsauPEoaLIudtUw2F7jq8QDdNUepRTQQgihhngb4MlFTNfUZP
RR7IYTTzCgfQZ6cYowaK6tlvk9We3QKN7yQ5xIydGWX4Rx7PjgXH9hYAnX05bVpoV0pQiecoTMLN
Dt92B/A67ytwzuXna447VMtmK4gYyc6lSp1jOkjTaDd1IuwZsWwywtT08IQQr4vQZK4/8oRafTte
EDAEhrGuZfqSZiHGtgTMp40m1fKLWqgswaiZ0+Dq/BSzpyXaJ8YezUTL7JJMWt5O/lR3ED8iP6Av
5gkG0J9mWtNpsJ7URAM7HHPSmGDTPUimLw/wLNoHFjC7pIdd3CcE2yQAlNdRmgzWxTUJtLFu/86k
SdEaefAPn5joR2yY5JshDgLrarL8ZnKjNFLqa7G6CMN4OPe8wBsF2JQHnl1V8XHTHpFP4AiVBLEm
usrHTj9DU5TUEm/NF8+mGkeyU/aT759TLgHE6EpMS48huWSE4lRXnd42hKYh0pdNG8a2rLiegFJT
H+rP+92a8lWugpZggMO5VRbbH3ayXWZDW78i5pvtFmNk8SJarKGJ6A0SvHBs6wECD+ybPr/W5HBh
gDu1R3WBmh9b/c7uwgMRNNRji2tcQs9ds0RrDgMa9SJSCZi4GSohGk8ZhxnDkp6nXSTlaf5eTRqZ
zrUGtuY5Cwk9CNH3CAyE6iPPQtBvxEIzDmPdIcHCGENTNM3Cha7mPVycFHaKQ2zbbmGreZOFAVoi
2NalKckxDFRXitZRImgrS58fVKRsZ2MTwdsLNoVjlvmgJE0wyJ2qTSxmvs+sudzAWBKhBZFQ4v0q
i9F2ck0EG8tQWZUYC/xpMoqnWXRE1A3/rosjgn/VMRbjtRYIrjra7mOaUY/qAMuFYHtoJgvF6y6Q
GNUptpFkIhkqCeDYH+G9jdk/GrplA7pPrrMcP1dGeHMNOwkFgBdWQrh2kFCGQ7qf9kL+KJZNbphi
HRTL2vPJOgxbWA457zbV4fCpq8/9/ljc8OJQwfq5h9ulq9WfrDsX6CMWEE9+jp8XytSeKL44WZh4
cx17XifXmIQdGCSo3hMQo5FnipJgii+iFy44aCFCjn/OJq291ZICE/WItzL68OHimok2hqsfiZEQ
VRWuOelgaMe7BqJm0IxX/R3ANuAs8W3yTb3RQ5NWhbM5qp48AgScnPFAy4pnxN2PR+C88kTWxLgp
DycZF4BXTVW4Ud7ay8Pj3WQ5vptvEY8lzVsZu3MszA8TzXd5sxf2/8nHML70sMIh3/7wgbw8+KDp
SpwPly7fC6bdF3OqrDXF/csrEkv0VJfV/mzEvhhbRznXNUY49NPGtdTdxMc7PQ+Xl6h5fP723X1Z
VOV6ihpNSBeaXMP8QOjQ6/JJp9qIGScZ1h8IUjzK3m/rnVS5u2v0dUCZU1u1FPz7jYaRiNz/Ozci
HflOjY3e7qbLBPMVJLcdjF6ZrqpjL3naXQE94B1VGtv4yvrYUuo2+NPl7u0CX0rp+PPuXd7evsg7
3w9uaQ6X//12eXu/ytWtfP29Kv1Kl7cW6t2Kxz8e3++ervoTVjsQp7ZF39wCyHgHVfLmg+jmvOsh
+jhJzITG+PKqd3HXEskmw5ZwFWRdPpkD90a97MemWonOj1RP1z3uRbbxVThhCyAqUtvQL+XdTFXT
lf6GU+MpruDUz/cvX77Aklk9S4CPvM1xS60NgYWOjEpJhxd8dS8Y7YsWnqnQth14y8+8znf7c1v2
J3SI951xhiFoi9pTW+OesbkMTcXlaoJl7Mp4UE2O3l2G3rVzNCKzCf28ViLV0W3xG4cHnmBcjiFJ
9BMpaAfoSzFXGYpCf2aDO6quNjcWJ+oJfRNr/oa2TkPXhVBGRlpQaz1vVKxN8dUk+u75/vHp6e71
B3LwoCbNvs+Lm0kU828Pjy9iPrp/gaue/3n19fXl/vL2BqEqILjEl8fvRhKq0P0pP5b6tuZILvM0
Cp3pQpAzprsIjeQqTyISFyjdXC+NMsO7MEKtWIUXPAx1M3uixqHu7LdQm5Dmbi59cwppkNcFDTE1
rpiOZU5C0zFVAcJES1PcA2dhCDO/jHQ05W03uCnz/e7TedNvxXpyQCXi7/WkCgBR8pnR7lue50nM
mD49GuyL4eBNQkzz4E9vt7kihxg5YkiNAUhQJ8cFZ5EjbiMZjFx71G56pvs4z8Q4QYiJQ/zAA8vD
ehTMhiWiqAl+OWRu1pTY9+ARDmzpMwombP2kkdN+E32ssC3Opy4m0UqqgMfu4Dx1aRAgAt7fUrbS
J/1tlplOzhode7RggYlTiFM3hBTVBPmQUZY4ql6JJUj7nTEY9Olda+wUv382aoiBxizCAxdY4q/l
fXn2jqrUiGWhkVmMyz5B7+rouKPWgBy6IiLJGdItAMTo/tOEZyHLNk56HxgjyIjtbzijwVqbze2j
tdnjF6Gq/rrAixBXEFvNabxjVyZREBJEWyuIhStZuskvE99vikXYY19fha6Ecwy0BKAU05jecF0t
rqegwlWXh6v3b8/CyJuSNWwX8Lgl9nQxxVm1Pp0fgbmI2f358vLt7erPy9NXLWm7K9IwcCShjWma
OQPNOI8aa9wLK72ry1EHaI9gePJXdbv7Ai91vF2exbzjBhIfpUcYwztYQTfOrFxwjHxTx3Hi9n3d
itbzqyIJO9oeqDHDE0vXE0ParR1CNIswRsb0/hTQHHVinnCaRIi2A3rsNxkAdidbSXX0w/4Ue7IQ
dOwAS4Md5bU/JYk7cwBvilPR4mQINaW6F/pMVQcpTtHTBL1yucBYcdLUtUj3J4aYAvtTlmC8GVp5
ErLYsUFPPEn0OK3jWOyzNgicikqya0UDmRCMu1M3Vm1yj6fdE4JM6wI4BSsTgcTRQp2QQvFDEAZd
ETrts9vvdwFBoTZu9429dJVPkrSYCXD4PY52/vLy+EOS5065gOroREGNquJ6QOjxJt/a5MJ8TkwR
q55VHxiqyHGdKNVlI2jYFsQ0+caMrpgAH9LQHVLlbZaSyC0g0BPMlWSGWZCeT2ZkP6N86sHPp7u3
P72KvYQzNad9wYchQbpQ0JMoQdvMzEZNpV1tT3jLXGlj1l7scSfjKKgm/vb2/vLl8f8usCMkJ1hk
90d+AdFPO0/APp1NrG+JfCPAtwk0szFjDnFAw4PFySA1zoksPGPoxVuDq8rjVL846oIpDrY9NX0I
LSzxVEpioRej+grLwkjoKejHnhi+Pzo2FDSgzNdKQxEHtm2KskX4UZlRwqERicXcl5fCU//pyshW
RBFn5nrJwME+xF2PHPEg3opviyDwhA9w2DyujDYbdu8AKRLF+6mCFvaXVthnP++mlrEDT0Q6P2vj
/phnxkxojnBKYo/U131GQo/UH4RiRo7G5s4PA3LAbj8YktySkojGjDytJPGNqGGkq2RMfel67e0i
9zm3ry/P7+KTObaudNZ6exdrY3hi+pe3u3dhxz++X/5x9S+NdSwG7EDyfhOwTDNuR2JiHOMr4inI
gu8I0YxnMZITQgIs1vkCEzMpGEy6+pE0xkoeqntBWP3uZZTc/7h6v7yKZdk7PFlh1tQ8cDgM2OM8
ciN21L0FLUurhjWMTatYO8Yi3RFoIc4lFaRfubcHjHIVA40IumKYUf2oW2bWh6Z9B8TPjei0ENt+
WVC7p+MbElGkp6l+p3OSiQCTCZplnu73HuUoUfJVGCbJgFkVhg4KjJP7idWIkgDEU8XJkNnfj4O9
JE4lFKQ6wc1VpD/Y/Lk7OtTnid0SiozvGC6d62sJkD3zVp7Mn4v5z/eJGC5OBSHuau6WTTVpakwZ
s+j2V794B5Vewk5YJLZQAG1wmoemgaMnFBnzSp6FM3TEXAxj/M4cgI1YwTJswbDUOHJadDf0yf9z
9iTLjePI3ucrdHrRHfF6SiJFLW9iDlwgCS1uJihZqgtDbbNsRdmWQ7aj2/P1DwmQFJakqnoO3WVl
JlYCiUwgF1waaPaaZ+x12EuuZyyWiAYw90mAg0MLPAUwCs2tMdOgx0tZGZexY/3FfGguaBKifN1V
ZUL5YSKHH34FAh2P9Ph2gCjK2Jm5/Rte4nGpQ8HDbVk/0wBGjKk24oNEI34Yw5NyFqkcOGzOiN4F
DMxiZjJAOZ+6F6kCx8SiCzectu37JePNp6fz++PAf4YM9YeXL+vTuT68DMrL3voSikMsKre9neTr
0xkOjS2VFV7jrqr1EcCjK1MdhFxP6z1s4mVUuq7ZVAP1UKhqTCbB/DuZawx28tA4e/zNzHMcDFZp
T9UKfDuOkYrFJMgwzCz6edY1d0bW5pvhzNMZMq0J/WD/n7/VbhnOh9a4hfAwdruw4q05g1Lh4PTy
9NnIgl/yODalCA7qYw/igOOj49wePfsESuisUgcnYWtG0irng2+nsxRp9MFwXuzOd/vfjSWQBivH
XC0Am1uw3PwIAmbxfLDXHg8xFanD2ttVgnHbSrGouKLej42XbLaM+5oUWFNc9cuAS6yudcxxvjGZ
eH3SMN053tAzFrxQfBxrNQJP1w10AbrKig1zMY9CUYaFWekQvaIViUlKutsSaalC27y4g19I6g0d
Z/Srak+EXGG1p8Jwjt1cS2lAe1ro019EpeXp9PQGCS34qqufTq+Dl/rPvm0kk9wvEAM42zRCVL48
H14fj3dvWHbaqLAz2vocdrkBuzwHKWB5V3Y+PNeDPz6+feNTFJlXZgs+P0kE8c0ur9QclmYlXexV
kPI3LRKRSohriZFWKuT/LWgcFyQsLUSY5XteyrcQNPGXJIipXoTtGV4XINC6AKHW1c0e9CorCF2m
FUm5ZpsiS6FtMVPzgCzACGxBioJEleoFwuGQrzimy5XixcyhENy3SUTFjB6UNBYdK41kePY3emwz
/FiWM7yaDRcIfK1NCAUg8ynpDTKut7s71GkHsI13nlYiYeFmgb9GQ9MRxsDhAwZJtdyVY0/lBhze
hQ9VgY2flDaZCSmLLM0SYg7BuvlUcAxEKi3CNbrSxfwGh7vvT8eHx3d+FsZhZOeBburlOGmr2aQJ
VPsDuCvJs7oFoVfwbOPXZeR4Go+84KSjHfoFLkT57fUOCDPs25hEeBt+BE4iuDBsUKFP/0pHLg4Z
2Egmrhoy0kDNUUw+81QnywsGi2Hb4nTfVqW2recMp3GOT0MQcS0Zu61W5qAId2GaYnU33ohos0RL
YfeDtdeWX0UJvWyKOFtm+i+IQQk58vg+QRHbJajQGCaMN6XjjFXzb+usaYuxbJPq8WJSzJIQzFIz
yCoPDC0mDVu9tK6YrerAJnyRBtvEORXZTA3KNDW+LID5J1lVK59VqzDSCuil/TTlIwlJlZLbZit2
Zq+69QAkmkAMjqGSNr4IcHPKsBteoFrwFmhKIRR9WVCdDYtaeq2N1cksId5IFm3CMuZNmXUAOqIM
wsKIDNpF6sfVaoNZBorRg6/DhvGDIeKDiP39vx0VLQNIdUk4Vqe3dy5hdWKUFS1FfI7JdDccNrOu
9W0H64DDe/pCGrT+fQS0gGA3fBRVaQ1Y4MsSPh8LV2gsnI5swWJ9jbRNXhIGmdO52zij4Sq/0m0I
qz6a7ETPtcoX/FvwwjYiuwxUb6ztDWN93ytDOqzupHg2GmFVdwjeXTxrE1AVM5Du59Mro4Uq9NAm
LRSipTybQGEWLBIZfF6WURNrJ3w6vL3ZootYlmGi1yWyE6teIwC8jazvVSahJTJxCZX830DMQpkV
EJz3vn4FMZzroQMWMsoFgfdBEK9FsmQWDZ4Pn+0rxOHp7TT4o+bie31f3/9rAPnp1JpW9dOr0Cif
wVfl+PLtZLKGltLsFUwEfT48HF8e7OdpsfeiEBy4tRGL/GglWWuTQ3Mj5IGEbbHtdIE3SbVnCDIt
OF7Lty2REL+mb+1A2U2EhwyR6D7PecEzopS5BlcHULX0oyUxTwaBgc4YkyMWXVSEGDizWaVAyAZ6
d4SgicBbvzDyizf+L4d3/vWfB8unj3oQHz7rc/d+JVZ64vOVcV9rD/ZiPdOsytIY88IULd6GxnQA
RJx/1qEBCPPLmPhuGu2iPzs4yesHzFY5m6qwu2/xuVZglkcMjtFCua4Q9mDsL9yhEpb0YGiy68FY
SfA0bEmWhW9OkMiYocu/3d6FWcCZl8y8bnFgmY89tDPV20RoVxuc1HR6avdpEcLRf716v1i7xguP
gg1IvKaY4quOYuWOR2j3ble0JCvilygW3Bs5cw9JTBpfTaTunB+aO7R4uM+59sqqZIaWJElOlihm
UUaQIT5Da93yI7FAMTT3b3pmmmIpYNS+8A3XO8QWyVX9nuoXs5HTc/WtU3kuprara8kvuDyJdoPm
t/iwNxsUviZ7lvsppBW6hu9ZV+uYYal4VYosoHyBhxajavBJWFYbY1oQKrgiQMebZGw6dYZo3wGn
+fyouN3G1k8aXOpvE0ufkag8dlyRVQcbS1bSyczDHoEUopvQV7O3qxjOtUFD6plrlof5bIfd+KpE
vh7D2kBVuR9FBH+f1PgRKQr/lhZ8TzPcRVKl3idBhl0OKTQlxfnCPiDF777ILIzwnVs/7Ztq4ct4
vc0sSSm4huLTATWEPcnBFLIdxAqtkr6TuO0pZasgS/tYOGObEfo8qn790kEnYZNH09lCD5atcl81
9B+cYbp+ix5mJKF6BuEG6OBB1IXwHm3KDX43KDuzZaRPEIzJMitF3jFtfLGpQrUnQbifhhNTctzL
FIQakEZJtmHWpIuDgeu9/d/Wz/lxyzVqrnDtUSJBUCULKhIAyxRF/YOnXNsOtks8M64Yav+OKws/
DcmWBoWZsFKXWrJbvygomtJSVMN1MlMNhtR2Qldb0F25Kax5ogwurBa3PVXueRHjyCZfxfzujJUK
Sjz/1/FGO1NdZDSEP1xP9QJRMePJcGwuxZim64p/GmESyuyIDbDM88fPt+Pd4UkK6Pg6z1fKG0aa
5QK4Cwnd6v0XQVq32h1U6a+2GSDVvnVAGfUz2Ld3RFduEdzmnl1JbNrTda1HqGwvoVeVLpUEHlDs
Cymdou9GqqGCSakifhToV0gNtlGDq3STVMFmsYBnjwudIR2rPCqvz8fXx/rM5+By86R/uwWsGqEq
63u7uX+5opZWy8JEK8j2OsS4itj5muGzUBO3Qo+xYK5xmcXS3HCRb6G8uLjTMdc3xFRHY4ICMuCF
pP6kK2zMfK0AYn68OY5q6qcAqyixlJ/mw8nowX3KpXi6bO+b1HWLfjWNpdOACzB5xri+oE/SQlz/
GCAIqWAwjHbVGHfEFQH2b5VHSBdVFphsa1GlduMEARHjhmoBgUQYKU1okfLDwwQm8O7TbAmz5s02
NMlXeiY7cciJPxd29ACY/eXh/qF+H7yea3DzO0Fs5LvTy7fjw8f5YIRugLq+ElNg5lNoAZqRfJpg
QozJWTZTiKymRb+AuNikInzGFRJ11vp3tFy2JRzDfcx22aOjL9t7xt5rKghQdFm0RuE0W1PMdEFi
+aKuEpvFVgk/FPoUo2Xz6TVQFCxzDCY7v7ZbEEg54t52bkkQ+saS5rxcPV3UfNs/XGDd4bjPVbd2
8bMqw1xpqoOFVDtBBbgoR9PRaIX0W+LNwHFKZeCNQK125GHhmOBV5DLWOG/rVYnAV7OdCWclr2g0
GXaGTjAv5edr/Vsobbtfn+q/6vOXqFZ+Ddifx/e7R8xwoxnOZlfl1BV99MwLAOUD/N2GzB76T+/1
+eXwXg+S0z1iPyB7E+WVH5fN9b2GSbdUhObosFjvehrRlhg/7St2S0sR4KNBJHqokvy2YOSGKx0J
fo43+GvOT0lYBXEWrlGsCKay8fHQYrxkIy8rsVlkeJb+1zCt4T4RDHAsWumLvgNyYaBcYI/3QKGY
S2gltxuQg3oKbdhKDeIrINGKTvgnGJoVFYR/WbKGT9Q7oeEN72ZPWyt2o1VJEsY1aMxlAV5duX6l
nCvwywyDdYHJUFkoRjDSMIuzwkAHBSgvKeiLq1tIIpsuSdQKTZA+w1r+opjvlyPN/01CU849vLnm
2i8RzJ0YwfANAkgGhFtsyG6GycR1sCuhC1p11RVQYQZi9lEAHQzoWt0WTo34TWOHnzuYANihh6Od
0VYXAlSvqycvgawIwmyPzT5zoGcNJPeGui9BC/a6tEdXxtNv0iLwEFXUQwM6duiJa7eOW9oI1CWi
tLEsI0eLAyu7V7qe6vEhgGXoQyBIq9EyDr35CDXckp/BCoirgOfoWvB0404d34Wo7ycBk6UJqrAI
NGXuaBG7o7m5YhqETN1kbEzxwPrH0/Hl+y+jX8UBUyyDQZP35uPlHo671/oOLIu5uNTu5sEv/EdV
rmi6TH41tnYA1waJOS3xriBLa1IgFHf/eGUc+B+uuitxQgWeLRN3NB6qYy/Px4cH4zyRdXF2tsRD
mcHTCiQi4TpbuW85HJ+bw/ePV5DQ3k5P9eDtta7vHjV3ZJyirZXy/6c08FNFFL3AxARBJg115hS0
H0WFuLrCOqzQgblfo4c2yCKC3Cj09tJqUYagOCokHCDPCjW8NgeuwjJje1yXADzHldkK0/wB296U
akXSLT/HLH2LYwbH1tpYOUKgBBfHF12GJROeF3ommA4RkW1ft4qtJo1A6HxoHzFnbsllHHg0Pm1D
4QeB95UwPVZyhyPZ13nvJEqSnVG/RRIxsL+80gUgmI6xDkgMpPv5UQuTKcZ0WoLVPpl5WvD4BgFZ
ieZanOcLoo3vbTUnwiNfaa1gXuhOHawoZfHIuVpYUjhXSjuYY2RLsuMEnj0ckUXVQSZAIIbY1AiM
24vpRcywaR6Pyhk2ywIu0jl9mrjgxnXWdhHGxZj50MemZ8GZaI/vVvdp+GpFfYYUAm82spuFgo6H
tUoSLhHijpFd4S0nubpiOIEWsLmDz2ZDZD5ZxHfUrOUDEE5C5wMqT3HCCvgrJ1LpIejYT/CPiCvF
6Iur8skdLVCYNuZ5iK5jiZOZp69+C3C+bXvdXW/+sMsjI9aaTeCNRvaCA7iHTDZwlxkkIExovO9D
m6y8w1xnn5xk6szwAIwqzfgnaGZolmutFgcbtTMejhG4mW6jXXrlejQt/ZldIhnPSpxhAgZNl6US
eHO0KEsmTo+CcuEU4xnqe9stpNwLh8gXh2WIcCXbWr3FfN2nN0neSlanl9/CfNO/9aBEkyXPrmpR
8r8gNIg9j23KA3vfTN2h7eUMQi+T0XqudqW7NlCWagQp0ITRs1UtRwWbBWbyzPZpKF6M0K8iy1VJ
tiWNd9A1MkbiBcg0PdGVJdGK+DkeVtboZCcIb3bNm6062FU0Hk97YnXQZAn+ZZTCYzMuyIeRg8mw
8OQLLh9BXGWLhdqeisGVA4XCygHYkEi52I7qW5SqPZP8DRraxgJuo1yLLCWAAYRXVg3s2xoSrFoO
bL2/FCP5lkjW3w1qK548oSvWmkqOd+fT2+nb+2D1+Vqff9sOHkRAcPVCtAvdd5300t6yIHsj83u7
UEt/yfW/S1e5nkYixb5E/u7kfRMqrfrFMqVfSbUO/u0Mx7MrZFxqVCmHBmlCWWh/ywYZZKqC1QD1
x/oGmPuFmeqgwVDWJoHE91NDJt7ufkw2czyvYtiTRkOwlv+CStaqJDQbvL03Zs0dI5JuiHd39VN9
Pj3X7+3J3Xoi6hhJ/XJ4Oj0IF8rGg5hrp7w6q+w1OrWmFv3H8bf747mWScCMOlvuEZVTd4RH+vrJ
2prokq+HO072AsHxewbSNTmVUW2VTkynPdHGflxv43oNHes8sNnny/tj/XbUpq+XRprO1+9/ns7f
xaA//1Of/3dAn1/re9FwiI7Cmzd3jE39P1lDs0De+YLhJevzw+dALAZYRjRUGyDTmTfW50mAzDxy
yuLqq1Xq7/Xb6QkumX640n5E2dJhW0A5OyVLkpGTLP7ov9yfT8d7fYFLkF1FX07IuCTVMkqmMgVO
yyRZtciXPqSNVl75Usr2jHF+ory+APMWr5wpSUvlEl4gUvWFW0BEbDztth+gEU16QnMB1vhW0qv5
8Pa9fscclQ1M2/qOxpW/o+D8u1BdbimJI2GLQhTbnVUCV/dwTLDKyJgEvnsNTkl3gcwr1JEX2cK0
FLylnO1jp0+e0GpFGXW1iJ5KLtQmu9NFzjMTw03Q5xxMkGthVU5zzP6bbYoF5BNsHYeU82cFHoph
rBhW8h/gC8MFhPUmNwhjsvTDvU6/uuUqZQovbK1oHD6d7r4P2OnjjGUUhmzZBZeWlGdFAeGzGxCt
G6wIDZFE+MCA3T4faTkZB+rjI9pqV9CncZAp9h5dJoZkpQhN8PJV+FUCpM9GWe32raifT+81RK1H
RG6SZCVprvgsWBXKtamwFqsq2cTr89sDUnueMD1bNwCEMIkpQQKZKjtZQoTz7xJuwvsxADCxjeip
xtvXutmtOPAQBcPg7iL69PFyf8sPHCW4gERk4eAX9vn2Xj8PspdB+Hh8/RUuoe+O3453yruqZJHP
/PzlYHbSbwFadomgpWf3+XS4vzs99xVE8fIU3OVfFue6frs7PNWDm9OZ3vRV8iNSQXv8Z7Lrq8DC
CSQRCXUG8fG9ltjg4/gE7x7dJNlPmLRUbZvET0g+rudg6tr9+RZEh24+Dk+QFKZvGCj+sjBC6fkg
SuyOT8eXv4yKLiweUtdvw43aV6xE95TxU0vpsnNykY5pUZAbZOeQXRkKFUl+hL/e+XHfei9avq+S
GLIrV8JKXdmeDcp8/jTxbdrL3p4AhQuhuj8NeF6melKEBl6Us/nU9ZG+sMTz0CuTBt/auqpHzAXF
vx+YqPQk8oOkPgXm2kZVH20KSqiwBL0M5wKrwgAjFQ9EPXCSLmlKUCw8+7d5dDX8GmQHoNLBzRMb
idoealj554KhZfTBtK0ycA3vSByVhN1eIkBcbiMkoimAX1ho/SRbLqzZ4qSpcnUy8y7Wksw0AD2w
vgCqFqMNQKcKEl/LncJ/j4fWb7NMyJer9ATDoTp95DtqE5HvGuHCEi4Jo+k6JEaN1gQANSCvmOqy
adUFgbIHBxfpBn69Y5F2aykAPSmt17vw9/VIC2SXhK6jWm8kiT8dq5l0G4CRgJsDJxPDaMef4UnR
OWbueSMzVbeEmgC1ayKusKcBJo7aN1auZ64aMhcAgd9osf+9an/Rf4fzUaEt0qkzH2m/J8OJ+bui
Us71C58fcrGhUs/nmKTuRxRUCWDeGr3IdF3hueEBOZuZRUIISzgc9ZQh6ZbEWQ53aCUJNZOQ1W6q
r2ma+s7OavxyG1mGzniKxYcUGD1HiwDN0YDb/MzR3vggVc1EjWibhLk71p8jhe4K9mHS+rJnsAlJ
q6+jbopaaO5MnLk5bam/meJX+EIW3frS8lbGo1AxQseiWgsX+LYHzsHa9LBIHNtJFkntC7M2FaWG
s5FSoYAxvqP13BmLyahvShp5ZteO/u/eYYkoY1xWU0OIAY8qCAv9mCB1KiUa6fn1iYtC2k5bJeG4
edrshOiOSmpzj/WzcEORzwz6ZVkZ+/x4W1Xg/YbOnaQgX7OGROX4ZKKfHfC74XbKnmIzNNUD9W90
tsb1k+lQfS9lYeQODd4nYRpHlaDGKPwC5b2lBaR0ZMtcZdMsZ1o+iK+z+U6dPmu65DPN8b59poEr
IhmpThWacQL1O0PqPzGFrOm/VJ9Y3pazK7WRxuGmV4jjmgn8hxbQERJXiTWGc29vOFHM+fhvd2bc
b3rjMXZkc4Q3d4oq8BnRKvDmbqEBtPTr8Hs+MeSGPCu5tKBnK2TjsYMlzkkmjqu+wXNO6I20ZziA
zBxsJXImOZ6qgSI5b+Dtep6eBEHyBo7A37KuzWx3u37/8fzcBgTUuYD0xiHbJUmNLylMoyW+HyNl
SKYLsBpBJ65rd51ah/4hg9RBnteXu8/uPvk/YJAXRawJ96lcES3hYvbwfjp/iY4QHvSPD7hKV1fw
VTppGfB4eKt/izlZfT+IT6fXwS+8HYhb2vbjTemHWvffLXkJIHd1hNpGefg8n97uTq/14M3mnkGy
HPWYoy52PnMgSi8uACT5xh16wx5hs9nA/9/aszQ3jvP4V1J92kPPjC3beRz6QEuyrbZeoSTHyUWV
Tjzdruk8Knb2m95fvwCpB0hCTm/VHmY6BkCKTxAAQWB5K7MBoVahGJk2Kpeg2BlC3HBPNGPb3f88
/iBnQwt9O55J7f7/vD/ax8YinE7ZxHyo5I7GVsIFDeMfRLBfIkjaON2096f94/74i0xI26rEm5jH
ebAqB3JRrAKU9ThxEjDeyMwlsCoLj+Ucq7KigWOL6MKQuvG3Z0yG03jNGWB3HNED9ml3f3h/09nj
3mEwSOfmSWTEM9a/TY652GbF5YURnrGBmHTrZEuj1Ufppo78ZOqd06IUap0vgIEFfK4WsGEVoAjm
RIqL5DwotkPwTnRo+dPwsGhHWxVuj9mXIvga1MWEFTtEUG3HhuOIwAQa5m/MyUoAeVBcTcw1rWBX
55yBXxQXE48K4fPV+MK8HkTIJVfWT6DopXHsIIh14gLEhDoF+ujNPzN/n8+Mupa5J/IRK6prFPR7
NFoYmsx1ce6BShSzV/St+FHE3tXITApj4rxLdhsq5NjjvIu+FmLsmdklZC5HM3Yjth/r3kl0upOc
0XQs8Qamemrm1AL2NB3KwqNRxAKRZmJshCDP8nIyMmOs5tBwb4RQrqXReExbiL+npmI+mdDlCPuj
2kSFN2NA5i4r/WIyHU8tALUBtcNUwrBrH9Cu0Qpkp7YkuAvWRRcw09nE6H1VzMaXHu+Fs/HT2B5q
CzkZyGccJvH5aMImKFOoCzPnV3w+ZjfYHcwXTI7xVt/kI9rV5f778+6oDR/MQbO+vLqg8jH+praO
9ejqyuAA2jiWiGXKAi0TkVhOxkbaqcSfzLypa/dSZXkJoa3WRrdLAPTG2SVN3mohLB2rQcpkYmRu
MOE2A2dHUY9v/9rR0oaTytDGDMLmsHz4uX92poacGgxeEbSPMs7+ONO5e36+PBvR3fD76gmxrPKS
s9/SIcaXAZ1RmLSY/0pzYD2DtKNTBj9/f/8Jf7++HPbK/cRZZIrxTus8K8y1+nEVhgD7+nKEY3PP
WJFnRkCBoBgbzsqoLllZT1BPAibPC7SAA0bAsYg8RuGPE0mttrHthjGkYlCc5FfjES/hmkW0coFp
ckF0YPbwPB+dj5Il3Y+5Z9oz8Lelk8Yr4DXGa5kgx9RQnHCY0/GM/Hw8MvYO6Gbj8cz+bbGCPJ6M
TZk2KWbnrGSDiMmFwwhUrB0eah0fs6mZHG6Ve6NzTj+5ywWIJER9bwD2/ndGvxfbntHBhtm9LrKZ
x5d/908oOOPKf1S5tx6YWVXyhHniR4GQ6ga13lD7wBxjtBmnthWxvZU5FujKRZ/6FXIxIsy/2F5N
THUBIDNWnMCSNF0rHHimD/Mmnk3ikSMIf9D7/19XKM0qd0+vqLGbW8cUCkcCww4lObcU4+3V6JyK
IhpCLTRlApLoufWbLN8SOCydSPXbM2Juc63srIk3JLIF/OiecvUTfpO477sNrCiTMK5XMYaO4N+I
9lSlP7crXxQYvHCoWDOGxhIEsHpKy6X2QaR6wKpuB/RRKK9VClI3wj1g0MuGOsbUCxqUEj3HpUA6
Q+OyKyRTngt/XfOeusBLwtL2TTBwc+knRTlvbN2DVeDhG9fLG+p3o6JbRTh9fh/QOl/dnhXv3w7K
V6DvdhN70wwIpQLWLJMG2OtgflKvs1SoiFaI5JfB6rZ9BVCXmZTWRS1LF/xOZTr03sdkIt7wfgdI
hSssSraXyfXga38kS6ItDCtmWD/dtnwrau8yTVTQro+pcOCGOwBrNbdbRdsk8nyVpWGdBMm5YXhA
bOaHcYYmbBmEhYlSN0E6stgggq50RKlwH97YkBrMJdRRY/w6aDnZKf7c+AE71Hz6KdzXF70naLv9
0kBmkRFpqXMNbeUIQTx+1HNV66f9GLUB4p1YEdDwL03SgjpEf7Wk3TKrm7Pj2/2DOlptdlGUpDj8
QF++Ep8Z4EgyCMyhYnhRIkqZmVk//gTdySSsZr8JEfbE4FahkOU8NKNoaYZQrsxl1hrT3B51dq98
SQ042iswl3Vkh/ByUG0gL1IRxqAIlm6hhQzDu9DBNveEUGUQ+lmVx9QFRdUnw2WUGaFWswXFMIOo
sMEitmoCSC0WFa1qwUZqVfE1oCnbPjc1jTjjOG9hLBsRLC+uPOOEQvCgJxQi0d2TnSzua2T9RBnr
hBtHiRGuDwF6o/ulJBHBlNYGf6dGGiEYfTPwPJzGGH01gIkhoknnkwpnODDevImh2KKzwky+iz7Q
is0EbIgX5YGNLqJUQzHdzvQ9yx4f6yvuQ3ObCxRYQVgF5TIXsjBaDwJ7llDeFG5LrzalmgZUb0VZ
cror4Cc1ZSMNABXNCObcj11UEfqV1EEJeszUrmU6XMvUqoW2dnpCCFPodYVpN5xnZg3J13ng0Rrx
92DYHmhFMveFvwqphBHBKAPGHMcODMQDsYc6EuUWHKULLj4KqV7PCfsROnIfVOJOxte28eQ3nYd+
bEhxbigXhRs8QZUpRRlhECBuArb660/0d5MUpt5MaVWIua6ykpd6th+MAeJpHGf8naXqUVvhy2rO
YmSYi0iaqBshU7tZQwtmuSg8o3eZ30B+2ZA686ik0IFx8IyVpTE6LmciinWccV+mVObKnJd6JTCF
0ii2m7fwnKWtQNgsvpKmhLtaW8SpWWppuM2ucGo7nfqweo4XpV9DFVHQ6Yh63YLGCxYZ32Vci+O7
KbvmWvxdUXJvcUitMqaZ8wb4HK55mxtrmI5gVmc52+8oDmvE69eO5GIiDdCj6dag4DtS1KAuyNuh
aNmA34Qm1+hA7p7vUfMqArkhhfN5mQo8F9n2F3YewcAGRBqgws2QJgibTrEH6yc+W1LPGdQhj/6B
RLjHqIkNGe5rawQ1Ymhza2wJUhz54iIBtmVcaGgQ696GFfilwWMxKdOimPIrXCPt7QiDUg9Ezsxg
HmJxWzOxQv37hx87wyqzKNTRNvDqUFFr8uAP0Av+CjaBEkJ6GYRcy2VXoJQNhA0OFpol9pXzFWp7
blb8tRDlX+EW/w/a88AnkwIoh4Zhs3CYFdliLrJlh2V7NvW+iuUJbq+Q8oZqaSebr00Rh93748vZ
30a3uuUJgoFldUIQGjNKjn3qB0arKA5kSNjbOpQpZeqWJqj/6RdWq+G6LSPjja+ZVeDo26IME35s
YefdZHI9RNdSxVQrjYv2UfWXT/vDy+Xl7OqP8SeK9rMAjuVlWE+pudrAXACGDJqJu+Cuiw2Sy9nI
bBHBeIOY2UBjLmcXQ2VMR24Lx3ueWES8BcUi4uyBFsn0REP4K1WLiPPms0iuBr9xNeFTCphEM84o
btXjDc771ZRL7ms28WJqFwdWhkuw5gL4GGXH3mw0+G1AclcuSKPiTpjro/3mmAd75jprwRN7dFsE
52dF8bOhPg9NaYu/4BtyNdCbwQaOP2rh2Npa6yy6rKXdbAWtBqpKhF/DIWMmCmkRfojRQwdXoCYB
6aGSnIrWkcgM9ByaEKbD3MoojqlVscUsRcjDQapYu+DIx3wVgTkaCpFWNDOy0WO2SSCMra1XxIiq
ygV/QRvECQsH5RpXOXfLndU31/Q8MSwW2nl59/D+hvdSfZyZ7sS6Lej5dYuhNK8rzFJh6d9N2k2Y
HiQDeW5J0zPIClCBro4+hNPCboNhOwaIOlhh3mQpUCrmqVo9pQ6SsFDXDaWMfN7Gf0J1blEL+2X2
SsggTEMdaBHzWdcYusVXEUUJpUVEZ9WtYQFVYB5a7s7ZIUb2pRI7kSqVPu8rGowArTNZM7W1wVH6
QRJkqcdF8uUTuvc+vvzn+fOv+6f7zz9f7h9f98+fD/d/76Ce/eNnjK74HZfI52+vf3/Sq2a9e3ve
/VQJsHfqqrdfPdowuXt6eft1tn/eo/ff/n/uG6fiTpeIMCUFXkelVioehcJ3nDjGXfNZjaglRSMu
oaTrfaAdLXq4G537vr09OoENF2/Wvk313369Hl/OHjAL5cvb2Y/dz1flHd67ACpykMJY9bHBingp
cnIQGWDPhYciYIEuabH2o9xIy2Ah3CIrUaxYoEsqjRA/HYwl7CRLp+GDLRFDjV/nuUsNQOJA2dSA
FgeXFBizWDL1NnC3QKP72rPa0HeJf4fjaVkFwm0pxaBdtCFeLsbeZVLFTmvSKuaBHtNG9Q9nIWmH
qCpXwJKZkmxen/z928/9wx//7H6dPai1/x0TVf/qt3g744Vgqgy4QFsNLvR9Z/5CP1gxQBkUwgEX
ieET0na/kpvQm83GV05XxPvxBzodPdwfd49n4bPqDzpj/Wd//HEmDoeXh71CBffHe6eDPk2V284Y
zVfS0q3gzBTeKM/iW+V+6o6KCJcRxk4cHpsivKYJkbqBWAnghZuWGc3Vgw3Me3pwmzv33aYt5i6s
dLeFT6PRdN92y8byxoFli7lTNucas6UvYNotHd7eSHVp4gwZZjMvK+4Wp21gUUSb7gL1/vBjaGAS
4a67VSKYFmKzbcqNpmz933aHo/sF6U88ZvQRzHRtu13xAeka/DwW69BzR1XD3UGE75TjURAtHMyS
ZfUnFmoS8LbYDs1p9y0ygtWqXBncoZBJAMvf6RGCz0cctTc7Z/Y6IKzQCNYuWomxyzZgc0Jtzvm4
ErMxc56uxMQFJhO3WrRNzjP3fCyXcnzlVnyT689p2UHlcHLXqjBThfXQms1k0y2M7KaJWsQj2he+
zsoRSQiqk8tqfaFDVRnPggluxjFigPOGhvZsYA3Urfyk/nVHXsSFoF54FtN1C4QyB3WFaV+RnFzb
5U2GQ+Wacl+eXtFV0hBzux4tYlGGzMfiO06ZbZCXU3d5xHdTDrZy9xLeh7RsT94/P748naXvT992
b+1LvvaVn7WI0iKq/VyyjpRtf+R8aUW6pBiWaWqMMLVdivPZq25C4VT5NSrLEL25pFa3XFGt5qTp
FqFbY6+YDjsoMXcUnNRLkbDUN/kwhZLe3SXR4cNUyZLZHN1tSj7Ua8dkxCkBEjuq7rYtbeXn/tvb
PWhHby/vx/0zcybG0bzhNS68OWbcXNkuDYvTW5MUd/ZGRzTcM0XTSXZdZfakmmQsuj3tQGCN7sIv
41Mkp7rcnZrMZu861EuBp7vWnUl2VSsuEagobhNMvhz5ynCCiaL6JhJkXs3jhqao5oNkZZ4YNL13
wGx0VfuhLKNF5KOfi+3kkq/94hLv9TaIxToait4RuKnbhmPJC2AtRYEWW67eC50mFQobvmvREi0m
eaivWfHmU7XNuknVix9fJP6tpP2Dymxy2H9/1g7IDz92D//sn78THyoMSYGensoY9eXTAxQ+/IUl
gKwG7efP191TdzOi71eoxUsa0W9dfPHl0yfSDY3XWiEZYd5alaWBkLcffg02ob+Oo6L8DQrFKfAv
3az2bvA3Rqx5FjDEUNCTQ8haYuonwg/QIdlo0TwCeQnD4pI12XoEp2FZV2UUm7JPJoMBszEswEQl
PJ3zyVq0TVEYKrQP+hwcKwZofG5SuFK0X0dlVdM4wa5MD4Au1ja76xUBbMxwfnvJFNWYIdlEkQh5
IwYPCqSA0eU/bV49AYC7DQAwuUTD/KGOQuMT4V3rL8TjsgqikuP3sCiCLDk9PCALdV4j/QcRig6a
NvwOmScceErqMqG9LNb24y5jakYoVzPIWiw1SGA8nG8fyGY9+ZMBJvT9UN4huC+vf9fbS+NsaKDK
/Tlno99ogkicT5lyQvK3Cz26XMFeGq4Xw9i6jZz7Xx2YiuLp7G/Gqi6KIvMj2KebEBogBRHzYHGh
KyV1sdYg5bVmuFgi3EhslIbALzG5EZAp4YmsEgRDG2Mh0dd5pQRM0iDpr1R9KgQ/0i4y2caP+4DK
zyvzM2mWtl/A+F+5iUUZ0IqLboDrwvCTabszD1MfJHDJXS0Uy1iPMqnymvC/ZZzNzV/dnqTXXY1T
mT19ZQY6/TnRT2JZ2TdFfnxXl4J8JJLXKDORRiR5ZKSYCqLE+A0/FjRdTRYFyucaNG3qGpXBoDY+
jMThGqGX/1KOrkDo1AM9NTyPC3xJkJGGFcA+E9MKhTdN6ZJlXOQ5nHUomhcorcChoK9v++fjP/qJ
2NPu8N29lPO1+30dZ8sYDsq4M6dfDFJcV1FYfpl249tIV04NUyqIJPMMhcRQyhS0f/46Uq1C+A/O
6zkMH9v7wR51WvP+5+6P4/6pkSUOivRBw9+45Bf6swOuugsJrdXuoeOR1/UZ5ykHboIPMGjkZQk6
mNKyAEX4RYgvq4CXpMAb6NJs9p12a0T3m0QYiVNtjGoI+rEat4GNQ2iGLybarMuwLSN8B+7xL4Bo
kZtQrFU0S0x9wvqJ/e6gqlFV1oD9Q7sgg9239+8qdHr0fDi+vWPADtPJSywj5f0kuYitnLNrC1Os
5wb/f6qPhbpFUZQJ+v6f+EhToX2DWM0LkbIj81t9Nb+CbluhswTQ86pVppsrxq4y4jqG2wyEeQxj
Rs1qug7E2szYRLQmAOfGTFWcZ1GRpYb0rMtnc3S8ZaagQZySs0zCheFXaeJUwPBiCIsuZ0M46Vdq
iw03EFY3LO727ceHzbSGaUz4WFzNXeuI9VV9D10VQ1nNCzjBgoYqTAP3NYFR2yZx+7VJ1P2A69lp
U0lOvOqw+RJk16Uz5mmWJFXz7MhB6ljA6qqcnMK+kk7WAjYKY83QWJxCPNzSDKiiErOqYCrJsDAc
FJ3Vb/HKFT5Pbe9FkOgse3k9fD7DkF/vr5oxre6fvxs8JocP+nizn/He1gYe39tU4ZeRicTlmVUl
gPt5zBYlOmBXeRf+kx1tRNWrCrpeisJYxdrDoEN1Hxl73dcxvwOGPk0ImWoR0XGHSJqedLanm2s4
QOAYCej1gTJ/6G6Yz5NOja329IGz4PFdZcp2eZVe5Ja8qYGN5dDcD8ymaj0mmM+YiwKHbR2GueZd
2nKAN5Y9P/6vw+v+GW8xoTdP78fdvzv4Y3d8+PPPP0kqWV0bSvtVGW5DhuO1WRFO7Lqm7AkKeVPw
TrMareVeYDXQI7cFjce/NilzqbZaqRbfFsCKRAf9NstBV9XNjW7mKc5d+Au3fCuC/h9Gl3wVhRc4
iOoqLUBhgpWgNfUTQ7XWLHlwrBo8MKs4FEVoMoZ/9Kn8eH+8P8Pj+AEtTAd7upV1yhnmHMGDn7U0
pYZronWNtwypwyWtA1EKNDBhKJnI9Cs62WL7U76E0UvLyArApa9m/IrbjsZM9uIqnJwq0KyVlgrh
VoneuuLj2bAg5ThTGBDhiavk3Y6teWPjA1I/2zBqDq8ZV/w+TIXROXNOgLlpeVbamrFWK9SGAOEJ
lWsyBKoVoEbqVCc9TxIYJnPAP1C5A2I9XP7gh/N/jQnoX4GoXM7c28Gmd2ZJqtWVu8MRNxoyYP/l
v3dv9993xK8SH0PS7a1fR6p+DzyQ6N9PMpOnkeFWDYHDOzRWTeugV1K7F1Ddy2T/cot/p2S+7uIM
hVqAALHBzzbNjFkP7kGwQ+MsNkknY0o5p2GYr245mx57/Ag7bn1auf5f1mp8+ZVeAQA=
--===============8184469376020611290==--

