Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.9])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6D4752C08D0
	for <oe-kbuild-all@lists.linux.dev>; Sat, 22 Aug 2026 00:47:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.9
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787359647; cv=none; b=MgjxNJG+aXJmf5AZydBbyzsnADwkAGjZDsEwtypue1acPkrhlavf66iIee1+vCovaVzL7rkRN5ESy+YV2O/Nn1azaxPH84gjOJrxmTbjb3UZswHC/N4+Qlr2msFavbAOXRvh16cnnLXmob2aDEBrwHFM0MqqhACesaIaFlyNBU0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787359647; c=relaxed/simple;
	bh=XqsT3DXzzwo5ITbxEbERRgI0PoQKxsBQ7+fobNFF00E=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type; b=mq88r1Sri4n5PufjQVc3aL/kGauFz+1C0Ja/8V+KNqY6of7zjBrJwc2D43c6mTwuXdYRYYIgnnKKEzzIW6Xv2Ar+9owB32dfnkXAOBjTNvm6yR/O5CQFuervVIAdYRpeMXHwe10BVoPTApwpWqlro0F5XZ+GidaF1fLJT0jS4CA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=V+wNNCT3; arc=none smtp.client-ip=192.198.163.9
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="V+wNNCT3"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1787359645; x=1818895645;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=XqsT3DXzzwo5ITbxEbERRgI0PoQKxsBQ7+fobNFF00E=;
  b=V+wNNCT3hNmH0sSXv06pR+30OkAXyovCmEZRTK4OzZO9WKIQO6cDtoVX
   UOd8qf0S1MGMztWfDo9Yu2gVI3HDvQmKHOgY/PKmB6ww6U+ZeY7qQ0Hjv
   YDi9DGiJaogWP5BnJTIXnfPiYGIbX/pkz1gV39LG9HWIFNnYJMSmLKHeW
   BsdMB8M9rV+v5JG9tCnS1N3JODluOZe+5YvbJ2URJvAD+wgKGeqMtSi5J
   4LoTXkmG0vWwmaSlXHKvK2cL55m44uc3qfHkIysgBpk4DRJJBICAsz8Vt
   mIhaNQN6uZrmgagOalNjV0qqcQbF4Em8XdfFIuamsqTH7vQTQTGOLvlIg
   Q==;
X-CSE-ConnectionGUID: Sr08MadLRqSGszzVvQ8CgA==
X-CSE-MsgGUID: VLgHsOF9QjqBnLPIpnJd7g==
X-IronPort-AV: E=McAfee;i="6800,10657,11882"; a="98576666"
X-IronPort-AV: E=Sophos;i="6.25,236,1779174000"; 
   d="scan'208";a="98576666"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
  by fmvoesa103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 21 Aug 2026 17:47:24 -0700
X-CSE-ConnectionGUID: +lPHy2/fRqeMfP69+WTC8w==
X-CSE-MsgGUID: KW2ldgjARHWHHobUBTf7bQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,236,1779174000"; 
   d="scan'208";a="271699983"
Received: from lkp-server01.sh.intel.com (HELO 6eda058d650d) ([10.239.97.150])
  by fmviesa005.fm.intel.com with ESMTP; 21 Aug 2026 17:47:23 -0700
Received: from kbuild by 6eda058d650d with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1wxZtI-00000000qgr-2hTU;
	Sat, 22 Aug 2026 00:47:20 +0000
Date: Sat, 22 Aug 2026 08:46:25 +0800
From: kernel test robot <lkp@intel.com>
To: Jim Cromie <jim.cromie@gmail.com>,
 =?utf-8?Q?"=C5=81ukasz?= Bartosik" <ukaszb@chromium.org>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [jimc:scratchpad-v10 14/24]
 kernel/locking/lockdep.c:6710:24: error: 'stack_trace' undeclared; did you
 mean 'lock_trace'?
Message-ID: <202608220839.a0YKGqsN-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii

