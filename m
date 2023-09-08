Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.100])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2805FEA0
	for <oe-kbuild-all@lists.linux.dev>; Fri,  8 Sep 2023 01:51:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1694137908; x=1725673908;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=NbEA9M4viQZ/Hqi157/bRYVWdiBjCqELJ/XrLttrIJU=;
  b=FEQserORFyNlk8uq58uUQ8IGb1W+DtqMzdgkY6UwjVtlcOhk/dkVGRDM
   yMsF65tR1GKTE3lDsLcgMMGn3XT0DsGhyDlqHM9W1A3apttawlWqy62vs
   +zcM8egZYWfOTsuhQLq6heOzp9rrSjCmAd+3eiJK5HB/7aNWjQaQTXHIC
   PsOoqAXNw2W8v4mfa+pySJkUmuMtW9UDxJyWuVg78kIYLEp6CZpyzibtQ
   XWnh8x4UQEm7rFMolZ2kd9Y02hXMXk6TrpYuwabxt/FG8JO8A694UDodm
   i+ISqXCppo74s4K8+iXri8B+qMVxpRbovcfM6xJE1lGGc7BEASvhbpQqF
   g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10826"; a="443955118"
X-IronPort-AV: E=Sophos;i="6.02,236,1688454000"; 
   d="scan'208";a="443955118"
Received: from fmsmga006.fm.intel.com ([10.253.24.20])
  by orsmga105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 07 Sep 2023 18:51:45 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10826"; a="989009063"
X-IronPort-AV: E=Sophos;i="6.02,236,1688454000"; 
   d="scan'208";a="989009063"
Received: from lkp-server01.sh.intel.com (HELO 59b3c6e06877) ([10.239.97.150])
  by fmsmga006.fm.intel.com with ESMTP; 07 Sep 2023 18:51:43 -0700
Received: from kbuild by 59b3c6e06877 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1qeQer-0001oR-22;
	Fri, 08 Sep 2023 01:51:41 +0000
Date: Fri, 8 Sep 2023 09:51:05 +0800
From: kernel test robot <lkp@intel.com>
To: Mark Rutland <mark.rutland@arm.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [mark:arm64/cpucap/cleanup 7/10] arch/arm64/kernel/process.c:457:13:
 error: implicit declaration of function 'alternative_has_cap'; did you mean
 'alternative_has_cap_likely'?
Message-ID: <202309080911.aIHkyqoz-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/mark/linux.git arm64/cpucap/cleanup
head:   2405f58284bdacc19c28bc216c4f4135de71db87
commit: dcaf6045f364d1d99e4d3275e91c8c2e7a81db14 [7/10] arm64: avoid cpus_have_const_cap() in ssbs_thread_switch()
config: arm64-randconfig-r003-20230908 (https://download.01.org/0day-ci/archive/20230908/202309080911.aIHkyqoz-lkp@intel.com/config)
compiler: aarch64-linux-gcc (GCC) 13.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20230908/202309080911.aIHkyqoz-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202309080911.aIHkyqoz-lkp@intel.com/

All errors (new ones prefixed by >>):

   arch/arm64/kernel/process.c: In function 'ssbs_thread_switch':
>> arch/arm64/kernel/process.c:457:13: error: implicit declaration of function 'alternative_has_cap'; did you mean 'alternative_has_cap_likely'? [-Werror=implicit-function-declaration]
     457 |         if (alternative_has_cap(ARM64_SSBS))
         |             ^~~~~~~~~~~~~~~~~~~
         |             alternative_has_cap_likely
   cc1: some warnings being treated as errors


vim +457 arch/arm64/kernel/process.c

   439	
   440	/*
   441	 * Force SSBS state on context-switch, since it may be lost after migrating
   442	 * from a CPU which treats the bit as RES0 in a heterogeneous system.
   443	 */
   444	static void ssbs_thread_switch(struct task_struct *next)
   445	{
   446		/*
   447		 * Nothing to do for kernel threads, but 'regs' may be junk
   448		 * (e.g. idle task) so check the flags and bail early.
   449		 */
   450		if (unlikely(next->flags & PF_KTHREAD))
   451			return;
   452	
   453		/*
   454		 * If all CPUs implement the SSBS extension, then we just need to
   455		 * context-switch the PSTATE field.
   456		 */
 > 457		if (alternative_has_cap(ARM64_SSBS))
   458			return;
   459	
   460		spectre_v4_enable_task_mitigation(next);
   461	}
   462	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
