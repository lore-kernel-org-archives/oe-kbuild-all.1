Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.13])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6A5C632D7FC
	for <oe-kbuild-all@lists.linux.dev>; Wed, 19 Nov 2025 10:05:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.13
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1763546732; cv=none; b=Cq4FFphn0WkUc0dC+rsEvlzuQuhwdwxycZvlW6V8ITijR0cQoB+FpsjpOI36Rz8zOpoCCOe1rhqDurqVW9yz9CteKb43c2iyk5GHUufXH4Gw6pnijZR5pdlEo+PwRaNkMQuTGe0rk/7L7An+SJMuwcH4NIMlx2eHQsl6Gpy2MGQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1763546732; c=relaxed/simple;
	bh=9TaPoWn/jWhLc3NzoJYhTPVWFcWtQ0mcnziLOHKb8Qo=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=uZhqVdDqFsgWdjQIXA6TjpAMy/DuuzKIur0TSi0vXatSgOZC3mM1Oz/qUeV8DZmOVD9l4w/Z/fRDMF3q3t/246KRyyv5kXvoxujrGdHih4Bj3lbupkRoWW4H+FBzUZFc/Jt+xLxERM5crq4tx9tjWUE3uznN4P9eYI2QjOmlCvk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=LsIsOTSb; arc=none smtp.client-ip=198.175.65.13
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="LsIsOTSb"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1763546730; x=1795082730;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=9TaPoWn/jWhLc3NzoJYhTPVWFcWtQ0mcnziLOHKb8Qo=;
  b=LsIsOTSbtU7nmzDee7HNxysgVz677QxNqnuTbfAzQgOlx4GMLlG728Sx
   JEH22TjUg9HLJiwFOOkLLLRCwebWU7nmmQTvQQ3ygG3LS8oPBljLQ8lIs
   hzkVMmGo+1O30kjSV8tBteFq1RtlWzqGHzer10grl7JMD65kcucTBFkUS
   FAFvuy0f81wMdiWZ6gWl0s1er8aeKiELdvy2vrpItpw17YiH63+35hWTH
   RSNpRKaRVprry9ywjx74jycPUvrAEVit0VUjn7WGeIRTMDYROy4iyCq/7
   E50+NWTNKzy3oWNtyBPXsW3Qj30d4kFzhD5IKjS/m1nfhP9EhoychP0Bv
   Q==;
X-CSE-ConnectionGUID: pqytk/AsQeqLT4V1XLThEw==
X-CSE-MsgGUID: 2s7c82wbRkaqxhGxgdhubQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11617"; a="76688355"
X-IronPort-AV: E=Sophos;i="6.19,315,1754982000"; 
   d="scan'208";a="76688355"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
  by orvoesa105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 19 Nov 2025 02:05:30 -0800
X-CSE-ConnectionGUID: KA2kk0ieRoyCQ5VIkRSChA==
X-CSE-MsgGUID: AqYQGwUGRr+avhSYNm5nbg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.19,315,1754982000"; 
   d="scan'208";a="221644185"
Received: from lkp-server01.sh.intel.com (HELO adf6d29aa8d9) ([10.239.97.150])
  by orviesa002.jf.intel.com with ESMTP; 19 Nov 2025 02:05:29 -0800
Received: from kbuild by adf6d29aa8d9 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1vLf42-0002i3-1n;
	Wed, 19 Nov 2025 10:05:26 +0000
Date: Wed, 19 Nov 2025 18:04:45 +0800
From: kernel test robot <lkp@intel.com>
To: kernel@openeuler.org, Zicheng Qu <quzicheng@huawei.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [openeuler:OLK-6.6 3278/3278] include/linux/xsched.h:265:29: error:
 field has incomplete type 'struct cgroup_subsys_state'
Message-ID: <202511191801.j34oMzNw-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://gitee.com/openeuler/kernel.git OLK-6.6
head:   4552257bd9515ad6f78bd3691c7379beb42dc3cd
commit: 43bbefc53356009d3603faa2c6e6a2858f724e4d [3278/3278] xsched: Add XCU control group implementation and its backend in xsched CFS
config: loongarch-allnoconfig (https://download.01.org/0day-ci/archive/20251119/202511191801.j34oMzNw-lkp@intel.com/config)
compiler: clang version 22.0.0git (https://github.com/llvm/llvm-project 0bba1e76581bad04e7d7f09f5115ae5e2989e0d9)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20251119/202511191801.j34oMzNw-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202511191801.j34oMzNw-lkp@intel.com/

All errors (new ones prefixed by >>):

   In file included from kernel/xsched/vstream.c:23:
>> include/linux/xsched.h:265:29: error: field has incomplete type 'struct cgroup_subsys_state'
     265 |         struct cgroup_subsys_state css;
         |                                    ^
   include/linux/kthread.h:219:8: note: forward declaration of 'struct cgroup_subsys_state'
     219 | struct cgroup_subsys_state;
         |        ^
   1 error generated.


vim +265 include/linux/xsched.h

   261	
   262	/* Xsched scheduling control group */
   263	struct xsched_group {
   264		/* Cgroups controller structure */
 > 265		struct cgroup_subsys_state css;
   266	
   267		/* Control group settings: */
   268		int sched_class;
   269		int prio;
   270	
   271		/* Bandwidth setting: shares value set by user */
   272		u64 shares_cfg;
   273		u64 shares_cfg_red;
   274		u32 weight;
   275		u64 children_shares_sum;
   276	
   277		struct xsched_group_xcu_priv perxcu_priv[XSCHED_NR_CUS];
   278	
   279		/* Groups hierarchcy */
   280		struct xsched_group *parent;
   281		struct list_head children_groups;
   282		struct list_head group_node;
   283	
   284		spinlock_t lock;
   285	
   286		/* for XSE to move in perxcu */
   287		struct list_head members;
   288	};
   289	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
