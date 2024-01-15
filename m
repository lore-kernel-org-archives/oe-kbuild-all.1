Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.11])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A50D31FAE
	for <oe-kbuild-all@lists.linux.dev>; Mon, 15 Jan 2024 03:20:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="Curg8M7c"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1705288833; x=1736824833;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=ivsuH3IajAsKYE98xq7oEDhRK4j/kaaiRahz9dpLGb0=;
  b=Curg8M7cMnCHmL5FGWIligBNtBXmiq6fTqO6XSJgBWIcHD2yjxuqouNf
   N/2UjSoyYYbVAU511CnxH5i/mUENsMwdnX7h2yjSWzsLbJZZ88byu10HP
   DsEtOjWW1pXKS7qtRXI/Ong7VscIs04H7rE7pc0KdUjBdiJdxURXyQrZH
   RvzVCiQAoLGhehp/2cCrYZmbrGkJyynJY8q7yRPf/ORGOHZnCLaAacprM
   yiZ9QOly/aH3SVJCqpacpIfCneRVJCCtAiUEG7/jFxToAM0yLZKtTLqRB
   CxIh3Sc6tPS+WWsMPMD6zs/gFR4XY78LYQkBQT8ww7KS9WZua+lvcQLvj
   Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10953"; a="6239722"
X-IronPort-AV: E=Sophos;i="6.04,195,1695711600"; 
   d="scan'208";a="6239722"
Received: from fmviesa002.fm.intel.com ([10.60.135.142])
  by fmvoesa105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 14 Jan 2024 19:20:30 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.04,195,1695711600"; 
   d="scan'208";a="18021452"
Received: from lkp-server02.sh.intel.com (HELO b07ab15da5fe) ([10.239.97.151])
  by fmviesa002.fm.intel.com with ESMTP; 14 Jan 2024 19:20:30 -0800
Received: from kbuild by b07ab15da5fe with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1rPDUU-000C35-2K;
	Mon, 15 Jan 2024 03:19:44 +0000
Date: Mon, 15 Jan 2024 11:14:34 +0800
From: kernel test robot <lkp@intel.com>
To: kernel@openeuler.org
Cc: oe-kbuild-all@lists.linux.dev
Subject: [openeuler:OLK-5.10 26173/30000] fs/xfs/libxfs/xfs_alloc.c:91:1:
 warning: no previous prototype for function 'xfs_ag_fixup_aside'
Message-ID: <202401151109.dcoo1KEi-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://gitee.com/openeuler/kernel.git OLK-5.10
head:   6d9d4951bf741189c66627715d5ae8a8cf1df85f
commit: 12a5c9f8f69c682f3aaf799a18f4a3631cc9bfbc [26173/30000] xfs: fix xfs shutdown since we reserve more blocks in agfl fixup
config: x86_64-buildonly-randconfig-003-20240114 (https://download.01.org/0day-ci/archive/20240115/202401151109.dcoo1KEi-lkp@intel.com/config)
compiler: ClangBuiltLinux clang version 17.0.6 (https://github.com/llvm/llvm-project 6009708b4367171ccdbf4b5905cb6a803753fe18)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240115/202401151109.dcoo1KEi-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202401151109.dcoo1KEi-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> fs/xfs/libxfs/xfs_alloc.c:91:1: warning: no previous prototype for function 'xfs_ag_fixup_aside' [-Wmissing-prototypes]
      91 | xfs_ag_fixup_aside(
         | ^
   fs/xfs/libxfs/xfs_alloc.c:90:1: note: declare 'static' if the function is not intended to be used outside of this translation unit
      90 | xfs_extlen_t
         | ^
         | static 
   1 warning generated.


vim +/xfs_ag_fixup_aside +91 fs/xfs/libxfs/xfs_alloc.c

    83	
    84	/*
    85	 * Twice fixup for the same ag may happen within exact one tp, and the consume
    86	 * of agfl after first fixup may trigger second fixup's failure, then xfs will
    87	 * shutdown. To avoid that, we reserve blocks which can satisfy the second
    88	 * fixup.
    89	 */
    90	xfs_extlen_t
  > 91	xfs_ag_fixup_aside(
    92		struct xfs_mount	*mp)
    93	{
    94		xfs_extlen_t ret;
    95	
    96		ret = 2 * mp->m_ag_maxlevels;
    97		if (xfs_has_rmapbt(mp))
    98			ret += mp->m_rmap_maxlevels;
    99	
   100		return ret;
   101	}
   102	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
