Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.100])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 362B6AD49
	for <oe-kbuild-all@lists.linux.dev>; Tue, 12 Sep 2023 16:24:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1694535887; x=1726071887;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=LGZvpRNu1wv+IfeVEAVcz9LaMPUUT1YFA9W2eeLhlnw=;
  b=TZUnoC+CywbTORQKsVptSZybFKmK+PLQK+x7OQMH+bg0ZCO1F37JLlcF
   ImC7C/A4z4qKSi5F6/s0IpHmGqjBzHpBCFvXZ+91EM4cW5tSap4LOAVVk
   KZjT9ExBhZEzR/xTL+VUjtfgbL+vFJgI9lTymJBjv2E4MsMtF5oZjE0FX
   QUKg6lkbW73x5n1IW5D2t8sY86LQmTrD9LY8FwwZxxafFbkhLVGzPZ2PI
   PuAGVbj3RGGgx2n1HrM5l1TZkQT2H4FycMphZ/Zoc+64i45I6vFd9dwe5
   7iZ1Q6DrjHhb22UOj+xRMMSCj5qUWiu4Zp1snCfrOP4+sKM3B7UT+iqm0
   A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10831"; a="444860274"
X-IronPort-AV: E=Sophos;i="6.02,139,1688454000"; 
   d="scan'208";a="444860274"
Received: from fmsmga006.fm.intel.com ([10.253.24.20])
  by orsmga105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 12 Sep 2023 09:09:48 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10831"; a="990543812"
X-IronPort-AV: E=Sophos;i="6.02,139,1688454000"; 
   d="scan'208";a="990543812"
Received: from lkp-server02.sh.intel.com (HELO 0a6943a0b3e1) ([10.239.97.151])
  by fmsmga006.fm.intel.com with ESMTP; 12 Sep 2023 09:09:47 -0700
Received: from kbuild by 0a6943a0b3e1 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1qg5xR-0000BM-1f;
	Tue, 12 Sep 2023 16:09:45 +0000
Date: Wed, 13 Sep 2023 00:01:00 +0800
From: kernel test robot <lkp@intel.com>
To: Thomas Gleixner <tglx@linutronix.de>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [tglx-devel:serial 50/74] include/linux/spinlock.h:282:17: warning:
 'irq_flags' is used uninitialized
Message-ID: <202309122341.pTFhN9UL-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hi Thomas,

