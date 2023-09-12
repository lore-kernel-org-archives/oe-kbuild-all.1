Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.88])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C8D4C168DA
	for <oe-kbuild-all@lists.linux.dev>; Tue, 12 Sep 2023 14:13:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1694527988; x=1726063988;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=blL4Kdd9YPpCKBrmM76uK1xi6t9nopUUHA3B0cSbWFw=;
  b=PVRvG/0ugKKSNSyfGMNNeX8gzKjXhX8bhi6HpPKp3f+cEp/UbY7cwoon
   0V5kiHcPaxQd+cTHmg1PoiEuj6yeaJWmnkkTpjljtuQ8b7rmKdzOo1pmF
   yJR91UWz7oOJAcKrzgLC3QPuthffVBSmr0VdD/rdbq+Cjdyh5nqzy8lpP
   +Gk++EjvlbC0JU+OElhOfvVj6l87x6phyaZVE0FVGoJv8MDW00/2EqPIw
   QcLD9IETBiGFpDxD+9fr8BngmVBT0ItLGwzCChypu0aalK5DZIp15Xyht
   ycG8PvEfX0kkOlvsHpJEu+e0hb6+YbT9odU5mY24AIRpbtmA7NqkK5k0U
   g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10831"; a="409339097"
X-IronPort-AV: E=Sophos;i="6.02,139,1688454000"; 
   d="scan'208";a="409339097"
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
  by fmsmga101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 12 Sep 2023 07:13:05 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10831"; a="886946480"
X-IronPort-AV: E=Sophos;i="6.02,139,1688454000"; 
   d="scan'208";a="886946480"
Received: from lkp-server02.sh.intel.com (HELO 0a6943a0b3e1) ([10.239.97.151])
  by fmsmga001.fm.intel.com with ESMTP; 12 Sep 2023 07:12:37 -0700
Received: from kbuild by 0a6943a0b3e1 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1qg48U-00003Z-09;
	Tue, 12 Sep 2023 14:13:02 +0000
Date: Tue, 12 Sep 2023 22:12:27 +0800
From: kernel test robot <lkp@intel.com>
To: Thomas Gleixner <tglx@linutronix.de>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [tglx-devel:serial 1/74] include/linux/serial_core.h:639:48:
 warning: passing argument 1 of 'arch_irqs_disabled_flags' makes integer from
 pointer without a cast
