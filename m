Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.15])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E42DA22094
	for <oe-kbuild-all@lists.linux.dev>; Fri, 16 Aug 2024 21:52:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.15
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1723845139; cv=none; b=YqUzJBk4YuE7qpsaM/bDW1Tk6MGmlWF1AFRWU4SQ8rmyKmZQt7x5MyLJ8TlCCkpvWnlCdXlHfMNtIBEyRQEAI9b1iIL0LEAEjCaWL4E8pu2vkaFl21wV4lyrHZnDEXA/nxZi3qXKB46HzgJOxB60tFULvoACcYPtCrxZMery12w=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1723845139; c=relaxed/simple;
	bh=DHPSzGbLNkwSfCwriBRqwKHbQilNWyG8oUDHkT2tJIg=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=dOl8sBl+AQiM6btU1zjY84RO5Oj/p69q0sglKKKyR886WSkjA0QikWokE5uCvKKynKuvp/EVaiQMhYLrtnjWw06RSoAbxxdSlpDpy/tf1fc/ZfC9GarjEEfd5CZAhhTGyccRmd4QGHI9eJ7mH1CZ0NoxugGADL11fp1/cpFwBvw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=g2vkXH/3; arc=none smtp.client-ip=192.198.163.15
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="g2vkXH/3"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1723845138; x=1755381138;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=DHPSzGbLNkwSfCwriBRqwKHbQilNWyG8oUDHkT2tJIg=;
  b=g2vkXH/3S6w5ecNjUsKlZaqwMHzDtIa7G7sd/osJNN2uYD2j53J/h0Ot
   prCHJXP4pln+H/PsLGgUKmuQivGtR/wDwGXUYrWTXnZQdGCzDb8Ps5Pt8
   aHzzM50btDaVMYIbS3OQigxebW42UJoV0H914VKmAqNHuBRp5zN+d1f4q
   zwHlHo4MhcrVnI7hwKP2rO7TjJI7BUm2kcxrsKw04UM5wLnA8YdESfgX8
   KqjNHc8RrglMGqwc0QSi+naOOuQfTcBjpFRcA6igoo2SreXIGqkMxlPIx
   yF8Go7/KqCNV1BnLzCI0ySFpywSKEpddRyRWA1eLBbqPczkn0Vu7sZYhH
   A==;
X-CSE-ConnectionGUID: u49H5PU4SDGKYnx3FS/lBA==
X-CSE-MsgGUID: rQd49Cj2TEytQ3agKjSD7g==
X-IronPort-AV: E=McAfee;i="6700,10204,11166"; a="22313140"
X-IronPort-AV: E=Sophos;i="6.10,152,1719903600"; 
   d="scan'208";a="22313140"
Received: from orviesa008.jf.intel.com ([10.64.159.148])
  by fmvoesa109.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 16 Aug 2024 14:52:17 -0700
X-CSE-ConnectionGUID: AWES1ef7T3utMJVxJKDWiQ==
X-CSE-MsgGUID: pmm/JlwZRjivWrkGPGow0A==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.10,152,1719903600"; 
   d="scan'208";a="60568421"
Received: from lkp-server01.sh.intel.com (HELO 9a732dc145d3) ([10.239.97.150])
  by orviesa008.jf.intel.com with ESMTP; 16 Aug 2024 14:52:16 -0700
Received: from kbuild by 9a732dc145d3 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1sf4rl-0006xC-35;
	Fri, 16 Aug 2024 21:52:13 +0000
Date: Sat, 17 Aug 2024 05:52:01 +0800
From: kernel test robot <lkp@intel.com>
To: "Darrick J. Wong" <darrick.wong@oracle.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [djwong-xfs:hch-wtf 75/253] fs/xfs/scrub/bmap.c:320:10: error: call
 to undeclared function 'xchk_rtgroup_init_existing'; ISO C99 and later do
 not support implicit function declarations
Message-ID: <202408170502.gnkAwijG-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/djwong/xfs-linux.git hch-wtf
head:   69e65efda7ca3f0b4a7fbf15a350611261769077
commit: dfce4a26676fa28f5f442069a95aba44fe9c1268 [75/253] xfs: move RT bitmap and summary information to the rtgroup
config: x86_64-buildonly-randconfig-006-20240817 (https://download.01.org/0day-ci/archive/20240817/202408170502.gnkAwijG-lkp@intel.com/config)
compiler: clang version 18.1.5 (https://github.com/llvm/llvm-project 617a15a9eac96088ae5e9134248d8236e34b91b1)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240817/202408170502.gnkAwijG-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202408170502.gnkAwijG-lkp@intel.com/

All errors (new ones prefixed by >>):

>> fs/xfs/scrub/bmap.c:320:10: error: call to undeclared function 'xchk_rtgroup_init_existing'; ISO C99 and later do not support implicit function declarations [-Wimplicit-function-declaration]
     320 |         error = xchk_rtgroup_init_existing(info->sc,
         |                 ^
   fs/xfs/scrub/bmap.c:320:10: note: did you mean 'xchk_ag_init_existing'?
   fs/xfs/scrub/common.h:113:1: note: 'xchk_ag_init_existing' declared here
     113 | xchk_ag_init_existing(
         | ^
   1 error generated.


vim +/xchk_rtgroup_init_existing +320 fs/xfs/scrub/bmap.c

   310	
   311	/* Cross-reference a single rtdev extent record. */
   312	STATIC void
   313	xchk_bmap_rt_iextent_xref(
   314		struct xfs_inode	*ip,
   315		struct xchk_bmap_info	*info,
   316		struct xfs_bmbt_irec	*irec)
   317	{
   318		int			error;
   319	
 > 320		error = xchk_rtgroup_init_existing(info->sc,
   321				xfs_rtb_to_rgno(ip->i_mount, irec->br_startblock),
   322				&info->sc->sr);
   323		if (!xchk_fblock_process_error(info->sc, info->whichfork,
   324				irec->br_startoff, &error))
   325			return;
   326	
   327		xchk_rtgroup_lock(&info->sc->sr, XCHK_RTGLOCK_ALL);
   328		xchk_xref_is_used_rt_space(info->sc, irec->br_startblock,
   329				irec->br_blockcount);
   330	
   331		xchk_rtgroup_free(info->sc, &info->sc->sr);
   332	}
   333	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