tree:   https://github.com/jimc/linux.git scratchpad-v10
head:   a23fc077806416450fbeb0a5a534fd995e465430
commit: 336938fcdc2d4cb4705b1ebcae351ef17abee91e [14/24] locking/lockdep: Route stack trace entries to static bootstrap scratchpad
config: arm-randconfig-003-20260822 (https://download.01.org/0day-ci/archive/20260822/202608220839.a0YKGqsN-lkp@intel.com/config)
compiler: arm-linux-gnueabi-gcc (GCC) 12.5.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260822/202608220839.a0YKGqsN-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202608220839.a0YKGqsN-lkp@intel.com/

All errors (new ones prefixed by >>):

   kernel/locking/lockdep.c:71:71: error: macro "SCRATCHREC_INIT_STATIC" passed 7 arguments, but takes just 6
      71 |                                SCRATCH_64K_ORDER, 0, &lockdep_pool_key);
         |                                                                       ^
   In file included from kernel/locking/lockdep.c:61:
   include/linux/scratchpad.h:360: note: macro "SCRATCHREC_INIT_STATIC" defined here
     360 | #define SCRATCHREC_INIT_STATIC(name, _elem_size, _static_buf, _size_bytes, _min_order, _key) \
         | 
   kernel/locking/lockdep.c:69:9: error: 'SCRATCHREC_INIT_STATIC' undeclared here (not in a function)
      69 |         SCRATCHREC_INIT_STATIC(lockdep_pool, sizeof(struct lock_list),
         |         ^~~~~~~~~~~~~~~~~~~~~~
   In file included from include/asm-generic/bug.h:31,
                    from arch/arm/include/asm/bug.h:60,
                    from include/linux/bug.h:5,
                    from include/linux/instrumented.h:10,
                    from include/linux/atomic/atomic-instrumented.h:17,
                    from include/linux/atomic.h:82,
                    from include/linux/cpumask.h:10,
                    from include/linux/smp.h:13,
                    from include/linux/lockdep.h:14,
                    from include/linux/mutex.h:17,
                    from kernel/locking/lockdep.c:30:
   kernel/locking/lockdep.c: In function 'lockdep_boot_report':
>> kernel/locking/lockdep.c:6710:24: error: 'stack_trace' undeclared (first use in this function); did you mean 'lock_trace'?
    6710 |                 sizeof(stack_trace) - lockdep_trace_scratchpad.remaining,
         |                        ^~~~~~~~~~~
   include/linux/printk.h:483:33: note: in definition of macro 'printk_index_wrap'
     483 |                 _p_func(_fmt, ##__VA_ARGS__);                           \
         |                                 ^~~~~~~~~~~
   include/linux/printk.h:584:9: note: in expansion of macro 'printk'
     584 |         printk(KERN_INFO pr_fmt(fmt), ##__VA_ARGS__)
         |         ^~~~~~
   kernel/locking/lockdep.c:6707:9: note: in expansion of macro 'pr_info'
    6707 |         pr_info("lockdep: %lu/%lu bootstrap entries, %zu/%lu bootstrap traces used before buddy init, scratchrec active\n",
         |         ^~~~~~~
   kernel/locking/lockdep.c:6710:24: note: each undeclared identifier is reported only once for each function it appears in
    6710 |                 sizeof(stack_trace) - lockdep_trace_scratchpad.remaining,
         |                        ^~~~~~~~~~~
   include/linux/printk.h:483:33: note: in definition of macro 'printk_index_wrap'
     483 |                 _p_func(_fmt, ##__VA_ARGS__);                           \
         |                                 ^~~~~~~~~~~
   include/linux/printk.h:584:9: note: in expansion of macro 'printk'
     584 |         printk(KERN_INFO pr_fmt(fmt), ##__VA_ARGS__)
         |         ^~~~~~
   kernel/locking/lockdep.c:6707:9: note: in expansion of macro 'pr_info'
    6707 |         pr_info("lockdep: %lu/%lu bootstrap entries, %zu/%lu bootstrap traces used before buddy init, scratchrec active\n",
         |         ^~~~~~~
>> kernel/locking/lockdep.c:6710:39: error: 'lockdep_trace_scratchpad' undeclared (first use in this function); did you mean 'lockdep_trace_stats'?
    6710 |                 sizeof(stack_trace) - lockdep_trace_scratchpad.remaining,
         |                                       ^~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/printk.h:483:33: note: in definition of macro 'printk_index_wrap'
     483 |                 _p_func(_fmt, ##__VA_ARGS__);                           \
         |                                 ^~~~~~~~~~~
   include/linux/printk.h:584:9: note: in expansion of macro 'printk'
     584 |         printk(KERN_INFO pr_fmt(fmt), ##__VA_ARGS__)
         |         ^~~~~~
   kernel/locking/lockdep.c:6707:9: note: in expansion of macro 'pr_info'
    6707 |         pr_info("lockdep: %lu/%lu bootstrap entries, %zu/%lu bootstrap traces used before buddy init, scratchrec active\n",
         |         ^~~~~~~
   kernel/locking/lockdep.c:6711:32: error: 'BOOTSTRAP_STACK_TRACE_ENTRIES' undeclared (first use in this function); did you mean 'MAX_STACK_TRACE_ENTRIES'?
    6711 |                 (unsigned long)BOOTSTRAP_STACK_TRACE_ENTRIES);
         |                                ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/printk.h:483:33: note: in definition of macro 'printk_index_wrap'
     483 |                 _p_func(_fmt, ##__VA_ARGS__);                           \
         |                                 ^~~~~~~~~~~
   include/linux/printk.h:584:9: note: in expansion of macro 'printk'
     584 |         printk(KERN_INFO pr_fmt(fmt), ##__VA_ARGS__)
         |         ^~~~~~
   kernel/locking/lockdep.c:6707:9: note: in expansion of macro 'pr_info'
    6707 |         pr_info("lockdep: %lu/%lu bootstrap entries, %zu/%lu bootstrap traces used before buddy init, scratchrec active\n",
         |         ^~~~~~~


vim +6710 kernel/locking/lockdep.c

  6704	
  6705	static int __init lockdep_boot_report(void)
  6706	{
> 6707		pr_info("lockdep: %lu/%lu bootstrap entries, %zu/%lu bootstrap traces used before buddy init, scratchrec active\n",
  6708			min_t(unsigned long, nr_list_entries, BOOTSTRAP_LOCKDEP_ENTRIES),
  6709			BOOTSTRAP_LOCKDEP_ENTRIES,
> 6710			sizeof(stack_trace) - lockdep_trace_scratchpad.remaining,
  6711			(unsigned long)BOOTSTRAP_STACK_TRACE_ENTRIES);
  6712		return 0;
  6713	}
  6714	core_initcall(lockdep_boot_report);
  6715	

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
