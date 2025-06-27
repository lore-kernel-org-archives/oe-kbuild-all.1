Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.16])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0C44E28852D
	for <oe-kbuild-all@lists.linux.dev>; Fri, 27 Jun 2025 22:41:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.16
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751064115; cv=none; b=JMHuDgACsmUICvELSJMCfXUibD5HJz0IOjMEzNnHtVdsD56Qv10BaDClloc1ExV/TTQ8tsa0vHd+Uu9eD1ZGO0MYnOaYzSpvaGtCCoiSU81Qbd0jeqQ2an/pdZJ7qknIH7RYo3omSq8vENHIW7PsDak9uWNTy3EBYGtOAePN/9Y=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751064115; c=relaxed/simple;
	bh=89RJ9WUEkXQu6EBc32/Qc3ZQ1mzEuC4Ly22YGeghAvA=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=tYAuKQrQ1q3bzdGf+p9U5sRQKaDZ5qB2LSIJFuyRRWphr4dDekQQhl6C1dOmw0iK+Ye31/kcUxJ/aCe7klMoelf0qZJNOoyAqTe4qB6s68hCvexk2TYxAETItOCfFdNEoqGDlHBRlXgzFUUCamH84DTrFhsUy3ti2zDY1Sl0PRo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=liBoaE5m; arc=none smtp.client-ip=192.198.163.16
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="liBoaE5m"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1751064114; x=1782600114;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=89RJ9WUEkXQu6EBc32/Qc3ZQ1mzEuC4Ly22YGeghAvA=;
  b=liBoaE5mTnqMTZS0XLYAuuY6W4cDgPyZunZWMjnns1Zas/D9hzUD4KFJ
   RMB2GSqVJN6miwMzduVvz8dYP6255VIMfE7cF6AeDJgLAH8dsq6cxbbxJ
   Yx2ehvGtv9yUohaLCtKLFc05EHOsHjYELukAYhCPqBxpyN4q97dPtUBNN
   tCVmc08Oczrwipx/J+Gu5FizFW5JVCVoVnjKxuuFApd6oulpEedpm38Ig
   kG8h6Sg8xTZjEi0/jHrf3bepGRNFiNxcXZG1Zu0VoDYTGh6CNI+ysxDZB
   9aH7DQkDmfIIkm0ivSssnw7rptxdQDJ6aJWCpfjpwtjgit5eBMcgm6S2E
   w==;
X-CSE-ConnectionGUID: n6eDZGAVSB6JHUVXhOi7wQ==
X-CSE-MsgGUID: S27Z0U5lSuuDgY8dY/HFAQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11477"; a="41010579"
X-IronPort-AV: E=Sophos;i="6.16,271,1744095600"; 
   d="scan'208";a="41010579"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
  by fmvoesa110.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 27 Jun 2025 15:41:53 -0700
X-CSE-ConnectionGUID: fSIhes9hS/Gso7LF2Cjr3Q==
X-CSE-MsgGUID: Ejyyxz8TTLufaHQ3QglfrQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,271,1744095600"; 
   d="scan'208";a="183955403"
Received: from lkp-server01.sh.intel.com (HELO e8142ee1dce2) ([10.239.97.150])
  by orviesa002.jf.intel.com with ESMTP; 27 Jun 2025 15:41:52 -0700
Received: from kbuild by e8142ee1dce2 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1uVHlW-000Was-0X;
	Fri, 27 Jun 2025 22:41:50 +0000
Date: Sat, 28 Jun 2025 06:41:50 +0800
From: kernel test robot <lkp@intel.com>
To: kernel@openeuler.org, Zheng Zengkai <zhengzengkai@huawei.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [openeuler:OLK-5.10 2987/2987]
 arch/arm64/kernel/arm64_cpu_park.c:140:17: sparse: sparse: incorrect type in
 argument 2 (different address spaces)
Message-ID: <202506280616.okoJpSCx-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hi Kefeng,

FYI, the error/warning was bisected to this commit, please ignore it if it's irrelevant.

tree:   https://gitee.com/openeuler/kernel.git OLK-5.10
head:   ab082f7137232cc372aad2eceb59b0ec98d0d9fb
commit: ba25d7467b3040d98290a140256303ba190ef376 [2987/2987] arm64: cpu_park: Move into stand-alone file
config: arm64-randconfig-r133-20250628 (https://download.01.org/0day-ci/archive/20250628/202506280616.okoJpSCx-lkp@intel.com/config)
compiler: aarch64-linux-gcc (GCC) 10.5.0
reproduce: (https://download.01.org/0day-ci/archive/20250628/202506280616.okoJpSCx-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202506280616.okoJpSCx-lkp@intel.com/

sparse warnings: (new ones prefixed by >>)
>> arch/arm64/kernel/arm64_cpu_park.c:140:17: sparse: sparse: incorrect type in argument 2 (different address spaces) @@     expected void volatile [noderef] __iomem *addr @@     got unsigned long *[assigned] park_exit @@
   arch/arm64/kernel/arm64_cpu_park.c:140:17: sparse:     expected void volatile [noderef] __iomem *addr
   arch/arm64/kernel/arm64_cpu_park.c:140:17: sparse:     got unsigned long *[assigned] park_exit

vim +140 arch/arm64/kernel/arm64_cpu_park.c

   112	
   113	/*
   114	 * Write the secondary_entry to exit section of park state.
   115	 * Then the secondary cpu will jump straight into the kernel
   116	 * by the secondary_entry.
   117	 */
   118	int write_park_exit(unsigned int cpu)
   119	{
   120		struct cpu_park_section *park_section;
   121		unsigned long *park_exit;
   122		unsigned long *park_text;
   123	
   124		if (mmap_cpu_park_mem() != 0)
   125			return -EPERM;
   126	
   127		park_section = (struct cpu_park_section *)cpu_park_section_v(cpu);
   128		park_exit = &park_section->exit;
   129		park_text = (unsigned long *)park_section->text;
   130		pr_debug("park_text 0x%lx : 0x%lx, do_cpu_park text 0x%lx : 0x%lx",
   131			 (unsigned long)park_text, *park_text,
   132			 (unsigned long)do_cpu_park,
   133			 *(unsigned long *)do_cpu_park);
   134	
   135		/*
   136		 * Test first 8 bytes to determine
   137		 * whether needs to write cpu park exit.
   138		 */
   139		if (*park_text == *(unsigned long *)do_cpu_park) {
 > 140			writeq_relaxed(__pa_symbol(secondary_entry), park_exit);
   141			__flush_dcache_area((__force void *)park_exit,
   142					    sizeof(unsigned long));
   143			flush_icache_range((unsigned long)park_exit,
   144					   (unsigned long)(park_exit + 1));
   145			sev();
   146			dsb(sy);
   147			isb();
   148	
   149			pr_debug("Write cpu %u secondary entry 0x%lx to 0x%lx.",
   150				cpu, *park_exit, (unsigned long)park_exit);
   151			pr_info("Boot cpu %u from PARK state.", cpu);
   152			return 0;
   153		}
   154	
   155		return -EPERM;
   156	}
   157	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
