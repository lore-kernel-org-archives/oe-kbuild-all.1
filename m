Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.10])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0AB857FB
	for <oe-kbuild-all@lists.linux.dev>; Sat, 30 Mar 2024 07:03:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.10
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1711782207; cv=none; b=upMRNUkBO1Ah6sQtNP2A9FwNsQqeZduNyD6uKrCeBx3M267DmanQAhwkRGa8dqQHaTRe9bANvFICEUVyI4Z7/z1QEyuFPOaH8Dh9LjN40ZzRxTPWIl5v8+RWsT0qjNJM/si5pbZGPQLDsVcEdl0K73hfdGH24XqBxT1e+3iJ9LI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1711782207; c=relaxed/simple;
	bh=nzQE3w0S8SizMWryd4jveC9pYiJtCHItO4EnZSZmwpc=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=sFbVKfWXGbgd7badGGWgJJnAepkizQGZd5ziI04HqLaT65Maf1KDzvGPBRMZjQWH6eTaUZ0qeKAYrs+WevhpyAjQoxpPhuhYcNHtbszTqoSOPZ8fTca0Cd8r5S5C7klYtWeEtssItH/UtkpQHrGhNsRkRpQfGaMBcKQUe4RP5Nk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=lGWDaZT0; arc=none smtp.client-ip=198.175.65.10
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="lGWDaZT0"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1711782205; x=1743318205;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=nzQE3w0S8SizMWryd4jveC9pYiJtCHItO4EnZSZmwpc=;
  b=lGWDaZT0fPZ6MciU7AOYuJv+CgyVZ3f3gZjVzGFFhUY0ucz+r3Te3OEw
   dn4a9wO3jG2lE7cdVZSxAhH9Nmflc1oEWNn2fNIs3w+1fpLznOE1t3wrJ
   YF4mofjwTbPgTqvXK/DHQH/IuHAAre/ssnsnDMOE7dR5eMAKyt22KJdFS
   yWeQnMxCrhQ3iiIVbz2VRdtq+QKHVBUoRJo1xk2a3AmaUXhTFl81HoJEL
   TzoUjvu2fHPDGDfPkXpkZ6FJRK+xSJTrz1Ut8avh84tiJbkjKn4GZ9K3t
   lCVUZCzNWN1y6yGeyi9Ts8rfKxfdGzUpxwRv9Iji7ikBxSSBF+GoM4IBz
   w==;
X-CSE-ConnectionGUID: q05lNjjGR62x+fUsJsDvmw==
X-CSE-MsgGUID: PVfapMjmRmWFlUR7PljsRQ==
X-IronPort-AV: E=McAfee;i="6600,9927,11028"; a="24427385"
X-IronPort-AV: E=Sophos;i="6.07,166,1708416000"; 
   d="scan'208";a="24427385"
Received: from orviesa008.jf.intel.com ([10.64.159.148])
  by orvoesa102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 30 Mar 2024 00:03:25 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,166,1708416000"; 
   d="scan'208";a="17806367"
Received: from lkp-server01.sh.intel.com (HELO be39aa325d23) ([10.239.97.150])
  by orviesa008.jf.intel.com with ESMTP; 30 Mar 2024 00:03:23 -0700
Received: from kbuild by be39aa325d23 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1rqSkK-000429-2x;
	Sat, 30 Mar 2024 07:03:20 +0000
Date: Sat, 30 Mar 2024 15:02:50 +0800
From: kernel test robot <lkp@intel.com>
To: Jim Cromie <jim.cromie@gmail.com>,
	=?utf-8?Q?=C5=81ukasz?= Bartosik <ukaszb@chromium.org>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [jimc:dd-fix-classmap-add-trace-1a 64/64] kernel/kcov.c:350:2:
 error: no member named 'ctrl' in 'struct _ddebug'
