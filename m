Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CCF292C3245
	for <oe-kbuild-all@lists.linux.dev>; Thu, 13 Nov 2025 21:11:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.17
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1763068270; cv=none; b=XFW57tPCvEA/4mTbgiAK+GXN6XKGlifl+75WtLg5XNscVvhYDZUDK/Kg2wwt3ufnOF3mNxhcf6RyB3r3KjMDDaoFfpYv9U3CMfMrU4P0J5rU3NCvgWEyISFHWf9sqpUEqvZ854sfAHkGHGqt2RKwRAhoelbMzn25zrp75s4kgWg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1763068270; c=relaxed/simple;
	bh=e4qzbvVVEU1XGTsXkFcagopdfI3VBplFdS+5q1Pm/+w=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=IxY8bVeUo8UP8fTYN10phxkSXU7lQovVhUChG3t8Z6N6q9aAEufmo+HN1ePCAGo9Nf76nnsEMoofSOYiOoUahfIOOtRGV0OiDvS5NUQSxyn7E5OX7Jvc58FDhnq4rpMf63BqEB4Vu/4y8tu+Pb6l9kImjlYVLJqdPyvVzrEn8UA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=BMInUgRr; arc=none smtp.client-ip=198.175.65.17
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="BMInUgRr"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1763068269; x=1794604269;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=e4qzbvVVEU1XGTsXkFcagopdfI3VBplFdS+5q1Pm/+w=;
  b=BMInUgRrz6ra1NQdAFyBTCODx3QIJiWuq87XWzMPkibKJWVUSDnqqW7b
   h/iKNwYaMfmS0S/ir8eEVAdTC6gbVD8yfYNo+eXKxf0iYLsvM/QVwwIsU
   0T6EqjTD4pyVd7i3PrySupleiNREMBjPaC+Y3/xothAa4Q7jUP3NI9Gt9
   PRG2ZVy4RRrUqkDyv89Pqmj3jXoP4UcD3pnPnMysksF+jsqGt2otAEucn
   2UKMkpKsKWMwm13CGmsp/5vrIkiKAafci4AbHKV62UcTdKmckIgTsJOy0
   qOgOyjB7ZMalVcr61gA1vPRaanfuryBGf30iczVLDlEBLp0s4v3wBnjwz
   w==;
X-CSE-ConnectionGUID: opmunkGLSgOrpg8KVArUiA==
X-CSE-MsgGUID: gqk5Alz7R3GtOx0YTCS3Kg==
X-IronPort-AV: E=McAfee;i="6800,10657,11531"; a="65098161"
X-IronPort-AV: E=Sophos;i="6.17,312,1747724400"; 
   d="scan'208";a="65098161"
Received: from orviesa004.jf.intel.com ([10.64.159.144])
  by orvoesa109.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 13 Nov 2025 13:11:08 -0800
X-CSE-ConnectionGUID: zTi88KYgQYmsH4HqeheDDA==
X-CSE-MsgGUID: 5kOD/6MXTWyQwSDCbh3xOw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.19,303,1754982000"; 
   d="scan'208";a="194047944"
Received: from lkp-server01.sh.intel.com (HELO 7b01c990427b) ([10.239.97.150])
  by orviesa004.jf.intel.com with ESMTP; 13 Nov 2025 13:11:07 -0800
Received: from kbuild by 7b01c990427b with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1vJeav-0005rz-0F;
	Thu, 13 Nov 2025 21:11:05 +0000
Date: Fri, 14 Nov 2025 05:10:51 +0800
From: kernel test robot <lkp@intel.com>
To: "Darrick J. Wong" <darrick.wong@oracle.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [djwong-xfs:iomap-ioerr-reporting 104/104] fs/xfs/xfs_health.c:75:3:
 error: call to undeclared function 'sb_error'; ISO C99 and later do not
 support implicit function declarations
