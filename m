Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 52F5F242D6C
	for <oe-kbuild-all@lists.linux.dev>; Fri, 30 Jan 2026 11:36:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769772968; cv=none; b=DBbsBrYY36w644/v7mzanqeKl2s48wgPowbS0V95GN2te/163cb+pvPc3kbVtoh0Q1Yh45xIJmtPTomDSRas7uxjecuHq9ptO/09QC11Bm0EIWYkw9NP5OKYVR9NnrCcxw7BTWny/BLCyYaV6eJMB6UQYj+cmlAjoMdpOXlLfCE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769772968; c=relaxed/simple;
	bh=l/hCV8hm/AOzuj3OTnnrzWwbXEEjrsevG3/YlXG0+LM=;
	h=Date:From:To:Cc:Subject:Message-ID; b=W3s9F5kTNJVEzC2RwSThqPU9jpV7M36ipHaJbsf2QVnJ8j7ANeuSHoCEcGSSsYB1OJEdN+dO4Qp+eSVy12o7Qlr9MIRzxHrHRT4ghxE7DEQ6ROqQvLYr5r4ER2oRbrbT4IxZuR6ARmYUYkIkI5nuU4zbkVjjGPVpwnwQuS9anAg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=i+iAnsVh; arc=none smtp.client-ip=198.175.65.18
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="i+iAnsVh"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1769772967; x=1801308967;
  h=date:from:to:cc:subject:message-id;
  bh=l/hCV8hm/AOzuj3OTnnrzWwbXEEjrsevG3/YlXG0+LM=;
  b=i+iAnsVhDlGBCcbo3fpT99o1795y5lWlRX5121chS9u7elqhMKKdT+60
   evrGGSkDMROevzdm3jCSGD6qKAkk41+MrCVCjHyOmyvm0psgEd5jGsLke
   zlt3kwyKHolVcOZY8qvP/OeIPYPlfAXJhONAC99/NuR7jx/0cJjLgLLRN
   c2UEZPkqPfxg2ps1OIVm4NOlPoAf7NdSo9ssXpNcyjFvcHYQz+6qhNOWM
   6W8s9PUXXpw3Fac5SolfmMjKpiUHRhSBOeolgD0CqLc2g8SM36sQenMNc
   fsNV8zZluW/RymTsuoIZSDFGxyiHbVf70jBtXnC6yPpql6Jp1BoPD5zNs
   Q==;
X-CSE-ConnectionGUID: qqQPC9prRbG70mHHO1mb0A==
X-CSE-MsgGUID: XHaSGOaAQ7KIwLXTRjBujg==
X-IronPort-AV: E=McAfee;i="6800,10657,11686"; a="71059653"
X-IronPort-AV: E=Sophos;i="6.21,262,1763452800"; 
   d="scan'208";a="71059653"
Received: from fmviesa007.fm.intel.com ([10.60.135.147])
  by orvoesa110.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 30 Jan 2026 03:36:07 -0800
X-CSE-ConnectionGUID: InUl+hbCQFK/NWmVq5dxUw==
X-CSE-MsgGUID: UMy7ONE3Sp+UyZlLg5uBkA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,262,1763452800"; 
   d="scan'208";a="208434603"
Received: from igk-lkp-server01.igk.intel.com (HELO afc5bfd7f602) ([10.211.93.152])
  by fmviesa007.fm.intel.com with ESMTP; 30 Jan 2026 03:36:05 -0800
Received: from kbuild by afc5bfd7f602 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vlmnD-000000002UT-3E2Y;
	Fri, 30 Jan 2026 11:36:03 +0000
Date: Fri, 30 Jan 2026 12:35:46 +0100
From: kernel test robot <lkp@intel.com>
To: Chao Yu <chao@kernel.org>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [chao:feature/lock_trace 1/5] fs/f2fs/checkpoint.c:115:1:
 warning: no return statement in function returning non-void
Message-ID: <202601301205.ZESpM5bv-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/chao/linux.git feature/lock_trace
head:   6c41a3391b747e9a5e8c6fe63003d2a8157d2610
commit: ea581585794290038e10ac4f1343bb1f5013cc60 [1/5] f2fs: fix lock priority inversion issue
config: x86_64-rhel-9.4 (https://download.01.org/0day-ci/archive/20260130/202601301205.ZESpM5bv-lkp@intel.com/config)
compiler: gcc-14 (Debian 14.2.0-19) 14.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260130/202601301205.ZESpM5bv-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202601301205.ZESpM5bv-lkp@intel.com/

All warnings (new ones prefixed by >>):

   fs/f2fs/checkpoint.c: In function 'need_uplift_priority':
   fs/f2fs/checkpoint.c:95:67: error: expected ')' before 'return'
      95 |         if (!(sem->sbi->adjust_lock_priority & BIT(sem->name - 1))
         |            ~                                                      ^
         |                                                                   )
      96 |                 return false;
         |                 ~~~~~~                                             
   fs/f2fs/checkpoint.c:115:1: error: expected expression before '}' token
     115 | }
         | ^
>> fs/f2fs/checkpoint.c:115:1: warning: no return statement in function returning non-void [-Wreturn-type]


vim +115 fs/f2fs/checkpoint.c

    92	
    93	static bool need_uplift_priority(struct f2fs_rwsem *sem, bool is_write)
    94	{
    95		if (!(sem->sbi->adjust_lock_priority & BIT(sem->name - 1))
    96			return false;
    97	
    98		switch (sem->name) {
    99		/*
   100		 * writer is checkpoint which has high priority, let's just uplift
   101		 * priority for reader
   102		 */
   103		case LOCK_NAME_CP_RWSEM:
   104		case LOCK_NAME_NODE_CHANGE:
   105		case LOCK_NAME_NODE_WRITE:
   106			return !is_write;
   107		case LOCK_NAME_GC_LOCK:
   108		case LOCK_NAME_CP_GLOBAL:
   109		case LOCK_NAME_IO_RWSEM:
   110			return true;
   111		default:
   112			f2fs_bug_on(sem->sbi, 1);
   113		}
   114		return false;
 > 115	}
   116	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
