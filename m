Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.20])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 89ECB7F0
	for <oe-kbuild-all@lists.linux.dev>; Tue, 12 Sep 2023 16:54:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1694537688; x=1726073688;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=3kNfr1VbQYGOWGSyzwOsZFXHSD7k6xsz0wrXZ+vr4KA=;
  b=Lz6CCcJL5tIA/gEWC+lNPXcgxcB8j1U50AdWGtJWg0WCy1eYXrbY/bK3
   l6zMSVGs5zRQvE9btYGqf3jNQAGEOhHF29WCNett5BO59Tzg18sW8TPS8
   RLnk0fcTfDrYoTIXvDzrWAqeA9BvH7gbPSBSvMQMldyw837JzLEV59+aZ
   BSlCjP8W4qPbmo+Gc2/DMj0z0ECop6iO2ZroyMrWN3iwilAC9pzsL7B1W
   bCgMFTeq6H2IHMmfmCqBerjeq6kxrvuN+0b+wP6ztwWcJcMve2Ss+YCoP
   hTcghkEG+J0pfVH8c6USC9g4gWTmLeficYfhWAIqSNulCqLYZXAFr3CZU
   w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10831"; a="368704644"
X-IronPort-AV: E=Sophos;i="6.02,139,1688454000"; 
   d="scan'208";a="368704644"
Received: from orsmga008.jf.intel.com ([10.7.209.65])
  by orsmga101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 12 Sep 2023 09:53:53 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10831"; a="773111600"
X-IronPort-AV: E=Sophos;i="6.02,139,1688454000"; 
   d="scan'208";a="773111600"
Received: from lkp-server02.sh.intel.com (HELO 0a6943a0b3e1) ([10.239.97.151])
  by orsmga008.jf.intel.com with ESMTP; 12 Sep 2023 09:53:52 -0700
Received: from kbuild by 0a6943a0b3e1 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1qg6dw-0000Hk-2i;
	Tue, 12 Sep 2023 16:53:43 +0000
Date: Wed, 13 Sep 2023 00:53:27 +0800
From: kernel test robot <lkp@intel.com>
To: Thomas Gleixner <tglx@linutronix.de>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [tglx-devel:serial 1/74] include/linux/serial_core.h:639:48: error:
 passing argument 1 of 'arch_local_irq_restore' makes integer from pointer
 without a cast
