Received: from mga02.intel.com (mga02.intel.com [134.134.136.20])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 402192105
	for <oe-kbuild-all@lists.linux.dev>; Fri, 16 Jun 2023 06:26:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1686896773; x=1718432773;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=eir4QommndsZkXf5vQaFls6LjCwHHPd5cJtt/evXzmk=;
  b=Fv1jJQzt8L8fenodCDwFLpSgns3kQ9dUyytgO9rctfaXGA6kkqXovz3O
   OD91m55Dhawkkh0g5Zzk4DwepWuR7uq9Hvg1XaNfrjP7OV/F01AKF4SIL
   xknGptE3DOPa6GjOacn6mAVxWOk71p+GqU3ME1ugyeto8R0zkKGyzlyXU
   LRcu/PkJcdUytUMSHR/c30+dlJmMAaPQYaPqA2okLT/KhxxXrfiweTbDN
   L64BpKbXNTuilCwTcx58o/Apg7tvdy2UIPv29w9VwHY/Zjuo1R/tPs13D
   53P7WoZH4kaUdVcm/SHJhv8T/isFnUJZ0GvOP+bjkMLOrbjIiKPIPPbPo
   Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10742"; a="348850073"
X-IronPort-AV: E=Sophos;i="6.00,246,1681196400"; 
   d="scan'208";a="348850073"
Received: from orsmga002.jf.intel.com ([10.7.209.21])
  by orsmga101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 15 Jun 2023 23:26:12 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10742"; a="712745336"
X-IronPort-AV: E=Sophos;i="6.00,246,1681196400"; 
   d="scan'208";a="712745336"
Received: from lkp-server01.sh.intel.com (HELO 783282924a45) ([10.239.97.150])
  by orsmga002.jf.intel.com with ESMTP; 15 Jun 2023 23:26:11 -0700
Received: from kbuild by 783282924a45 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1qA2uQ-0000sm-13;
	Fri, 16 Jun 2023 06:26:10 +0000
Date: Fri, 16 Jun 2023 14:26:07 +0800
From: kernel test robot <lkp@intel.com>
To: "Darrick J. Wong" <darrick.wong@oracle.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [djwong-xfs:vectorized-scrub 487/494] fs/xfs/xfs_qm_bhv.c:26:34:
 warning: unused variable 'mp'
Message-ID: <202306161438.nFqdlFRV-lkp@intel.com>
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
config: i386-randconfig-i003-20230615 (https://download.01.org/0day-ci/archive/20230616/202306161438.nFqdlFRV-lkp@intel.com/config)
compiler: gcc-12 (Debian 12.2.0-14) 12.2.0
reproduce (this is a W=1 build):
        # https://git.kernel.org/pub/scm/linux/kernel/git/djwong/xfs-linux.git/commit/?id=a10c06d375a1fd7792ddba757ce2d0ad7772b543
        git remote add djwong-xfs https://git.kernel.org/pub/scm/linux/kernel/git/djwong/xfs-linux.git
        git fetch --no-tags djwong-xfs vectorized-scrub
        git checkout a10c06d375a1fd7792ddba757ce2d0ad7772b543
        # save the config file
        mkdir build_dir && cp config build_dir/.config
        make W=1 O=build_dir ARCH=i386 olddefconfig
        make W=1 O=build_dir ARCH=i386 SHELL=/bin/bash fs/xfs/

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202306161438.nFqdlFRV-lkp@intel.com/

All warnings (new ones prefixed by >>):

   fs/xfs/xfs_qm_bhv.c: In function 'xfs_fill_statvfs_from_dquot':
>> fs/xfs/xfs_qm_bhv.c:26:34: warning: unused variable 'mp' [-Wunused-variable]
      26 |         struct xfs_mount        *mp = ip->i_mount;
         |                                  ^~


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
