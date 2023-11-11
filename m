Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.115])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4D7C01170F
	for <oe-kbuild-all@lists.linux.dev>; Sat, 11 Nov 2023 10:23:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="ZJSGsLCI"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1699698195; x=1731234195;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=82b6d+TVSPMsv+QjC9mdvOo8nMCmZgm0t36wMEnL3c4=;
  b=ZJSGsLCIhrbC1MqCFj7wjqmEo2f6MWxnIeEiU7q8v8bHHxRTRGtwr8x9
   /2Vr9k0w1dWkmBJ4WrjTfybehqJRAPBQSvI9QaxsUFdaLmBUYXER0aO2k
   C2tBwu61+vutXvXhWVUgrrEpMnOqdYeDB2ek/RfwKQPed+nC5fSGsPeZv
   suacFoifCAiv6txgDAOj5nK46OIXyTcPObtBdT2labY2F3SF8J3Jv8k37
   yY70PSfPt6FVk6v/tsWEmLFkTmAbqhldOtBa4ta1wqFGp1pFh/aKzrjpI
   pM8BYEh/FNM5csnhCIK4OLd1dS4MVLBzceLuWyWM7O8Tr6Bn10iVAIm7P
   A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10890"; a="390075536"
X-IronPort-AV: E=Sophos;i="6.03,294,1694761200"; 
   d="scan'208";a="390075536"
Received: from orsmga008.jf.intel.com ([10.7.209.65])
  by fmsmga103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 11 Nov 2023 02:23:14 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10890"; a="793029087"
X-IronPort-AV: E=Sophos;i="6.03,294,1694761200"; 
   d="scan'208";a="793029087"
Received: from lkp-server01.sh.intel.com (HELO 17d9e85e5079) ([10.239.97.150])
  by orsmga008.jf.intel.com with ESMTP; 11 Nov 2023 02:23:12 -0800
Received: from kbuild by 17d9e85e5079 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1r1l8v-000AMo-2c;
	Sat, 11 Nov 2023 10:23:09 +0000
Date: Sat, 11 Nov 2023 18:22:52 +0800
From: kernel test robot <lkp@intel.com>
To: Petr =?utf-8?Q?=C5=A0tetiar?= <ynezz@true.cz>
Cc: oe-kbuild-all@lists.linux.dev, linux-kernel@vger.kernel.org,
	Paul Burton <paul.burton@mips.com>
Subject: drivers/irqchip/irq-ath79-misc.c:29:5: warning: no previous
 prototype for 'get_c0_perfcount_int'
