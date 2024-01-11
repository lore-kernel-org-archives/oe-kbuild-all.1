Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.88])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7BD6D101FB
	for <oe-kbuild-all@lists.linux.dev>; Thu, 11 Jan 2024 04:10:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="MjcDcEWH"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1704946244; x=1736482244;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=1LNSGsE0oMExaGYRFr9vvbaH/lVNQiDQcr2sBdjNWSY=;
  b=MjcDcEWHzblVEqaA2IZBfeXLD1WitOH+R8Aaggfyif7aklpnY4nEOTjn
   vLvwt9TaVlvLq3bPPnwdxhRDWnrEYE+f7lkTdbwORFE3CD3zIY/adWK9H
   DcQf3tFWUJmQVAr1lGxrMfApBbx5Vyr6F6dSIytwabtF0tq6VelwsTOAg
   PdqxMyCWfPszh7WRZIsTxoH2DhJRNsuRQgMicvEbdaYYDKbFITa3NikC2
   LQ4SB3pKBvAhQmUrzWBdfYu8NCJ8CkJAV3xEKuk6s7VmatR0Njf1U3HaU
   MFqaaH5PPtj4c0yqkW6qmgIpFG5ZjCcMxFYz8iPr+WvcOGjHTQM1OAXyZ
   w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10949"; a="429916094"
X-IronPort-AV: E=Sophos;i="6.04,185,1695711600"; 
   d="scan'208";a="429916094"
Received: from fmsmga004.fm.intel.com ([10.253.24.48])
  by fmsmga101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 10 Jan 2024 20:10:43 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10949"; a="852822475"
X-IronPort-AV: E=Sophos;i="6.04,185,1695711600"; 
   d="scan'208";a="852822475"
Received: from lkp-server02.sh.intel.com (HELO b07ab15da5fe) ([10.239.97.151])
  by fmsmga004.fm.intel.com with ESMTP; 10 Jan 2024 20:10:43 -0800
Received: from kbuild by b07ab15da5fe with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1rNmOu-0007oQ-19;
	Thu, 11 Jan 2024 04:10:40 +0000
Date: Thu, 11 Jan 2024 12:09:40 +0800
From: kernel test robot <lkp@intel.com>
To: Christoph Hellwig <hch@lst.de>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [hch-xfs:xfs-zoned 68/69] fs/xfs/xfs_ioctl.c:2102: undefined
 reference to `xfs_zoned_reserved_extents'
Message-ID: <202401111216.eUtRj8W7-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   git://git.infradead.org/users/hch/xfs xfs-zoned
head:   6cbaa154b781048e31781d9982968f2949ee7059
commit: 73364c28e1ed20ded818eca16763e4cd31e7c8ee [68/69] xfs: fix reserved GC blocks handling
config: i386-randconfig-002-20240111 (https://download.01.org/0day-ci/archive/20240111/202401111216.eUtRj8W7-lkp@intel.com/config)
compiler: gcc-7 (Ubuntu 7.5.0-6ubuntu2) 7.5.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240111/202401111216.eUtRj8W7-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202401111216.eUtRj8W7-lkp@intel.com/

All errors (new ones prefixed by >>):

   ld: fs/xfs/xfs_ioctl.o: in function `xfs_ioctl_fs_counts':
>> fs/xfs/xfs_ioctl.c:2102: undefined reference to `xfs_zoned_reserved_extents'


vim +2102 fs/xfs/xfs_ioctl.c

  2087	
  2088	static int
  2089	xfs_ioctl_fs_counts(
  2090		struct xfs_mount	*mp,
  2091		struct xfs_fsop_counts	*uarg)
  2092	{
  2093		struct xfs_fsop_counts	out = {
  2094			.allocino = percpu_counter_read_positive(&mp->m_icount),
  2095			.freeino = percpu_counter_read_positive(&mp->m_ifree),
  2096			.freedata = xfs_estimate_freecounter(mp, FREE_BLOCKS) -
  2097					xfs_freecounter_unavailable(mp, FREE_BLOCKS),
  2098			.freertx = xfs_estimate_freecounter(mp, FREE_RTEXTENTS),
  2099		};
  2100	
  2101		if (xfs_has_zoned(mp))
> 2102			out.freertx -= xfs_zoned_reserved_extents(mp);
  2103	
  2104		if (copy_to_user(uarg, &out, sizeof(out)))
  2105			return -EFAULT;
  2106		return 0;
  2107	}
  2108	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
