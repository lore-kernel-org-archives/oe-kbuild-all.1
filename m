Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.10])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4FEE31EABBB
	for <oe-kbuild-all@lists.linux.dev>; Tue, 12 Nov 2024 00:35:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.10
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1731371709; cv=none; b=QftxLKyHd2RZ4x2qFH/DhIDHJLEFiRCjEmcB6rJ3KqvvN/Eyphx76A2zrQcbXv+QdeqWpqWdflxA8+r7j6SezCiN7UMyiodmf4HlYT1vNdDP5JTtwxD/tqUMMBs5uP1Fbdnkz2teurrbZ0SOow5+qvnZS7pYs3fpJWoyXtPrFOE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1731371709; c=relaxed/simple;
	bh=JPzF+cKSotICdZWqh7VBXn+yX95zZCJ1VZNjx6QYAug=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=VTCjWlHX34bcnoCGAkwoaV+71wyn7/mDwPmL7D9dn/OJvn6EpqyXysnScetCk/QZ4Z03IwKkFIIpHDhWp30BobKQ5dQGKqKmJJB7eH8LkZal0qUhpx9pmsEWgEff91jxW/ijf6Y4sBW5Awe8qyKXBvLvuZfOIrkbeuNlT8hAOuQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=WGhRDuoa; arc=none smtp.client-ip=198.175.65.10
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="WGhRDuoa"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1731371707; x=1762907707;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=JPzF+cKSotICdZWqh7VBXn+yX95zZCJ1VZNjx6QYAug=;
  b=WGhRDuoa8zh9lqFaaAfkf2vHpnSRGtFZAe3YB254EV+f+lcnKOoFyQUA
   PrLqK+G0GCLBHJmSxbXE8eXh8izfhhohbkI0PjWUngVvWfhRhp/9CFpNP
   aXl3LUkx2khlikAZ8sBur3BvEVa4BrtlZ9xRpOQp0DdHXbmn3K2uxFApF
   VMvmr3fU3ZDAFtSLuo5CkRsRpYPsftlDIEqvA8A/BBWtnSbl7sICkQazH
   MHqlX6RoDCfOouwe9QoyFBDrl1/YyEE7AvFRVV/+4+Z/skdQerNSYP0WU
   bL4LQm9+tEnEv34N9GZXVrUk0V+i5sdmFYoxRcfFbsxYKfVgXYMQkJA1T
   A==;
X-CSE-ConnectionGUID: bH+VDlFKSLW1HEFgzQC+aA==
X-CSE-MsgGUID: WBUrfEkwQiSeAvovQf/OOw==
X-IronPort-AV: E=McAfee;i="6700,10204,11222"; a="48647980"
X-IronPort-AV: E=Sophos;i="6.11,199,1725346800"; 
   d="scan'208";a="48647980"
Received: from orviesa005.jf.intel.com ([10.64.159.145])
  by orvoesa102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 11 Nov 2024 16:35:07 -0800
X-CSE-ConnectionGUID: 4qLl9mmXR3CTGPopSR3Mug==
X-CSE-MsgGUID: bAn2w6TKSBKoUDHpj4s0gg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,146,1728975600"; 
   d="scan'208";a="92130251"
Received: from lkp-server01.sh.intel.com (HELO bcfed0da017c) ([10.239.97.150])
  by orviesa005.jf.intel.com with ESMTP; 11 Nov 2024 16:35:06 -0800
Received: from kbuild by bcfed0da017c with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1tAes3-0000Hv-2U;
	Tue, 12 Nov 2024 00:35:03 +0000
Date: Tue, 12 Nov 2024 08:34:58 +0800
From: kernel test robot <lkp@intel.com>
To: Christoph Hellwig <hch@lst.de>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [hch-xfs:xfs-zoned 62/64] fs/xfs/xfs_aops.c:200:undefined reference
 to `xfs_mark_rtg_boundary'
Message-ID: <202411120859.2bRiON7C-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   git://git.infradead.org/users/hch/xfs xfs-zoned
head:   f9bf4d561e545fe8e988fb807cc47d879f0a00f8
commit: 2469717386951415b1e900370e25b0cc3c8d6b1d [62/64] xfs: use xfs_mark_rtg_boundary in xfs_end_bio
config: powerpc64-randconfig-002-20241112 (https://download.01.org/0day-ci/archive/20241112/202411120859.2bRiON7C-lkp@intel.com/config)
compiler: powerpc64-linux-gcc (GCC) 14.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20241112/202411120859.2bRiON7C-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202411120859.2bRiON7C-lkp@intel.com/

All errors (new ones prefixed by >>):

   powerpc64-linux-ld: warning: discarding dynamic section .glink
   powerpc64-linux-ld: warning: discarding dynamic section .plt
   powerpc64-linux-ld: linkage table error against `xfs_mark_rtg_boundary'
   powerpc64-linux-ld: stubs don't match calculated size
   powerpc64-linux-ld: can not build stubs: bad value
   powerpc64-linux-ld: fs/xfs/xfs_aops.o: in function `xfs_end_bio':
>> fs/xfs/xfs_aops.c:200:(.text+0xc0): undefined reference to `xfs_mark_rtg_boundary'


vim +200 fs/xfs/xfs_aops.c

   184	
   185	void
   186	xfs_end_bio(
   187		struct bio		*bio)
   188	{
   189		struct iomap_ioend	*ioend = iomap_ioend_from_bio(bio);
   190		struct xfs_inode	*ip = XFS_I(ioend->io_inode);
   191		struct xfs_mount	*mp = ip->i_mount;
   192		unsigned long		flags;
   193	
   194		/*
   195		 * For Appends record the actually written block number and set the
   196		 * boundary flag if needed.
   197		 */
   198		if (bio_is_zone_append(bio)) {
   199			ioend->io_sector = bio->bi_iter.bi_sector;
 > 200			xfs_mark_rtg_boundary(ioend);
   201		}
   202	
   203		spin_lock_irqsave(&ip->i_ioend_lock, flags);
   204		if (list_empty(&ip->i_ioend_list))
   205			WARN_ON_ONCE(!queue_work(mp->m_unwritten_workqueue,
   206						 &ip->i_ioend_work));
   207		list_add_tail(&ioend->io_list, &ip->i_ioend_list);
   208		spin_unlock_irqrestore(&ip->i_ioend_lock, flags);
   209	}
   210	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
