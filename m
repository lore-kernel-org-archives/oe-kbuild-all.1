Content-Type: multipart/mixed; boundary="===============7673564909817246411=="
MIME-Version: 1.0
From: kernel test robot <lkp@intel.com>
To: kbuild-all@lists.01.org
Subject: fs/xfs/xfs_rtalloc.c:898:1: warning: stack frame size of 1056 bytes in function 'xfs_growfs_rt'
Date: Sun, 17 Jan 2021 03:19:54 +0800
Message-ID: <202101170343.N74p02P6-lkp@intel.com>
List-Id: <oe-kbuild-all.lists.linux.dev>

--===============7673564909817246411==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git =
master
head:   1d94330a437a573cfdf848f6743b1ed169242c8a
commit: f4c32e87de7d66074d5612567c5eac7325024428 xfs: fix realtime bitmap/s=
ummary file truncation when growing rt volume
date:   3 months ago
config: mips-randconfig-r023-20210116 (attached as .config)
compiler: clang version 12.0.0 (https://github.com/llvm/llvm-project d7bc3b=
7ce23b664d6620cdc32370a8614523ca2f)
reproduce (this is a W=3D1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/=
make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # install mips cross compiling tool for clang build
        # apt-get install binutils-mips-linux-gnu
        # https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.gi=
t/commit/?id=3Df4c32e87de7d66074d5612567c5eac7325024428
        git remote add linus https://git.kernel.org/pub/scm/linux/kernel/gi=
t/torvalds/linux.git
        git fetch --no-tags linus master
        git checkout f4c32e87de7d66074d5612567c5eac7325024428
        # save the attached .config to linux build tree
        COMPILER_INSTALL_PATH=3D$HOME/0day COMPILER=3Dclang make.cross ARCH=
=3Dmips =


If you fix the issue, kindly add following tag as appropriate
Reported-by: kernel test robot <lkp@intel.com>

All warnings (new ones prefixed by >>):

>> fs/xfs/xfs_rtalloc.c:898:1: warning: stack frame size of 1056 bytes in f=
unction 'xfs_growfs_rt' [-Wframe-larger-than=3D]
   xfs_growfs_rt(
   ^
   1 warning generated.


vim +/xfs_growfs_rt +898 fs/xfs/xfs_rtalloc.c

65eed012d1f2d0f0 Omar Sandoval       2018-12-21   889  =

^1da177e4c3f4152 Linus Torvalds      2005-04-16   890  /*
^1da177e4c3f4152 Linus Torvalds      2005-04-16   891   * Visible (exported=
) functions.
^1da177e4c3f4152 Linus Torvalds      2005-04-16   892   */
^1da177e4c3f4152 Linus Torvalds      2005-04-16   893  =

^1da177e4c3f4152 Linus Torvalds      2005-04-16   894  /*
^1da177e4c3f4152 Linus Torvalds      2005-04-16   895   * Grow the realtime=
 area of the filesystem.
^1da177e4c3f4152 Linus Torvalds      2005-04-16   896   */
^1da177e4c3f4152 Linus Torvalds      2005-04-16   897  int
^1da177e4c3f4152 Linus Torvalds      2005-04-16  @898  xfs_growfs_rt(
^1da177e4c3f4152 Linus Torvalds      2005-04-16   899  	xfs_mount_t	*mp,		/=
* mount point for filesystem */
^1da177e4c3f4152 Linus Torvalds      2005-04-16   900  	xfs_growfs_rt_t	*in=
)		/* growfs rt input struct */
^1da177e4c3f4152 Linus Torvalds      2005-04-16   901  {
^1da177e4c3f4152 Linus Torvalds      2005-04-16   902  	xfs_rtblock_t	bmbno=
;		/* bitmap block number */
^1da177e4c3f4152 Linus Torvalds      2005-04-16   903  	xfs_buf_t	*bp;		/* =
temporary buffer */
^1da177e4c3f4152 Linus Torvalds      2005-04-16   904  	int		error;		/* err=
or return value */
^1da177e4c3f4152 Linus Torvalds      2005-04-16   905  	xfs_mount_t	*nmp;		=
/* new (fake) mount structure */
d5cf09baced0ef3d Christoph Hellwig   2014-07-30   906  	xfs_rfsblock_t	nrbl=
ocks;	/* new number of realtime blocks */
^1da177e4c3f4152 Linus Torvalds      2005-04-16   907  	xfs_extlen_t	nrbmbl=
ocks;	/* new number of rt bitmap blocks */
d5cf09baced0ef3d Christoph Hellwig   2014-07-30   908  	xfs_rtblock_t	nrext=
ents;	/* new number of realtime extents */
^1da177e4c3f4152 Linus Torvalds      2005-04-16   909  	uint8_t		nrextslog;=
	/* new log2 of sb_rextents */
^1da177e4c3f4152 Linus Torvalds      2005-04-16   910  	xfs_extlen_t	nrsumb=
locks;	/* new number of summary blocks */
^1da177e4c3f4152 Linus Torvalds      2005-04-16   911  	uint		nrsumlevels;	=
/* new rt summary levels */
^1da177e4c3f4152 Linus Torvalds      2005-04-16   912  	uint		nrsumsize;	/*=
 new size of rt summary, bytes */
^1da177e4c3f4152 Linus Torvalds      2005-04-16   913  	xfs_sb_t	*nsbp;		/*=
 new superblock */
^1da177e4c3f4152 Linus Torvalds      2005-04-16   914  	xfs_extlen_t	rbmblo=
cks;	/* current number of rt bitmap blocks */
^1da177e4c3f4152 Linus Torvalds      2005-04-16   915  	xfs_extlen_t	rsumbl=
ocks;	/* current number of rt summary blks */
^1da177e4c3f4152 Linus Torvalds      2005-04-16   916  	xfs_sb_t	*sbp;		/* =
old superblock */
^1da177e4c3f4152 Linus Torvalds      2005-04-16   917  	xfs_fsblock_t	sumbn=
o;		/* summary block number */
65eed012d1f2d0f0 Omar Sandoval       2018-12-21   918  	uint8_t		*rsum_cach=
e;	/* old summary cache */
^1da177e4c3f4152 Linus Torvalds      2005-04-16   919  =

^1da177e4c3f4152 Linus Torvalds      2005-04-16   920  	sbp =3D &mp->m_sb;
^1da177e4c3f4152 Linus Torvalds      2005-04-16   921  	/*
^1da177e4c3f4152 Linus Torvalds      2005-04-16   922  	 * Initial error ch=
ecking.
^1da177e4c3f4152 Linus Torvalds      2005-04-16   923  	 */
743bb4650da9e259 sandeen(a)sandeen.net 2008-11-25   924  	if (!capable(CAP_=
SYS_ADMIN))
2451337dd043901b Dave Chinner        2014-06-25   925  		return -EPERM;
73024cf11522c023 Eric Sesterhenn     2006-06-28   926  	if (mp->m_rtdev_tar=
gp =3D=3D NULL || mp->m_rbmip =3D=3D NULL ||
^1da177e4c3f4152 Linus Torvalds      2005-04-16   927  	    (nrblocks =3D i=
n->newblocks) <=3D sbp->sb_rblocks ||
^1da177e4c3f4152 Linus Torvalds      2005-04-16   928  	    (sbp->sb_rblock=
s && (in->extsize !=3D sbp->sb_rextsize)))
2451337dd043901b Dave Chinner        2014-06-25   929  		return -EINVAL;
4cc929ee305c6957 Nathan Scott        2007-05-14   930  	if ((error =3D xfs_=
sb_validate_fsb_count(sbp, nrblocks)))
4cc929ee305c6957 Nathan Scott        2007-05-14   931  		return error;
^1da177e4c3f4152 Linus Torvalds      2005-04-16   932  	/*
^1da177e4c3f4152 Linus Torvalds      2005-04-16   933  	 * Read in the last=
 block of the device, make sure it exists.
^1da177e4c3f4152 Linus Torvalds      2005-04-16   934  	 */
ba3726742c1712c4 Dave Chinner        2014-10-02   935  	error =3D xfs_buf_r=
ead_uncached(mp->m_rtdev_targp,
4cc929ee305c6957 Nathan Scott        2007-05-14   936  				XFS_FSB_TO_BB(mp=
, nrblocks - 1),
ba3726742c1712c4 Dave Chinner        2014-10-02   937  				XFS_FSB_TO_BB(mp=
, 1), 0, &bp, NULL);
ba3726742c1712c4 Dave Chinner        2014-10-02   938  	if (error)
eab4e63368b4cfa5 Dave Chinner        2012-11-12   939  		return error;
^1da177e4c3f4152 Linus Torvalds      2005-04-16   940  	xfs_buf_relse(bp);
1922c949c59f93be Dave Chinner        2010-09-22   941  =

^1da177e4c3f4152 Linus Torvalds      2005-04-16   942  	/*
^1da177e4c3f4152 Linus Torvalds      2005-04-16   943  	 * Calculate new pa=
rameters.  These are the final values to be reached.
^1da177e4c3f4152 Linus Torvalds      2005-04-16   944  	 */
^1da177e4c3f4152 Linus Torvalds      2005-04-16   945  	nrextents =3D nrblo=
cks;
^1da177e4c3f4152 Linus Torvalds      2005-04-16   946  	do_div(nrextents, i=
n->extsize);
68c3271515f11f66 Nathan Scott        2006-09-28   947  	nrbmblocks =3D howm=
any_64(nrextents, NBBY * sbp->sb_blocksize);
^1da177e4c3f4152 Linus Torvalds      2005-04-16   948  	nrextslog =3D xfs_h=
ighbit32(nrextents);
^1da177e4c3f4152 Linus Torvalds      2005-04-16   949  	nrsumlevels =3D nre=
xtslog + 1;
^1da177e4c3f4152 Linus Torvalds      2005-04-16   950  	nrsumsize =3D (uint=
)sizeof(xfs_suminfo_t) * nrsumlevels * nrbmblocks;
^1da177e4c3f4152 Linus Torvalds      2005-04-16   951  	nrsumblocks =3D XFS=
_B_TO_FSB(mp, nrsumsize);
^1da177e4c3f4152 Linus Torvalds      2005-04-16   952  	nrsumsize =3D XFS_F=
SB_TO_B(mp, nrsumblocks);
^1da177e4c3f4152 Linus Torvalds      2005-04-16   953  	/*
^1da177e4c3f4152 Linus Torvalds      2005-04-16   954  	 * New summary size=
 can't be more than half the size of
^1da177e4c3f4152 Linus Torvalds      2005-04-16   955  	 * the log.  This p=
revents us from getting a log overflow,
^1da177e4c3f4152 Linus Torvalds      2005-04-16   956  	 * since we'll log =
basically the whole summary file at once.
^1da177e4c3f4152 Linus Torvalds      2005-04-16   957  	 */
^1da177e4c3f4152 Linus Torvalds      2005-04-16   958  	if (nrsumblocks > (=
mp->m_sb.sb_logblocks >> 1))
2451337dd043901b Dave Chinner        2014-06-25   959  		return -EINVAL;
^1da177e4c3f4152 Linus Torvalds      2005-04-16   960  	/*
^1da177e4c3f4152 Linus Torvalds      2005-04-16   961  	 * Get the old bloc=
k counts for bitmap and summary inodes.
^1da177e4c3f4152 Linus Torvalds      2005-04-16   962  	 * These can't chan=
ge since other growfs callers are locked out.
^1da177e4c3f4152 Linus Torvalds      2005-04-16   963  	 */
^1da177e4c3f4152 Linus Torvalds      2005-04-16   964  	rbmblocks =3D XFS_B=
_TO_FSB(mp, mp->m_rbmip->i_d.di_size);
^1da177e4c3f4152 Linus Torvalds      2005-04-16   965  	rsumblocks =3D XFS_=
B_TO_FSB(mp, mp->m_rsumip->i_d.di_size);
^1da177e4c3f4152 Linus Torvalds      2005-04-16   966  	/*
^1da177e4c3f4152 Linus Torvalds      2005-04-16   967  	 * Allocate space t=
o the bitmap and summary files, as necessary.
^1da177e4c3f4152 Linus Torvalds      2005-04-16   968  	 */
1050c71e2925ab0c Christoph Hellwig   2011-02-13   969  	error =3D xfs_growf=
s_rt_alloc(mp, rbmblocks, nrbmblocks, mp->m_rbmip);
1050c71e2925ab0c Christoph Hellwig   2011-02-13   970  	if (error)
^1da177e4c3f4152 Linus Torvalds      2005-04-16   971  		return error;
1050c71e2925ab0c Christoph Hellwig   2011-02-13   972  	error =3D xfs_growf=
s_rt_alloc(mp, rsumblocks, nrsumblocks, mp->m_rsumip);
1050c71e2925ab0c Christoph Hellwig   2011-02-13   973  	if (error)
^1da177e4c3f4152 Linus Torvalds      2005-04-16   974  		return error;
65eed012d1f2d0f0 Omar Sandoval       2018-12-21   975  =

65eed012d1f2d0f0 Omar Sandoval       2018-12-21   976  	rsum_cache =3D mp->=
m_rsum_cache;
65eed012d1f2d0f0 Omar Sandoval       2018-12-21   977  	if (nrbmblocks !=3D=
 sbp->sb_rbmblocks)
65eed012d1f2d0f0 Omar Sandoval       2018-12-21   978  		xfs_alloc_rsum_cac=
he(mp, nrbmblocks);
65eed012d1f2d0f0 Omar Sandoval       2018-12-21   979  =

d432c80e68e3c283 Nathan Scott        2006-09-28   980  	/*
d432c80e68e3c283 Nathan Scott        2006-09-28   981  	 * Allocate a new (=
fake) mount/sb.
d432c80e68e3c283 Nathan Scott        2006-09-28   982  	 */
707e0ddaf67e8942 Tetsuo Handa        2019-08-26   983  	nmp =3D kmem_alloc(=
sizeof(*nmp), 0);
^1da177e4c3f4152 Linus Torvalds      2005-04-16   984  	/*
^1da177e4c3f4152 Linus Torvalds      2005-04-16   985  	 * Loop over the bi=
tmap blocks.
^1da177e4c3f4152 Linus Torvalds      2005-04-16   986  	 * We will do every=
thing one bitmap block at a time.
^1da177e4c3f4152 Linus Torvalds      2005-04-16   987  	 * Skip the current=
 block if it is exactly full.
^1da177e4c3f4152 Linus Torvalds      2005-04-16   988  	 * This also deals =
with the case where there were no rtextents before.
^1da177e4c3f4152 Linus Torvalds      2005-04-16   989  	 */
^1da177e4c3f4152 Linus Torvalds      2005-04-16   990  	for (bmbno =3D sbp-=
>sb_rbmblocks -
^1da177e4c3f4152 Linus Torvalds      2005-04-16   991  		     ((sbp->sb_rex=
tents & ((1 << mp->m_blkbit_log) - 1)) !=3D 0);
^1da177e4c3f4152 Linus Torvalds      2005-04-16   992  	     bmbno < nrbmbl=
ocks;
^1da177e4c3f4152 Linus Torvalds      2005-04-16   993  	     bmbno++) {
0924b585fc49bf37 Dave Chinner        2008-11-28   994  		xfs_trans_t	*tp;
0924b585fc49bf37 Dave Chinner        2008-11-28   995  =

^1da177e4c3f4152 Linus Torvalds      2005-04-16   996  		*nmp =3D *mp;
^1da177e4c3f4152 Linus Torvalds      2005-04-16   997  		nsbp =3D &nmp->m_s=
b;
^1da177e4c3f4152 Linus Torvalds      2005-04-16   998  		/*
^1da177e4c3f4152 Linus Torvalds      2005-04-16   999  		 * Calculate new s=
b and mount fields for this round.
^1da177e4c3f4152 Linus Torvalds      2005-04-16  1000  		 */
^1da177e4c3f4152 Linus Torvalds      2005-04-16  1001  		nsbp->sb_rextsize =
=3D in->extsize;
^1da177e4c3f4152 Linus Torvalds      2005-04-16  1002  		nsbp->sb_rbmblocks=
 =3D bmbno + 1;
^1da177e4c3f4152 Linus Torvalds      2005-04-16  1003  		nsbp->sb_rblocks =
=3D
^1da177e4c3f4152 Linus Torvalds      2005-04-16  1004  			XFS_RTMIN(nrblock=
s,
^1da177e4c3f4152 Linus Torvalds      2005-04-16  1005  				  nsbp->sb_rbmbl=
ocks * NBBY *
^1da177e4c3f4152 Linus Torvalds      2005-04-16  1006  				  nsbp->sb_block=
size * nsbp->sb_rextsize);
^1da177e4c3f4152 Linus Torvalds      2005-04-16  1007  		nsbp->sb_rextents =
=3D nsbp->sb_rblocks;
^1da177e4c3f4152 Linus Torvalds      2005-04-16  1008  		do_div(nsbp->sb_re=
xtents, nsbp->sb_rextsize);
79071eb0b2f142b9 David Chinner       2008-08-13  1009  		ASSERT(nsbp->sb_re=
xtents !=3D 0);
^1da177e4c3f4152 Linus Torvalds      2005-04-16  1010  		nsbp->sb_rextslog =
=3D xfs_highbit32(nsbp->sb_rextents);
^1da177e4c3f4152 Linus Torvalds      2005-04-16  1011  		nrsumlevels =3D nm=
p->m_rsumlevels =3D nsbp->sb_rextslog + 1;
^1da177e4c3f4152 Linus Torvalds      2005-04-16  1012  		nrsumsize =3D
^1da177e4c3f4152 Linus Torvalds      2005-04-16  1013  			(uint)sizeof(xfs_=
suminfo_t) * nrsumlevels *
^1da177e4c3f4152 Linus Torvalds      2005-04-16  1014  			nsbp->sb_rbmblock=
s;
^1da177e4c3f4152 Linus Torvalds      2005-04-16  1015  		nrsumblocks =3D XF=
S_B_TO_FSB(mp, nrsumsize);
^1da177e4c3f4152 Linus Torvalds      2005-04-16  1016  		nmp->m_rsumsize =
=3D nrsumsize =3D XFS_FSB_TO_B(mp, nrsumblocks);
^1da177e4c3f4152 Linus Torvalds      2005-04-16  1017  		/*
^1da177e4c3f4152 Linus Torvalds      2005-04-16  1018  		 * Start a transac=
tion, get the log reservation.
^1da177e4c3f4152 Linus Torvalds      2005-04-16  1019  		 */
253f4911f297b837 Christoph Hellwig   2016-04-06  1020  		error =3D xfs_tran=
s_alloc(mp, &M_RES(mp)->tr_growrtfree, 0, 0, 0,
253f4911f297b837 Christoph Hellwig   2016-04-06  1021  				&tp);
3d3c8b5222b92447 Jie Liu             2013-08-12  1022  		if (error)
253f4911f297b837 Christoph Hellwig   2016-04-06  1023  			break;
^1da177e4c3f4152 Linus Torvalds      2005-04-16  1024  		/*
^1da177e4c3f4152 Linus Torvalds      2005-04-16  1025  		 * Lock out other =
callers by grabbing the bitmap inode lock.
^1da177e4c3f4152 Linus Torvalds      2005-04-16  1026  		 */
1050c71e2925ab0c Christoph Hellwig   2011-02-13  1027  		xfs_ilock(mp->m_rb=
mip, XFS_ILOCK_EXCL);
ddc3415aba1cb2f8 Christoph Hellwig   2011-09-19  1028  		xfs_trans_ijoin(tp=
, mp->m_rbmip, XFS_ILOCK_EXCL);
^1da177e4c3f4152 Linus Torvalds      2005-04-16  1029  		/*
f4c32e87de7d6607 Darrick J. Wong     2020-10-07  1030  		 * Update the bitm=
ap inode's size ondisk and incore.  We need
f4c32e87de7d6607 Darrick J. Wong     2020-10-07  1031  		 * to update the i=
ncore size so that inode inactivation won't
f4c32e87de7d6607 Darrick J. Wong     2020-10-07  1032  		 * punch what it t=
hinks are "posteof" blocks.
^1da177e4c3f4152 Linus Torvalds      2005-04-16  1033  		 */
^1da177e4c3f4152 Linus Torvalds      2005-04-16  1034  		mp->m_rbmip->i_d.d=
i_size =3D
^1da177e4c3f4152 Linus Torvalds      2005-04-16  1035  			nsbp->sb_rbmblock=
s * nsbp->sb_blocksize;
f4c32e87de7d6607 Darrick J. Wong     2020-10-07  1036  		i_size_write(VFS_I=
(mp->m_rbmip), mp->m_rbmip->i_d.di_size);
^1da177e4c3f4152 Linus Torvalds      2005-04-16  1037  		xfs_trans_log_inod=
e(tp, mp->m_rbmip, XFS_ILOG_CORE);
^1da177e4c3f4152 Linus Torvalds      2005-04-16  1038  		/*
^1da177e4c3f4152 Linus Torvalds      2005-04-16  1039  		 * Get the summary=
 inode into the transaction.
^1da177e4c3f4152 Linus Torvalds      2005-04-16  1040  		 */
1050c71e2925ab0c Christoph Hellwig   2011-02-13  1041  		xfs_ilock(mp->m_rs=
umip, XFS_ILOCK_EXCL);
ddc3415aba1cb2f8 Christoph Hellwig   2011-09-19  1042  		xfs_trans_ijoin(tp=
, mp->m_rsumip, XFS_ILOCK_EXCL);
^1da177e4c3f4152 Linus Torvalds      2005-04-16  1043  		/*
f4c32e87de7d6607 Darrick J. Wong     2020-10-07  1044  		 * Update the summ=
ary inode's size.  We need to update the
f4c32e87de7d6607 Darrick J. Wong     2020-10-07  1045  		 * incore size so =
that inode inactivation won't punch what it
f4c32e87de7d6607 Darrick J. Wong     2020-10-07  1046  		 * thinks are "pos=
teof" blocks.
^1da177e4c3f4152 Linus Torvalds      2005-04-16  1047  		 */
^1da177e4c3f4152 Linus Torvalds      2005-04-16  1048  		mp->m_rsumip->i_d.=
di_size =3D nmp->m_rsumsize;
f4c32e87de7d6607 Darrick J. Wong     2020-10-07  1049  		i_size_write(VFS_I=
(mp->m_rsumip), mp->m_rsumip->i_d.di_size);
^1da177e4c3f4152 Linus Torvalds      2005-04-16  1050  		xfs_trans_log_inod=
e(tp, mp->m_rsumip, XFS_ILOG_CORE);
^1da177e4c3f4152 Linus Torvalds      2005-04-16  1051  		/*
^1da177e4c3f4152 Linus Torvalds      2005-04-16  1052  		 * Copy summary da=
ta from old to new sizes.
^1da177e4c3f4152 Linus Torvalds      2005-04-16  1053  		 * Do this when th=
e real size (not block-aligned) changes.
^1da177e4c3f4152 Linus Torvalds      2005-04-16  1054  		 */
^1da177e4c3f4152 Linus Torvalds      2005-04-16  1055  		if (sbp->sb_rbmblo=
cks !=3D nsbp->sb_rbmblocks ||
^1da177e4c3f4152 Linus Torvalds      2005-04-16  1056  		    mp->m_rsumleve=
ls !=3D nmp->m_rsumlevels) {
^1da177e4c3f4152 Linus Torvalds      2005-04-16  1057  			error =3D xfs_rtc=
opy_summary(mp, nmp, tp);
^1da177e4c3f4152 Linus Torvalds      2005-04-16  1058  			if (error)
0924b585fc49bf37 Dave Chinner        2008-11-28  1059  				goto error_cance=
l;
^1da177e4c3f4152 Linus Torvalds      2005-04-16  1060  		}
^1da177e4c3f4152 Linus Torvalds      2005-04-16  1061  		/*
^1da177e4c3f4152 Linus Torvalds      2005-04-16  1062  		 * Update superblo=
ck fields.
^1da177e4c3f4152 Linus Torvalds      2005-04-16  1063  		 */
^1da177e4c3f4152 Linus Torvalds      2005-04-16  1064  		if (nsbp->sb_rexts=
ize !=3D sbp->sb_rextsize)
^1da177e4c3f4152 Linus Torvalds      2005-04-16  1065  			xfs_trans_mod_sb(=
tp, XFS_TRANS_SB_REXTSIZE,
^1da177e4c3f4152 Linus Torvalds      2005-04-16  1066  				nsbp->sb_rextsiz=
e - sbp->sb_rextsize);
^1da177e4c3f4152 Linus Torvalds      2005-04-16  1067  		if (nsbp->sb_rbmbl=
ocks !=3D sbp->sb_rbmblocks)
^1da177e4c3f4152 Linus Torvalds      2005-04-16  1068  			xfs_trans_mod_sb(=
tp, XFS_TRANS_SB_RBMBLOCKS,
^1da177e4c3f4152 Linus Torvalds      2005-04-16  1069  				nsbp->sb_rbmbloc=
ks - sbp->sb_rbmblocks);
^1da177e4c3f4152 Linus Torvalds      2005-04-16  1070  		if (nsbp->sb_rbloc=
ks !=3D sbp->sb_rblocks)
^1da177e4c3f4152 Linus Torvalds      2005-04-16  1071  			xfs_trans_mod_sb(=
tp, XFS_TRANS_SB_RBLOCKS,
^1da177e4c3f4152 Linus Torvalds      2005-04-16  1072  				nsbp->sb_rblocks=
 - sbp->sb_rblocks);
^1da177e4c3f4152 Linus Torvalds      2005-04-16  1073  		if (nsbp->sb_rexte=
nts !=3D sbp->sb_rextents)
^1da177e4c3f4152 Linus Torvalds      2005-04-16  1074  			xfs_trans_mod_sb(=
tp, XFS_TRANS_SB_REXTENTS,
^1da177e4c3f4152 Linus Torvalds      2005-04-16  1075  				nsbp->sb_rextent=
s - sbp->sb_rextents);
^1da177e4c3f4152 Linus Torvalds      2005-04-16  1076  		if (nsbp->sb_rexts=
log !=3D sbp->sb_rextslog)
^1da177e4c3f4152 Linus Torvalds      2005-04-16  1077  			xfs_trans_mod_sb(=
tp, XFS_TRANS_SB_REXTSLOG,
^1da177e4c3f4152 Linus Torvalds      2005-04-16  1078  				nsbp->sb_rextslo=
g - sbp->sb_rextslog);
^1da177e4c3f4152 Linus Torvalds      2005-04-16  1079  		/*
^1da177e4c3f4152 Linus Torvalds      2005-04-16  1080  		 * Free new extent.
^1da177e4c3f4152 Linus Torvalds      2005-04-16  1081  		 */
^1da177e4c3f4152 Linus Torvalds      2005-04-16  1082  		bp =3D NULL;
^1da177e4c3f4152 Linus Torvalds      2005-04-16  1083  		error =3D xfs_rtfr=
ee_range(nmp, tp, sbp->sb_rextents,
^1da177e4c3f4152 Linus Torvalds      2005-04-16  1084  			nsbp->sb_rextents=
 - sbp->sb_rextents, &bp, &sumbno);
0924b585fc49bf37 Dave Chinner        2008-11-28  1085  		if (error) {
0924b585fc49bf37 Dave Chinner        2008-11-28  1086  error_cancel:
4906e21545814e41 Christoph Hellwig   2015-06-04  1087  			xfs_trans_cancel(=
tp);
d432c80e68e3c283 Nathan Scott        2006-09-28  1088  			break;
0924b585fc49bf37 Dave Chinner        2008-11-28  1089  		}
^1da177e4c3f4152 Linus Torvalds      2005-04-16  1090  		/*
^1da177e4c3f4152 Linus Torvalds      2005-04-16  1091  		 * Mark more block=
s free in the superblock.
^1da177e4c3f4152 Linus Torvalds      2005-04-16  1092  		 */
^1da177e4c3f4152 Linus Torvalds      2005-04-16  1093  		xfs_trans_mod_sb(t=
p, XFS_TRANS_SB_FREXTENTS,
^1da177e4c3f4152 Linus Torvalds      2005-04-16  1094  			nsbp->sb_rextents=
 - sbp->sb_rextents);
^1da177e4c3f4152 Linus Torvalds      2005-04-16  1095  		/*
^1da177e4c3f4152 Linus Torvalds      2005-04-16  1096  		 * Update mp value=
s into the real mp structure.
^1da177e4c3f4152 Linus Torvalds      2005-04-16  1097  		 */
^1da177e4c3f4152 Linus Torvalds      2005-04-16  1098  		mp->m_rsumlevels =
=3D nrsumlevels;
^1da177e4c3f4152 Linus Torvalds      2005-04-16  1099  		mp->m_rsumsize =3D=
 nrsumsize;
e5720eec0548c089 David Chinner       2008-04-10  1100  =

70393313dd0b26a6 Christoph Hellwig   2015-06-04  1101  		error =3D xfs_tran=
s_commit(tp);
0924b585fc49bf37 Dave Chinner        2008-11-28  1102  		if (error)
e5720eec0548c089 David Chinner       2008-04-10  1103  			break;
e5720eec0548c089 David Chinner       2008-04-10  1104  	}
^1da177e4c3f4152 Linus Torvalds      2005-04-16  1105  =

^1da177e4c3f4152 Linus Torvalds      2005-04-16  1106  	/*
d432c80e68e3c283 Nathan Scott        2006-09-28  1107  	 * Free the fake mp=
 structure.
^1da177e4c3f4152 Linus Torvalds      2005-04-16  1108  	 */
f0e2d93c29dc39ff Denys Vlasenko      2008-05-19  1109  	kmem_free(nmp);
d432c80e68e3c283 Nathan Scott        2006-09-28  1110  =

65eed012d1f2d0f0 Omar Sandoval       2018-12-21  1111  	/*
65eed012d1f2d0f0 Omar Sandoval       2018-12-21  1112  	 * If we had to all=
ocate a new rsum_cache, we either need to free the
65eed012d1f2d0f0 Omar Sandoval       2018-12-21  1113  	 * old one (if we s=
ucceeded) or free the new one and restore the old one
65eed012d1f2d0f0 Omar Sandoval       2018-12-21  1114  	 * (if there was an=
 error).
65eed012d1f2d0f0 Omar Sandoval       2018-12-21  1115  	 */
65eed012d1f2d0f0 Omar Sandoval       2018-12-21  1116  	if (rsum_cache !=3D=
 mp->m_rsum_cache) {
65eed012d1f2d0f0 Omar Sandoval       2018-12-21  1117  		if (error) {
65eed012d1f2d0f0 Omar Sandoval       2018-12-21  1118  			kmem_free(mp->m_r=
sum_cache);
65eed012d1f2d0f0 Omar Sandoval       2018-12-21  1119  			mp->m_rsum_cache =
=3D rsum_cache;
65eed012d1f2d0f0 Omar Sandoval       2018-12-21  1120  		} else {
65eed012d1f2d0f0 Omar Sandoval       2018-12-21  1121  			kmem_free(rsum_ca=
che);
65eed012d1f2d0f0 Omar Sandoval       2018-12-21  1122  		}
65eed012d1f2d0f0 Omar Sandoval       2018-12-21  1123  	}
65eed012d1f2d0f0 Omar Sandoval       2018-12-21  1124  =

^1da177e4c3f4152 Linus Torvalds      2005-04-16  1125  	return error;
^1da177e4c3f4152 Linus Torvalds      2005-04-16  1126  }
^1da177e4c3f4152 Linus Torvalds      2005-04-16  1127  =


:::::: The code at line 898 was first introduced by commit
:::::: 1da177e4c3f41524e886b7f1b8a0c1fc7321cac2 Linux-2.6.12-rc2

:::::: TO: Linus Torvalds <torvalds@ppc970.osdl.org>
:::::: CC: Linus Torvalds <torvalds@ppc970.osdl.org>

---
0-DAY CI Kernel Test Service, Intel Corporation
https://lists.01.org/hyperkitty/list/kbuild-all(a)lists.01.org

--===============7673564909817246411==
Content-Type: application/gzip
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: attachment; filename="config.gz"

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
--===============7673564909817246411==--

