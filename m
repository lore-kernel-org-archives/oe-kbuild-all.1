Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.15])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B400B21FF4D
	for <oe-kbuild-all@lists.linux.dev>; Thu, 13 Nov 2025 21:24:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.15
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1763069058; cv=none; b=RVaEQxSbUn8A8Qa2twTDNMtHQw9ofzD5ghkm2QodXDdymp1JSlkPu3mjOK03yCUJSmSffeeOq/sVIBhLTplEk+h46KuoQWdOGgjXsSqJbFNcjbrtEih7KS6aY25N5l0rorbzMXD2FggWR1TTb6D++kwfgtKnJdOsX/HFjWiEEFc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1763069058; c=relaxed/simple;
	bh=STRYj1YvY3QDoaBSSpbiCytqKYTj7tjb88t0l8IwTyk=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=mwiQlLKnjdIBPfC3+CmYT2ZZcvczqcwgIwQp3wLwVPt6jCfjeINvAmp4Zv6zWJ56bokTyUKE34qxqmaKWa8nRzn26LUtmUcOLVlF6zbppLmY5RpPltQyOvzdVQoXaGkQNr5uycl5He++efs14JyN89Kv4+64EUhHA0W2UyHD7gg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=BgK4Zt0D; arc=none smtp.client-ip=198.175.65.15
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="BgK4Zt0D"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1763069057; x=1794605057;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=STRYj1YvY3QDoaBSSpbiCytqKYTj7tjb88t0l8IwTyk=;
  b=BgK4Zt0Dqee3w5IMGqW27deTYzyWaEndGwXjmhZgqbHcFLl2AIGBdLZD
   00CNSIJRMZ6OqiCoxFdp6jeUAbmqhhLTKnimSj0FC8PdJFFe1BoIdQq1d
   cVUrEYO1JSY6Qn6BLyD10tSF4PWBDYfrqs1/YqORmTDvOM6PRtNn5HroC
   AsEpbD2yekA+6f3MTkkHP3yxpo+ikyXYbe2ab4no+72hRcJ99NZYwnJXW
   gETNhkJAVWFBv/XNGSqNvTgWBiNgJuWUuPDNNprhHm66/PvtO7llsHabb
   Vn3hlyJWxoq4X9a+bgnDDtZpnPxcCeiA1tZgARTlZDDaoQusY3SV2oia1
   A==;
X-CSE-ConnectionGUID: HMLAIPnNTgW+/2q+pHV44w==
X-CSE-MsgGUID: 71VkNU6DR1Cb1DxP0KrpWw==
X-IronPort-AV: E=McAfee;i="6800,10657,11612"; a="68790217"
X-IronPort-AV: E=Sophos;i="6.19,303,1754982000"; 
   d="scan'208";a="68790217"
Received: from fmviesa008.fm.intel.com ([10.60.135.148])
  by orvoesa107.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 13 Nov 2025 13:24:16 -0800
X-CSE-ConnectionGUID: MnesgJL7Q0euYIcpQpoJ3Q==
X-CSE-MsgGUID: Fm6hp+MgS3K+7ubw9GscRg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.19,303,1754982000"; 
   d="scan'208";a="189856579"
Received: from igk-lkp-server01.igk.intel.com (HELO 230842de89ac) ([10.211.93.152])
  by fmviesa008.fm.intel.com with ESMTP; 13 Nov 2025 13:24:15 -0800
Received: from kbuild by 230842de89ac with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vJend-0000000017o-1Il2;
	Thu, 13 Nov 2025 21:24:13 +0000
Date: Thu, 13 Nov 2025 22:23:53 +0100
From: kernel test robot <lkp@intel.com>
To: Yury Norov <yury.norov@gmail.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [norov:total_cpus 1/2] include/linux/smp.h:71:48: error: use of
 undeclared identifier 'cpu_online_mask'
