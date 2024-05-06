Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.10])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id ECF2A155A55
	for <oe-kbuild-all@lists.linux.dev>; Mon,  6 May 2024 16:14:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.10
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1715012098; cv=none; b=to4Y91HARGsRetRoqeI+pvm5nMRpJuO9Wnl0TZa5JanOPUyGmHU/y5dXmhv2hpuDWbYcSE/LO3JqAwVObtGAc6QXf3WQfMUxe9sp1Kdr3G2jW/fk5VPii5VkYqv73E5UzWrKwTvggTzwgNAAsj+d0UiJmLV0NDl9Lo0vq1ndkk0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1715012098; c=relaxed/simple;
	bh=7iTblGjzPBzeEPtk9vOH97asjcc9afyU/oztAWtnbwI=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=YEZ6HP93Fxw8EmcOezCnUk0hFb22lHXQIL9o4rGO/yVwbCM5QHBOK5Up954p1tkJ4ViDz6+E7cPVTnkjXlNWhSxQm/SbXZrl33hnUXQO9K3GEId1R5S9pIGIKjjoIAjZ5bSiV1wlYDbbbgzCSD45oWXwAChN+xAyEOns0TLaD/4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=caos4gQ6; arc=none smtp.client-ip=192.198.163.10
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="caos4gQ6"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1715012096; x=1746548096;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=7iTblGjzPBzeEPtk9vOH97asjcc9afyU/oztAWtnbwI=;
  b=caos4gQ6MdvvrXvwlVnT+lShTEtnkWe/GMkyQYFqkVGTmoNoFaK3yliC
   pfzDUA7q6BeZLC1Zejj8yQ8TPQy4JYGMWUpoEtZPUAQvnE2UHisHHb0KF
   8ii7NY0/zes4bpvAieiDuq0f2VkwU1exRC5iVNyyT+wgOYCOoaqXkVaCf
   C5cd74yYIGVmj1tweRglPnk9Hu7DUrAYAmFzwd9ZOiIT+uIWtd9JVAhuI
   F8jGk+SBE6R7XKSKEcQIdy1lGTheMyyHdTAKvbOAaRgZzWElOXJUjmxBe
   PQ5R+1ljIWnE1S4iqPiBdIkeBW0rZhgO+G/BQbQY+JtD294r2DUt10ud6
   A==;
X-CSE-ConnectionGUID: bBICVYHaQ2CZf/YvwPVi0Q==
X-CSE-MsgGUID: DBfQtmHXQZm2AaKEwRTIAw==
X-IronPort-AV: E=McAfee;i="6600,9927,11065"; a="22171649"
X-IronPort-AV: E=Sophos;i="6.07,258,1708416000"; 
   d="scan'208";a="22171649"
Received: from fmviesa009.fm.intel.com ([10.60.135.149])
  by fmvoesa104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 06 May 2024 09:14:55 -0700
X-CSE-ConnectionGUID: ImJImsdwR16vZaWklEv91g==
X-CSE-MsgGUID: hoH4QvH0SHGeOAeleeT8vA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,258,1708416000"; 
   d="scan'208";a="28183448"
Received: from lkp-server01.sh.intel.com (HELO f8b243fe6e68) ([10.239.97.150])
  by fmviesa009.fm.intel.com with ESMTP; 06 May 2024 09:14:53 -0700
Received: from kbuild by f8b243fe6e68 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1s40zL-0000m9-0Q;
	Mon, 06 May 2024 16:14:51 +0000
Date: Tue, 7 May 2024 00:14:17 +0800
From: kernel test robot <lkp@intel.com>
To: Yury Norov <yury.norov@gmail.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [norov:fns-removal 11/11] include/linux/cpumask.h:416:29: error: too
 few arguments provided to function-like macro invocation
