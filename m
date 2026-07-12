Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 19E6022083
	for <oe-kbuild-all@lists.linux.dev>; Sun, 12 Jul 2026 00:23:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.19
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783815816; cv=none; b=GaP6MjhwCoaC2eWC/B5jIiId50p1nzFVO0UzpBXTc9cyB0DWCgqtagtjMxfK77CB1NtiTLe6t8nAvZMl3FmE0JXxvT1laRnIbQo3+NmuwEeTcpNKZNkwLuU2++rLq/x0V+qUZRqN3RoD0maYz9aXbisdrFWHaR8xAHEw59yIeYg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783815816; c=relaxed/simple;
	bh=DCTXE2jztK6ZRDOXhobt1G/sOdeApYz6pBuTjaExloQ=;
	h=Date:From:To:Cc:Subject:Message-ID; b=W4qYXEZrhzJJ89y6AHHbVpOyv3T1BhE6ZwwPCW39h5052URe7sS7E0vtYluVFwB1cdmCWLofgDHiH2PTI7pkAqoE6mnEwKTcUScVH+Kj+CA2MR5fJKJZxIEBFbwcnuy32YFHZIMk61sGMQ7ktjr0EVepFyYx2fo4gqtkzc5Ql3k=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=DL52zMGs; arc=none smtp.client-ip=192.198.163.19
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="DL52zMGs"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1783815813; x=1815351813;
  h=date:from:to:cc:subject:message-id;
  bh=DCTXE2jztK6ZRDOXhobt1G/sOdeApYz6pBuTjaExloQ=;
  b=DL52zMGsELRFcZcH9U6RvbNdXpS4pMweQoDCxgnhfELXQWsk0i9o4cq1
   /yE74Zh0UGoErvMZkNalcuZJMAJLK8onSmM0vUWDvxlvm9YTOnJl4uKuo
   B9RO07MeCKs2unaBE0AaEL5URbxU7QEJL5K4HsDW79f3Je3YCr2CtA4LG
   rIi4HAyFBrDC+rDcGC129ghMTFMXCfaBur1R99e0H5oTuPrDsHMlf1zOq
   TSwPymrQA80XSTnHCJFIxfM0O1una3rXCerrohvPXFyV1Pu5mtSLevEEo
   8+uaotwmnn3KA9mKGCe093jLR+wED+UXmK1k/0fK6ldskLcERurfqQ9cw
   Q==;
X-CSE-ConnectionGUID: JNM4+ffMSeCYAjXAnOgNqQ==
X-CSE-MsgGUID: MUBL+hUBSDOWQbZQRHPhLw==
X-IronPort-AV: E=McAfee;i="6800,10657,11841"; a="83455882"
X-IronPort-AV: E=Sophos;i="6.25,154,1779174000"; 
   d="scan'208";a="83455882"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
  by fmvoesa113.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 11 Jul 2026 17:23:32 -0700
X-CSE-ConnectionGUID: FlybZLs1SFaIpcP73kXsCQ==
X-CSE-MsgGUID: 6M1KmcIoQj6PSJcoMpVXqw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,154,1779174000"; 
   d="scan'208";a="293408467"
Received: from igk-lkp-server01.igk.intel.com (HELO e5a8ed462067) ([10.211.93.152])
  by orviesa001.jf.intel.com with ESMTP; 11 Jul 2026 17:23:31 -0700
Received: from kbuild by e5a8ed462067 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1wihyi-000000003T3-2faC;
	Sun, 12 Jul 2026 00:23:28 +0000
Date: Sun, 12 Jul 2026 02:23:08 +0200
From: kernel test robot <lkp@intel.com>
To: Thomas Gleixner <tglx@kernel.org>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [tglx-devel:timers/cleanup 58/59]
 arch/x86/kernel/apic/hw_nmi.c:30:1: warning: control reaches end of non-void
 function
Message-ID: <202607120242.GGYE86Th-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/tglx/devel.git timers/cleanup
head:   0ad363c8e014568032d53fe2c7ab288de68373f4
commit: 27019f00127af90a16c3b8c54e976cdc8a711b0a [58/59] x86: Select ARCH_HAS_RANDOM_ENTROPY
config: x86_64-rhel-9.4 (https://download.01.org/0day-ci/archive/20260712/202607120242.GGYE86Th-lkp@intel.com/config)
compiler: gcc-14 (Debian 14.2.0-19) 14.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260712/202607120242.GGYE86Th-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202607120242.GGYE86Th-lkp@intel.com/

All warnings (new ones prefixed by >>):

   arch/x86/kernel/apic/hw_nmi.c: In function 'hw_nmi_get_sample_period':
   arch/x86/kernel/apic/hw_nmi.c:29:22: error: 'cpu_khz' undeclared (first use in this function)
      29 |         return (u64)(cpu_khz) * 1000 * watchdog_thresh;
         |                      ^~~~~~~
   arch/x86/kernel/apic/hw_nmi.c:29:22: note: each undeclared identifier is reported only once for each function it appears in
>> arch/x86/kernel/apic/hw_nmi.c:30:1: warning: control reaches end of non-void function [-Wreturn-type]
      30 | }
         | ^


vim +30 arch/x86/kernel/apic/hw_nmi.c

28b8235238fa39 Dave Hansen          2023-08-09  25  
05a4a95279311c Nicholas Piggin      2017-07-12  26  #ifdef CONFIG_HARDLOCKUP_DETECTOR_PERF
4eec42f3920430 Mandeep Singh Baines 2011-05-22  27  u64 hw_nmi_get_sample_period(int watchdog_thresh)
504d7cf10ee42b Don Zickus           2010-02-12  28  {
4eec42f3920430 Mandeep Singh Baines 2011-05-22  29  	return (u64)(cpu_khz) * 1000 * watchdog_thresh;
504d7cf10ee42b Don Zickus           2010-02-12 @30  }
5f2b0ba4d94b3a Don Zickus           2010-11-12  31  #endif
504d7cf10ee42b Don Zickus           2010-02-12  32  

:::::: The code at line 30 was first introduced by commit
:::::: 504d7cf10ee42bb76b9556859f23d4121dee0a77 nmi_watchdog: Compile and portability fixes

:::::: TO: Don Zickus <dzickus@redhat.com>
:::::: CC: Ingo Molnar <mingo@elte.hu>

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