Message-ID: <202403301436.VhONUiNI-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://github.com/jimc/linux.git dd-fix-classmap-add-trace-1a
head:   9cf8914e3a113c16ba8cd3da48422401f20cfc33
commit: 9cf8914e3a113c16ba8cd3da48422401f20cfc33 [64/64] dyndbg: grind out ctrl
config: um-randconfig-001-20240330 (https://download.01.org/0day-ci/archive/20240330/202403301436.VhONUiNI-lkp@intel.com/config)
compiler: clang version 19.0.0git (https://github.com/llvm/llvm-project 79ba323bdd0843275019e16b6e9b35133677c514)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240330/202403301436.VhONUiNI-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202403301436.VhONUiNI-lkp@intel.com/

All errors (new ones prefixed by >>):

   In file included from kernel/kcov.c:15:
   In file included from include/linux/mm.h:2188:
   include/linux/vmstat.h:522:36: warning: arithmetic between different enumeration types ('enum node_stat_item' and 'enum lru_list') [-Wenum-enum-conversion]
     522 |         return node_stat_name(NR_LRU_BASE + lru) + 3; // skip "nr_"
         |                               ~~~~~~~~~~~ ^ ~~~
>> kernel/kcov.c:350:2: error: no member named 'ctrl' in 'struct _ddebug'
     350 |         kcov_debug("t = %px, size = %u, area = %px\n", t, size, area);
         |         ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   kernel/kcov.c:29:30: note: expanded from macro 'kcov_debug'
      29 | #define kcov_debug(fmt, ...) pr_debug("%s: " fmt, __func__, ##__VA_ARGS__)
         |                              ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/printk.h:579:2: note: expanded from macro 'pr_debug'
     579 |         dynamic_pr_debug(fmt, ##__VA_ARGS__)
         |         ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/dynamic_debug.h:335:2: note: expanded from macro 'dynamic_pr_debug'
     335 |         _dynamic_func_call(fmt, __dynamic_pr_debug,             \
         |         ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
     336 |                            pr_fmt(fmt), ##__VA_ARGS__)
         |                            ~~~~~~~~~~~~~~~~~~~~~~~~~~~
   note: (skipping 2 expansions in backtrace; use -fmacro-backtrace-limit=0 to see all)
   include/linux/dynamic_debug.h:289:6: note: expanded from macro '__dynamic_func_call_cls'
     289 |         if (DYNAMIC_DEBUG_BRANCH(id))                           \
         |             ^                    ~~
   include/linux/dynamic_debug.h:271:22: note: expanded from macro 'DYNAMIC_DEBUG_BRANCH'
     271 |         unlikely(descriptor.ctrl.flags & _DPRINTK_FLAGS_ENABLED)
         |                  ~~~~~~~~~~ ^
   include/linux/compiler.h:77:42: note: expanded from macro 'unlikely'
      77 | # define unlikely(x)    __builtin_expect(!!(x), 0)
         |                                             ^
   kernel/kcov.c:444:2: error: no member named 'ctrl' in 'struct _ddebug'
     444 |         kcov_debug("t = %px, kcov->t = %px\n", t, kcov->t);
         |         ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   kernel/kcov.c:29:30: note: expanded from macro 'kcov_debug'
      29 | #define kcov_debug(fmt, ...) pr_debug("%s: " fmt, __func__, ##__VA_ARGS__)
         |                              ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/printk.h:579:2: note: expanded from macro 'pr_debug'
     579 |         dynamic_pr_debug(fmt, ##__VA_ARGS__)
         |         ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/dynamic_debug.h:335:2: note: expanded from macro 'dynamic_pr_debug'
     335 |         _dynamic_func_call(fmt, __dynamic_pr_debug,             \
         |         ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
     336 |                            pr_fmt(fmt), ##__VA_ARGS__)
         |                            ~~~~~~~~~~~~~~~~~~~~~~~~~~~
   note: (skipping 2 expansions in backtrace; use -fmacro-backtrace-limit=0 to see all)
   include/linux/dynamic_debug.h:289:6: note: expanded from macro '__dynamic_func_call_cls'
     289 |         if (DYNAMIC_DEBUG_BRANCH(id))                           \
         |             ^                    ~~
   include/linux/dynamic_debug.h:271:22: note: expanded from macro 'DYNAMIC_DEBUG_BRANCH'
     271 |         unlikely(descriptor.ctrl.flags & _DPRINTK_FLAGS_ENABLED)
         |                  ~~~~~~~~~~ ^
   include/linux/compiler.h:77:42: note: expanded from macro 'unlikely'
      77 | # define unlikely(x)    __builtin_expect(!!(x), 0)
         |                                             ^
   kernel/kcov.c:630:29: warning: result of comparison of constant 1152921504606846975 with expression of type '__u32' (aka 'unsigned int') is always false [-Wtautological-constant-out-of-range-compare]
     630 |                 if (remote_arg->area_size > LONG_MAX / sizeof(unsigned long))
         |                     ~~~~~~~~~~~~~~~~~~~~~ ^ ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   kernel/kcov.c:881:2: error: no member named 'ctrl' in 'struct _ddebug'
     881 |         kcov_debug("handle = %llx, context: %s\n", handle,
         |         ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
     882 |                         in_task() ? "task" : "softirq");
         |                         ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   kernel/kcov.c:29:30: note: expanded from macro 'kcov_debug'
      29 | #define kcov_debug(fmt, ...) pr_debug("%s: " fmt, __func__, ##__VA_ARGS__)
         |                              ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/printk.h:579:2: note: expanded from macro 'pr_debug'
     579 |         dynamic_pr_debug(fmt, ##__VA_ARGS__)
         |         ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/dynamic_debug.h:335:2: note: expanded from macro 'dynamic_pr_debug'
     335 |         _dynamic_func_call(fmt, __dynamic_pr_debug,             \
         |         ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
     336 |                            pr_fmt(fmt), ##__VA_ARGS__)
         |                            ~~~~~~~~~~~~~~~~~~~~~~~~~~~
   note: (skipping 2 expansions in backtrace; use -fmacro-backtrace-limit=0 to see all)
   include/linux/dynamic_debug.h:289:6: note: expanded from macro '__dynamic_func_call_cls'
     289 |         if (DYNAMIC_DEBUG_BRANCH(id))                           \
         |             ^                    ~~
   include/linux/dynamic_debug.h:271:22: note: expanded from macro 'DYNAMIC_DEBUG_BRANCH'
     271 |         unlikely(descriptor.ctrl.flags & _DPRINTK_FLAGS_ENABLED)
         |                  ~~~~~~~~~~ ^
   include/linux/compiler.h:77:42: note: expanded from macro 'unlikely'
      77 | # define unlikely(x)    __builtin_expect(!!(x), 0)
         |                                             ^
   kernel/kcov.c:935:2: error: no member named 'ctrl' in 'struct _ddebug'
     935 |         kcov_debug("%px %u <= %px %lu\n",
         |         ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
     936 |                 dst_area, dst_area_size, src_area, *(unsigned long *)src_area);
         |                 ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   kernel/kcov.c:29:30: note: expanded from macro 'kcov_debug'
      29 | #define kcov_debug(fmt, ...) pr_debug("%s: " fmt, __func__, ##__VA_ARGS__)
         |                              ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/printk.h:579:2: note: expanded from macro 'pr_debug'
     579 |         dynamic_pr_debug(fmt, ##__VA_ARGS__)
         |         ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/dynamic_debug.h:335:2: note: expanded from macro 'dynamic_pr_debug'
     335 |         _dynamic_func_call(fmt, __dynamic_pr_debug,             \
         |         ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
     336 |                            pr_fmt(fmt), ##__VA_ARGS__)
         |                            ~~~~~~~~~~~~~~~~~~~~~~~~~~~
   note: (skipping 2 expansions in backtrace; use -fmacro-backtrace-limit=0 to see all)
   include/linux/dynamic_debug.h:289:6: note: expanded from macro '__dynamic_func_call_cls'
     289 |         if (DYNAMIC_DEBUG_BRANCH(id))                           \
         |             ^                    ~~
   include/linux/dynamic_debug.h:271:22: note: expanded from macro 'DYNAMIC_DEBUG_BRANCH'
     271 |         unlikely(descriptor.ctrl.flags & _DPRINTK_FLAGS_ENABLED)
         |                  ~~~~~~~~~~ ^
   include/linux/compiler.h:77:42: note: expanded from macro 'unlikely'
--
   In file included from kernel/printk/printk.c:23:
   In file included from include/linux/mm.h:2188:
   include/linux/vmstat.h:522:36: warning: arithmetic between different enumeration types ('enum node_stat_item' and 'enum lru_list') [-Wenum-enum-conversion]
     522 |         return node_stat_name(NR_LRU_BASE + lru) + 3; // skip "nr_"
         |                               ~~~~~~~~~~~ ^ ~~~
   In file included from kernel/printk/printk.c:24:
   In file included from include/linux/tty.h:12:
   In file included from include/linux/tty_port.h:5:
   In file included from include/linux/kfifo.h:42:
   In file included from include/linux/scatterlist.h:9:
   In file included from arch/um/include/asm/io.h:24:
   include/asm-generic/io.h:547:31: warning: performing pointer arithmetic on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
     547 |         val = __raw_readb(PCI_IOBASE + addr);
         |                           ~~~~~~~~~~ ^
   include/asm-generic/io.h:560:61: warning: performing pointer arithmetic on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
     560 |         val = __le16_to_cpu((__le16 __force)__raw_readw(PCI_IOBASE + addr));
         |                                                         ~~~~~~~~~~ ^
   include/uapi/linux/byteorder/little_endian.h:37:51: note: expanded from macro '__le16_to_cpu'
      37 | #define __le16_to_cpu(x) ((__force __u16)(__le16)(x))
         |                                                   ^
   In file included from kernel/printk/printk.c:24:
   In file included from include/linux/tty.h:12:
   In file included from include/linux/tty_port.h:5:
   In file included from include/linux/kfifo.h:42:
   In file included from include/linux/scatterlist.h:9:
   In file included from arch/um/include/asm/io.h:24:
   include/asm-generic/io.h:573:61: warning: performing pointer arithmetic on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
     573 |         val = __le32_to_cpu((__le32 __force)__raw_readl(PCI_IOBASE + addr));
         |                                                         ~~~~~~~~~~ ^
   include/uapi/linux/byteorder/little_endian.h:35:51: note: expanded from macro '__le32_to_cpu'
      35 | #define __le32_to_cpu(x) ((__force __u32)(__le32)(x))
         |                                                   ^
   In file included from kernel/printk/printk.c:24:
   In file included from include/linux/tty.h:12:
   In file included from include/linux/tty_port.h:5:
   In file included from include/linux/kfifo.h:42:
   In file included from include/linux/scatterlist.h:9:
   In file included from arch/um/include/asm/io.h:24:
   include/asm-generic/io.h:584:33: warning: performing pointer arithmetic on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
     584 |         __raw_writeb(value, PCI_IOBASE + addr);
         |                             ~~~~~~~~~~ ^
   include/asm-generic/io.h:594:59: warning: performing pointer arithmetic on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
     594 |         __raw_writew((u16 __force)cpu_to_le16(value), PCI_IOBASE + addr);
         |                                                       ~~~~~~~~~~ ^
   include/asm-generic/io.h:604:59: warning: performing pointer arithmetic on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
     604 |         __raw_writel((u32 __force)cpu_to_le32(value), PCI_IOBASE + addr);
         |                                                       ~~~~~~~~~~ ^
   include/asm-generic/io.h:692:20: warning: performing pointer arithmetic on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
     692 |         readsb(PCI_IOBASE + addr, buffer, count);
         |                ~~~~~~~~~~ ^
   include/asm-generic/io.h:700:20: warning: performing pointer arithmetic on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
     700 |         readsw(PCI_IOBASE + addr, buffer, count);
         |                ~~~~~~~~~~ ^
   include/asm-generic/io.h:708:20: warning: performing pointer arithmetic on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
     708 |         readsl(PCI_IOBASE + addr, buffer, count);
         |                ~~~~~~~~~~ ^
   include/asm-generic/io.h:717:21: warning: performing pointer arithmetic on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
     717 |         writesb(PCI_IOBASE + addr, buffer, count);
         |                 ~~~~~~~~~~ ^
   include/asm-generic/io.h:726:21: warning: performing pointer arithmetic on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
     726 |         writesw(PCI_IOBASE + addr, buffer, count);
         |                 ~~~~~~~~~~ ^
   include/asm-generic/io.h:735:21: warning: performing pointer arithmetic on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
     735 |         writesl(PCI_IOBASE + addr, buffer, count);
         |                 ~~~~~~~~~~ ^
>> kernel/printk/printk.c:1273:2: error: no member named 'ctrl' in 'struct _ddebug'
    1273 |         pr_debug("boot_delay: %u, preset_lpj: %ld, lpj: %lu, "
         |         ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
    1274 |                 "HZ: %d, loops_per_msec: %llu\n",
         |                 ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
    1275 |                 boot_delay, preset_lpj, lpj, HZ, loops_per_msec);
         |                 ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/printk.h:579:2: note: expanded from macro 'pr_debug'
     579 |         dynamic_pr_debug(fmt, ##__VA_ARGS__)
         |         ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/dynamic_debug.h:335:2: note: expanded from macro 'dynamic_pr_debug'
     335 |         _dynamic_func_call(fmt, __dynamic_pr_debug,             \
         |         ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
     336 |                            pr_fmt(fmt), ##__VA_ARGS__)
         |                            ~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/dynamic_debug.h:316:2: note: expanded from macro '_dynamic_func_call'
     316 |         _dynamic_func_call_cls(_DPRINTK_CLASS_DFLT, fmt, func, ##__VA_ARGS__)
         |         ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   note: (skipping 1 expansions in backtrace; use -fmacro-backtrace-limit=0 to see all)
   include/linux/dynamic_debug.h:289:6: note: expanded from macro '__dynamic_func_call_cls'
     289 |         if (DYNAMIC_DEBUG_BRANCH(id))                           \
         |             ^                    ~~
   include/linux/dynamic_debug.h:271:22: note: expanded from macro 'DYNAMIC_DEBUG_BRANCH'
     271 |         unlikely(descriptor.ctrl.flags & _DPRINTK_FLAGS_ENABLED)
         |                  ~~~~~~~~~~ ^
   include/linux/compiler.h:77:42: note: expanded from macro 'unlikely'
      77 | # define unlikely(x)    __builtin_expect(!!(x), 0)
         |                                             ^
   13 warnings and 1 error generated.


vim +350 kernel/kcov.c

ded97d2c2b2c5f Victor Chibotaru 2017-11-17  345  
76484b1c77242b Andrey Konovalov 2020-06-04  346  static void kcov_start(struct task_struct *t, struct kcov *kcov,
76484b1c77242b Andrey Konovalov 2020-06-04  347  			unsigned int size, void *area, enum kcov_mode mode,
76484b1c77242b Andrey Konovalov 2020-06-04  348  			int sequence)
eec028c9386ed1 Andrey Konovalov 2019-12-04  349  {
eec028c9386ed1 Andrey Konovalov 2019-12-04 @350  	kcov_debug("t = %px, size = %u, area = %px\n", t, size, area);
76484b1c77242b Andrey Konovalov 2020-06-04  351  	t->kcov = kcov;
eec028c9386ed1 Andrey Konovalov 2019-12-04  352  	/* Cache in task struct for performance. */
eec028c9386ed1 Andrey Konovalov 2019-12-04  353  	t->kcov_size = size;
eec028c9386ed1 Andrey Konovalov 2019-12-04  354  	t->kcov_area = area;
eeb91f9a2e3e97 Andrey Konovalov 2020-06-04  355  	t->kcov_sequence = sequence;
eec028c9386ed1 Andrey Konovalov 2019-12-04  356  	/* See comment in check_kcov_mode(). */
eec028c9386ed1 Andrey Konovalov 2019-12-04  357  	barrier();
eec028c9386ed1 Andrey Konovalov 2019-12-04  358  	WRITE_ONCE(t->kcov_mode, mode);
eec028c9386ed1 Andrey Konovalov 2019-12-04  359  }
eec028c9386ed1 Andrey Konovalov 2019-12-04  360  

:::::: The code at line 350 was first introduced by commit
:::::: eec028c9386ed1a692aa01a85b55952202b41619 kcov: remote coverage support

:::::: TO: Andrey Konovalov <andreyknvl@google.com>
:::::: CC: Linus Torvalds <torvalds@linux-foundation.org>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
