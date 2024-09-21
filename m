Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6DDBB16FF45
	for <oe-kbuild-all@lists.linux.dev>; Sat, 21 Sep 2024 14:42:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.17
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1726929777; cv=none; b=GJCjLdaE/qGREGiaB8oFxXbEGjnx49V6aoFeCODeiBezDzjVANLaB9id0dSG6HXoJEPzyALH1bZDBgTCAOK4nV0dfRJ1AbG0Xg6uovm2wu0/IcTCmARSWRfkjHopn24dn8tUXFKfHC5Sr2933qibm6ucKRJrkRP2ujOcwLpe/g0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1726929777; c=relaxed/simple;
	bh=PPD7Bpz6RGT4OOk1QNpfg/JTJHQyQi9pktwucIl4icQ=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Jo2C81+84CN7SSBKAObVOfuqVgkv73wuMOzuViVh0Ob4IbZKKL6Mz9Jae4EdmAp7ehTJ8J/nP5DDYiNe/lWM+gPvPk9W/oPv+RFSsf6mpKiGaKUxEdWMz5KH+RCgYfpHnemK9UWZRRftS5NfQ3bdEO18mXp2upvrvEIi/p9zTD0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=f3h9Fh0i; arc=none smtp.client-ip=198.175.65.17
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="f3h9Fh0i"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1726929775; x=1758465775;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=PPD7Bpz6RGT4OOk1QNpfg/JTJHQyQi9pktwucIl4icQ=;
  b=f3h9Fh0iKFjevFNGntSbdlkVOVPGvrsyyqJYZF5nht5snS/ek72ZSNtT
   J9Z5WTZnKn5bQPCnVBUhLQTZkr3fQ0ivl78D0F/Qh7pvltnR3m+q2FTt4
   6WdlSSx8zEEc/cAw7XcHtw8LbC4odF1bExByAsmIHURbZjygYMfSipD95
   1Bi305Ef9yyyrMis98TFWS+RZbsPH96lRctk+Jnk8ubd5qPPplN6Y2n3n
   tywVo9zYGQ9qOBHDZF19CoTLjZDBTUFhryHukbZAf3Tbnmzi6ZW3XzFz2
   LDx/Y6ayXW4I+y3vh2bqP4NtMxQ35XiCq3X1jnzX2rbkaY4G/NAPENVdL
   w==;
X-CSE-ConnectionGUID: pjN+jhR7SgWb42DUV/CkbA==
X-CSE-MsgGUID: eU7OuszrTzyhrAuJ1IMEHA==
X-IronPort-AV: E=McAfee;i="6700,10204,11202"; a="26077191"
X-IronPort-AV: E=Sophos;i="6.10,247,1719903600"; 
   d="scan'208";a="26077191"
Received: from fmviesa010.fm.intel.com ([10.60.135.150])
  by orvoesa109.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 21 Sep 2024 07:42:52 -0700
X-CSE-ConnectionGUID: /yVqmYj2TomAXje2G01TFw==
X-CSE-MsgGUID: T6ZvZgOWTtyyV8QRsuZAxQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.10,247,1719903600"; 
   d="scan'208";a="70892298"
Received: from lkp-server01.sh.intel.com (HELO 53e96f405c61) ([10.239.97.150])
  by fmviesa010.fm.intel.com with ESMTP; 21 Sep 2024 07:42:51 -0700
Received: from kbuild by 53e96f405c61 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1ss1Jw-000FUV-2M;
	Sat, 21 Sep 2024 14:42:48 +0000
Date: Sat, 21 Sep 2024 22:42:15 +0800
From: kernel test robot <lkp@intel.com>
To: Steven Davis <goldside000@outlook.com>, akpm@linux-foundation.org
Cc: oe-kbuild-all@lists.linux.dev, linux-kernel@vger.kernel.org,
	Steven Davis <goldside000@outlook.com>
