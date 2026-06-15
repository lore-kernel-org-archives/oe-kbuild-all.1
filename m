Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.14])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C89153B8405
	for <oe-kbuild-all@lists.linux.dev>; Mon, 15 Jun 2026 23:05:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.14
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781564756; cv=none; b=CQe4QFYwM9r/uf20qITNYSQ99LwAgAcQSXJR3efHt5OqkI3COLqno7rm9qgDgBXoxSmgW4u4uN5XzhzQKx9D2s7wVcOP1C5qxqpBhCXM6CyaaJRSErLuFUv08jkHy5R8NeyTjL1TUw9yLpkI17wBpCgLOJN1OLHNBiYO211NPzM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781564756; c=relaxed/simple;
	bh=24FMK2v5qb1kIFTM2XDrqWRQXKA+EMZwrKGkVuee3c8=;
	h=Date:From:To:Cc:Subject:Message-ID; b=Sqs4UpATfzId6tBiBoXD4o0Nl0PBU0b2UOgUqA8l4aPslCa6IBchZgBVCahrYHvktsKeOvQSkqQ/pDpy5IGHiyXyz42hnHmiiBRDIdjjExK7eS3jZJlD/0+uauyfxF1lvZb2WG2Otfnen9V6kfAheQIt3x96aHi1rGHG2qZPiDc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=n2BVdJvS; arc=none smtp.client-ip=198.175.65.14
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="n2BVdJvS"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1781564754; x=1813100754;
  h=date:from:to:cc:subject:message-id;
  bh=24FMK2v5qb1kIFTM2XDrqWRQXKA+EMZwrKGkVuee3c8=;
  b=n2BVdJvSiKCgfXc2wTBXDvNCaNPCRs+BJcFiLGx3DvWBm+U27horftn6
   kupkPoQMCwdtwfx+5f5+bXTkCIpXMRDxQWjV+HcOA5Rl0yFTNzoX73olm
   zT6KR6H2nX2Iss5sH58OlxfvgCckTM6J7n2WqDeDEZyWsBzIA6rG63tIq
   0XtOK2KNlB61HFipcQBo+j8SppSkDKtMebgHtEJtcWiemdYlS8lQ4e/0D
   3XObYkdziHcA02yHtMCk2yBhcMz/hEBvuLRbYbGhVWk9zpgnlLJpTnjcg
   T0QaQU4o5qDfV/075PkZ0MmFik19ztlp0NmfytVG8IvB7aN+ba3uzfsPW
   w==;
X-CSE-ConnectionGUID: suUOvLp8SGWhCf2Jp8h1gw==
X-CSE-MsgGUID: +VQd+T87TPKTASaJLkavLw==
X-IronPort-AV: E=McAfee;i="6800,10657,11818"; a="86220104"
X-IronPort-AV: E=Sophos;i="6.24,207,1774335600"; 
   d="scan'208";a="86220104"
Received: from fmviesa004.fm.intel.com ([10.60.135.144])
  by orvoesa106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 15 Jun 2026 16:05:54 -0700
X-CSE-ConnectionGUID: wEAB+9Z+RH6bKOiUg4nv8Q==
X-CSE-MsgGUID: 0kfezEWtTMKjRTY4u+hVeQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.24,207,1774335600"; 
   d="scan'208";a="249484780"
Received: from lkp-server01.sh.intel.com (HELO f0d55cb201f0) ([10.239.97.150])
  by fmviesa004.fm.intel.com with ESMTP; 15 Jun 2026 16:05:51 -0700
Received: from kbuild by f0d55cb201f0 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1wZGNJ-00000000SRO-0VKq;
	Mon, 15 Jun 2026 23:05:49 +0000
Date: Tue, 16 Jun 2026 07:05:22 +0800
From: kernel test robot <lkp@intel.com>
To: Kajol Jain <kjain@linux.ibm.com>
Cc: oe-kbuild-all@lists.linux.dev, linux-kernel@vger.kernel.org,
 Madhavan Srinivasan <maddy@linux.ibm.com>
Subject: arch/powerpc/perf/vpa-dtl.c:254:30: sparse: sparse:
 incorrect type in assignment (different base types)
Message-ID: <202606160631.IihWXt6l-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git master
head:   0e0611827f3349d0a2ac121c023a6d3260dcecdb
commit: 4708fba19adee9ba14ef28af6face4ab043d9cd6 powerpc/vpa_dtl: Add interface to expose vpa dtl counters via perf
date:   9 months ago
config: powerpc64-randconfig-r113-20260615 (https://download.01.org/0day-ci/archive/20260616/202606160631.IihWXt6l-lkp@intel.com/config)
compiler: powerpc64-linux-gcc (GCC) 16.1.0
sparse: v0.6.5-rc1
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260616/202606160631.IihWXt6l-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Fixes: 4708fba19ade ("powerpc/vpa_dtl: Add interface to expose vpa dtl counters via perf")
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202606160631.IihWXt6l-lkp@intel.com/

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
