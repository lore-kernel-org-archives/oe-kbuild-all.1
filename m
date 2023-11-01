Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.24])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 00E7163C5
	for <oe-kbuild-all@lists.linux.dev>; Wed,  1 Nov 2023 06:21:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="S3XwPCJb"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1698819684; x=1730355684;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=w+d9l0PfeLPZkZe0Du7cOx6UPG5NzuLO9Du+pOSYTEg=;
  b=S3XwPCJbdtgSXsSEtq7ES3BcHru9DHaVh3NwJlfu0RaENrqxAxPqsfNh
   vd4SIrmi0Wa70PKtEQFR/JvDFFqU9Z2g7tXNgcBug9noeX6dVQH41d5/m
   VKQXyDuN+WxLO5t0oJu3NwIDJRDft21i0JVGo8DYzrzrTDGEr6jOPmtdI
   jR7H8Vg/RssqhhhQqCFv/VNcC4Mqbbb7udMngGaNNWiSJS/peHEcKxV20
   La+poqbC1Lz6uLYB1OqXZmkKkUWXDF+tgqL5SDi70oIObyu9IiGPwwl0x
   2K1IG2xQSO2QlICNCoUZPSAUOSeqOyp9hZG1xKH9KBsQRPuKm7G/i/w7n
   w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10880"; a="391314366"
X-IronPort-AV: E=Sophos;i="6.03,267,1694761200"; 
   d="scan'208";a="391314366"
Received: from fmsmga004.fm.intel.com ([10.253.24.48])
  by orsmga102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 31 Oct 2023 23:21:23 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10880"; a="831266867"
X-IronPort-AV: E=Sophos;i="6.03,267,1694761200"; 
   d="scan'208";a="831266867"
Received: from lkp-server01.sh.intel.com (HELO 17d9e85e5079) ([10.239.97.150])
  by fmsmga004.fm.intel.com with ESMTP; 31 Oct 2023 23:21:21 -0700
Received: from kbuild by 17d9e85e5079 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1qy4bP-0000dT-14;
	Wed, 01 Nov 2023 06:21:19 +0000
Date: Wed, 1 Nov 2023 14:21:03 +0800
From: kernel test robot <lkp@intel.com>
To: David Woodhouse <dwmw2@infradead.org>
Cc: oe-kbuild-all@lists.linux.dev
Subject: Re: [PATCH v2] lockdep: add lockdep_cleanup_dead_cpu()
Message-ID: <202311011432.qY1KcRN5-lkp@intel.com>
References: <635fa006e8f3816b4a36b964d6281f0d8efa789b.camel@infradead.org>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <635fa006e8f3816b4a36b964d6281f0d8efa789b.camel@infradead.org>

Hi David,

kernel test robot noticed the following build errors:

[auto build test ERROR on tip/smp/core]
[also build test ERROR on tip/locking/core linus/master v6.6 next-20231101]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/David-Woodhouse/lockdep-add-lockdep_cleanup_dead_cpu/20231029-032722
base:   tip/smp/core
patch link:    https://lore.kernel.org/r/635fa006e8f3816b4a36b964d6281f0d8efa789b.camel%40infradead.org
patch subject: [PATCH v2] lockdep: add lockdep_cleanup_dead_cpu()
config: sh-randconfig-002-20231101 (https://download.01.org/0day-ci/archive/20231101/202311011432.qY1KcRN5-lkp@intel.com/config)
compiler: sh4-linux-gcc (GCC) 13.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20231101/202311011432.qY1KcRN5-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202311011432.qY1KcRN5-lkp@intel.com/

All errors (new ones prefixed by >>):

   In file included from arch/sh/include/asm/cmpxchg-irq.h:5,
                    from arch/sh/include/asm/cmpxchg.h:20,
                    from arch/sh/include/asm/atomic.h:19,
                    from include/linux/atomic.h:7,
                    from include/asm-generic/bitops/atomic.h:5,
                    from arch/sh/include/asm/bitops.h:23,
                    from include/linux/bitops.h:68,
                    from include/linux/log2.h:12,
                    from include/asm-generic/div64.h:55,
                    from ./arch/sh/include/generated/asm/div64.h:1,
                    from include/linux/math.h:6,
                    from include/linux/math64.h:6,
                    from include/linux/time.h:6,
                    from include/linux/stat.h:19,
                    from include/linux/module.h:13,
                    from lib/test_bitops.c:9:
>> include/linux/irqflags.h:28:47: error: 'struct task_struct' declared inside parameter list will not be visible outside of this definition or declaration [-Werror]
      28 |                                        struct task_struct *idle);
         |                                               ^~~~~~~~~~~
   cc1: all warnings being treated as errors