Subject: Re: [PATCH] irq_work: Improve CPU Responsiveness in irq_work_sync
 with cond_resched()
Message-ID: <202409212211.Lopmt0MK-lkp@intel.com>
References: <SJ2P223MB10263844181902531B671FB6F7622@SJ2P223MB1026.NAMP223.PROD.OUTLOOK.COM>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <SJ2P223MB10263844181902531B671FB6F7622@SJ2P223MB1026.NAMP223.PROD.OUTLOOK.COM>

Hi Steven,

kernel test robot noticed the following build errors:

[auto build test ERROR on akpm-mm/mm-everything]
[also build test ERROR on linus/master v6.11 next-20240920]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Steven-Davis/irq_work-Improve-CPU-Responsiveness-in-irq_work_sync-with-cond_resched/20240918-232606
base:   https://git.kernel.org/pub/scm/linux/kernel/git/akpm/mm.git mm-everything
patch link:    https://lore.kernel.org/r/SJ2P223MB10263844181902531B671FB6F7622%40SJ2P223MB1026.NAMP223.PROD.OUTLOOK.COM
patch subject: [PATCH] irq_work: Improve CPU Responsiveness in irq_work_sync with cond_resched()
config: parisc-allnoconfig (https://download.01.org/0day-ci/archive/20240921/202409212211.Lopmt0MK-lkp@intel.com/config)
compiler: hppa-linux-gcc (GCC) 14.1.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240921/202409212211.Lopmt0MK-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202409212211.Lopmt0MK-lkp@intel.com/

All errors (new ones prefixed by >>):

   kernel/irq_work.c: In function 'irq_work_sync':
>> kernel/irq_work.c:311:13: error: invalid storage class for function 'run_irq_workd'
     311 | static void run_irq_workd(unsigned int cpu)
         |             ^~~~~~~~~~~~~
>> kernel/irq_work.c:316:13: error: invalid storage class for function 'irq_workd_setup'
     316 | static void irq_workd_setup(unsigned int cpu)
         |             ^~~~~~~~~~~~~~~
>> kernel/irq_work.c:323:35: error: initializer element is not constant
     323 |         .setup                  = irq_workd_setup,
         |                                   ^~~~~~~~~~~~~~~
   kernel/irq_work.c:323:35: note: (near initialization for 'irqwork_threads.setup')
   kernel/irq_work.c:325:35: error: initializer element is not constant
     325 |         .thread_fn              = run_irq_workd,
         |                                   ^~~~~~~~~~~~~
   kernel/irq_work.c:325:35: note: (near initialization for 'irqwork_threads.thread_fn')
>> kernel/irq_work.c:329:19: error: invalid storage class for function 'irq_work_init_threads'
     329 | static __init int irq_work_init_threads(void)
         |                   ^~~~~~~~~~~~~~~~~~~~~
   In file included from arch/parisc/include/asm/alternative.h:18,
                    from arch/parisc/include/asm/barrier.h:5,
                    from include/asm-generic/bitops/generic-non-atomic.h:7,
                    from include/linux/bitops.h:29,
                    from include/linux/kernel.h:23,
                    from arch/parisc/include/asm/bug.h:5,
                    from include/linux/bug.h:5,
                    from kernel/irq_work.c:9:
   kernel/irq_work.c:335:16: error: initializer element is not constant
     335 | early_initcall(irq_work_init_threads);
         |                ^~~~~~~~~~~~~~~~~~~~~
   include/linux/init.h:270:55: note: in definition of macro '____define_initcall'
     270 |                 __attribute__((__section__(__sec))) = fn;
         |                                                       ^~
   include/linux/init.h:280:9: note: in expansion of macro '__unique_initcall'
     280 |         __unique_initcall(fn, id, __sec, __initcall_id(fn))
         |         ^~~~~~~~~~~~~~~~~
   include/linux/init.h:282:35: note: in expansion of macro '___define_initcall'
     282 | #define __define_initcall(fn, id) ___define_initcall(fn, id, .initcall##id)
         |                                   ^~~~~~~~~~~~~~~~~~
   include/linux/init.h:289:41: note: in expansion of macro '__define_initcall'
     289 | #define early_initcall(fn)              __define_initcall(fn, early)
         |                                         ^~~~~~~~~~~~~~~~~
   kernel/irq_work.c:335:1: note: in expansion of macro 'early_initcall'
     335 | early_initcall(irq_work_init_threads);
         | ^~~~~~~~~~~~~~
>> kernel/irq_work.c:335:1: error: expected declaration or statement at end of input


vim +/run_irq_workd +311 kernel/irq_work.c

b4c6f86ec2f648 Sebastian Andrzej Siewior 2021-10-07  310  
b4c6f86ec2f648 Sebastian Andrzej Siewior 2021-10-07 @311  static void run_irq_workd(unsigned int cpu)
b4c6f86ec2f648 Sebastian Andrzej Siewior 2021-10-07  312  {
b4c6f86ec2f648 Sebastian Andrzej Siewior 2021-10-07  313  	irq_work_run_list(this_cpu_ptr(&lazy_list));
b4c6f86ec2f648 Sebastian Andrzej Siewior 2021-10-07  314  }
b4c6f86ec2f648 Sebastian Andrzej Siewior 2021-10-07  315  
b4c6f86ec2f648 Sebastian Andrzej Siewior 2021-10-07 @316  static void irq_workd_setup(unsigned int cpu)
b4c6f86ec2f648 Sebastian Andrzej Siewior 2021-10-07  317  {
b4c6f86ec2f648 Sebastian Andrzej Siewior 2021-10-07  318  	sched_set_fifo_low(current);
b4c6f86ec2f648 Sebastian Andrzej Siewior 2021-10-07  319  }
b4c6f86ec2f648 Sebastian Andrzej Siewior 2021-10-07  320  
b4c6f86ec2f648 Sebastian Andrzej Siewior 2021-10-07  321  static struct smp_hotplug_thread irqwork_threads = {
b4c6f86ec2f648 Sebastian Andrzej Siewior 2021-10-07  322  	.store                  = &irq_workd,
b4c6f86ec2f648 Sebastian Andrzej Siewior 2021-10-07 @323  	.setup			= irq_workd_setup,
b4c6f86ec2f648 Sebastian Andrzej Siewior 2021-10-07  324  	.thread_should_run      = irq_workd_should_run,
b4c6f86ec2f648 Sebastian Andrzej Siewior 2021-10-07  325  	.thread_fn              = run_irq_workd,
b4c6f86ec2f648 Sebastian Andrzej Siewior 2021-10-07  326  	.thread_comm            = "irq_work/%u",
b4c6f86ec2f648 Sebastian Andrzej Siewior 2021-10-07  327  };
b4c6f86ec2f648 Sebastian Andrzej Siewior 2021-10-07  328  
b4c6f86ec2f648 Sebastian Andrzej Siewior 2021-10-07 @329  static __init int irq_work_init_threads(void)
b4c6f86ec2f648 Sebastian Andrzej Siewior 2021-10-07  330  {
b4c6f86ec2f648 Sebastian Andrzej Siewior 2021-10-07  331  	if (IS_ENABLED(CONFIG_PREEMPT_RT))
b4c6f86ec2f648 Sebastian Andrzej Siewior 2021-10-07  332  		BUG_ON(smpboot_register_percpu_thread(&irqwork_threads));
b4c6f86ec2f648 Sebastian Andrzej Siewior 2021-10-07  333  	return 0;
b4c6f86ec2f648 Sebastian Andrzej Siewior 2021-10-07  334  }
b4c6f86ec2f648 Sebastian Andrzej Siewior 2021-10-07 @335  early_initcall(irq_work_init_threads);

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
