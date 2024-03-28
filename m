Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.9])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 53C9B1804A
	for <oe-kbuild-all@lists.linux.dev>; Thu, 28 Mar 2024 01:31:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.9
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1711589511; cv=none; b=Elg7vrVIpK8FlxRL4pGjvrrDshaZzDDcPYqe6TaU+DLgSrlLSkawptCGlPgMtgw//E0dTeo8MPRH5XMaBAl1ThyZFj9yLnKNsf4pYyHfEXiyBPgFWTSav5mzvhCIf5Yn2KjP19BrWoD4S5KRXXbCc4NX73VfTuJRX0BJKbBe0HU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1711589511; c=relaxed/simple;
	bh=4WBwNSDLAD8PZNnI1Bhe9Fzeix21I0rWcpMaCs2vPD0=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=bJB+9dqpLHpjM45qrA5KxbyiznYyxMhljE3FrODsQbOCyYzuBx1109Lh7QKzkS7mVzm8lWeMrfhvwJ+V8Xq16Vz/zWxkAdDzumgCdE4RvLdKrR0b/90gky3tUVoN8nc0X5Bla2LOn+ozeaqwIfeFdb5OvA7TIuL/iqt1vFnXolw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=U+VVyfbe; arc=none smtp.client-ip=192.198.163.9
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="U+VVyfbe"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1711589510; x=1743125510;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=4WBwNSDLAD8PZNnI1Bhe9Fzeix21I0rWcpMaCs2vPD0=;
  b=U+VVyfbehLYv8f/6ZytofwWRn90FOfAeW3rH0AO3+c5wIJmmktQ/hpcY
   5hfRRnRFN+VBXbizHMSaPhSvmwtpNpFR249nhh9Wz6A/ZZ7geCN8l7uwg
   C/75hXDKubYry6VTbwwf10Ph6tcBCC/nDkiAlHh+KGTjkq2SgJDPwK/pe
   Waas0R/iTIpeeuxih3tx8wad+AJd+S3y6HGXKVIHeeShD1qV5T/mEcnbH
   1CrSoUG0+SLEnXsb1qcQI00EUM+U+HyTn14Cq2SA+zgNLH+KrYh4/oNkA
   23bOe9NflSALZvVWp8r8aBScEWFZbG86l3lalG+0zmgqvsc+fHXVhreHP
   Q==;
X-CSE-ConnectionGUID: DriGP1GcRmCBPnbB961E+A==
X-CSE-MsgGUID: oM1Z3zAKQHWsqa+Tc4+vaw==
X-IronPort-AV: E=McAfee;i="6600,9927,11026"; a="17453279"
X-IronPort-AV: E=Sophos;i="6.07,160,1708416000"; 
   d="scan'208";a="17453279"
Received: from orviesa010.jf.intel.com ([10.64.159.150])
  by fmvoesa103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 27 Mar 2024 18:31:49 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,160,1708416000"; 
   d="scan'208";a="16311831"
Received: from lkp-server01.sh.intel.com (HELO be39aa325d23) ([10.239.97.150])
  by orviesa010.jf.intel.com with ESMTP; 27 Mar 2024 18:31:47 -0700
Received: from kbuild by be39aa325d23 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1rpecK-0001fu-3C;
	Thu, 28 Mar 2024 01:31:44 +0000
Date: Thu, 28 Mar 2024 09:31:15 +0800
From: kernel test robot <lkp@intel.com>
To: "Darrick J. Wong" <darrick.wong@oracle.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [djwong-xfs:timestats-hoist 289/450] fs/xfs/xfs_rtalloc.c:983:11-18:
 WARNING opportunity for kmemdup
Message-ID: <202403280909.pFV8iHQT-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/djwong/xfs-linux.git timestats-hoist
head:   78ba84a4335927bab8c205732c55e2f6dd18a56f
commit: 4725eeedfb35a3de3e29db04766d6b5f74502d6d [289/450] xfs: check that the rtrmapbt maxlevels doesn't increase when growing fs
config: nios2-randconfig-r063-20240328 (https://download.01.org/0day-ci/archive/20240328/202403280909.pFV8iHQT-lkp@intel.com/config)
compiler: nios2-linux-gcc (GCC) 13.2.0

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202403280909.pFV8iHQT-lkp@intel.com/

cocci warnings: (new ones prefixed by >>)
>> fs/xfs/xfs_rtalloc.c:983:11-18: WARNING opportunity for kmemdup

vim +983 fs/xfs/xfs_rtalloc.c

   965	
   966	/*
   967	 * Check that changes to the realtime geometry won't affect the minimum
   968	 * log size, which would cause the fs to become unusable.
   969	 */
   970	int
   971	xfs_growfs_check_rtgeom(
   972		const struct xfs_mount	*mp,
   973		xfs_rfsblock_t		dblocks,
   974		xfs_rfsblock_t		rblocks,
   975		xfs_agblock_t		rextsize,
   976		xfs_rtblock_t		rextents,
   977		xfs_extlen_t		rbmblocks,
   978		uint8_t			rextslog)
   979	{
   980		struct xfs_mount	*fake_mp;
   981		int			min_logfsbs;
   982	
 > 983		fake_mp = kmalloc(sizeof(struct xfs_mount),
   984				GFP_KERNEL | __GFP_RETRY_MAYFAIL);
   985		if (!fake_mp)
   986			return -ENOMEM;
   987	
   988		/*
   989		 * Create a dummy xfs_mount with the new rt geometry, and compute the
   990		 * new minimum log size.  This ensures that the log is big enough to
   991		 * handle the larger transactions that we could start sending.
   992		 */
   993		memcpy(fake_mp, mp, sizeof(struct xfs_mount));
   994	
   995		fake_mp->m_sb.sb_dblocks = dblocks;
   996		fake_mp->m_sb.sb_rblocks = rblocks;
   997		fake_mp->m_sb.sb_rextents = rextents;
   998		fake_mp->m_sb.sb_rextsize = rextsize;
   999		fake_mp->m_sb.sb_rbmblocks = rbmblocks;
  1000		fake_mp->m_sb.sb_rextslog = rextslog;
  1001		if (rblocks > 0)
  1002			fake_mp->m_features |= XFS_FEAT_REALTIME;
  1003	
  1004		xfs_rtrmapbt_compute_maxlevels(fake_mp);
  1005	
  1006		xfs_trans_resv_calc(fake_mp, M_RES(fake_mp));
  1007		min_logfsbs = xfs_log_calc_minimum_size(fake_mp);
  1008		trace_xfs_growfs_check_rtgeom(mp, min_logfsbs);
  1009	
  1010		kfree(fake_mp);
  1011	
  1012		if (mp->m_sb.sb_logblocks < min_logfsbs)
  1013			return -ENOSPC;
  1014	
  1015		return 0;
  1016	}
  1017	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
