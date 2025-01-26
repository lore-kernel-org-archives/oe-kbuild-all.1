Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BFA056FC5
	for <oe-kbuild-all@lists.linux.dev>; Sun, 26 Jan 2025 23:55:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1737935749; cv=none; b=r5JZWjMl9RpPR7vYPaXj1vQeLyhJijDyDoX/jm9gCa0dQC5vEKCSWuZIpJvCJjo7B0PniSzh8ZZgXM1j4IidKSddSt+6Phpj9VrsoEUwX9y7CHt59fEkEAmewFGfi/yRG+PmCgF6rdfXAiY+OZgXuSwL7t/FkA3iejF9EdoLnZY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1737935749; c=relaxed/simple;
	bh=rv2ZooDV0O/kkZMlHXtZYzrC27A16Zs8vutIEIZqMns=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=W6/i3VVSd5YahajIQfaPZACfv/Kyezkr/G1d3kNjS3Grs/CRuYJGh72mFXy3lCgzkA+T+6UOlXm6lGSXGxow3otx1fm9di6yBv6iamOTq+NJyO9vhxaCr0tCr0R9TscxROL9oNipsRMPWEQoA5JlJoYOPfYMFjt7oc6XPuHQXzE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=h1IQCzPL; arc=none smtp.client-ip=198.175.65.18
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="h1IQCzPL"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1737935748; x=1769471748;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=rv2ZooDV0O/kkZMlHXtZYzrC27A16Zs8vutIEIZqMns=;
  b=h1IQCzPL088rBAwH+ffx8ByGyULBt4uLo4dflOYwIE1ek0STSAPYnfYU
   quAViZP2NjpijDui9gCUgU6kgkXiSGtMU+UcD2jx8aW0HJsDjH2Y8uQfi
   BF85HJeIgM96mRzQxPgelO0fbeDgqGrX9DJcRdTmSGnMxfSnjyUo6E2rd
   zpZhjfxDiM5OQ5xAS3IouH1hxWm/Xypc+EhLLtMQNS9fJauP8V8eWE51F
   pKHfbBCmuyTq1SqobIC6JfvBmqxfmnlzS1AxEU+NrUpKFb927IHDI9EOX
   NgA69F+eeDBhiXTOp+YP9adOa6E7TY8XZar/HyitZXNC6Tvhr1p9clOag
   A==;
X-CSE-ConnectionGUID: BYuiarr5RumEhFVPt/8PIQ==
X-CSE-MsgGUID: kCAxHs1zQpWMHWlbyEEi7g==
X-IronPort-AV: E=McAfee;i="6700,10204,11314"; a="38494409"
X-IronPort-AV: E=Sophos;i="6.12,310,1728975600"; 
   d="scan'208";a="38494409"
Received: from orviesa004.jf.intel.com ([10.64.159.144])
  by orvoesa110.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 26 Jan 2025 15:55:47 -0800
X-CSE-ConnectionGUID: ++KbOtchSuSyFXqdmdh3AQ==
X-CSE-MsgGUID: cZCsd7ZJQq66at5azFmR4Q==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.13,237,1732608000"; 
   d="scan'208";a="113306967"
Received: from lkp-server01.sh.intel.com (HELO d63d4d77d921) ([10.239.97.150])
  by orviesa004.jf.intel.com with ESMTP; 26 Jan 2025 15:55:46 -0800
Received: from kbuild by d63d4d77d921 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1tcCTf-000gBX-38;
	Sun, 26 Jan 2025 23:55:43 +0000
Date: Mon, 27 Jan 2025 07:55:26 +0800
From: kernel test robot <lkp@intel.com>
To: Steev Klimaszewski <steev@kali.org>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [steev:lenovo-x13s-linux-6.13.y 83/83] kernel/sched/debug.c:555:78:
 error: 'sched_min_base_slice_fops' undeclared
Message-ID: <202501270727.gvQbJmoX-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://github.com/steev/linux lenovo-x13s-linux-6.13.y
head:   c358c65925524fe1dfe962d59966a6aa01b5fc9b
commit: c358c65925524fe1dfe962d59966a6aa01b5fc9b [83/83] linux6.13.y-bore5.9.6
config: arc-randconfig-002-20250127 (https://download.01.org/0day-ci/archive/20250127/202501270727.gvQbJmoX-lkp@intel.com/config)
compiler: arceb-elf-gcc (GCC) 13.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250127/202501270727.gvQbJmoX-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202501270727.gvQbJmoX-lkp@intel.com/

All error/warnings (new ones prefixed by >>):

   In file included from kernel/sched/build_utility.c:26:
   kernel/sched/debug.c: In function 'sched_init_debug':
>> kernel/sched/debug.c:555:78: error: 'sched_min_base_slice_fops' undeclared (first use in this function)
     555 |         debugfs_create_file("min_base_slice_ns", 0644, debugfs_sched, NULL, &sched_min_base_slice_fops);
         |                                                                              ^~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/debugfs.h:124:18: note: in definition of macro 'debugfs_create_file'
     124 |         _Generic(fops,                                                          \
         |                  ^~~~
   kernel/sched/debug.c:555:78: note: each undeclared identifier is reported only once for each function it appears in
     555 |         debugfs_create_file("min_base_slice_ns", 0644, debugfs_sched, NULL, &sched_min_base_slice_fops);
         |                                                                              ^~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/debugfs.h:124:18: note: in definition of macro 'debugfs_create_file'
     124 |         _Generic(fops,                                                          \
         |                  ^~~~
--
>> kernel/sched/fair.c:87:50: error: 'CONFIG_MIN_BASE_SLICE_NS' undeclared here (not in a function)
      87 | unsigned int sysctl_sched_min_base_slice       = CONFIG_MIN_BASE_SLICE_NS;
         |                                                  ^~~~~~~~~~~~~~~~~~~~~~~~
>> kernel/sched/fair.c:211:6: warning: no previous prototype for 'sched_update_min_base_slice' [-Wmissing-prototypes]
     211 | void sched_update_min_base_slice(void) { update_sysctl(); }
         |      ^~~~~~~~~~~~~~~~~~~~~~~~~~~


vim +/sched_min_base_slice_fops +555 kernel/sched/debug.c

   553	
   554	#ifdef CONFIG_SCHED_BORE
 > 555		debugfs_create_file("min_base_slice_ns", 0644, debugfs_sched, NULL, &sched_min_base_slice_fops);
   556		debugfs_create_u32("base_slice_ns", 0444, debugfs_sched, &sysctl_sched_base_slice);
   557	#else // !CONFIG_SCHED_BORE
   558		debugfs_create_u32("base_slice_ns", 0644, debugfs_sched, &sysctl_sched_base_slice);
   559	#endif // CONFIG_SCHED_BORE
   560	
   561		debugfs_create_u32("latency_warn_ms", 0644, debugfs_sched, &sysctl_resched_latency_warn_ms);
   562		debugfs_create_u32("latency_warn_once", 0644, debugfs_sched, &sysctl_resched_latency_warn_once);
   563	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
