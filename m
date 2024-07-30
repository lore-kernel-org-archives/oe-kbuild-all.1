Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.21])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AE8C26AA7
	for <oe-kbuild-all@lists.linux.dev>; Tue, 30 Jul 2024 00:49:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.21
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1722300555; cv=none; b=NKSajpgZEvOfTAPFSQ/CEIERYNj+s9To6BTkaYvrj+QHcEkdcIs9wOVumhCrKxNHCjWliGshnwsZ79+PVjHqsiRcTFRAxAulX2t4Rr977lyqb2H7s0JWPWxJNPLT1wgqsj7X81tCR90M5wrW6YF6UUcquvbhbGyvGXQ+Rhcndvo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1722300555; c=relaxed/simple;
	bh=pC7Uw9QGiuHtrj+Qs/T5uKgCK6qYwreQmKKInz3ONI0=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=XKXjye1X1a1O1/lAoKSEx+K5ErRz6TwMmc7+U5Oh2NUc3Sq9HrB5n/kZJyodTBVsPa/DktYXoefEcnQkod3PhB6QyHJnM8Ddzpwxw2hKFnsUyoWB3axeCxE6UBszvIJ4Wk9QwbCJtdfceEJSUpn9dY57nV33lcV9e5PYAybRjVQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=lN1eL7q+; arc=none smtp.client-ip=198.175.65.21
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="lN1eL7q+"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1722300554; x=1753836554;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=pC7Uw9QGiuHtrj+Qs/T5uKgCK6qYwreQmKKInz3ONI0=;
  b=lN1eL7q+LNh4C40CyIWVFNF83NQ8HMJYi01pidA474iKv/ofU6M3utWs
   jRuZ1BPLNqGMzj4KLgIgqj7xli29YTHUkgOufrdmbaXtVM6AaOp8NqGC1
   t3NrlUAcFIOcotNaIbZf5vP41wp/vm+tjhfLzmVMrjdM33CquRjWaaFus
   RbQouCDbHmOj76ufyv+gGgXN5uThmufD5JNAP370omOcAzoKo4l3k5s7c
   UUQNolmi8DLXIJnqKkWrDAQR4Jpl6TO37igGh7xShefIxS1uLFXSblk8P
   8s59KpzgQwTPIAv10+a24AHFVkxonZgwBDM3Tf8y4GxQn/yqo6D57cRwx
   g==;
X-CSE-ConnectionGUID: mzxdsDvYTgumxWBzcg5Zrw==
X-CSE-MsgGUID: 3E4GM3CPRca4EvYxEilCJg==
X-IronPort-AV: E=McAfee;i="6700,10204,11148"; a="20040536"
X-IronPort-AV: E=Sophos;i="6.09,247,1716274800"; 
   d="scan'208";a="20040536"
Received: from orviesa008.jf.intel.com ([10.64.159.148])
  by orvoesa113.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 29 Jul 2024 17:49:13 -0700
X-CSE-ConnectionGUID: qXIxNm2tRHqtyC9cd09JOA==
X-CSE-MsgGUID: ZXbo4KJXR8OqZS7A/PhXug==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.09,247,1716274800"; 
   d="scan'208";a="54955976"
Received: from lkp-server01.sh.intel.com (HELO 68891e0c336b) ([10.239.97.150])
  by orviesa008.jf.intel.com with ESMTP; 29 Jul 2024 17:49:12 -0700
Received: from kbuild by 68891e0c336b with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1sYb37-000sGZ-2D;
	Tue, 30 Jul 2024 00:49:09 +0000
Date: Tue, 30 Jul 2024 08:48:37 +0800
From: kernel test robot <lkp@intel.com>
To: Christoph Hellwig <hch@lst.de>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [hch-xfs:xfs-per-rtg-bitmap 8/15] fs/xfs/xfs_rtalloc.h:72:47: error:
 expected identifier in macro parameter list
