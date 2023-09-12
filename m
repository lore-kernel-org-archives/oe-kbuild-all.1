Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DC26C1C06
	for <oe-kbuild-all@lists.linux.dev>; Tue, 12 Sep 2023 17:05:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1694538302; x=1726074302;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=bf0jgKqYLgJjBA3pWVqMn/thf3H4Yw65RwmqC9ZerJo=;
  b=EcF1kXjshaAqpxFvmTfelp3ynIqENrQNsEQoX0UW+SICjnkM33I20mI5
   8/lqUp3PdkeQP1i46TyDB2KbuBpTyQLwZmSyibT7RQ9Sj53RVfQc01Pub
   Cf1Bcb1I3RfegwlrNtX/Mmheg9MKCRpo7plBb1C5OeKK7tGGmERdG2uus
   ZUJCVyU/ROpr0oKzRLPLbE2M4QNM5CmVMmNtWqVgHPs3CWCioIBb0Jyan
   lXw3/bj4YVEqi1IA/UbuVGdbNbyDaK58oXM4Sfg+KRS4z8RwmoLfktTFs
   gCGJ7CQ9dpu8sv9/nH+KX/AT6sdMEVEb+Nw9ROcrk3xZtn3mxDwGaP+GY
   Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10831"; a="464812674"
X-IronPort-AV: E=Sophos;i="6.02,139,1688454000"; 
   d="scan'208";a="464812674"
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
  by fmsmga105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 12 Sep 2023 10:05:01 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10831"; a="858883183"
X-IronPort-AV: E=Sophos;i="6.02,139,1688454000"; 
   d="scan'208";a="858883183"
Received: from lkp-server02.sh.intel.com (HELO 47e905db7d2b) ([10.239.97.151])
  by fmsmga002.fm.intel.com with ESMTP; 12 Sep 2023 10:05:00 -0700
Received: from kbuild by 47e905db7d2b with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1qg6os-000017-2Z;
	Tue, 12 Sep 2023 17:04:58 +0000
Date: Wed, 13 Sep 2023 01:03:59 +0800
From: kernel test robot <lkp@intel.com>
To: Thomas Gleixner <tglx@linutronix.de>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [tglx-devel:serial 55/74] include/linux/spinlock.h:282:17: warning:
 'irqflags' is used uninitialized
