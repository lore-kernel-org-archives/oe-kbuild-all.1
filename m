Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2E06EAD49
	for <oe-kbuild-all@lists.linux.dev>; Tue, 12 Sep 2023 16:20:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1694535649; x=1726071649;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=+6V9tbTIKJFpIFptoQTGqmYoPMAIGmpA8RmsR6fD+BY=;
  b=i4d+b3d/bfVKWDlEhaUzVLsS4SlvZajnbsRPTqkrfE+nqADZzp9bsPl3
   2zvKTEf2rBJq7S/m3xvZo4o9t25+j+qXs49pMYAZpmDq6AtQyUqoT5g9R
   Ie1T64WYKy3EFvI9qG9byWpFR+bwrM5OOPOJlRlN2pJLHABV1LM2cDyDv
   dlk22S52gRAqU7NJlp77mAIVXOXI0WaXGuQ26cBwlE3wyM/IZ9fvh2rcl
   pyqadEeKs/17euAy9TlWsfF7g454eoHr1c161WUdhvWDHs1EQ1a9DjfCN
   x3MHVNMi4FuxmVv8WwAhJ96iAX2X+XXyw2YjvozYP+2jhD3XXtYmhWRmh
   w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10831"; a="357858873"
X-IronPort-AV: E=Sophos;i="6.02,139,1688454000"; 
   d="scan'208";a="357858873"
Received: from orsmga007.jf.intel.com ([10.7.209.58])
  by fmsmga106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 12 Sep 2023 09:20:48 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10831"; a="737173359"
X-IronPort-AV: E=Sophos;i="6.02,139,1688454000"; 
   d="scan'208";a="737173359"
Received: from lkp-server02.sh.intel.com (HELO 0a6943a0b3e1) ([10.239.97.151])
  by orsmga007.jf.intel.com with ESMTP; 12 Sep 2023 09:20:46 -0700
Received: from kbuild by 0a6943a0b3e1 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1qg680-0000EA-0v;
	Tue, 12 Sep 2023 16:20:41 +0000
Date: Wed, 13 Sep 2023 00:11:22 +0800
From: kernel test robot <lkp@intel.com>
To: Thomas Gleixner <tglx@linutronix.de>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [tglx-devel:serial 5/74]
 arch/arc/include/asm/irqflags-compact.h:87:9: warning: 'flags' is used
 uninitialized
Message-ID: <202309130042.a5NKTfI3-lkp@intel.com>
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
commit: 4a28d2af5e30aa4598ff584be8a3bf9131592820 [5/74] serial: 8250_bcm7271: Use port lock wrappers
config: arc-randconfig-r013-20230912 (https://download.01.org/0day-ci/archive/20230913/202309130042.a5NKTfI3-lkp@intel.com/config)
compiler: arc-elf-gcc (GCC) 13.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20230913/202309130042.a5NKTfI3-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202309130042.a5NKTfI3-lkp@intel.com/

All warnings (new ones prefixed by >>):

                    from include/linux/bitops.h:68:
   include/linux/irqflags.h:179:23: warning: assignment to 'long unsigned int *' from 'long int' makes pointer from integer without a cast [-Wint-conversion]
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
   include/linux/irqflags.h:179:23: warning: assignment to 'long unsigned int *' from 'long int' makes pointer from integer without a cast [-Wint-conversion]
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
   In file included from arch/arc/include/asm/irqflags.h:11,
                    from include/linux/irqflags.h:17:
   arch/arc/include/asm/irqflags-compact.h:84:57: note: expected 'long unsigned int' but argument is of type 'long unsigned int *'
      84 | static inline void arch_local_irq_restore(unsigned long flags)
         |                                           ~~~~~~~~~~~~~~^~~~~
   In function 'arch_local_irq_restore',
       inlined from 'spin_unlock_irqrestore' at include/linux/spinlock.h:406:2,
       inlined from 'uart_port_unlock_irqrestore' at include/linux/serial_core.h:667:2,
       inlined from 'brcmuart_shutdown' at drivers/tty/serial/8250/8250_bcm7271.c:648:2:
>> arch/arc/include/asm/irqflags-compact.h:87:9: warning: 'flags' is used uninitialized [-Wuninitialized]
      87 |         __asm__ __volatile__(
         |         ^~~~~~~
   drivers/tty/serial/8250/8250_bcm7271.c: In function 'brcmuart_shutdown':
   drivers/tty/serial/8250/8250_bcm7271.c:630:23: note: 'flags' was declared here
     630 |         unsigned long flags;
         |                       ^~~~~


vim +/flags +87 arch/arc/include/asm/irqflags-compact.h

5793e273a13433 Vineet Gupta 2015-03-05  86  
5793e273a13433 Vineet Gupta 2015-03-05 @87  	__asm__ __volatile__(
5793e273a13433 Vineet Gupta 2015-03-05  88  	"	flag %0			\n"
5793e273a13433 Vineet Gupta 2015-03-05  89  	:
5793e273a13433 Vineet Gupta 2015-03-05  90  	: "r"(flags)
5793e273a13433 Vineet Gupta 2015-03-05  91  	: "memory");
5793e273a13433 Vineet Gupta 2015-03-05  92  }
5793e273a13433 Vineet Gupta 2015-03-05  93  

:::::: The code at line 87 was first introduced by commit
:::::: 5793e273a134331d05ed904e5be3b31ccfca54c1 ARC: intc: split into ARCompact ISA specific, common bits

:::::: TO: Vineet Gupta <vgupta@synopsys.com>
:::::: CC: Vineet Gupta <vgupta@synopsys.com>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
