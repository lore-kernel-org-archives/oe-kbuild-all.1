Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.15])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7049121257E
	for <oe-kbuild-all@lists.linux.dev>; Sat, 17 Jan 2026 16:02:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.15
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768665729; cv=none; b=sc/05G2FomYfSPSfLtNMqIZ1Mx2VR995WfF9pfNjY04a4LoJu8lELo3aHtxBa4iS/ccpUNj/W72EzFTXKwnxmLO0p5X1arEl13bSqhgSDU2P8SP+rGHUHBU4euRwsCLmdEQwa1yn3Q15O7l3Wwl6h1LY+LGLoLESF6MRWyucTA8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768665729; c=relaxed/simple;
	bh=QzoPCFM8HqqpQqkd1SRh9SOFrnNLPk5mK+iIOSFMxrQ=;
	h=Date:From:To:Cc:Subject:Message-ID; b=thzrTwMkJvwPvJZpjNkUpDtng2a34ZDmDbB3XbLIStMlYL9A9AhUAWo7BkNDh2y2IT46PGupGAIPNVhxH2klMkljClAh5vqNac+PPtJPXsrJ1PkycWC15BYq5xEzH1jBAQ2nuakNO2ux59KClotvzrWTs6kR7O7vh+xQ1jPLLu8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=dkOsA8Bs; arc=none smtp.client-ip=192.198.163.15
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="dkOsA8Bs"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1768665727; x=1800201727;
  h=date:from:to:cc:subject:message-id;
  bh=QzoPCFM8HqqpQqkd1SRh9SOFrnNLPk5mK+iIOSFMxrQ=;
  b=dkOsA8BsosnKL7ScFI62NSAWlEuzLIT8y/su0MPkyqLTUlehvVDb98UA
   hMuan7V+KE1YKTiwgyt6mBNKWlErUIDPIvUJVEFmJgGPffa+l2id259I0
   I2kzwdJrSeWgFpIvXTX6qNwPYHGo4V5bjSEu80kCJk2KSS1un6c/E3c/t
   R57ADUvUudtNXFDKcfBt787G2wjjh5YUkZ/VSzzM0hYSkqXGAbXRgHJL+
   jAarPYPqXpJwzuJ6wc93z1tUHovt+seHghd7HC+2jCZW+uFK+FmQsVWUm
   nuPS8NA139h/OPaNc/5CKWRKcvmWjJq7zQWHhzlZ3TmKJGGCJJq1OaEod
   A==;
X-CSE-ConnectionGUID: UPLRBpBkRcWJMqYkFS9T+A==
X-CSE-MsgGUID: zXqpIXsVQcOrNXwtzFQFWg==
X-IronPort-AV: E=McAfee;i="6800,10657,11674"; a="70034761"
X-IronPort-AV: E=Sophos;i="6.21,234,1763452800"; 
   d="scan'208";a="70034761"
Received: from fmviesa006.fm.intel.com ([10.60.135.146])
  by fmvoesa109.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 17 Jan 2026 08:02:06 -0800
X-CSE-ConnectionGUID: suAlcZxuRUeVDXRawW+dsw==
X-CSE-MsgGUID: ILLOZiqITJ2h7Ii8RcgdFQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,234,1763452800"; 
   d="scan'208";a="205390744"
Received: from lkp-server01.sh.intel.com (HELO 765f4a05e27f) ([10.239.97.150])
  by fmviesa006.fm.intel.com with ESMTP; 17 Jan 2026 08:02:04 -0800
Received: from kbuild by 765f4a05e27f with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vh8kU-00000000Lza-0Zrm;
	Sat, 17 Jan 2026 16:02:02 +0000
Date: Sun, 18 Jan 2026 00:01:28 +0800
From: kernel test robot <lkp@intel.com>
To: Kajol Jain <kjain@linux.ibm.com>
Cc: oe-kbuild-all@lists.linux.dev, linux-kernel@vger.kernel.org,
 Madhavan Srinivasan <maddy@linux.ibm.com>
Subject: arch/powerpc/perf/vpa-dtl.c:254:30: sparse: sparse:
 incorrect type in assignment (different base types)
Message-ID: <202601172326.7KiWQt28-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git master
head:   d3eeb99bbc99cc5eb94a4a75ed4415a0272254ef
commit: 4708fba19adee9ba14ef28af6face4ab043d9cd6 powerpc/vpa_dtl: Add interface to expose vpa dtl counters via perf
date:   4 months ago
config: powerpc64-randconfig-r111-20260117 (https://download.01.org/0day-ci/archive/20260117/202601172326.7KiWQt28-lkp@intel.com/config)
compiler: clang version 22.0.0git (https://github.com/llvm/llvm-project 9b8addffa70cee5b2acc5454712d9cf78ce45710)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260117/202601172326.7KiWQt28-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202601172326.7KiWQt28-lkp@intel.com/

sparse warnings: (new ones prefixed by >>)
>> arch/powerpc/perf/vpa-dtl.c:254:30: sparse: sparse: incorrect type in assignment (different base types) @@     expected unsigned int [usertype] @@     got restricted __be32 [usertype] @@
   arch/powerpc/perf/vpa-dtl.c:254:30: sparse:     expected unsigned int [usertype]
   arch/powerpc/perf/vpa-dtl.c:254:30: sparse:     got restricted __be32 [usertype]

vim +254 arch/powerpc/perf/vpa-dtl.c

   241	
   242	static int vpa_dtl_event_add(struct perf_event *event, int flags)
   243	{
   244		int ret, hwcpu;
   245		unsigned long addr;
   246		struct vpa_dtl *dtl = &per_cpu(vpa_dtl_cpu, event->cpu);
   247	
   248		/*
   249		 * Register our dtl buffer with the hypervisor. The
   250		 * HV expects the buffer size to be passed in the second
   251		 * word of the buffer. Refer section '14.11.3.2. H_REGISTER_VPA'
   252		 * from PAPR for more information.
   253		 */
 > 254		((u32 *)dtl->buf)[1] = cpu_to_be32(DISPATCH_LOG_BYTES);
   255		dtl->last_idx = 0;
   256	
   257		hwcpu = get_hard_smp_processor_id(event->cpu);
   258		addr = __pa(dtl->buf);
   259	
   260		ret = register_dtl(hwcpu, addr);
   261		if (ret) {
   262			pr_warn("DTL registration for cpu %d (hw %d) failed with %d\n",
   263				event->cpu, hwcpu, ret);
   264			return ret;
   265		}
   266	
   267		/* set our initial buffer indices */
   268		lppaca_of(event->cpu).dtl_idx = 0;
   269	
   270		/*
   271		 * Ensure that our updates to the lppaca fields have
   272		 * occurred before we actually enable the logging
   273		 */
   274		smp_wmb();
   275	
   276		/* enable event logging */
   277		lppaca_of(event->cpu).dtl_enable_mask = event->attr.config;
   278	
   279		vpa_dtl_start_hrtimer(event);
   280	
   281		return 0;
   282	}
   283	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