FYI, the error/warning was bisected to this commit, please ignore it if it's irrelevant.

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/tglx/devel.git serial
head:   75adfb6dc779d7c86a2e31b3ca6b266b8a8ef854
commit: 435fa9a16d39a5838b48b38f956ece91caf759dd [50/74] serial: rda: Use port lock wrappers
config: m68k-allyesconfig (https://download.01.org/0day-ci/archive/20230912/202309122341.pTFhN9UL-lkp@intel.com/config)
compiler: m68k-linux-gcc (GCC) 13.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20230912/202309122341.pTFhN9UL-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202309122341.pTFhN9UL-lkp@intel.com/

All warnings (new ones prefixed by >>):

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
   In file included from arch/m68k/include/asm/atomic.h:6,
                    from include/linux/atomic.h:7,
                    from include/linux/cpumask.h:13,
                    from include/linux/smp.h:13,
                    from include/linux/lockdep.h:14,
                    from include/linux/mutex.h:17,
                    from include/linux/notifier.h:14:
   include/linux/irqflags.h:179:23: warning: assignment to 'long unsigned int *' from 'long unsigned int' makes pointer from integer without a cast [-Wint-conversion]
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
   include/linux/typecheck.h:12:25: warning: comparison of distinct pointer types lacks a cast
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
   In file included from include/linux/irqflags.h:17:
   arch/m68k/include/asm/irqflags.h:61:57: note: expected 'long unsigned int' but argument is of type 'long unsigned int *'
      61 | static inline void arch_local_irq_restore(unsigned long flags)
         |                                           ~~~~~~~~~~~~~~^~~~~
   In function 'spin_unlock_irqrestore',
       inlined from 'uart_port_unlock_irqrestore' at include/linux/serial_core.h:667:2,
       inlined from 'rda_uart_tx_empty' at drivers/tty/serial/rda-uart.c:147:2:
   include/linux/spinlock.h:282:17: warning: 'flags' is used uninitialized [-Wuninitialized]
     282 |                 _raw_spin_unlock_irqrestore(lock, flags);       \
         |                 ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/spinlock.h:406:9: note: in expansion of macro 'raw_spin_unlock_irqrestore'
     406 |         raw_spin_unlock_irqrestore(&lock->rlock, flags);
         |         ^~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/tty/serial/rda-uart.c: In function 'rda_uart_tx_empty':
   drivers/tty/serial/rda-uart.c:138:23: note: 'flags' was declared here
     138 |         unsigned long flags;
         |                       ^~~~~
   In function 'spin_unlock_irqrestore',
       inlined from 'uart_port_unlock_irqrestore' at include/linux/serial_core.h:667:2,
       inlined from 'rda_uart_config_port' at drivers/tty/serial/rda-uart.c:526:2:
>> include/linux/spinlock.h:282:17: warning: 'irq_flags' is used uninitialized [-Wuninitialized]
     282 |                 _raw_spin_unlock_irqrestore(lock, flags);       \
         |                 ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/spinlock.h:406:9: note: in expansion of macro 'raw_spin_unlock_irqrestore'
     406 |         raw_spin_unlock_irqrestore(&lock->rlock, flags);
         |         ^~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/tty/serial/rda-uart.c: In function 'rda_uart_config_port':
   drivers/tty/serial/rda-uart.c:511:23: note: 'irq_flags' was declared here
     511 |         unsigned long irq_flags;
         |                       ^~~~~~~~~
   In function 'spin_unlock_irqrestore',
       inlined from 'uart_port_unlock_irqrestore' at include/linux/serial_core.h:667:2,
       inlined from 'rda_uart_shutdown' at drivers/tty/serial/rda-uart.c:478:2:
   include/linux/spinlock.h:282:17: warning: 'flags' is used uninitialized [-Wuninitialized]
     282 |                 _raw_spin_unlock_irqrestore(lock, flags);       \
         |                 ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/spinlock.h:406:9: note: in expansion of macro 'raw_spin_unlock_irqrestore'
     406 |         raw_spin_unlock_irqrestore(&lock->rlock, flags);
         |         ^~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/tty/serial/rda-uart.c: In function 'rda_uart_shutdown':
   drivers/tty/serial/rda-uart.c:466:23: note: 'flags' was declared here
     466 |         unsigned long flags;
         |                       ^~~~~
   In function 'spin_unlock_irqrestore',
       inlined from 'uart_port_unlock_irqrestore' at include/linux/serial_core.h:667:2,
       inlined from 'rda_uart_startup' at drivers/tty/serial/rda-uart.c:441:2:
   include/linux/spinlock.h:282:17: warning: 'flags' is used uninitialized [-Wuninitialized]
     282 |                 _raw_spin_unlock_irqrestore(lock, flags);       \
         |                 ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/spinlock.h:406:9: note: in expansion of macro 'raw_spin_unlock_irqrestore'
     406 |         raw_spin_unlock_irqrestore(&lock->rlock, flags);
         |         ^~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/tty/serial/rda-uart.c: In function 'rda_uart_startup':
   drivers/tty/serial/rda-uart.c:435:23: note: 'flags' was declared here
     435 |         unsigned long flags;
         |                       ^~~~~
   In function 'spin_unlock_irqrestore',
       inlined from 'uart_port_unlock_irqrestore' at include/linux/serial_core.h:667:2,
       inlined from 'rda_uart_set_termios' at drivers/tty/serial/rda-uart.c:328:2:
   include/linux/spinlock.h:282:17: warning: 'flags' is used uninitialized [-Wuninitialized]
     282 |                 _raw_spin_unlock_irqrestore(lock, flags);       \
         |                 ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/spinlock.h:406:9: note: in expansion of macro 'raw_spin_unlock_irqrestore'
     406 |         raw_spin_unlock_irqrestore(&lock->rlock, flags);
         |         ^~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/tty/serial/rda-uart.c: In function 'rda_uart_set_termios':
   drivers/tty/serial/rda-uart.c:244:23: note: 'flags' was declared here
     244 |         unsigned long flags;
         |                       ^~~~~
   In function 'spin_unlock_irqrestore',
       inlined from 'uart_port_unlock_irqrestore' at include/linux/serial_core.h:667:2,
       inlined from 'rda_interrupt' at drivers/tty/serial/rda-uart.c:428:2:
   include/linux/spinlock.h:282:17: warning: 'flags' is used uninitialized [-Wuninitialized]
     282 |                 _raw_spin_unlock_irqrestore(lock, flags);       \
         |                 ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/spinlock.h:406:9: note: in expansion of macro 'raw_spin_unlock_irqrestore'
     406 |         raw_spin_unlock_irqrestore(&lock->rlock, flags);
         |         ^~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/tty/serial/rda-uart.c: In function 'rda_interrupt':
   drivers/tty/serial/rda-uart.c:408:23: note: 'flags' was declared here
     408 |         unsigned long flags;
         |                       ^~~~~


vim +/irq_flags +282 include/linux/spinlock.h

^1da177e4c3f415 Linus Torvalds  2005-04-16  278  
c2f21ce2e31286a Thomas Gleixner 2009-12-02  279  #define raw_spin_unlock_irqrestore(lock, flags)		\
3f307891ce0e7b0 Steven Rostedt  2008-07-25  280  	do {							\
3f307891ce0e7b0 Steven Rostedt  2008-07-25  281  		typecheck(unsigned long, flags);		\
9c1721aa4994f66 Thomas Gleixner 2009-12-03 @282  		_raw_spin_unlock_irqrestore(lock, flags);	\
3f307891ce0e7b0 Steven Rostedt  2008-07-25  283  	} while (0)
9c1721aa4994f66 Thomas Gleixner 2009-12-03  284  #define raw_spin_unlock_bh(lock)	_raw_spin_unlock_bh(lock)
^1da177e4c3f415 Linus Torvalds  2005-04-16  285  

:::::: The code at line 282 was first introduced by commit
:::::: 9c1721aa4994f6625decbd915241f3a94ee2fe67 locking: Cleanup the name space completely

:::::: TO: Thomas Gleixner <tglx@linutronix.de>
:::::: CC: Thomas Gleixner <tglx@linutronix.de>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