Message-ID: <202309130001.M9w9avP4-lkp@intel.com>
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
commit: 24a6950a9b9f4f314896b70c7836b2831c938aff [55/74] serial: sc16is7xx: Use port lock wrappers
config: m68k-allyesconfig (https://download.01.org/0day-ci/archive/20230913/202309130001.M9w9avP4-lkp@intel.com/config)
compiler: m68k-linux-gcc (GCC) 13.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20230913/202309130001.M9w9avP4-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202309130001.M9w9avP4-lkp@intel.com/

All warnings (new ones prefixed by >>):

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
       inlined from 'sc16is7xx_unthrottle' at drivers/tty/serial/sc16is7xx.c:977:2:
   include/linux/spinlock.h:282:17: warning: 'flags' is used uninitialized [-Wuninitialized]
     282 |                 _raw_spin_unlock_irqrestore(lock, flags);       \
         |                 ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/spinlock.h:406:9: note: in expansion of macro 'raw_spin_unlock_irqrestore'
     406 |         raw_spin_unlock_irqrestore(&lock->rlock, flags);
         |         ^~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/tty/serial/sc16is7xx.c: In function 'sc16is7xx_unthrottle':
   drivers/tty/serial/sc16is7xx.c:973:23: note: 'flags' was declared here
     973 |         unsigned long flags;
         |                       ^~~~~
   In function 'spin_unlock_irqrestore',
       inlined from 'uart_port_unlock_irqrestore' at include/linux/serial_core.h:667:2,
       inlined from 'sc16is7xx_throttle' at drivers/tty/serial/sc16is7xx.c:968:2:
   include/linux/spinlock.h:282:17: warning: 'flags' is used uninitialized [-Wuninitialized]
     282 |                 _raw_spin_unlock_irqrestore(lock, flags);       \
         |                 ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/spinlock.h:406:9: note: in expansion of macro 'raw_spin_unlock_irqrestore'
     406 |         raw_spin_unlock_irqrestore(&lock->rlock, flags);
         |         ^~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/tty/serial/sc16is7xx.c: In function 'sc16is7xx_throttle':
   drivers/tty/serial/sc16is7xx.c:959:23: note: 'flags' was declared here
     959 |         unsigned long flags;
         |                       ^~~~~
   In function 'spin_unlock_irqrestore',
       inlined from 'uart_port_unlock_irqrestore' at include/linux/serial_core.h:667:2,
       inlined from 'sc16is7xx_tx_proc' at drivers/tty/serial/sc16is7xx.c:828:2:
   include/linux/spinlock.h:282:17: warning: 'flags' is used uninitialized [-Wuninitialized]
     282 |                 _raw_spin_unlock_irqrestore(lock, flags);       \
         |                 ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/spinlock.h:406:9: note: in expansion of macro 'raw_spin_unlock_irqrestore'
     406 |         raw_spin_unlock_irqrestore(&lock->rlock, flags);
         |         ^~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/tty/serial/sc16is7xx.c: In function 'sc16is7xx_tx_proc':
   drivers/tty/serial/sc16is7xx.c:816:23: note: 'flags' was declared here
     816 |         unsigned long flags;
         |                       ^~~~~
   In function 'spin_unlock_irqrestore',
       inlined from 'uart_port_unlock_irqrestore' at include/linux/serial_core.h:667:2,
       inlined from 'sc16is7xx_startup' at drivers/tty/serial/sc16is7xx.c:1213:2:
   include/linux/spinlock.h:282:17: warning: 'flags' is used uninitialized [-Wuninitialized]
     282 |                 _raw_spin_unlock_irqrestore(lock, flags);       \
         |                 ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/spinlock.h:406:9: note: in expansion of macro 'raw_spin_unlock_irqrestore'
     406 |         raw_spin_unlock_irqrestore(&lock->rlock, flags);
         |         ^~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/tty/serial/sc16is7xx.c: In function 'sc16is7xx_startup':
   drivers/tty/serial/sc16is7xx.c:1154:23: note: 'flags' was declared here
    1154 |         unsigned long flags;
         |                       ^~~~~
   In function 'spin_unlock_irqrestore',
       inlined from 'uart_port_unlock_irqrestore' at include/linux/serial_core.h:667:2,
       inlined from 'sc16is7xx_reg_proc' at drivers/tty/serial/sc16is7xx.c:860:2:
>> include/linux/spinlock.h:282:17: warning: 'irqflags' is used uninitialized [-Wuninitialized]
     282 |                 _raw_spin_unlock_irqrestore(lock, flags);       \
         |                 ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/spinlock.h:406:9: note: in expansion of macro 'raw_spin_unlock_irqrestore'
     406 |         raw_spin_unlock_irqrestore(&lock->rlock, flags);
         |         ^~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/tty/serial/sc16is7xx.c: In function 'sc16is7xx_reg_proc':
   drivers/tty/serial/sc16is7xx.c:855:23: note: 'irqflags' was declared here
     855 |         unsigned long irqflags;
         |                       ^~~~~~~~
   In function 'spin_unlock_irqrestore',
       inlined from 'uart_port_unlock_irqrestore' at include/linux/serial_core.h:667:2,
       inlined from 'sc16is7xx_set_termios' at drivers/tty/serial/sc16is7xx.c:1124:2:
   include/linux/spinlock.h:282:17: warning: 'flags' is used uninitialized [-Wuninitialized]
     282 |                 _raw_spin_unlock_irqrestore(lock, flags);       \
         |                 ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/spinlock.h:406:9: note: in expansion of macro 'raw_spin_unlock_irqrestore'
     406 |         raw_spin_unlock_irqrestore(&lock->rlock, flags);
         |         ^~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/tty/serial/sc16is7xx.c: In function 'sc16is7xx_set_termios':
   drivers/tty/serial/sc16is7xx.c:1021:23: note: 'flags' was declared here
    1021 |         unsigned long flags;
         |                       ^~~~~


vim +/irqflags +282 include/linux/spinlock.h

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
