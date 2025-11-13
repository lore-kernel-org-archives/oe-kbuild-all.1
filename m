Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.16])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0BB1F29CE1
	for <oe-kbuild-all@lists.linux.dev>; Thu, 13 Nov 2025 13:30:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.16
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1763040620; cv=none; b=M5MQeAW1hM0GYUsDhts3pnjTg14bKgFEbqePCuNf3SODiYl0urFrQ08iMgi0IakHntyuR9AoD00Wqr/2Ey3bvh81PeYXW/qDdkPe3B3OSos3blmDwK2tEklhXxfWMn/UaUchKQAypD8SJI6BJBHvW3p34289osTU/aUk++CkKIw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1763040620; c=relaxed/simple;
	bh=aAQ4tAvqhBMFBgB4TQJm4IXcX/uVjg9n5edjhFwxpHE=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=EntRTUN2T6CVZRoPxh3Ccss//EHcf4SZt4Vlb6/hdEV/bABoZWkugppIv/uIBF8fvdulYF7h8D+ROzxClpV398YnJi5astXSqx/06nc3P1Eh9NevsxG9L1oHUodxq5cSmy+zTmfwNrQcgUgNlE6NJ8sy5rdToHX1a+hBhVwAqgY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=aOvl/hB2; arc=none smtp.client-ip=192.198.163.16
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="aOvl/hB2"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1763040619; x=1794576619;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=aAQ4tAvqhBMFBgB4TQJm4IXcX/uVjg9n5edjhFwxpHE=;
  b=aOvl/hB22hkDTFsyHP94vTp/D/BVOcFyOF7tu6a8pVAtCp5XaDACph0/
   qRTxqORMMNO5sD+f5JogS0ZjUCs7Hd9M6OL+AncL7CjvUvYlEdCuYsXyA
   ZyiiTVC2ztzcTTqrJVA63vfTkWQRQJoeHHMaV/gHMzizits2YzsHURaay
   ky/ez6yGScXJlEbJwkmzXjYMqe9r1OdrJVAPx4u/p23XxYob3djT3J9hF
   m79G/+K+0H0hR8WN8p1JC6CI3hDfevTcBjlmI+0F3S8zoLCUkBsWMCWt0
   hve8zCKqnrLAbF9nQxXeFeeacYu2Eo0au7b34eeDbRo66PhxxYnk8osMP
   A==;
X-CSE-ConnectionGUID: G2Km7kTaTn24R5B3Y9JErQ==
X-CSE-MsgGUID: QXIKki+EQqu2UsAXr65MkA==
X-IronPort-AV: E=McAfee;i="6800,10657,11612"; a="52682437"
X-IronPort-AV: E=Sophos;i="6.19,301,1754982000"; 
   d="scan'208";a="52682437"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
  by fmvoesa110.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 13 Nov 2025 05:30:18 -0800
X-CSE-ConnectionGUID: XYbIP0VjSJ6jhHUFn4dbcA==
X-CSE-MsgGUID: MWESau43TJa8P4h8YXE9Ag==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.19,301,1754982000"; 
   d="scan'208";a="220157546"
Received: from lkp-server01.sh.intel.com (HELO 7b01c990427b) ([10.239.97.150])
  by orviesa002.jf.intel.com with ESMTP; 13 Nov 2025 05:30:18 -0800
Received: from kbuild by 7b01c990427b with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1vJXOw-0005Nz-38;
	Thu, 13 Nov 2025 13:30:14 +0000
Date: Thu, 13 Nov 2025 21:29:17 +0800
From: kernel test robot <lkp@intel.com>
To: "Darrick J. Wong" <darrick.wong@oracle.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [djwong-xfs:iomap-ioerr-reporting 104/104] fs/xfs/xfs_health.c:75:3:
 error: implicit declaration of function 'sb_error'; did you mean
 'vmf_error'?
Message-ID: <202511132146.1TITtIAV-lkp@intel.com>
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
config: powerpc-randconfig-r072-20251113 (https://download.01.org/0day-ci/archive/20251113/202511132146.1TITtIAV-lkp@intel.com/config)
compiler: powerpc-linux-gcc (GCC) 10.5.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20251113/202511132146.1TITtIAV-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202511132146.1TITtIAV-lkp@intel.com/

All errors (new ones prefixed by >>):

   fs/xfs/xfs_health.c: In function 'xfs_fs_health_update_hook':
>> fs/xfs/xfs_health.c:75:3: error: implicit declaration of function 'sb_error'; did you mean 'vmf_error'? [-Werror=implicit-function-declaration]
      75 |   sb_error(mp->m_super, -EFSCORRUPTED);
         |   ^~~~~~~~
         |   vmf_error
   fs/xfs/xfs_health.c: In function 'xfs_inode_health_update_hook':
>> fs/xfs/xfs_health.c:135:26: error: 'FSERR_METADATA' undeclared (first use in this function); did you mean 'XFS_ERR_METADATA'?
     135 |   inode_error(VFS_I(ip), FSERR_METADATA, 0, 0, -EFSCORRUPTED);
         |                          ^~~~~~~~~~~~~~
         |                          XFS_ERR_METADATA
   fs/xfs/xfs_health.c:135:26: note: each undeclared identifier is reported only once for each function it appears in
   cc1: some warnings being treated as errors


vim +75 fs/xfs/xfs_health.c

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