Message-ID: <202511130743.GivvVMZt-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://github.com/norov/linux total_cpus
head:   57f6e7cf466e27e510bbc03cc2a5b067622f9673
commit: 3a8c8f12c46acd1541dbea31afaa96e8c4bf8177 [1/2] smp: include cpumask_types.h
config: x86_64-rhel-9.4-rust (https://download.01.org/0day-ci/archive/20251113/202511130743.GivvVMZt-lkp@intel.com/config)
compiler: clang version 20.1.8 (https://github.com/llvm/llvm-project 87f0227cb60147a26a1eeb4fb06e3b505e9c7261)
rustc: rustc 1.88.0 (6b00bc388 2025-06-23)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20251113/202511130743.GivvVMZt-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202511130743.GivvVMZt-lkp@intel.com/

All errors (new ones prefixed by >>):

   In file included from arch/x86/kernel/asm-offsets.c:9:
   In file included from include/linux/crypto.h:15:
   In file included from include/linux/completion.h:12:
   In file included from include/linux/swait.h:7:
   In file included from include/linux/spinlock.h:63:
   In file included from include/linux/lockdep.h:14:
>> include/linux/smp.h:71:48: error: use of undeclared identifier 'cpu_online_mask'
      71 |         on_each_cpu_cond_mask(NULL, func, info, wait, cpu_online_mask);
         |                                                       ^
   include/linux/smp.h:105:53: error: use of undeclared identifier 'cpu_online_mask'
     105 |         on_each_cpu_cond_mask(cond_func, func, info, wait, cpu_online_mask);
         |                                                            ^
   In file included from arch/x86/kernel/asm-offsets.c:14:
   In file included from include/linux/suspend.h:5:
   In file included from include/linux/swap.h:9:
   In file included from include/linux/memcontrol.h:13:
   In file included from include/linux/cgroup.h:17:
   In file included from include/linux/fs.h:5:
   In file included from include/linux/fs/super.h:5:
   In file included from include/linux/fs/super_types.h:13:
   In file included from include/linux/percpu-rwsem.h:7:
   In file included from include/linux/rcuwait.h:6:
   In file included from include/linux/sched/signal.h:6:
   include/linux/signal.h:98:11: warning: array index 3 is past the end of the array (that has type 'unsigned long[1]') [-Warray-bounds]
      98 |                 return (set->sig[3] | set->sig[2] |
         |                         ^        ~
   arch/x86/include/asm/signal.h:24:2: note: array 'sig' declared here
      24 |         unsigned long sig[_NSIG_WORDS];
         |         ^
   In file included from arch/x86/kernel/asm-offsets.c:14:
   In file included from include/linux/suspend.h:5:
   In file included from include/linux/swap.h:9:
   In file included from include/linux/memcontrol.h:13:
   In file included from include/linux/cgroup.h:17:
   In file included from include/linux/fs.h:5:
   In file included from include/linux/fs/super.h:5:
   In file included from include/linux/fs/super_types.h:13:
   In file included from include/linux/percpu-rwsem.h:7:
   In file included from include/linux/rcuwait.h:6:
   In file included from include/linux/sched/signal.h:6:
   include/linux/signal.h:98:25: warning: array index 2 is past the end of the array (that has type 'unsigned long[1]') [-Warray-bounds]
      98 |                 return (set->sig[3] | set->sig[2] |
         |                                       ^        ~
   arch/x86/include/asm/signal.h:24:2: note: array 'sig' declared here
      24 |         unsigned long sig[_NSIG_WORDS];
         |         ^
   In file included from arch/x86/kernel/asm-offsets.c:14:
   In file included from include/linux/suspend.h:5:
   In file included from include/linux/swap.h:9:
   In file included from include/linux/memcontrol.h:13:
   In file included from include/linux/cgroup.h:17:
   In file included from include/linux/fs.h:5:
   In file included from include/linux/fs/super.h:5:
   In file included from include/linux/fs/super_types.h:13:
   In file included from include/linux/percpu-rwsem.h:7:
   In file included from include/linux/rcuwait.h:6:
   In file included from include/linux/sched/signal.h:6:
   include/linux/signal.h:99:4: warning: array index 1 is past the end of the array (that has type 'unsigned long[1]') [-Warray-bounds]
      99 |                         set->sig[1] | set->sig[0]) == 0;
         |                         ^        ~
   arch/x86/include/asm/signal.h:24:2: note: array 'sig' declared here
      24 |         unsigned long sig[_NSIG_WORDS];
         |         ^
   In file included from arch/x86/kernel/asm-offsets.c:14:
   In file included from include/linux/suspend.h:5:
   In file included from include/linux/swap.h:9:
   In file included from include/linux/memcontrol.h:13:
   In file included from include/linux/cgroup.h:17:
   In file included from include/linux/fs.h:5:
   In file included from include/linux/fs/super.h:5:
   In file included from include/linux/fs/super_types.h:13:
   In file included from include/linux/percpu-rwsem.h:7:
   In file included from include/linux/rcuwait.h:6:
   In file included from include/linux/sched/signal.h:6:
   include/linux/signal.h:101:11: warning: array index 1 is past the end of the array (that has type 'unsigned long[1]') [-Warray-bounds]
     101 |                 return (set->sig[1] | set->sig[0]) == 0;
         |                         ^        ~
   arch/x86/include/asm/signal.h:24:2: note: array 'sig' declared here
      24 |         unsigned long sig[_NSIG_WORDS];
         |         ^
   In file included from arch/x86/kernel/asm-offsets.c:14:
   In file included from include/linux/suspend.h:5:
   In file included from include/linux/swap.h:9:
   In file included from include/linux/memcontrol.h:13:
   In file included from include/linux/cgroup.h:17:
   In file included from include/linux/fs.h:5:
   In file included from include/linux/fs/super.h:5:
   In file included from include/linux/fs/super_types.h:13:
   In file included from include/linux/percpu-rwsem.h:7:
   In file included from include/linux/rcuwait.h:6:
   In file included from include/linux/sched/signal.h:6:
   include/linux/signal.h:114:11: warning: array index 3 is past the end of the array (that has type 'const unsigned long[1]') [-Warray-bounds]
     114 |                 return  (set1->sig[3] == set2->sig[3]) &&
         |                          ^         ~
   arch/x86/include/asm/signal.h:24:2: note: array 'sig' declared here
      24 |         unsigned long sig[_NSIG_WORDS];
         |         ^
   In file included from arch/x86/kernel/asm-offsets.c:14:
   In file included from include/linux/suspend.h:5:
   In file included from include/linux/swap.h:9:
   In file included from include/linux/memcontrol.h:13:
   In file included from include/linux/cgroup.h:17:
   In file included from include/linux/fs.h:5:
   In file included from include/linux/fs/super.h:5:
   In file included from include/linux/fs/super_types.h:13:
   In file included from include/linux/percpu-rwsem.h:7:
   In file included from include/linux/rcuwait.h:6:


vim +/cpu_online_mask +71 include/linux/smp.h

6f1f942cd5fbbe He Ying     2021-05-06  65  
bff2dc42bcafdd David Daney 2013-09-11  66  /*
bff2dc42bcafdd David Daney 2013-09-11  67   * Call a function on all processors
bff2dc42bcafdd David Daney 2013-09-11  68   */
a5aa5ce3005972 Nadav Amit  2021-02-20  69  static inline void on_each_cpu(smp_call_func_t func, void *info, int wait)
a5aa5ce3005972 Nadav Amit  2021-02-20  70  {
a5aa5ce3005972 Nadav Amit  2021-02-20 @71  	on_each_cpu_cond_mask(NULL, func, info, wait, cpu_online_mask);
a5aa5ce3005972 Nadav Amit  2021-02-20  72  }
a5aa5ce3005972 Nadav Amit  2021-02-20  73  

:::::: The code at line 71 was first introduced by commit
:::::: a5aa5ce300597224ec76dacc8e63ba3ad7a18bbd smp: Inline on_each_cpu_cond() and on_each_cpu()

:::::: TO: Nadav Amit <namit@vmware.com>
:::::: CC: Ingo Molnar <mingo@kernel.org>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
