Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8E53C377
	for <oe-kbuild-all@lists.linux.dev>; Tue, 12 Sep 2023 14:23:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1694528586; x=1726064586;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=NHN6Hf5l677vjphsYHBvKeML7dGIocA/TdkQ/aUeJrs=;
  b=bYdeLpEf6A8EaDZ3NtkLX/5/f2tpDhAwElAYUijdicpRacNhlcq1YQfs
   B0fAfcFZG3L4lvzpmp+ywvXQ4/T3FwNYfn8RTRoMkGjVpyp/jtDmWceV/
   pL1ZAjK9MrcANYHZdarVRAA/gO6JNFlnx4xgZCdLdYcK2f1BIA+T4lsdf
   a2tcUiCR8YRg5qV0YRwQ9qgsdJ259SDezSfgW9JHw5hEE18znuy4gZ8mj
   pxZ1Og0H+pcjce4nlGIobNgmbTJVehQ5wRtiyOrrChZTR/IQukQnB/V/A
   j8RkeVfRMTixC7R8gfL5rsF54WDt2kYTRT9ldtrZKiRI2e/zeRGwMseVA
   A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10831"; a="377303053"
X-IronPort-AV: E=Sophos;i="6.02,139,1688454000"; 
   d="scan'208";a="377303053"
Received: from fmsmga008.fm.intel.com ([10.253.24.58])
  by fmsmga104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 12 Sep 2023 07:23:05 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10831"; a="809282328"
X-IronPort-AV: E=Sophos;i="6.02,139,1688454000"; 
   d="scan'208";a="809282328"
Received: from lkp-server02.sh.intel.com (HELO 0a6943a0b3e1) ([10.239.97.151])
  by fmsmga008.fm.intel.com with ESMTP; 12 Sep 2023 07:23:04 -0700
Received: from kbuild by 0a6943a0b3e1 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1qg4IA-00004H-16;
	Tue, 12 Sep 2023 14:23:02 +0000
Date: Tue, 12 Sep 2023 22:22:41 +0800
From: kernel test robot <lkp@intel.com>
To: Thomas Gleixner <tglx@linutronix.de>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [tglx-devel:serial 31/74] include/linux/spinlock.h:282:17: warning:
 'lock_flags' is used uninitialized
Message-ID: <202309122240.kuHI8OxB-lkp@intel.com>
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
commit: a991e11b25feae9b35ad15c92a7e0b1d7fc5b7e2 [31/74] serial: jsm: Use port lock wrappers
config: alpha-allyesconfig (https://download.01.org/0day-ci/archive/20230912/202309122240.kuHI8OxB-lkp@intel.com/config)
compiler: alpha-linux-gcc (GCC) 13.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20230912/202309122240.kuHI8OxB-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202309122240.kuHI8OxB-lkp@intel.com/

All warnings (new ones prefixed by >>):

                    from drivers/tty/serial/jsm/jsm_tty.c:14:
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
   In file included from include/linux/spinlock.h:59:
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
   arch/alpha/include/asm/irqflags.h:51:57: note: expected 'long unsigned int' but argument is of type 'long unsigned int *'
      51 | static inline void arch_local_irq_restore(unsigned long flags)
         |                                           ~~~~~~~~~~~~~~^~~~~
   In function 'spin_unlock_irqrestore',
       inlined from 'uart_port_unlock_irqrestore' at include/linux/serial_core.h:667:2,
       inlined from 'jsm_tty_send_xchar' at drivers/tty/serial/jsm/jsm_tty.c:162:2:
>> include/linux/spinlock.h:282:17: warning: 'lock_flags' is used uninitialized [-Wuninitialized]
     282 |                 _raw_spin_unlock_irqrestore(lock, flags);       \
         |                 ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/spinlock.h:406:9: note: in expansion of macro 'raw_spin_unlock_irqrestore'
     406 |         raw_spin_unlock_irqrestore(&lock->rlock, flags);
         |         ^~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/tty/serial/jsm/jsm_tty.c: In function 'jsm_tty_send_xchar':
   drivers/tty/serial/jsm/jsm_tty.c:150:23: note: 'lock_flags' was declared here
     150 |         unsigned long lock_flags;
         |                       ^~~~~~~~~~
   In function 'spin_unlock_irqrestore',
       inlined from 'uart_port_unlock_irqrestore' at include/linux/serial_core.h:667:2,
       inlined from 'jsm_tty_break' at drivers/tty/serial/jsm/jsm_tty.c:185:2:
>> include/linux/spinlock.h:282:17: warning: 'lock_flags' is used uninitialized [-Wuninitialized]
     282 |                 _raw_spin_unlock_irqrestore(lock, flags);       \
         |                 ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/spinlock.h:406:9: note: in expansion of macro 'raw_spin_unlock_irqrestore'
     406 |         raw_spin_unlock_irqrestore(&lock->rlock, flags);
         |         ^~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/tty/serial/jsm/jsm_tty.c: In function 'jsm_tty_break':
   drivers/tty/serial/jsm/jsm_tty.c:175:23: note: 'lock_flags' was declared here
     175 |         unsigned long lock_flags;
         |                       ^~~~~~~~~~
   In function 'spin_unlock_irqrestore',
       inlined from 'uart_port_unlock_irqrestore' at include/linux/serial_core.h:667:2,
       inlined from 'jsm_tty_set_termios' at drivers/tty/serial/jsm/jsm_tty.c:320:2:
>> include/linux/spinlock.h:282:17: warning: 'lock_flags' is used uninitialized [-Wuninitialized]
     282 |                 _raw_spin_unlock_irqrestore(lock, flags);       \
         |                 ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/spinlock.h:406:9: note: in expansion of macro 'raw_spin_unlock_irqrestore'
     406 |         raw_spin_unlock_irqrestore(&lock->rlock, flags);
         |         ^~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/tty/serial/jsm/jsm_tty.c: In function 'jsm_tty_set_termios':
   drivers/tty/serial/jsm/jsm_tty.c:306:23: note: 'lock_flags' was declared here
     306 |         unsigned long lock_flags;
         |                       ^~~~~~~~~~


vim +/lock_flags +282 include/linux/spinlock.h

^1da177e4c3f41 Linus Torvalds  2005-04-16  278  
c2f21ce2e31286 Thomas Gleixner 2009-12-02  279  #define raw_spin_unlock_irqrestore(lock, flags)		\
3f307891ce0e7b Steven Rostedt  2008-07-25  280  	do {							\
3f307891ce0e7b Steven Rostedt  2008-07-25  281  		typecheck(unsigned long, flags);		\
9c1721aa4994f6 Thomas Gleixner 2009-12-03 @282  		_raw_spin_unlock_irqrestore(lock, flags);	\
3f307891ce0e7b Steven Rostedt  2008-07-25  283  	} while (0)
9c1721aa4994f6 Thomas Gleixner 2009-12-03  284  #define raw_spin_unlock_bh(lock)	_raw_spin_unlock_bh(lock)
^1da177e4c3f41 Linus Torvalds  2005-04-16  285  

:::::: The code at line 282 was first introduced by commit
:::::: 9c1721aa4994f6625decbd915241f3a94ee2fe67 locking: Cleanup the name space completely

:::::: TO: Thomas Gleixner <tglx@linutronix.de>
:::::: CC: Thomas Gleixner <tglx@linutronix.de>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
