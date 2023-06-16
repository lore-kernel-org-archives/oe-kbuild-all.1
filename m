Received: from mga03.intel.com (mga03.intel.com [134.134.136.65])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 76BD3111A2
	for <oe-kbuild-all@lists.linux.dev>; Fri, 16 Jun 2023 18:42:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1686940972; x=1718476972;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=pxpyYRcrfkVU+VKRyxkdGIbsfCQkdeag7UvVOzZ/13o=;
  b=XHlKkYzSiGSQUYvZ3I+t1eF/hgdjUrBlMojiKW96yOognT88frdEoByI
   lS7DENObi5kJKDqvK/6pa0TT7K06sRrcWgfzvkQGuy4Qd8TBZAOPYmsP0
   sVljqsOR1gAEFAdOf0Fm99yQSHpSODEcJ4G0X1Hc0uxwfIRBGLzLKrifm
   iCuxIxauj0M8/GnyBbfy8ETdHj398X+51QCyMnBU6bKaAQlLbBI33O0AK
   2kMFI5Z5x18ClQBt59j/0r7AtMbcu3J+HLwPkn5CRWAcYIDIsQQiXTMTi
   lfn6EvwpL3Zoc7tyl3IWfM0Rq25EYtKM+3uV1uPxGxiusTlt8HMAo9ZyG
   w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10743"; a="362699720"
X-IronPort-AV: E=Sophos;i="6.00,248,1681196400"; 
   d="scan'208";a="362699720"
Received: from fmsmga004.fm.intel.com ([10.253.24.48])
  by orsmga103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 16 Jun 2023 11:42:51 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10743"; a="783023610"
X-IronPort-AV: E=Sophos;i="6.00,248,1681196400"; 
   d="scan'208";a="783023610"
Received: from lkp-server01.sh.intel.com (HELO 783282924a45) ([10.239.97.150])
  by fmsmga004.fm.intel.com with ESMTP; 16 Jun 2023 11:42:50 -0700
Received: from kbuild by 783282924a45 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1qAEPJ-0001i8-2D;
	Fri, 16 Jun 2023 18:42:49 +0000
Date: Sat, 17 Jun 2023 02:42:14 +0800
From: kernel test robot <lkp@intel.com>
To: "Darrick J. Wong" <darrick.wong@oracle.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [djwong-xfs:vectorized-scrub 487/494] fs/xfs/xfs_qm_bhv.c:26:20:
 warning: unused variable 'mp'
Message-ID: <202306170200.Pz3gGGzE-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/djwong/xfs-linux.git vectorized-scrub
head:   fe4478b28c0065201a37d4b3fab2d01f98c81cd6
commit: a10c06d375a1fd7792ddba757ce2d0ad7772b543 [487/494] xfs: report realtime block quota limits on realtime directories
config: x86_64-randconfig-r004-20230616 (https://download.01.org/0day-ci/archive/20230617/202306170200.Pz3gGGzE-lkp@intel.com/config)
compiler: clang version 15.0.7 (https://github.com/llvm/llvm-project.git 8dfdcc7b7bf66834a761bd8de445840ef68e4d1a)
reproduce: (https://download.01.org/0day-ci/archive/20230617/202306170200.Pz3gGGzE-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202306170200.Pz3gGGzE-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> fs/xfs/xfs_qm_bhv.c:26:20: warning: unused variable 'mp' [-Wunused-variable]
           struct xfs_mount        *mp = ip->i_mount;
                                    ^
   1 warning generated.


vim +/mp +26 fs/xfs/xfs_qm_bhv.c

    18	
    19	
    20	STATIC void
    21	xfs_fill_statvfs_from_dquot(
    22		struct kstatfs		*statp,
    23		struct xfs_inode	*ip,
    24		struct xfs_dquot	*dqp)
    25	{
  > 26		struct xfs_mount	*mp = ip->i_mount;
    27		struct xfs_dquot_res	*blkres = &dqp->q_blk;
    28		uint64_t		limit;
    29	
    30		if (XFS_IS_REALTIME_MOUNT(mp) &&
    31		    (ip->i_diflags & (XFS_DIFLAG_RTINHERIT | XFS_DIFLAG_REALTIME)))
    32			blkres = &dqp->q_rtb;
    33	
    34		limit = blkres->softlimit ?
    35			blkres->softlimit :
    36			blkres->hardlimit;
    37		if (limit && statp->f_blocks > limit) {
    38			statp->f_blocks = limit;
    39			statp->f_bfree = statp->f_bavail =
    40				(statp->f_blocks > blkres->reserved) ?
    41				 (statp->f_blocks - blkres->reserved) : 0;
    42		}
    43	
    44		limit = dqp->q_ino.softlimit ?
    45			dqp->q_ino.softlimit :
    46			dqp->q_ino.hardlimit;
    47		if (limit && statp->f_files > limit) {
    48			statp->f_files = limit;
    49			statp->f_ffree =
    50				(statp->f_files > dqp->q_ino.reserved) ?
    51				 (statp->f_files - dqp->q_ino.reserved) : 0;
    52		}
    53	}
    54	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