Message-ID: <202309130056.xm1Da0cJ-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/tglx/devel.git serial
head:   75adfb6dc779d7c86a2e31b3ca6b266b8a8ef854
commit: 7887baec9d85468ea43d70b614fc3f51f7206793 [1/74] serial: core: Provide port lock wrappers
config: powerpc-allnoconfig (https://download.01.org/0day-ci/archive/20230913/202309130056.xm1Da0cJ-lkp@intel.com/config)
compiler: powerpc-linux-gcc (GCC) 13.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20230913/202309130056.xm1Da0cJ-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202309130056.xm1Da0cJ-lkp@intel.com/

All errors (new ones prefixed by >>):

   In file included from include/linux/bitops.h:7,
                    from include/linux/kernel.h:22,
                    from include/linux/cpumask.h:10,
                    from include/linux/smp.h:13,
                    from include/linux/lockdep.h:14,
                    from include/linux/mutex.h:17,
                    from include/linux/notifier.h:14,
                    from include/linux/panic_notifier.h:5,
                    from arch/powerpc/kernel/setup-common.c:12:
   include/linux/serial_core.h: In function 'uart_port_lock_irqsave':
   include/linux/typecheck.h:12:25: error: comparison of distinct pointer types lacks a cast [-Werror]
      12 |         (void)(&__dummy == &__dummy2); \
         |                         ^~
   include/linux/spinlock.h:265:17: note: in expansion of macro 'typecheck'
     265 |                 typecheck(unsigned long, flags);        \
         |                 ^~~~~~~~~
   include/linux/spinlock.h:381:9: note: in expansion of macro 'raw_spin_lock_irqsave'
     381 |         raw_spin_lock_irqsave(spinlock_check(lock), flags);     \
         |         ^~~~~~~~~~~~~~~~~~~~~
   include/linux/serial_core.h:616:9: note: in expansion of macro 'spin_lock_irqsave'
     616 |         spin_lock_irqsave(&up->lock, flags);
         |         ^~~~~~~~~~~~~~~~~
   include/linux/typecheck.h:12:25: error: comparison of distinct pointer types lacks a cast [-Werror]
      12 |         (void)(&__dummy == &__dummy2); \
         |                         ^~
   include/linux/irqflags.h:178:17: note: in expansion of macro 'typecheck'
     178 |                 typecheck(unsigned long, flags);        \
         |                 ^~~~~~~~~
   include/linux/irqflags.h:245:38: note: in expansion of macro 'raw_local_irq_save'
     245 | #define local_irq_save(flags)   do { raw_local_irq_save(flags); } while (0)
         |                                      ^~~~~~~~~~~~~~~~~~
   include/linux/spinlock_api_up.h:40:8: note: in expansion of macro 'local_irq_save'
      40 |   do { local_irq_save(flags); __LOCK(lock); } while (0)
         |        ^~~~~~~~~~~~~~
   include/linux/spinlock_api_up.h:69:49: note: in expansion of macro '__LOCK_IRQSAVE'
      69 | #define _raw_spin_lock_irqsave(lock, flags)     __LOCK_IRQSAVE(lock, flags)
         |                                                 ^~~~~~~~~~~~~~
   include/linux/spinlock.h:266:17: note: in expansion of macro '_raw_spin_lock_irqsave'
     266 |                 _raw_spin_lock_irqsave(lock, flags);    \
         |                 ^~~~~~~~~~~~~~~~~~~~~~
   include/linux/spinlock.h:381:9: note: in expansion of macro 'raw_spin_lock_irqsave'
     381 |         raw_spin_lock_irqsave(spinlock_check(lock), flags);     \
         |         ^~~~~~~~~~~~~~~~~~~~~
   include/linux/serial_core.h:616:9: note: in expansion of macro 'spin_lock_irqsave'
     616 |         spin_lock_irqsave(&up->lock, flags);
         |         ^~~~~~~~~~~~~~~~~
   In file included from include/asm-generic/cmpxchg-local.h:6,
                    from arch/powerpc/include/asm/cmpxchg.h:755,
                    from arch/powerpc/include/asm/atomic.h:11,
                    from include/linux/atomic.h:7,
                    from include/linux/cpumask.h:13:
>> include/linux/irqflags.h:179:23: error: assignment to 'long unsigned int *' from 'long unsigned int' makes pointer from integer without a cast [-Werror=int-conversion]
     179 |                 flags = arch_local_irq_save();          \
         |                       ^
   include/linux/irqflags.h:245:38: note: in expansion of macro 'raw_local_irq_save'
     245 | #define local_irq_save(flags)   do { raw_local_irq_save(flags); } while (0)
         |                                      ^~~~~~~~~~~~~~~~~~
   include/linux/spinlock_api_up.h:40:8: note: in expansion of macro 'local_irq_save'
      40 |   do { local_irq_save(flags); __LOCK(lock); } while (0)
         |        ^~~~~~~~~~~~~~
   include/linux/spinlock_api_up.h:69:49: note: in expansion of macro '__LOCK_IRQSAVE'
      69 | #define _raw_spin_lock_irqsave(lock, flags)     __LOCK_IRQSAVE(lock, flags)
         |                                                 ^~~~~~~~~~~~~~
   include/linux/spinlock.h:266:17: note: in expansion of macro '_raw_spin_lock_irqsave'
     266 |                 _raw_spin_lock_irqsave(lock, flags);    \
         |                 ^~~~~~~~~~~~~~~~~~~~~~
   include/linux/spinlock.h:381:9: note: in expansion of macro 'raw_spin_lock_irqsave'
     381 |         raw_spin_lock_irqsave(spinlock_check(lock), flags);     \
         |         ^~~~~~~~~~~~~~~~~~~~~
   include/linux/serial_core.h:616:9: note: in expansion of macro 'spin_lock_irqsave'
     616 |         spin_lock_irqsave(&up->lock, flags);
         |         ^~~~~~~~~~~~~~~~~
   include/linux/serial_core.h: In function 'uart_port_trylock_irqsave':
   include/linux/typecheck.h:12:25: error: comparison of distinct pointer types lacks a cast [-Werror]
      12 |         (void)(&__dummy == &__dummy2); \
         |                         ^~
   include/linux/irqflags.h:178:17: note: in expansion of macro 'typecheck'
     178 |                 typecheck(unsigned long, flags);        \
         |                 ^~~~~~~~~
   include/linux/irqflags.h:245:38: note: in expansion of macro 'raw_local_irq_save'
     245 | #define local_irq_save(flags)   do { raw_local_irq_save(flags); } while (0)
         |                                      ^~~~~~~~~~~~~~~~~~
   include/linux/spinlock.h:298:9: note: in expansion of macro 'local_irq_save'
     298 |         local_irq_save(flags); \
         |         ^~~~~~~~~~~~~~
   include/linux/spinlock.h:421:9: note: in expansion of macro 'raw_spin_trylock_irqsave'
     421 |         raw_spin_trylock_irqsave(spinlock_check(lock), flags); \
         |         ^~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/serial_core.h:639:16: note: in expansion of macro 'spin_trylock_irqsave'
     639 |         return spin_trylock_irqsave(&up->lock, flags);
         |                ^~~~~~~~~~~~~~~~~~~~
>> include/linux/irqflags.h:179:23: error: assignment to 'long unsigned int *' from 'long unsigned int' makes pointer from integer without a cast [-Werror=int-conversion]
     179 |                 flags = arch_local_irq_save();          \
         |                       ^
   include/linux/irqflags.h:245:38: note: in expansion of macro 'raw_local_irq_save'
     245 | #define local_irq_save(flags)   do { raw_local_irq_save(flags); } while (0)
         |                                      ^~~~~~~~~~~~~~~~~~
   include/linux/spinlock.h:298:9: note: in expansion of macro 'local_irq_save'
     298 |         local_irq_save(flags); \
         |         ^~~~~~~~~~~~~~
   include/linux/spinlock.h:421:9: note: in expansion of macro 'raw_spin_trylock_irqsave'
     421 |         raw_spin_trylock_irqsave(spinlock_check(lock), flags); \
         |         ^~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/serial_core.h:639:16: note: in expansion of macro 'spin_trylock_irqsave'
     639 |         return spin_trylock_irqsave(&up->lock, flags);
         |                ^~~~~~~~~~~~~~~~~~~~
   include/linux/typecheck.h:12:25: error: comparison of distinct pointer types lacks a cast [-Werror]
      12 |         (void)(&__dummy == &__dummy2); \
         |                         ^~
   include/linux/irqflags.h:183:17: note: in expansion of macro 'typecheck'
     183 |                 typecheck(unsigned long, flags);        \
         |                 ^~~~~~~~~
   include/linux/irqflags.h:246:39: note: in expansion of macro 'raw_local_irq_restore'
     246 | #define local_irq_restore(flags) do { raw_local_irq_restore(flags); } while (0)
         |                                       ^~~~~~~~~~~~~~~~~~~~~
   include/linux/spinlock.h:300:16: note: in expansion of macro 'local_irq_restore'
     300 |         1 : ({ local_irq_restore(flags); 0; }); \
         |                ^~~~~~~~~~~~~~~~~
   include/linux/spinlock.h:421:9: note: in expansion of macro 'raw_spin_trylock_irqsave'
     421 |         raw_spin_trylock_irqsave(spinlock_check(lock), flags); \
         |         ^~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/serial_core.h:639:16: note: in expansion of macro 'spin_trylock_irqsave'
     639 |         return spin_trylock_irqsave(&up->lock, flags);
         |                ^~~~~~~~~~~~~~~~~~~~
>> include/linux/serial_core.h:639:48: error: passing argument 1 of 'arch_local_irq_restore' makes integer from pointer without a cast [-Werror=int-conversion]
     639 |         return spin_trylock_irqsave(&up->lock, flags);
         |                                                ^~~~~
         |                                                |
         |                                                long unsigned int *
   include/linux/irqflags.h:185:40: note: in definition of macro 'raw_local_irq_restore'
     185 |                 arch_local_irq_restore(flags);          \
         |                                        ^~~~~
   include/linux/spinlock.h:300:16: note: in expansion of macro 'local_irq_restore'
     300 |         1 : ({ local_irq_restore(flags); 0; }); \
         |                ^~~~~~~~~~~~~~~~~
   include/linux/spinlock.h:421:9: note: in expansion of macro 'raw_spin_trylock_irqsave'
     421 |         raw_spin_trylock_irqsave(spinlock_check(lock), flags); \
         |         ^~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/serial_core.h:639:16: note: in expansion of macro 'spin_trylock_irqsave'
     639 |         return spin_trylock_irqsave(&up->lock, flags);
         |                ^~~~~~~~~~~~~~~~~~~~
   In file included from arch/powerpc/include/asm/irqflags.h:12,
                    from include/linux/irqflags.h:17:
   arch/powerpc/include/asm/hw_irq.h:425:57: note: expected 'long unsigned int' but argument is of type 'long unsigned int *'
     425 | static inline void arch_local_irq_restore(unsigned long flags)
         |                                           ~~~~~~~~~~~~~~^~~~~
   cc1: all warnings being treated as errors


vim +/arch_local_irq_restore +639 include/linux/serial_core.h

   629	
   630	/**
   631	 * uart_port_trylock_irqsave - Try to lock the UART port, save and disable interrupts
   632	 * @up:		Pointer to UART port structure
   633	 * @flags:	Pointer to interrupt flags storage
   634	 *
   635	 * Returns: True if lock was acquired, false otherwise
   636	 */
   637	static inline bool uart_port_trylock_irqsave(struct uart_port *up, unsigned long *flags)
   638	{
 > 639		return spin_trylock_irqsave(&up->lock, flags);
   640	}
   641	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