Message-ID: <202405070032.IM2agXFu-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://github.com/norov/linux fns-removal
head:   2985d417a6ad2d864d53f69743b601ce51e36c6d
commit: 2985d417a6ad2d864d53f69743b601ce51e36c6d [11/11] x86/resctrl: simplify cpumask_any_housekeeping()
config: x86_64-allmodconfig (https://download.01.org/0day-ci/archive/20240507/202405070032.IM2agXFu-lkp@intel.com/config)
compiler: clang version 18.1.4 (https://github.com/llvm/llvm-project e6c3289804a67ea0bb6a86fadbe454dd93b8d855)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240507/202405070032.IM2agXFu-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202405070032.IM2agXFu-lkp@intel.com/

All errors (new ones prefixed by >>):

   In file included from arch/x86/kernel/asm-offsets.c:9:
   In file included from include/linux/crypto.h:15:
   In file included from include/linux/completion.h:12:
   In file included from include/linux/swait.h:7:
   In file included from include/linux/spinlock.h:59:
   In file included from include/linux/irqflags.h:18:
   In file included from arch/x86/include/asm/irqflags.h:60:
   In file included from arch/x86/include/asm/paravirt.h:21:
>> include/linux/cpumask.h:416:29: error: too few arguments provided to function-like macro invocation
     416 |         for_each_cpu_andnot(i, mask)
         |                                    ^
   include/linux/cpumask.h:351:9: note: macro 'for_each_cpu_andnot' defined here
     351 | #define for_each_cpu_andnot(cpu, mask1, mask2)                          \
         |         ^
>> include/linux/cpumask.h:416:2: error: use of undeclared identifier 'for_each_cpu_andnot'
     416 |         for_each_cpu_andnot(i, mask)
         |         ^
   In file included from arch/x86/kernel/asm-offsets.c:10:
   In file included from include/crypto/aria.h:22:
   In file included from include/linux/module.h:19:
   In file included from include/linux/elf.h:6:
   In file included from arch/x86/include/asm/elf.h:10:
   In file included from arch/x86/include/asm/ia32.h:7:
   In file included from include/linux/compat.h:17:
   In file included from include/linux/fs.h:33:
   In file included from include/linux/percpu-rwsem.h:7:
   In file included from include/linux/rcuwait.h:6:
   In file included from include/linux/sched/signal.h:6:
   include/linux/signal.h:98:11: warning: array index 3 is past the end of the array (that has type 'unsigned long[1]') [-Warray-bounds]
      98 |                 return (set->sig[3] | set->sig[2] |
         |                         ^        ~
   arch/x86/include/asm/signal.h:24:2: note: array 'sig' declared here
      24 |         unsigned long sig[_NSIG_WORDS];
         |         ^
   In file included from arch/x86/kernel/asm-offsets.c:10:
   In file included from include/crypto/aria.h:22:
   In file included from include/linux/module.h:19:
   In file included from include/linux/elf.h:6:
   In file included from arch/x86/include/asm/elf.h:10:
   In file included from arch/x86/include/asm/ia32.h:7:
   In file included from include/linux/compat.h:17:
   In file included from include/linux/fs.h:33:
   In file included from include/linux/percpu-rwsem.h:7:
   In file included from include/linux/rcuwait.h:6:
   In file included from include/linux/sched/signal.h:6:
   include/linux/signal.h:98:25: warning: array index 2 is past the end of the array (that has type 'unsigned long[1]') [-Warray-bounds]
      98 |                 return (set->sig[3] | set->sig[2] |
         |                                       ^        ~
   arch/x86/include/asm/signal.h:24:2: note: array 'sig' declared here
      24 |         unsigned long sig[_NSIG_WORDS];
         |         ^
   In file included from arch/x86/kernel/asm-offsets.c:10:
   In file included from include/crypto/aria.h:22:
   In file included from include/linux/module.h:19:
   In file included from include/linux/elf.h:6:
   In file included from arch/x86/include/asm/elf.h:10:
   In file included from arch/x86/include/asm/ia32.h:7:
   In file included from include/linux/compat.h:17:
   In file included from include/linux/fs.h:33:
   In file included from include/linux/percpu-rwsem.h:7:
   In file included from include/linux/rcuwait.h:6:
   In file included from include/linux/sched/signal.h:6:
   include/linux/signal.h:99:4: warning: array index 1 is past the end of the array (that has type 'unsigned long[1]') [-Warray-bounds]
      99 |                         set->sig[1] | set->sig[0]) == 0;
         |                         ^        ~
   arch/x86/include/asm/signal.h:24:2: note: array 'sig' declared here
      24 |         unsigned long sig[_NSIG_WORDS];
         |         ^
   In file included from arch/x86/kernel/asm-offsets.c:10:
   In file included from include/crypto/aria.h:22:
   In file included from include/linux/module.h:19:
   In file included from include/linux/elf.h:6:
   In file included from arch/x86/include/asm/elf.h:10:
   In file included from arch/x86/include/asm/ia32.h:7:
   In file included from include/linux/compat.h:17:
   In file included from include/linux/fs.h:33:
   In file included from include/linux/percpu-rwsem.h:7:
   In file included from include/linux/rcuwait.h:6:
   In file included from include/linux/sched/signal.h:6:
   include/linux/signal.h:101:11: warning: array index 1 is past the end of the array (that has type 'unsigned long[1]') [-Warray-bounds]
     101 |                 return (set->sig[1] | set->sig[0]) == 0;
         |                         ^        ~
   arch/x86/include/asm/signal.h:24:2: note: array 'sig' declared here
      24 |         unsigned long sig[_NSIG_WORDS];
         |         ^
   In file included from arch/x86/kernel/asm-offsets.c:10:
   In file included from include/crypto/aria.h:22:
   In file included from include/linux/module.h:19:
   In file included from include/linux/elf.h:6:
   In file included from arch/x86/include/asm/elf.h:10:
   In file included from arch/x86/include/asm/ia32.h:7:
   In file included from include/linux/compat.h:17:
   In file included from include/linux/fs.h:33:
   In file included from include/linux/percpu-rwsem.h:7:
   In file included from include/linux/rcuwait.h:6:
   In file included from include/linux/sched/signal.h:6:
   include/linux/signal.h:114:11: warning: array index 3 is past the end of the array (that has type 'const unsigned long[1]') [-Warray-bounds]
     114 |                 return  (set1->sig[3] == set2->sig[3]) &&
         |                          ^         ~
   arch/x86/include/asm/signal.h:24:2: note: array 'sig' declared here
      24 |         unsigned long sig[_NSIG_WORDS];
         |         ^
   In file included from arch/x86/kernel/asm-offsets.c:10:
   In file included from include/crypto/aria.h:22:
   In file included from include/linux/module.h:19:
   In file included from include/linux/elf.h:6:
   In file included from arch/x86/include/asm/elf.h:10:
   In file included from arch/x86/include/asm/ia32.h:7:
   In file included from include/linux/compat.h:17:
   In file included from include/linux/fs.h:33:
   In file included from include/linux/percpu-rwsem.h:7:
   In file included from include/linux/rcuwait.h:6:
   In file included from include/linux/sched/signal.h:6:
   include/linux/signal.h:114:27: warning: array index 3 is past the end of the array (that has type 'const unsigned long[1]') [-Warray-bounds]
     114 |                 return  (set1->sig[3] == set2->sig[3]) &&


vim +416 include/linux/cpumask.h

   400	
   401	/**
   402	 * cpumask_andnot_any_but - return a "random" in an intersection of cpumasks, but not this one.
   403	 * @mask1: the cpumask to search
   404	 * @mask2: the cpumask to search
   405	 * @cpu: the cpu to ignore.
   406	 *
   407	 * Often used to find any cpu but smp_processor_id() in a mask.
   408	 * Return: >= nr_cpu_ids if no cpus set.
   409	 */
   410	static inline
   411	unsigned int cpumask_andnot_any_but(const struct cpumask *mask1, const struct cpumask *mask2,
   412					unsigned int cpu)
   413	{
   414		unsigned int i;
   415	
 > 416		for_each_cpu_andnot(i, mask)
   417			if (i != cpu)
   418				break;
   419		return i;
   420	}
   421	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
