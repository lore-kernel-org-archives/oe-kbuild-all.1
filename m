Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.13])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4212328DCB
	for <oe-kbuild-all@lists.linux.dev>; Sat, 10 Aug 2024 10:52:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.13
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1723287169; cv=none; b=r5MuaOf1+ACaT75imEOWQ2wWKMhSoouoJDe8p+Xv4cdsApcRGjNz+OBV6zrJRv4F/5d/Er+tuAtPmvJV31UWtqpXymRN+98f8oJTcNlGSiEiH2p5XvVzdM4u52CBVQFWRvZaC26b6Htw/Y1PVyjPsJm/abh8wt2CGMDd6dAUOc4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1723287169; c=relaxed/simple;
	bh=ZQouxwWY1Me5rGP4bDZE8Yzrye1Yypr5i+gwie2g7gc=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=OvQ+u34QuZpa88ZnDv2r0Lu6a7QyMMlvgdJhsGM6UCjiZi3ReIkbboITVLgDhsM2tK+kULuylgjCa07NsKcpe8PBTS/84IPLX2+7PezyyqLJ6Hgs4v4wFLRItCi2COE/tNxAlSWK5lxcnl74NtNpc7w0N6kvRmM3aUS4iCdsoiM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=RmO7K4Xe; arc=none smtp.client-ip=198.175.65.13
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="RmO7K4Xe"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1723287168; x=1754823168;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=ZQouxwWY1Me5rGP4bDZE8Yzrye1Yypr5i+gwie2g7gc=;
  b=RmO7K4XeZlaa5v6OpxFamv6V3ZSlCOnGwBjDndbLOsFlzvMSJr/oiSYV
   ijPvXuzoAWxn3x4LPU6JpyN5wRa2RRZF1IKzjj7Gyy4jJn+1b1qBm3/EO
   jgjHOsPbpYJn/f9isk9SuGuHEfeGdnMyvTSUyTIbNO4FO4G0R2AORyCLd
   4203nBECIND23SVCPN5OxA32w3dxTr4Ggjzz07fpqEuPXgZHEMyT/u7db
   fuzN/xcw7ODLkBhh2Uz7HR+w3T4SvGv3zxwL7t/sCjGcSnAVszmC3lxsR
   8eEo6QEvdw2c5OzARoRpryBbMw0zyV2lbfxDzwojfAGKx1bzidE7QIuxQ
   Q==;
X-CSE-ConnectionGUID: yegavUQ3RTehjA9cIi0qhw==
X-CSE-MsgGUID: S6nJaRaCSYy1tdKCW+Kzag==
X-IronPort-AV: E=McAfee;i="6700,10204,11159"; a="32604344"
X-IronPort-AV: E=Sophos;i="6.09,279,1716274800"; 
   d="scan'208";a="32604344"
Received: from fmviesa008.fm.intel.com ([10.60.135.148])
  by orvoesa105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 10 Aug 2024 03:52:48 -0700
X-CSE-ConnectionGUID: hVY1RC8qR6yODL2W/L1XBQ==
X-CSE-MsgGUID: 2iW+BOB0QaeZlTCw1KNyRg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.09,279,1716274800"; 
   d="scan'208";a="57771502"
Received: from unknown (HELO b6bf6c95bbab) ([10.239.97.151])
  by fmviesa008.fm.intel.com with ESMTP; 10 Aug 2024 03:52:46 -0700
Received: from kbuild by b6bf6c95bbab with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1scjiE-0009rQ-37;
	Sat, 10 Aug 2024 10:52:43 +0000
Date: Sat, 10 Aug 2024 18:52:18 +0800
From: kernel test robot <lkp@intel.com>
To: Christoph Hellwig <hch@lst.de>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [hch-xfs:xfs-per-rtg-bitmap 5/5] fs/xfs/xfs_rtalloc.c:1015:2-8:
 WARNING: NULL check before some freeing functions is not needed.
Message-ID: <202408101851.inX7AvrE-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   git://git.infradead.org/users/hch/xfs xfs-per-rtg-bitmap
head:   a20a115ce4258bcd890eddb67ff3b15c7a4e9157
commit: a20a115ce4258bcd890eddb67ff3b15c7a4e9157 [5/5] xfs: use per-RTG bitmaps and summaries
config: m68k-randconfig-r052-20240810 (https://download.01.org/0day-ci/archive/20240810/202408101851.inX7AvrE-lkp@intel.com/config)
compiler: m68k-linux-gcc (GCC) 14.1.0

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202408101851.inX7AvrE-lkp@intel.com/

cocci warnings: (new ones prefixed by >>)
>> fs/xfs/xfs_rtalloc.c:1015:2-8: WARNING: NULL check before some freeing functions is not needed.

vim +1015 fs/xfs/xfs_rtalloc.c

   985	
   986	static int
   987	xfs_growfs_rtg(
   988		struct xfs_rtgroup	*rtg,
   989		xfs_rfsblock_t		nrblocks,
   990		xfs_agblock_t		rextsize)
   991	{
   992		uint8_t			*old_rsum_cache = NULL;
   993		xfs_extlen_t		bmblocks;
   994		xfs_fileoff_t		bmbno;
   995		int			error;
   996	
   997		error = xfs_growfs_rt_alloc_blocks(rtg, nrblocks, rextsize, &bmblocks);
   998		if (error)
   999			return error;
  1000	
  1001		if (bmblocks != rtg->rtg_mount->m_sb.sb_rbmblocks) {
  1002			old_rsum_cache = rtg->rtg_rsum_cache;
  1003			error = xfs_alloc_rsum_cache(rtg, bmblocks);
  1004			if (error)
  1005				return error;
  1006		}
  1007	
  1008		for (bmbno = xfs_last_rt_bmblock(rtg); bmbno < bmblocks; bmbno++) {
  1009			error = xfs_growfs_rt_bmblock(rtg, nrblocks, rextsize, bmbno);
  1010			if (error)
  1011				goto out_error;
  1012		}
  1013	
  1014		if (old_rsum_cache)
> 1015			kvfree(old_rsum_cache);
  1016		return 0;
  1017	
  1018	out_error:
  1019		/*
  1020		 * Reset rtg_extents to the old value if adding more blocks failed.
  1021		 */
  1022		rtg->rtg_extents = xfs_rtgroup_extents(rtg->rtg_mount, rtg->rtg_rgno);
  1023		if (old_rsum_cache) {
  1024			kvfree(rtg->rtg_rsum_cache);
  1025			rtg->rtg_rsum_cache = old_rsum_cache;
  1026		}
  1027		return error;
  1028	}
  1029	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