Message-ID: <202311111847.SpxiCHnp-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git master
head:   3ca112b71f35dd5d99fc4571a56b5fc6f0c15814
commit: a1e8783db8e0d58891681bc1e6d9ada66eae8e20 MIPS: perf: ath79: Fix perfcount IRQ assignment
date:   4 years, 7 months ago
config: mips-randconfig-r005-20210928 (https://download.01.org/0day-ci/archive/20231111/202311111847.SpxiCHnp-lkp@intel.com/config)
compiler: mips-linux-gcc (GCC) 12.3.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20231111/202311111847.SpxiCHnp-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202311111847.SpxiCHnp-lkp@intel.com/

All warnings (new ones prefixed by >>):

   include/linux/device.h:686:13: note: in expansion of macro 'unlikely'
     686 |         if (unlikely(check_mul_overflow(n, size, &bytes)))
         |             ^~~~~~~~
   include/linux/compiler.h:64:25: note: previous declaration here
      64 |                         ______f = {                                     \
         |                         ^~~~~~~
   include/linux/compiler.h:56:23: note: in expansion of macro '__trace_if'
      56 | #define if(cond, ...) __trace_if( (cond , ## __VA_ARGS__) )
         |                       ^~~~~~~~~~
   include/linux/device.h:686:9: note: in expansion of macro 'if'
     686 |         if (unlikely(check_mul_overflow(n, size, &bytes)))
         |         ^~
   include/linux/device.h: In function 'device_lock_assert':
   include/linux/compiler.h:25:39: warning: ignoring attribute 'section ("\"_ftrace_annotated_branch\"")' because it conflicts with previous 'section ("\"_ftrace_branch\"")' [-Wattributes]
      25 |                         static struct ftrace_likely_data                \
         |                                       ^~~~~~~~~~~~~~~~~~
   include/linux/compiler.h:69:30: note: in definition of macro '__trace_if'
      69 |                 ______r = !!(cond);                                     \
         |                              ^~~~
   include/asm-generic/bug.h:123:9: note: in expansion of macro 'if'
     123 |         if (unlikely(__ret_warn_on))                                    \
         |         ^~
   include/linux/compiler.h:48:26: note: in expansion of macro '__branch_check__'
      48 | #  define unlikely(x)   (__branch_check__(x, 0, __builtin_constant_p(x)))
         |                          ^~~~~~~~~~~~~~~~
   include/asm-generic/bug.h:123:13: note: in expansion of macro 'unlikely'
     123 |         if (unlikely(__ret_warn_on))                                    \
         |             ^~~~~~~~
   include/linux/lockdep.h:380:17: note: in expansion of macro 'WARN_ON'
     380 |                 WARN_ON(debug_locks && !lockdep_is_held(l));    \
         |                 ^~~~~~~
   include/linux/device.h:1227:9: note: in expansion of macro 'lockdep_assert_held'
    1227 |         lockdep_assert_held(&dev->mutex);
         |         ^~~~~~~~~~~~~~~~~~~
   include/linux/compiler.h:64:25: note: previous declaration here
      64 |                         ______f = {                                     \
         |                         ^~~~~~~
   include/linux/compiler.h:56:23: note: in expansion of macro '__trace_if'
      56 | #define if(cond, ...) __trace_if( (cond , ## __VA_ARGS__) )
         |                       ^~~~~~~~~~
   include/asm-generic/bug.h:123:9: note: in expansion of macro 'if'
     123 |         if (unlikely(__ret_warn_on))                                    \
         |         ^~
   include/linux/lockdep.h:380:17: note: in expansion of macro 'WARN_ON'
     380 |                 WARN_ON(debug_locks && !lockdep_is_held(l));    \
         |                 ^~~~~~~
   include/linux/device.h:1227:9: note: in expansion of macro 'lockdep_assert_held'
    1227 |         lockdep_assert_held(&dev->mutex);
         |         ^~~~~~~~~~~~~~~~~~~
   arch/mips/include/asm/ptrace.h: In function 'regs_get_register':
   include/linux/compiler.h:25:39: warning: ignoring attribute 'section ("\"_ftrace_annotated_branch\"")' because it conflicts with previous 'section ("\"_ftrace_branch\"")' [-Wattributes]
      25 |                         static struct ftrace_likely_data                \
         |                                       ^~~~~~~~~~~~~~~~~~
   include/linux/compiler.h:69:30: note: in definition of macro '__trace_if'
      69 |                 ______r = !!(cond);                                     \
         |                              ^~~~
   arch/mips/include/asm/ptrace.h:86:9: note: in expansion of macro 'if'
      86 |         if (unlikely(offset > MAX_REG_OFFSET))
         |         ^~
   include/linux/compiler.h:48:26: note: in expansion of macro '__branch_check__'
      48 | #  define unlikely(x)   (__branch_check__(x, 0, __builtin_constant_p(x)))
         |                          ^~~~~~~~~~~~~~~~
   arch/mips/include/asm/ptrace.h:86:13: note: in expansion of macro 'unlikely'
      86 |         if (unlikely(offset > MAX_REG_OFFSET))
         |             ^~~~~~~~
   include/linux/compiler.h:64:25: note: previous declaration here
      64 |                         ______f = {                                     \
         |                         ^~~~~~~
   include/linux/compiler.h:56:23: note: in expansion of macro '__trace_if'
      56 | #define if(cond, ...) __trace_if( (cond , ## __VA_ARGS__) )
         |                       ^~~~~~~~~~
   arch/mips/include/asm/ptrace.h:86:9: note: in expansion of macro 'if'
      86 |         if (unlikely(offset > MAX_REG_OFFSET))
         |         ^~
   arch/mips/include/asm/ptrace.h: In function 'die_if_kernel':
   include/linux/compiler.h:25:39: warning: ignoring attribute 'section ("\"_ftrace_annotated_branch\"")' because it conflicts with previous 'section ("\"_ftrace_branch\"")' [-Wattributes]
      25 |                         static struct ftrace_likely_data                \
         |                                       ^~~~~~~~~~~~~~~~~~
   include/linux/compiler.h:69:30: note: in definition of macro '__trace_if'
      69 |                 ______r = !!(cond);                                     \
         |                              ^~~~
   arch/mips/include/asm/ptrace.h:171:9: note: in expansion of macro 'if'
     171 |         if (unlikely(!user_mode(regs)))
         |         ^~
   include/linux/compiler.h:48:26: note: in expansion of macro '__branch_check__'
      48 | #  define unlikely(x)   (__branch_check__(x, 0, __builtin_constant_p(x)))
         |                          ^~~~~~~~~~~~~~~~
   arch/mips/include/asm/ptrace.h:171:13: note: in expansion of macro 'unlikely'
     171 |         if (unlikely(!user_mode(regs)))
         |             ^~~~~~~~
   include/linux/compiler.h:64:25: note: previous declaration here
      64 |                         ______f = {                                     \
         |                         ^~~~~~~
   include/linux/compiler.h:56:23: note: in expansion of macro '__trace_if'
      56 | #define if(cond, ...) __trace_if( (cond , ## __VA_ARGS__) )
         |                       ^~~~~~~~~~
   arch/mips/include/asm/ptrace.h:171:9: note: in expansion of macro 'if'
     171 |         if (unlikely(!user_mode(regs)))
         |         ^~
   drivers/irqchip/irq-ath79-misc.c: At top level:
>> drivers/irqchip/irq-ath79-misc.c:29:5: warning: no previous prototype for 'get_c0_perfcount_int' [-Wmissing-prototypes]
      29 | int get_c0_perfcount_int(void)
         |     ^~~~~~~~~~~~~~~~~~~~
   drivers/irqchip/irq-ath79-misc.c:184:13: warning: no previous prototype for 'ath79_misc_irq_init' [-Wmissing-prototypes]
     184 | void __init ath79_misc_irq_init(void __iomem *regs, int irq,
         |             ^~~~~~~~~~~~~~~~~~~


vim +/get_c0_perfcount_int +29 drivers/irqchip/irq-ath79-misc.c

    28	
  > 29	int get_c0_perfcount_int(void)
    30	{
    31		return ath79_perfcount_irq;
    32	}
    33	EXPORT_SYMBOL_GPL(get_c0_perfcount_int);
    34	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