Message-ID: <202407300807.PAoFVeKU-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   git://git.infradead.org/users/hch/xfs xfs-per-rtg-bitmap
head:   f30a4a99bd08a8b9f43363a4ae0fdff0677c5d33
commit: 220c97a57bc171ea5d5463d42328a86017334af7 [8/15] xfs: refactor xfs_growfs_check_rtgeom
config: arm64-randconfig-002-20240730 (https://download.01.org/0day-ci/archive/20240730/202407300807.PAoFVeKU-lkp@intel.com/config)
compiler: clang version 20.0.0git (https://github.com/llvm/llvm-project ccae7b461be339e717d02f99ac857cf0bc7d17fc)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240730/202407300807.PAoFVeKU-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202407300807.PAoFVeKU-lkp@intel.com/

All errors (new ones prefixed by >>):

   In file included from fs/xfs/xfs_fsops.c:6:
   In file included from fs/xfs/xfs.h:26:
   In file included from fs/xfs/xfs_linux.h:25:
   In file included from include/linux/mm.h:2258:
   include/linux/vmstat.h:500:43: warning: arithmetic between different enumeration types ('enum zone_stat_item' and 'enum numa_stat_item') [-Wenum-enum-conversion]
     500 |         return vmstat_text[NR_VM_ZONE_STAT_ITEMS +
         |                            ~~~~~~~~~~~~~~~~~~~~~ ^
     501 |                            item];
         |                            ~~~~
   include/linux/vmstat.h:507:43: warning: arithmetic between different enumeration types ('enum zone_stat_item' and 'enum numa_stat_item') [-Wenum-enum-conversion]
     507 |         return vmstat_text[NR_VM_ZONE_STAT_ITEMS +
         |                            ~~~~~~~~~~~~~~~~~~~~~ ^
     508 |                            NR_VM_NUMA_EVENT_ITEMS +
         |                            ~~~~~~~~~~~~~~~~~~~~~~
   include/linux/vmstat.h:514:36: warning: arithmetic between different enumeration types ('enum node_stat_item' and 'enum lru_list') [-Wenum-enum-conversion]
     514 |         return node_stat_name(NR_LRU_BASE + lru) + 3; // skip "nr_"
         |                               ~~~~~~~~~~~ ^ ~~~
   include/linux/vmstat.h:519:43: warning: arithmetic between different enumeration types ('enum zone_stat_item' and 'enum numa_stat_item') [-Wenum-enum-conversion]
     519 |         return vmstat_text[NR_VM_ZONE_STAT_ITEMS +
         |                            ~~~~~~~~~~~~~~~~~~~~~ ^
     520 |                            NR_VM_NUMA_EVENT_ITEMS +
         |                            ~~~~~~~~~~~~~~~~~~~~~~
   include/linux/vmstat.h:528:43: warning: arithmetic between different enumeration types ('enum zone_stat_item' and 'enum numa_stat_item') [-Wenum-enum-conversion]
     528 |         return vmstat_text[NR_VM_ZONE_STAT_ITEMS +
         |                            ~~~~~~~~~~~~~~~~~~~~~ ^
     529 |                            NR_VM_NUMA_EVENT_ITEMS +
         |                            ~~~~~~~~~~~~~~~~~~~~~~
   In file included from fs/xfs/xfs_fsops.c:24:
>> fs/xfs/xfs_rtalloc.h:72:47: error: expected identifier in macro parameter list
      72 | # define xfs_growfs_check_rtgeom(mp, d, r, rs,)         (0)
         |                                               ^
>> fs/xfs/xfs_fsops.c:120:10: error: call to undeclared function 'xfs_growfs_check_rtgeom'; ISO C99 and later do not support implicit function declarations [-Wimplicit-function-declaration]
     120 |         error = xfs_growfs_check_rtgeom(mp, nb, mp->m_sb.sb_rblocks,
         |                 ^
   5 warnings and 2 errors generated.
--
   In file included from fs/xfs/xfs_reflink.c:6:
   In file included from fs/xfs/xfs.h:26:
   In file included from fs/xfs/xfs_linux.h:25:
   In file included from include/linux/mm.h:2258:
   include/linux/vmstat.h:500:43: warning: arithmetic between different enumeration types ('enum zone_stat_item' and 'enum numa_stat_item') [-Wenum-enum-conversion]
     500 |         return vmstat_text[NR_VM_ZONE_STAT_ITEMS +
         |                            ~~~~~~~~~~~~~~~~~~~~~ ^
     501 |                            item];
         |                            ~~~~
   include/linux/vmstat.h:507:43: warning: arithmetic between different enumeration types ('enum zone_stat_item' and 'enum numa_stat_item') [-Wenum-enum-conversion]
     507 |         return vmstat_text[NR_VM_ZONE_STAT_ITEMS +
         |                            ~~~~~~~~~~~~~~~~~~~~~ ^
     508 |                            NR_VM_NUMA_EVENT_ITEMS +
         |                            ~~~~~~~~~~~~~~~~~~~~~~
   include/linux/vmstat.h:514:36: warning: arithmetic between different enumeration types ('enum node_stat_item' and 'enum lru_list') [-Wenum-enum-conversion]
     514 |         return node_stat_name(NR_LRU_BASE + lru) + 3; // skip "nr_"
         |                               ~~~~~~~~~~~ ^ ~~~
   include/linux/vmstat.h:519:43: warning: arithmetic between different enumeration types ('enum zone_stat_item' and 'enum numa_stat_item') [-Wenum-enum-conversion]
     519 |         return vmstat_text[NR_VM_ZONE_STAT_ITEMS +
         |                            ~~~~~~~~~~~~~~~~~~~~~ ^
     520 |                            NR_VM_NUMA_EVENT_ITEMS +
         |                            ~~~~~~~~~~~~~~~~~~~~~~
   include/linux/vmstat.h:528:43: warning: arithmetic between different enumeration types ('enum zone_stat_item' and 'enum numa_stat_item') [-Wenum-enum-conversion]
     528 |         return vmstat_text[NR_VM_ZONE_STAT_ITEMS +
         |                            ~~~~~~~~~~~~~~~~~~~~~ ^
     529 |                            NR_VM_NUMA_EVENT_ITEMS +
         |                            ~~~~~~~~~~~~~~~~~~~~~~
   In file included from fs/xfs/xfs_reflink.c:34:
>> fs/xfs/xfs_rtalloc.h:72:47: error: expected identifier in macro parameter list
      72 | # define xfs_growfs_check_rtgeom(mp, d, r, rs,)         (0)
         |                                               ^
   5 warnings and 1 error generated.


vim +72 fs/xfs/xfs_rtalloc.h

    39	
    40	/*
    41	 * Grow the realtime area of the filesystem.
    42	 */
    43	int
    44	xfs_growfs_rt(
    45		struct xfs_mount	*mp,	/* file system mount structure */
    46		xfs_growfs_rt_t		*in);	/* user supplied growfs struct */
    47	
    48	int xfs_rtalloc_reinit_frextents(struct xfs_mount *mp);
    49	int xfs_growfs_check_rtgeom(const struct xfs_mount *mp, xfs_rfsblock_t dblocks,
    50			xfs_rfsblock_t rblocks, xfs_agblock_t rextsize);
    51	int xfs_rtallocate_extent(struct xfs_trans *tp, xfs_rtxnum_t start,
    52			xfs_rtxlen_t maxlen, xfs_rtxlen_t *len, xfs_rtxnum_t *rtx);
    53	#else
    54	# define xfs_growfs_rt(mp,in)				(-ENOSYS)
    55	# define xfs_rtalloc_reinit_frextents(m)		(0)
    56	# define xfs_rtmount_readsb(mp)				(0)
    57	# define xfs_rtmount_freesb(mp)				((void)0)
    58	static inline int		/* error */
    59	xfs_rtmount_init(
    60		xfs_mount_t	*mp)	/* file system mount structure */
    61	{
    62		if (mp->m_sb.sb_rblocks == 0)
    63			return 0;
    64	
    65		xfs_warn(mp, "Not built with CONFIG_XFS_RT");
    66		return -ENOSYS;
    67	}
    68	# define xfs_rtmount_inodes(m)  (((mp)->m_sb.sb_rblocks == 0)? 0 : (-ENOSYS))
    69	# define xfs_rtunmount_inodes(m)
    70	# define xfs_rt_resv_free(mp)				((void)0)
    71	# define xfs_rt_resv_init(mp)				(0)
  > 72	# define xfs_growfs_check_rtgeom(mp, d, r, rs,)		(0)
    73	# define xfs_rtallocate_extent(...)			(-ENOSYS)
    74	#endif	/* CONFIG_XFS_RT */
    75	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