Message-ID: <202511140520.OUxq1tWj-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/djwong/xfs-linux.git iomap-ioerr-reporting
head:   fcfa2d1ca43ca32450cc8f8577771778de9a4da3
commit: fcfa2d1ca43ca32450cc8f8577771778de9a4da3 [104/104] xfs: report fs metadata errors via fsnotify
config: arm-randconfig-004-20251114 (https://download.01.org/0day-ci/archive/20251114/202511140520.OUxq1tWj-lkp@intel.com/config)
compiler: clang version 22.0.0git (https://github.com/llvm/llvm-project 0bba1e76581bad04e7d7f09f5115ae5e2989e0d9)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20251114/202511140520.OUxq1tWj-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202511140520.OUxq1tWj-lkp@intel.com/

All errors (new ones prefixed by >>):

>> fs/xfs/xfs_health.c:75:3: error: call to undeclared function 'sb_error'; ISO C99 and later do not support implicit function declarations [-Wimplicit-function-declaration]
      75 |                 sb_error(mp->m_super, -EFSCORRUPTED);
         |                 ^
   fs/xfs/xfs_health.c:100:3: error: call to undeclared function 'sb_error'; ISO C99 and later do not support implicit function declarations [-Wimplicit-function-declaration]
     100 |                 sb_error(mp->m_super, -EFSCORRUPTED);
         |                 ^
>> fs/xfs/xfs_health.c:135:26: error: use of undeclared identifier 'FSERR_METADATA'; did you mean 'XFS_ERR_METADATA'?
     135 |                 inode_error(VFS_I(ip), FSERR_METADATA, 0, 0, -EFSCORRUPTED);
         |                                        ^~~~~~~~~~~~~~
         |                                        XFS_ERR_METADATA
   fs/xfs/xfs_mount.h:34:2: note: 'XFS_ERR_METADATA' declared here
      34 |         XFS_ERR_METADATA,
         |         ^
   3 errors generated.


vim +/sb_error +75 fs/xfs/xfs_health.c

    65	
    66	/* Call downstream hooks for a filesystem health update. */
    67	static inline void
    68	xfs_fs_health_update_hook(
    69		struct xfs_mount		*mp,
    70		enum xfs_health_update_type	op,
    71		unsigned int			old_mask,
    72		unsigned int			new_mask)
    73	{
    74		if (op != XFS_HEALTHUP_HEALTHY && new_mask)
  > 75			sb_error(mp->m_super, -EFSCORRUPTED);
    76	
    77		if (xfs_hooks_switched_on(&xfs_health_hooks_switch)) {
    78			struct xfs_health_update_params	p = {
    79				.domain		= XFS_HEALTHUP_FS,
    80				.old_mask	= old_mask,
    81				.new_mask	= new_mask,
    82			};
    83	
    84			if (new_mask)
    85				xfs_hooks_call(&mp->m_health_update_hooks, op, &p);
    86		}
    87	}
    88	
    89	/* Call downstream hooks for a group health update. */
    90	static inline void
    91	xfs_group_health_update_hook(
    92		struct xfs_group		*xg,
    93		enum xfs_health_update_type	op,
    94		unsigned int			old_mask,
    95		unsigned int			new_mask)
    96	{
    97		struct xfs_mount		*mp = xg->xg_mount;
    98	
    99		if (op != XFS_HEALTHUP_HEALTHY && new_mask)
   100			sb_error(mp->m_super, -EFSCORRUPTED);
   101	
   102		if (xfs_hooks_switched_on(&xfs_health_hooks_switch)) {
   103			struct xfs_health_update_params	p = {
   104				.old_mask	= old_mask,
   105				.new_mask	= new_mask,
   106				.group		= xg->xg_gno,
   107			};
   108	
   109			switch (xg->xg_type) {
   110			case XG_TYPE_AG:
   111				p.domain = XFS_HEALTHUP_AG;
   112				break;
   113			case XG_TYPE_RTG:
   114				p.domain = XFS_HEALTHUP_RTGROUP;
   115				break;
   116			default:
   117				ASSERT(0);
   118				return;
   119			}
   120	
   121			if (new_mask)
   122				xfs_hooks_call(&mp->m_health_update_hooks, op, &p);
   123		}
   124	}
   125	
   126	/* Call downstream hooks for an inode health update. */
   127	static inline void
   128	xfs_inode_health_update_hook(
   129		struct xfs_inode		*ip,
   130		enum xfs_health_update_type	op,
   131		unsigned int			old_mask,
   132		unsigned int			new_mask)
   133	{
   134		if (op != XFS_HEALTHUP_HEALTHY && new_mask)
 > 135			inode_error(VFS_I(ip), FSERR_METADATA, 0, 0, -EFSCORRUPTED);
   136	
   137		if (xfs_hooks_switched_on(&xfs_health_hooks_switch)) {
   138			struct xfs_health_update_params	p = {
   139				.domain		= XFS_HEALTHUP_INODE,
   140				.old_mask	= old_mask,
   141				.new_mask	= new_mask,
   142				.ino		= ip->i_ino,
   143				.gen		= VFS_I(ip)->i_generation,
   144			};
   145			struct xfs_mount	*mp = ip->i_mount;
   146	
   147			if (new_mask)
   148				xfs_hooks_call(&mp->m_health_update_hooks, op, &p);
   149		}
   150	}
   151	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
