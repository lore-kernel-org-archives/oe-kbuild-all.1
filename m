Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.20])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 747E47F0
	for <oe-kbuild-all@lists.linux.dev>; Tue, 12 Sep 2023 16:54:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1694537683; x=1726073683;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=iZU57jnUNnzBsSR+Fg5M1BDJ7pv2kR1jI6aMe5dnOFU=;
  b=lhmQpisOfPK/iZE31qzNyC7h8tcnjEEHrX98AfLY6I7OsRSi70iTOo1j
   9ru5Wim/tIMSZk/cA0e9cvfXdi4cYB+gYX5dZIFVWtVRRV07p/xc04wQQ
   jGJ7f6BXxGL8+YJRXplcNAKhf6ybbBTty/9noRFpfbwODRVcfTaHf+Jsw
   wUO+aPQCp0CR2DqBNVFZ9oZLLy74yasD+tr0/+mhyc8q3Cu+qW4K3VL6R
   wndfIUuzy8Bvfr0Epa3Mg7OrClzXPMZi8pK2Rhb237OzTwS8ekQusq+uv
   bksHYiYZIaLCAkYMhTXcoQnrdEvS8Z/JsszusXjjhjmJKuqC/glEYSPNj
   A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10831"; a="368704603"
X-IronPort-AV: E=Sophos;i="6.02,139,1688454000"; 
   d="scan'208";a="368704603"
Received: from orsmga008.jf.intel.com ([10.7.209.65])
  by orsmga101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 12 Sep 2023 09:53:44 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10831"; a="773111593"
X-IronPort-AV: E=Sophos;i="6.02,139,1688454000"; 
   d="scan'208";a="773111593"
Received: from lkp-server02.sh.intel.com (HELO 0a6943a0b3e1) ([10.239.97.151])
  by orsmga008.jf.intel.com with ESMTP; 12 Sep 2023 09:53:43 -0700
Received: from kbuild by 0a6943a0b3e1 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1qg6dq-0000Hh-2j;
	Tue, 12 Sep 2023 16:53:36 +0000
Date: Wed, 13 Sep 2023 00:53:28 +0800
From: kernel test robot <lkp@intel.com>
To: Thomas Gleixner <tglx@linutronix.de>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [tglx-devel:serial 55/74]
 arch/arc/include/asm/irqflags-compact.h:87:9: warning: 'irqflags' is used
 uninitialized
Message-ID: <202309130006.q26csOz1-lkp@intel.com>
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
config: arc-randconfig-r013-20230912 (https://download.01.org/0day-ci/archive/20230913/202309130006.q26csOz1-lkp@intel.com/config)
compiler: arc-elf-gcc (GCC) 13.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20230913/202309130006.q26csOz1-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202309130006.q26csOz1-lkp@intel.com/

All warnings (new ones prefixed by >>):

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
       inlined from 'sc16is7xx_throttle' at drivers/tty/serial/sc16is7xx.c:968:2:
   arch/arc/include/asm/irqflags-compact.h:87:9: warning: 'flags' is used uninitialized [-Wuninitialized]
      87 |         __asm__ __volatile__(
         |         ^~~~~~~
   drivers/tty/serial/sc16is7xx.c: In function 'sc16is7xx_throttle':
   drivers/tty/serial/sc16is7xx.c:959:23: note: 'flags' was declared here
     959 |         unsigned long flags;
         |                       ^~~~~
   In function 'arch_local_irq_restore',
       inlined from 'spin_unlock_irqrestore' at include/linux/spinlock.h:406:2,
       inlined from 'uart_port_unlock_irqrestore' at include/linux/serial_core.h:667:2,
       inlined from 'sc16is7xx_unthrottle' at drivers/tty/serial/sc16is7xx.c:977:2:
   arch/arc/include/asm/irqflags-compact.h:87:9: warning: 'flags' is used uninitialized [-Wuninitialized]
      87 |         __asm__ __volatile__(
         |         ^~~~~~~
   drivers/tty/serial/sc16is7xx.c: In function 'sc16is7xx_unthrottle':
   drivers/tty/serial/sc16is7xx.c:973:23: note: 'flags' was declared here
     973 |         unsigned long flags;
         |                       ^~~~~
   In function 'arch_local_irq_restore',
       inlined from 'spin_unlock_irqrestore' at include/linux/spinlock.h:406:2,
       inlined from 'uart_port_unlock_irqrestore' at include/linux/serial_core.h:667:2,
       inlined from 'sc16is7xx_tx_proc' at drivers/tty/serial/sc16is7xx.c:828:2:
   arch/arc/include/asm/irqflags-compact.h:87:9: warning: 'flags' is used uninitialized [-Wuninitialized]
      87 |         __asm__ __volatile__(
         |         ^~~~~~~
   drivers/tty/serial/sc16is7xx.c: In function 'sc16is7xx_tx_proc':
   drivers/tty/serial/sc16is7xx.c:816:23: note: 'flags' was declared here
     816 |         unsigned long flags;
         |                       ^~~~~
   In function 'arch_local_irq_restore',
       inlined from 'spin_unlock_irqrestore' at include/linux/spinlock.h:406:2,
       inlined from 'uart_port_unlock_irqrestore' at include/linux/serial_core.h:667:2,
       inlined from 'sc16is7xx_reg_proc' at drivers/tty/serial/sc16is7xx.c:860:2:
>> arch/arc/include/asm/irqflags-compact.h:87:9: warning: 'irqflags' is used uninitialized [-Wuninitialized]
      87 |         __asm__ __volatile__(
         |         ^~~~~~~
   drivers/tty/serial/sc16is7xx.c: In function 'sc16is7xx_reg_proc':
   drivers/tty/serial/sc16is7xx.c:855:23: note: 'irqflags' was declared here
     855 |         unsigned long irqflags;
         |                       ^~~~~~~~
   In function 'arch_local_irq_restore',
       inlined from 'spin_unlock_irqrestore' at include/linux/spinlock.h:406:2,
       inlined from 'uart_port_unlock_irqrestore' at include/linux/serial_core.h:667:2,
       inlined from 'sc16is7xx_startup' at drivers/tty/serial/sc16is7xx.c:1213:2:
   arch/arc/include/asm/irqflags-compact.h:87:9: warning: 'flags' is used uninitialized [-Wuninitialized]
      87 |         __asm__ __volatile__(
         |         ^~~~~~~
   drivers/tty/serial/sc16is7xx.c: In function 'sc16is7xx_startup':
   drivers/tty/serial/sc16is7xx.c:1154:23: note: 'flags' was declared here
    1154 |         unsigned long flags;
         |                       ^~~~~
   In function 'arch_local_irq_restore',
       inlined from 'spin_unlock_irqrestore' at include/linux/spinlock.h:406:2,
       inlined from 'uart_port_unlock_irqrestore' at include/linux/serial_core.h:667:2,
       inlined from 'sc16is7xx_set_termios' at drivers/tty/serial/sc16is7xx.c:1124:2:
   arch/arc/include/asm/irqflags-compact.h:87:9: warning: 'flags' is used uninitialized [-Wuninitialized]
      87 |         __asm__ __volatile__(
         |         ^~~~~~~
   drivers/tty/serial/sc16is7xx.c: In function 'sc16is7xx_set_termios':
   drivers/tty/serial/sc16is7xx.c:1021:23: note: 'flags' was declared here
    1021 |         unsigned long flags;
         |                       ^~~~~


vim +/irqflags +87 arch/arc/include/asm/irqflags-compact.h

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