Message-ID: <202309122220.W08fAWsO-lkp@intel.com>
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
config: parisc-allyesconfig (https://download.01.org/0day-ci/archive/20230912/202309122220.W08fAWsO-lkp@intel.com/config)
compiler: hppa-linux-gcc (GCC) 13.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20230912/202309122220.W08fAWsO-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202309122220.W08fAWsO-lkp@intel.com/

All warnings (new ones prefixed by >>):

   In file included from include/linux/bitops.h:7,
                    from include/linux/log2.h:12,
                    from include/asm-generic/div64.h:55,
                    from ./arch/parisc/include/generated/asm/div64.h:1,
                    from include/linux/math.h:6,
                    from include/linux/math64.h:6,
                    from include/linux/time.h:6,
                    from include/linux/stat.h:19,
                    from include/linux/module.h:13,
                    from drivers/tty/serial/serial_core.c:10:
   include/linux/serial_core.h: In function 'uart_port_lock_irqsave':
   include/linux/typecheck.h:12:25: warning: comparison of distinct pointer types lacks a cast
      12 |         (void)(&__dummy == &__dummy2); \
         |                         ^~
   include/linux/spinlock.h:243:17: note: in expansion of macro 'typecheck'
     243 |                 typecheck(unsigned long, flags);        \
         |                 ^~~~~~~~~
   include/linux/spinlock.h:381:9: note: in expansion of macro 'raw_spin_lock_irqsave'
     381 |         raw_spin_lock_irqsave(spinlock_check(lock), flags);     \
         |         ^~~~~~~~~~~~~~~~~~~~~
   include/linux/serial_core.h:616:9: note: in expansion of macro 'spin_lock_irqsave'
     616 |         spin_lock_irqsave(&up->lock, flags);
         |         ^~~~~~~~~~~~~~~~~
   In file included from include/linux/kref.h:16,
                    from include/linux/mm_types.h:8,
                    from include/linux/buildid.h:5,
                    from include/linux/module.h:14:
   include/linux/spinlock.h:244:23: warning: assignment to 'long unsigned int *' from 'long unsigned int' makes pointer from integer without a cast [-Wint-conversion]
     244 |                 flags = _raw_spin_lock_irqsave(lock);   \
         |                       ^
   include/linux/spinlock.h:381:9: note: in expansion of macro 'raw_spin_lock_irqsave'
     381 |         raw_spin_lock_irqsave(spinlock_check(lock), flags);     \
         |         ^~~~~~~~~~~~~~~~~~~~~
   include/linux/serial_core.h:616:9: note: in expansion of macro 'spin_lock_irqsave'
     616 |         spin_lock_irqsave(&up->lock, flags);
         |         ^~~~~~~~~~~~~~~~~
   include/linux/serial_core.h: In function 'uart_port_trylock_irqsave':
   include/linux/typecheck.h:12:25: warning: comparison of distinct pointer types lacks a cast
      12 |         (void)(&__dummy == &__dummy2); \
         |                         ^~
   include/linux/irqflags.h:178:17: note: in expansion of macro 'typecheck'
     178 |                 typecheck(unsigned long, flags);        \
         |                 ^~~~~~~~~
   include/linux/irqflags.h:222:17: note: in expansion of macro 'raw_local_irq_save'
     222 |                 raw_local_irq_save(flags);              \
         |                 ^~~~~~~~~~~~~~~~~~
   include/linux/spinlock.h:298:9: note: in expansion of macro 'local_irq_save'
     298 |         local_irq_save(flags); \
         |         ^~~~~~~~~~~~~~
   include/linux/spinlock.h:421:9: note: in expansion of macro 'raw_spin_trylock_irqsave'
     421 |         raw_spin_trylock_irqsave(spinlock_check(lock), flags); \
         |         ^~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/serial_core.h:639:16: note: in expansion of macro 'spin_trylock_irqsave'
     639 |         return spin_trylock_irqsave(&up->lock, flags);
         |                ^~~~~~~~~~~~~~~~~~~~
   In file included from include/asm-generic/cmpxchg-local.h:6,
                    from arch/parisc/include/asm/cmpxchg.h:89,
                    from arch/parisc/include/asm/atomic.h:10,
                    from include/linux/atomic.h:7,
                    from arch/parisc/include/asm/bitops.h:13,
                    from include/linux/bitops.h:68:
   include/linux/irqflags.h:179:23: warning: assignment to 'long unsigned int *' from 'long unsigned int' makes pointer from integer without a cast [-Wint-conversion]
     179 |                 flags = arch_local_irq_save();          \
         |                       ^
   include/linux/irqflags.h:222:17: note: in expansion of macro 'raw_local_irq_save'
     222 |                 raw_local_irq_save(flags);              \
         |                 ^~~~~~~~~~~~~~~~~~
   include/linux/spinlock.h:298:9: note: in expansion of macro 'local_irq_save'
     298 |         local_irq_save(flags); \
         |         ^~~~~~~~~~~~~~
   include/linux/spinlock.h:421:9: note: in expansion of macro 'raw_spin_trylock_irqsave'
     421 |         raw_spin_trylock_irqsave(spinlock_check(lock), flags); \
         |         ^~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/serial_core.h:639:16: note: in expansion of macro 'spin_trylock_irqsave'
     639 |         return spin_trylock_irqsave(&up->lock, flags);
         |                ^~~~~~~~~~~~~~~~~~~~
   include/linux/typecheck.h:12:25: warning: comparison of distinct pointer types lacks a cast
      12 |         (void)(&__dummy == &__dummy2); \
         |                         ^~
   include/linux/irqflags.h:194:17: note: in expansion of macro 'typecheck'
     194 |                 typecheck(unsigned long, flags);        \
         |                 ^~~~~~~~~
   include/linux/irqflags.h:223:22: note: in expansion of macro 'raw_irqs_disabled_flags'
     223 |                 if (!raw_irqs_disabled_flags(flags))    \
         |                      ^~~~~~~~~~~~~~~~~~~~~~~
   include/linux/spinlock.h:298:9: note: in expansion of macro 'local_irq_save'
     298 |         local_irq_save(flags); \
         |         ^~~~~~~~~~~~~~
   include/linux/spinlock.h:421:9: note: in expansion of macro 'raw_spin_trylock_irqsave'
     421 |         raw_spin_trylock_irqsave(spinlock_check(lock), flags); \
         |         ^~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/serial_core.h:639:16: note: in expansion of macro 'spin_trylock_irqsave'
     639 |         return spin_trylock_irqsave(&up->lock, flags);
         |                ^~~~~~~~~~~~~~~~~~~~
>> include/linux/serial_core.h:639:48: warning: passing argument 1 of 'arch_irqs_disabled_flags' makes integer from pointer without a cast [-Wint-conversion]
     639 |         return spin_trylock_irqsave(&up->lock, flags);
         |                                                ^~~~~
         |                                                |
         |                                                long unsigned int *
   include/linux/irqflags.h:195:42: note: in definition of macro 'raw_irqs_disabled_flags'
     195 |                 arch_irqs_disabled_flags(flags);        \
         |                                          ^~~~~
   include/linux/spinlock.h:298:9: note: in expansion of macro 'local_irq_save'
     298 |         local_irq_save(flags); \
         |         ^~~~~~~~~~~~~~
   include/linux/spinlock.h:421:9: note: in expansion of macro 'raw_spin_trylock_irqsave'
     421 |         raw_spin_trylock_irqsave(spinlock_check(lock), flags); \
         |         ^~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/serial_core.h:639:16: note: in expansion of macro 'spin_trylock_irqsave'
     639 |         return spin_trylock_irqsave(&up->lock, flags);
         |                ^~~~~~~~~~~~~~~~~~~~
   In file included from include/linux/irqflags.h:17:
   arch/parisc/include/asm/irqflags.h:42:59: note: expected 'long unsigned int' but argument is of type 'long unsigned int *'
      42 | static inline bool arch_irqs_disabled_flags(unsigned long flags)
         |                                             ~~~~~~~~~~~~~~^~~~~
   include/linux/typecheck.h:12:25: warning: comparison of distinct pointer types lacks a cast
      12 |         (void)(&__dummy == &__dummy2); \
         |                         ^~
   include/linux/irqflags.h:194:17: note: in expansion of macro 'typecheck'
     194 |                 typecheck(unsigned long, flags);        \
         |                 ^~~~~~~~~
   include/linux/irqflags.h:229:22: note: in expansion of macro 'raw_irqs_disabled_flags'
     229 |                 if (!raw_irqs_disabled_flags(flags))    \
         |                      ^~~~~~~~~~~~~~~~~~~~~~~
   include/linux/spinlock.h:300:16: note: in expansion of macro 'local_irq_restore'
     300 |         1 : ({ local_irq_restore(flags); 0; }); \
         |                ^~~~~~~~~~~~~~~~~
   include/linux/spinlock.h:421:9: note: in expansion of macro 'raw_spin_trylock_irqsave'
     421 |         raw_spin_trylock_irqsave(spinlock_check(lock), flags); \
         |         ^~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/serial_core.h:639:16: note: in expansion of macro 'spin_trylock_irqsave'
     639 |         return spin_trylock_irqsave(&up->lock, flags);
         |                ^~~~~~~~~~~~~~~~~~~~
>> include/linux/serial_core.h:639:48: warning: passing argument 1 of 'arch_irqs_disabled_flags' makes integer from pointer without a cast [-Wint-conversion]
     639 |         return spin_trylock_irqsave(&up->lock, flags);
         |                                                ^~~~~
         |                                                |
         |                                                long unsigned int *
   include/linux/irqflags.h:195:42: note: in definition of macro 'raw_irqs_disabled_flags'
     195 |                 arch_irqs_disabled_flags(flags);        \
         |                                          ^~~~~
   include/linux/spinlock.h:300:16: note: in expansion of macro 'local_irq_restore'
     300 |         1 : ({ local_irq_restore(flags); 0; }); \
         |                ^~~~~~~~~~~~~~~~~
   include/linux/spinlock.h:421:9: note: in expansion of macro 'raw_spin_trylock_irqsave'
     421 |         raw_spin_trylock_irqsave(spinlock_check(lock), flags); \
         |         ^~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/serial_core.h:639:16: note: in expansion of macro 'spin_trylock_irqsave'
     639 |         return spin_trylock_irqsave(&up->lock, flags);
         |                ^~~~~~~~~~~~~~~~~~~~
   arch/parisc/include/asm/irqflags.h:42:59: note: expected 'long unsigned int' but argument is of type 'long unsigned int *'
      42 | static inline bool arch_irqs_disabled_flags(unsigned long flags)
         |                                             ~~~~~~~~~~~~~~^~~~~
   include/linux/typecheck.h:12:25: warning: comparison of distinct pointer types lacks a cast
      12 |         (void)(&__dummy == &__dummy2); \
         |                         ^~
   include/linux/irqflags.h:183:17: note: in expansion of macro 'typecheck'
     183 |                 typecheck(unsigned long, flags);        \
         |                 ^~~~~~~~~
   include/linux/irqflags.h:231:17: note: in expansion of macro 'raw_local_irq_restore'
     231 |                 raw_local_irq_restore(flags);           \
         |                 ^~~~~~~~~~~~~~~~~~~~~
   include/linux/spinlock.h:300:16: note: in expansion of macro 'local_irq_restore'
     300 |         1 : ({ local_irq_restore(flags); 0; }); \
         |                ^~~~~~~~~~~~~~~~~
   include/linux/spinlock.h:421:9: note: in expansion of macro 'raw_spin_trylock_irqsave'
     421 |         raw_spin_trylock_irqsave(spinlock_check(lock), flags); \
         |         ^~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/serial_core.h:639:16: note: in expansion of macro 'spin_trylock_irqsave'
     639 |         return spin_trylock_irqsave(&up->lock, flags);
         |                ^~~~~~~~~~~~~~~~~~~~
   include/linux/serial_core.h:639:48: warning: passing argument 1 of 'arch_local_irq_restore' makes integer from pointer without a cast [-Wint-conversion]
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
   arch/parisc/include/asm/irqflags.h:32:57: note: expected 'long unsigned int' but argument is of type 'long unsigned int *'
      32 | static inline void arch_local_irq_restore(unsigned long flags)
         |                                           ~~~~~~~~~~~~~~^~~~~
--
   In file included from include/linux/irqflags.h:15,
                    from include/asm-generic/cmpxchg-local.h:6,
                    from arch/parisc/include/asm/cmpxchg.h:89,
                    from arch/parisc/include/asm/atomic.h:10,
                    from include/linux/atomic.h:7,
                    from include/linux/rcupdate.h:25,
                    from include/linux/rculist.h:11,
                    from include/linux/pid.h:5,
                    from include/linux/sched.h:14,
                    from include/linux/ratelimit.h:6,
                    from include/linux/dev_printk.h:16,
                    from include/linux/device.h:15,
                    from include/linux/dmaengine.h:8,
                    from drivers/tty/serial/samsung_tty.c:24:
   include/linux/serial_core.h: In function 'uart_port_lock_irqsave':
   include/linux/typecheck.h:12:25: warning: comparison of distinct pointer types lacks a cast
      12 |         (void)(&__dummy == &__dummy2); \
         |                         ^~
   include/linux/spinlock.h:243:17: note: in expansion of macro 'typecheck'
     243 |                 typecheck(unsigned long, flags);        \
         |                 ^~~~~~~~~
   include/linux/spinlock.h:381:9: note: in expansion of macro 'raw_spin_lock_irqsave'
     381 |         raw_spin_lock_irqsave(spinlock_check(lock), flags);     \
         |         ^~~~~~~~~~~~~~~~~~~~~
   include/linux/serial_core.h:616:9: note: in expansion of macro 'spin_lock_irqsave'
     616 |         spin_lock_irqsave(&up->lock, flags);
         |         ^~~~~~~~~~~~~~~~~
   In file included from include/linux/wait.h:9,
                    from include/linux/pid.h:6:
   include/linux/spinlock.h:244:23: warning: assignment to 'long unsigned int *' from 'long unsigned int' makes pointer from integer without a cast [-Wint-conversion]
     244 |                 flags = _raw_spin_lock_irqsave(lock);   \
         |                       ^
   include/linux/spinlock.h:381:9: note: in expansion of macro 'raw_spin_lock_irqsave'
     381 |         raw_spin_lock_irqsave(spinlock_check(lock), flags);     \
         |         ^~~~~~~~~~~~~~~~~~~~~
   include/linux/serial_core.h:616:9: note: in expansion of macro 'spin_lock_irqsave'
     616 |         spin_lock_irqsave(&up->lock, flags);
         |         ^~~~~~~~~~~~~~~~~
   include/linux/serial_core.h: In function 'uart_port_trylock_irqsave':
   include/linux/typecheck.h:12:25: warning: comparison of distinct pointer types lacks a cast
      12 |         (void)(&__dummy == &__dummy2); \
         |                         ^~
   include/linux/irqflags.h:178:17: note: in expansion of macro 'typecheck'
     178 |                 typecheck(unsigned long, flags);        \
         |                 ^~~~~~~~~
   include/linux/irqflags.h:222:17: note: in expansion of macro 'raw_local_irq_save'
     222 |                 raw_local_irq_save(flags);              \
         |                 ^~~~~~~~~~~~~~~~~~
   include/linux/spinlock.h:298:9: note: in expansion of macro 'local_irq_save'
     298 |         local_irq_save(flags); \
         |         ^~~~~~~~~~~~~~
   include/linux/spinlock.h:421:9: note: in expansion of macro 'raw_spin_trylock_irqsave'
     421 |         raw_spin_trylock_irqsave(spinlock_check(lock), flags); \
         |         ^~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/serial_core.h:639:16: note: in expansion of macro 'spin_trylock_irqsave'
     639 |         return spin_trylock_irqsave(&up->lock, flags);
         |                ^~~~~~~~~~~~~~~~~~~~
   include/linux/irqflags.h:179:23: warning: assignment to 'long unsigned int *' from 'long unsigned int' makes pointer from integer without a cast [-Wint-conversion]
     179 |                 flags = arch_local_irq_save();          \
         |                       ^
   include/linux/irqflags.h:222:17: note: in expansion of macro 'raw_local_irq_save'
     222 |                 raw_local_irq_save(flags);              \
         |                 ^~~~~~~~~~~~~~~~~~
   include/linux/spinlock.h:298:9: note: in expansion of macro 'local_irq_save'
     298 |         local_irq_save(flags); \
         |         ^~~~~~~~~~~~~~
   include/linux/spinlock.h:421:9: note: in expansion of macro 'raw_spin_trylock_irqsave'
     421 |         raw_spin_trylock_irqsave(spinlock_check(lock), flags); \
         |         ^~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/serial_core.h:639:16: note: in expansion of macro 'spin_trylock_irqsave'
     639 |         return spin_trylock_irqsave(&up->lock, flags);
         |                ^~~~~~~~~~~~~~~~~~~~
   include/linux/typecheck.h:12:25: warning: comparison of distinct pointer types lacks a cast
      12 |         (void)(&__dummy == &__dummy2); \
         |                         ^~
   include/linux/irqflags.h:194:17: note: in expansion of macro 'typecheck'
     194 |                 typecheck(unsigned long, flags);        \
         |                 ^~~~~~~~~
   include/linux/irqflags.h:223:22: note: in expansion of macro 'raw_irqs_disabled_flags'
     223 |                 if (!raw_irqs_disabled_flags(flags))    \
         |                      ^~~~~~~~~~~~~~~~~~~~~~~
   include/linux/spinlock.h:298:9: note: in expansion of macro 'local_irq_save'
     298 |         local_irq_save(flags); \
         |         ^~~~~~~~~~~~~~
   include/linux/spinlock.h:421:9: note: in expansion of macro 'raw_spin_trylock_irqsave'
     421 |         raw_spin_trylock_irqsave(spinlock_check(lock), flags); \
         |         ^~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/serial_core.h:639:16: note: in expansion of macro 'spin_trylock_irqsave'
     639 |         return spin_trylock_irqsave(&up->lock, flags);
         |                ^~~~~~~~~~~~~~~~~~~~
>> include/linux/serial_core.h:639:48: warning: passing argument 1 of 'arch_irqs_disabled_flags' makes integer from pointer without a cast [-Wint-conversion]
     639 |         return spin_trylock_irqsave(&up->lock, flags);
         |                                                ^~~~~
         |                                                |
         |                                                long unsigned int *
   include/linux/irqflags.h:195:42: note: in definition of macro 'raw_irqs_disabled_flags'
     195 |                 arch_irqs_disabled_flags(flags);        \
         |                                          ^~~~~
   include/linux/spinlock.h:298:9: note: in expansion of macro 'local_irq_save'
     298 |         local_irq_save(flags); \
         |         ^~~~~~~~~~~~~~
   include/linux/spinlock.h:421:9: note: in expansion of macro 'raw_spin_trylock_irqsave'
     421 |         raw_spin_trylock_irqsave(spinlock_check(lock), flags); \
         |         ^~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/serial_core.h:639:16: note: in expansion of macro 'spin_trylock_irqsave'
     639 |         return spin_trylock_irqsave(&up->lock, flags);
         |                ^~~~~~~~~~~~~~~~~~~~
   In file included from include/linux/irqflags.h:17:
   arch/parisc/include/asm/irqflags.h:42:59: note: expected 'long unsigned int' but argument is of type 'long unsigned int *'
      42 | static inline bool arch_irqs_disabled_flags(unsigned long flags)
         |                                             ~~~~~~~~~~~~~~^~~~~
   include/linux/typecheck.h:12:25: warning: comparison of distinct pointer types lacks a cast
      12 |         (void)(&__dummy == &__dummy2); \
         |                         ^~
   include/linux/irqflags.h:194:17: note: in expansion of macro 'typecheck'
     194 |                 typecheck(unsigned long, flags);        \
         |                 ^~~~~~~~~
   include/linux/irqflags.h:229:22: note: in expansion of macro 'raw_irqs_disabled_flags'
     229 |                 if (!raw_irqs_disabled_flags(flags))    \
         |                      ^~~~~~~~~~~~~~~~~~~~~~~
   include/linux/spinlock.h:300:16: note: in expansion of macro 'local_irq_restore'
     300 |         1 : ({ local_irq_restore(flags); 0; }); \
         |                ^~~~~~~~~~~~~~~~~
   include/linux/spinlock.h:421:9: note: in expansion of macro 'raw_spin_trylock_irqsave'
     421 |         raw_spin_trylock_irqsave(spinlock_check(lock), flags); \
         |         ^~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/serial_core.h:639:16: note: in expansion of macro 'spin_trylock_irqsave'
     639 |         return spin_trylock_irqsave(&up->lock, flags);
         |                ^~~~~~~~~~~~~~~~~~~~
>> include/linux/serial_core.h:639:48: warning: passing argument 1 of 'arch_irqs_disabled_flags' makes integer from pointer without a cast [-Wint-conversion]
     639 |         return spin_trylock_irqsave(&up->lock, flags);
         |                                                ^~~~~
         |                                                |
         |                                                long unsigned int *
   include/linux/irqflags.h:195:42: note: in definition of macro 'raw_irqs_disabled_flags'
     195 |                 arch_irqs_disabled_flags(flags);        \
         |                                          ^~~~~
   include/linux/spinlock.h:300:16: note: in expansion of macro 'local_irq_restore'
     300 |         1 : ({ local_irq_restore(flags); 0; }); \
         |                ^~~~~~~~~~~~~~~~~
   include/linux/spinlock.h:421:9: note: in expansion of macro 'raw_spin_trylock_irqsave'
     421 |         raw_spin_trylock_irqsave(spinlock_check(lock), flags); \
         |         ^~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/serial_core.h:639:16: note: in expansion of macro 'spin_trylock_irqsave'
     639 |         return spin_trylock_irqsave(&up->lock, flags);
         |                ^~~~~~~~~~~~~~~~~~~~
   arch/parisc/include/asm/irqflags.h:42:59: note: expected 'long unsigned int' but argument is of type 'long unsigned int *'
      42 | static inline bool arch_irqs_disabled_flags(unsigned long flags)
         |                                             ~~~~~~~~~~~~~~^~~~~
   include/linux/typecheck.h:12:25: warning: comparison of distinct pointer types lacks a cast
      12 |         (void)(&__dummy == &__dummy2); \
         |                         ^~
   include/linux/irqflags.h:183:17: note: in expansion of macro 'typecheck'
     183 |                 typecheck(unsigned long, flags);        \
         |                 ^~~~~~~~~
   include/linux/irqflags.h:231:17: note: in expansion of macro 'raw_local_irq_restore'
     231 |                 raw_local_irq_restore(flags);           \
         |                 ^~~~~~~~~~~~~~~~~~~~~
   include/linux/spinlock.h:300:16: note: in expansion of macro 'local_irq_restore'
     300 |         1 : ({ local_irq_restore(flags); 0; }); \
         |                ^~~~~~~~~~~~~~~~~
   include/linux/spinlock.h:421:9: note: in expansion of macro 'raw_spin_trylock_irqsave'
     421 |         raw_spin_trylock_irqsave(spinlock_check(lock), flags); \
         |         ^~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/serial_core.h:639:16: note: in expansion of macro 'spin_trylock_irqsave'
     639 |         return spin_trylock_irqsave(&up->lock, flags);
         |                ^~~~~~~~~~~~~~~~~~~~
   include/linux/serial_core.h:639:48: warning: passing argument 1 of 'arch_local_irq_restore' makes integer from pointer without a cast [-Wint-conversion]
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
   arch/parisc/include/asm/irqflags.h:32:57: note: expected 'long unsigned int' but argument is of type 'long unsigned int *'
      32 | static inline void arch_local_irq_restore(unsigned long flags)
         |                                           ~~~~~~~~~~~~~~^~~~~
   drivers/tty/serial/samsung_tty.c: In function 's3c24xx_serial_init_port':
   drivers/tty/serial/samsung_tty.c:1881:51: warning: 'sprintf' may write a terminating nul past the end of the destination [-Wformat-overflow=]
    1881 |                 sprintf(clk_name, "clk_uart_baud%d", clk_num);
         |                                                   ^
   In function 's3c24xx_serial_enable_baudclk',
       inlined from 's3c24xx_serial_init_port' at drivers/tty/serial/samsung_tty.c:1997:8:
   drivers/tty/serial/samsung_tty.c:1881:17: note: 'sprintf' output between 15 and 16 bytes into a destination of size 15
    1881 |                 sprintf(clk_name, "clk_uart_baud%d", clk_num);
         |                 ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~


vim +/arch_irqs_disabled_flags +639 include/linux/serial_core.h

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
