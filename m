Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.14])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3149A3DFC63
	for <oe-kbuild-all@lists.linux.dev>; Tue, 31 Mar 2026 13:06:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.14
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774962398; cv=none; b=sHFbB7Z3mfw7fdKN3Q8GqibibNEUG12QqUQ32PuY1jvnVWEqTWaWvDjbHbB17V5d5GlpFPq5V0s+vzoNStpuDxEQRa0OOLBCifbCmO3bsZEZ5hh33NAQH33h6SlKoIvm+IJSq0+dCBklIEbX22iEmPEUSjUTAMYmrrkOr0NqTTk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774962398; c=relaxed/simple;
	bh=IHGDMqeyZIxXBsnG4Y9WU/nMF39ktLyX8cRCjPkvE1w=;
	h=Date:From:To:Cc:Subject:Message-ID; b=rCH3SRiFJ27Wku8fxMjEzMF4jJVujOsTfbpIsCakDY45G1N/wPlmZ2e+NTHZri7M6YyTxq/oTUc4miaqPRAa9caB9qltXIsrGWsJMJHNSBmIR3LiyD6IC8FyOKkzU8WR29+keqVPABhjgDOX3SGBL/8fGszsPhKjm1UHPl0Bwi8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=AHpIi7cw; arc=none smtp.client-ip=198.175.65.14
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="AHpIi7cw"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1774962397; x=1806498397;
  h=date:from:to:cc:subject:message-id;
  bh=IHGDMqeyZIxXBsnG4Y9WU/nMF39ktLyX8cRCjPkvE1w=;
  b=AHpIi7cwp94lkhcyBLPj03PN3NnB1KH0cQxGS+N2m5nXI59W1j+076iw
   iTastHTNf/yRccchLhgFh0wMZQYrHwBBzPXVRzk8s2vpLvxzqSm4eRdho
   EG4V/PufZVuKObNeY7DCIHIF2j6ozVNlFO2ouprMtrh5J0DlypyRVEy1F
   x45Srn2fLH3FZsI3vJw9xpbcAYk3Tkr4Qjk05G7OQTk4dwrKXncbybg3z
   uRDytfSB9ow7rWznmuOq1Yl6qHuRzxi63dab67wmeRWJbufShjcgXANAi
   aTJE19/dnr+CWArSu/nWEI+FYUzGBiWX8qToWEKgopQvkhToVcQuliFld
   Q==;
X-CSE-ConnectionGUID: CaKQMXDiSLOgTb7rUO451w==
X-CSE-MsgGUID: WkUuoBLsRZKwhWvB9cUUNg==
X-IronPort-AV: E=McAfee;i="6800,10657,11745"; a="79833580"
X-IronPort-AV: E=Sophos;i="6.23,151,1770624000"; 
   d="scan'208";a="79833580"
Received: from orviesa005.jf.intel.com ([10.64.159.145])
  by orvoesa106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 31 Mar 2026 06:06:36 -0700
X-CSE-ConnectionGUID: nyrjClxSSAy1RHArWb0LOg==
X-CSE-MsgGUID: SnPf/vxeQmGX+4es5wegPg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,151,1770624000"; 
   d="scan'208";a="231291336"
Received: from lkp-server01.sh.intel.com (HELO 283bf2e1b94a) ([10.239.97.150])
  by orviesa005.jf.intel.com with ESMTP; 31 Mar 2026 06:06:34 -0700
Received: from kbuild by 283bf2e1b94a with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1w7Ynf-000000002eH-3mus;
	Tue, 31 Mar 2026 13:06:31 +0000
Date: Tue, 31 Mar 2026 21:06:20 +0800
From: kernel test robot <lkp@intel.com>
To: cros-kernel-buildreports@googlegroups.com
Cc: oe-kbuild-all@lists.linux.dev
Subject: [android-common:android15-6.6-2025-09 1/1]
 lib/percpu_counter.c:178:36: sparse: sparse: cast removes address space
 '__percpu' of expression
Message-ID: <202603312007.XjsEbKEW-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>

tree:   https://android.googlesource.com/kernel/common android15-6.6-2025-09
head:   b93ae26d721ce546bfc68d0bf0819a00ac746e7b
commit: c439d5e8a0deb7310b5bb4e5f2fe47c40ff5297f [1/1] pcpcntr: add group allocation/free
config: i386-randconfig-r112-20260331 (https://download.01.org/0day-ci/archive/20260331/202603312007.XjsEbKEW-lkp@intel.com/config)
compiler: gcc-14 (Debian 14.2.0-19) 14.2.0
sparse: v0.6.5-rc1
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260331/202603312007.XjsEbKEW-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202603312007.XjsEbKEW-lkp@intel.com/

sparse warnings: (new ones prefixed by >>)
>> lib/percpu_counter.c:178:36: sparse: sparse: cast removes address space '__percpu' of expression
>> lib/percpu_counter.c:178:33: sparse: sparse: incorrect type in assignment (different address spaces) @@     expected signed int [noderef] [usertype] __percpu *counters @@     got void * @@
   lib/percpu_counter.c:178:33: sparse:     expected signed int [noderef] [usertype] __percpu *counters
   lib/percpu_counter.c:178:33: sparse:     got void *

vim +/__percpu +178 lib/percpu_counter.c

   153	
   154	int __percpu_counter_init_many(struct percpu_counter *fbc, s64 amount,
   155				       gfp_t gfp, u32 nr_counters,
   156				       struct lock_class_key *key)
   157	{
   158		unsigned long flags __maybe_unused;
   159		size_t counter_size;
   160		s32 __percpu *counters;
   161		u32 i;
   162	
   163		counter_size = ALIGN(sizeof(*counters), __alignof__(*counters));
   164		counters = __alloc_percpu_gfp(nr_counters * counter_size,
   165					      __alignof__(*counters), gfp);
   166		if (!counters) {
   167			fbc[0].counters = NULL;
   168			return -ENOMEM;
   169		}
   170	
   171		for (i = 0; i < nr_counters; i++) {
   172			raw_spin_lock_init(&fbc[i].lock);
   173			lockdep_set_class(&fbc[i].lock, key);
   174	#ifdef CONFIG_HOTPLUG_CPU
   175			INIT_LIST_HEAD(&fbc[i].list);
   176	#endif
   177			fbc[i].count = amount;
 > 178			fbc[i].counters = (void *)counters + (i * counter_size);
   179	
   180			debug_percpu_counter_activate(&fbc[i]);
   181		}
   182	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