--
   In file included from arch/sh/include/asm/cmpxchg-irq.h:5,
                    from arch/sh/include/asm/cmpxchg.h:20,
                    from arch/sh/include/asm/atomic.h:19,
                    from include/linux/atomic.h:7,
                    from include/asm-generic/bitops/atomic.h:5,
                    from arch/sh/include/asm/bitops.h:23,
                    from include/linux/bitops.h:68,
                    from include/linux/log2.h:12,
                    from include/asm-generic/div64.h:55,
                    from ./arch/sh/include/generated/asm/div64.h:1,
                    from include/linux/math.h:6,
                    from include/linux/math64.h:6,
                    from include/linux/time64.h:5,
                    from include/linux/restart_block.h:10,
                    from include/linux/thread_info.h:14,
                    from include/asm-generic/current.h:5,
                    from ./arch/sh/include/generated/asm/current.h:1,
                    from include/linux/mutex.h:14,
                    from kernel/locking/lockdep.c:30:
   include/linux/irqflags.h:28:47: warning: 'struct task_struct' declared inside parameter list will not be visible outside of this definition or declaration
      28 |                                        struct task_struct *idle);
         |                                               ^~~~~~~~~~~
>> kernel/locking/lockdep.c:4559:6: error: conflicting types for 'lockdep_cleanup_dead_cpu'; have 'void(unsigned int,  struct task_struct *)'
    4559 | void lockdep_cleanup_dead_cpu(unsigned int cpu, struct task_struct *idle)
         |      ^~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/irqflags.h:27:15: note: previous declaration of 'lockdep_cleanup_dead_cpu' with type 'void(unsigned int,  struct task_struct *)'
      27 |   extern void lockdep_cleanup_dead_cpu(unsigned int cpu,
         |               ^~~~~~~~~~~~~~~~~~~~~~~~


vim +28 include/linux/irqflags.h

    19	
    20	/* Currently lockdep_softirqs_on/off is used only by lockdep */
    21	#ifdef CONFIG_PROVE_LOCKING
    22	  extern void lockdep_softirqs_on(unsigned long ip);
    23	  extern void lockdep_softirqs_off(unsigned long ip);
    24	  extern void lockdep_hardirqs_on_prepare(void);
    25	  extern void lockdep_hardirqs_on(unsigned long ip);
    26	  extern void lockdep_hardirqs_off(unsigned long ip);
    27	  extern void lockdep_cleanup_dead_cpu(unsigned int cpu,
  > 28					       struct task_struct *idle);
    29	#else
    30	  static inline void lockdep_softirqs_on(unsigned long ip) { }
    31	  static inline void lockdep_softirqs_off(unsigned long ip) { }
    32	  static inline void lockdep_hardirqs_on_prepare(void) { }
    33	  static inline void lockdep_hardirqs_on(unsigned long ip) { }
    34	  static inline void lockdep_hardirqs_off(unsigned long ip) { }
    35	  static inline void lockdep_cleanup_dead_cpu(unsigned int cpu,
    36						      struct task_struct *idle) {}
    37	#endif
    38	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
