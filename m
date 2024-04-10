Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.15])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8EF3D18412F
	for <oe-kbuild-all@lists.linux.dev>; Wed, 10 Apr 2024 21:34:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.15
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1712784891; cv=none; b=Tf+0Yxs2uDBbyVG3BUJePklTiwj9kBHoPLrswCc/OUYHJnTKi/1FZ+BEVMKYBknb7+kiefAqNp2hhmkIK5wZ110BIZ80BieWEjRkoxq10J94QcDlS/2AxCwPxDBR7TQurry3TnNFHgylA0dc4BwMfeVoNMkwyztuevEPiTJTyVg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1712784891; c=relaxed/simple;
	bh=/1VrSNTxl/xrg3ScjtijD9/OnIFT5lTpNF89eb6Q3VM=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=WRlQrGRLl6U7DrEOlHMbAqWtxTENxUvVTUK5woSj2ORRYNxMZhpmZKQdcPRfg48kPUbquRkexfoxcpKeEVP2kkgcK53MODUuhzP3ILqDXgQilo43BnsDuzwXZ3AuUQgjvlm7mNfZZmq+h6rLvys/8BIJELtQrmVH7LGP/debYPk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=CuEXmx4w; arc=none smtp.client-ip=192.198.163.15
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="CuEXmx4w"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1712784889; x=1744320889;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=/1VrSNTxl/xrg3ScjtijD9/OnIFT5lTpNF89eb6Q3VM=;
  b=CuEXmx4wMk+2PBcGkmBFfSzuM/s4TlNi0fXRUHhNcSzNWtWX5FKsO+z/
   tqtzOGNWTvysO6ePRlf6+RzKnZPbYS4mGHH19eUfNeZTFjN4PoxaGepcE
   7CoAcYS13/EgXrJ9TIcaucLFsj+nj0Eq9OPEMvmcNlJMkWkMdrTcGa+f9
   r/HfIwbWcll5wGzMRuOyRmF5+60NoZEgGXg3INPQm99Mg0KLEh1PSvRYF
   GknPkLocQhK6r/3SFIiel4t1E6c+JLnoMcA/KAg+MSvEJs1H87VeePasl
   JLcTMK4qXWrUBpZEOEaEiI/zQ4sMZXg0X3gBS19zG5NVjmPV0qEcBFKfz
   Q==;
X-CSE-ConnectionGUID: r9jfOexeS2uyQfvl1FRtiw==
X-CSE-MsgGUID: C2+blggJThOe2AQq6aPyKg==
X-IronPort-AV: E=McAfee;i="6600,9927,11039"; a="8350649"
X-IronPort-AV: E=Sophos;i="6.07,191,1708416000"; 
   d="scan'208";a="8350649"
Received: from orviesa003.jf.intel.com ([10.64.159.143])
  by fmvoesa109.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 10 Apr 2024 14:34:48 -0700
X-CSE-ConnectionGUID: PXyYsQzdTiieqTUO2x4vlQ==
X-CSE-MsgGUID: jt4MtzViRzKdO4z/Tak9PA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,191,1708416000"; 
   d="scan'208";a="25356071"
Received: from lkp-server01.sh.intel.com (HELO e61807b1d151) ([10.239.97.150])
  by orviesa003.jf.intel.com with ESMTP; 10 Apr 2024 14:34:46 -0700
Received: from kbuild by e61807b1d151 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1rufae-0007qi-1j;
	Wed, 10 Apr 2024 21:34:44 +0000
Date: Thu, 11 Apr 2024 05:34:42 +0800
From: kernel test robot <lkp@intel.com>
To: Roman Gushchin <roman.gushchin@linux.dev>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [rgushchin:page_counters.1 4/5]
 arch/x86/include/asm/page_32_types.h:22: warning: "THREAD_SIZE_ORDER"
 redefined
Message-ID: <202404110551.8KW5Qo5H-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://github.com/rgushchin/linux.git page_counters.1
head:   dbe528dceca7fe608061c8686e00aa4d53042767
commit: 7fb104a83d94f08496291125374fdf7c49ea7baa [4/5] mm: memcg: merge multiple page_counters into a single structure
config: um-i386_defconfig (https://download.01.org/0day-ci/archive/20240411/202404110551.8KW5Qo5H-lkp@intel.com/config)
compiler: gcc-13 (Ubuntu 13.2.0-4ubuntu3) 13.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240411/202404110551.8KW5Qo5H-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202404110551.8KW5Qo5H-lkp@intel.com/

All warnings (new ones prefixed by >>):

   In file included from include/linux/page_counter.h:9,
                    from include/linux/memcontrol.h:18,
                    from include/linux/swap.h:9,
                    from include/linux/mm_inline.h:8,
                    from kernel/fork.c:46:
   arch/x86/include/asm/page_types.h:11: warning: "PAGE_SIZE" redefined
      11 | #define PAGE_SIZE               (_AC(1,UL) << PAGE_SHIFT)
         | 
   In file included from arch/um/include/asm/thread_info.h:15,
                    from include/linux/thread_info.h:60,
                    from include/asm-generic/preempt.h:5,
                    from ./arch/um/include/generated/asm/preempt.h:1,
                    from include/linux/preempt.h:79,
                    from include/linux/spinlock.h:56,
                    from include/linux/mmzone.h:8,
                    from include/linux/gfp.h:7,
                    from include/linux/slab.h:16,
                    from kernel/fork.c:16:
   arch/um/include/asm/page.h:14: note: this is the location of the previous definition
      14 | #define PAGE_SIZE       (_AC(1, UL) << PAGE_SHIFT)
         | 
   arch/x86/include/asm/page_types.h:30: warning: "PAGE_OFFSET" redefined
      30 | #define PAGE_OFFSET             ((unsigned long)__PAGE_OFFSET)
         | 
   arch/um/include/asm/page.h:93: note: this is the location of the previous definition
      93 | #define PAGE_OFFSET (uml_physmem)
         | 
   In file included from arch/x86/include/asm/page_types.h:43:
>> arch/x86/include/asm/page_32_types.h:22: warning: "THREAD_SIZE_ORDER" redefined
      22 | #define THREAD_SIZE_ORDER       1
         | 
   arch/um/include/asm/thread_info.h:9: note: this is the location of the previous definition
       9 | #define THREAD_SIZE_ORDER CONFIG_KERNEL_STACK_ORDER
         | 
>> arch/x86/include/asm/page_32_types.h:23: warning: "THREAD_SIZE" redefined
      23 | #define THREAD_SIZE             (PAGE_SIZE << THREAD_SIZE_ORDER)
         | 
   arch/um/include/asm/thread_info.h:10: note: this is the location of the previous definition
      10 | #define THREAD_SIZE ((1 << CONFIG_KERNEL_STACK_ORDER) * PAGE_SIZE)
         | 
>> arch/x86/include/asm/page_32_types.h:48: warning: "TASK_SIZE" redefined
      48 | #define TASK_SIZE               __PAGE_OFFSET
         | 
   In file included from arch/x86/um/asm/processor.h:41,
                    from include/linux/spinlock_up.h:8,
                    from include/linux/spinlock.h:97:
   arch/um/include/asm/processor-generic.h:62: note: this is the location of the previous definition
      62 | #define TASK_SIZE (task_size)
         | 
>> arch/x86/include/asm/page_32_types.h:52: warning: "STACK_TOP" redefined
      52 | #define STACK_TOP               TASK_SIZE
         | 
   arch/um/include/asm/processor-generic.h:70: note: this is the location of the previous definition
      70 | #define STACK_TOP       (TASK_SIZE - 2 * PAGE_SIZE)
         | 
   arch/x86/include/asm/page_types.h:44: warning: "IOREMAP_MAX_ORDER" redefined
      44 | #define IOREMAP_MAX_ORDER       (PMD_SHIFT)
         | 
   In file included from kernel/fork.c:31:
   include/linux/vmalloc.h:49: note: this is the location of the previous definition
      49 | #define IOREMAP_MAX_ORDER       (7 + PAGE_SHIFT)        /* 128 pages */
         | 
   In file included from include/linux/percpu.h:5,
                    from include/linux/percpu_counter.h:14,
                    from include/linux/mm_types.h:21,
                    from include/linux/mmzone.h:22:
   kernel/fork.c: In function 'alloc_thread_stack_node':
   arch/x86/include/asm/page_32_types.h:17:37: error: 'CONFIG_PAGE_OFFSETUL' undeclared (first use in this function); did you mean 'CONFIG_PAGE_SHIFT'?
      17 | #define __PAGE_OFFSET_BASE      _AC(CONFIG_PAGE_OFFSET, UL)
         |                                     ^~~~~~~~~~~~~~~~~~
   include/linux/alloc_tag.h:205:16: note: in definition of macro 'alloc_hooks_tag'
     205 |         typeof(_do_alloc) _res = _do_alloc;                             \
         |                ^~~~~~~~~
   include/linux/vmalloc.h:171:41: note: in expansion of macro 'alloc_hooks'
     171 | #define __vmalloc_node_range(...)       alloc_hooks(__vmalloc_node_range_noprof(__VA_ARGS__))
         |                                         ^~~~~~~~~~~
   kernel/fork.c:309:17: note: in expansion of macro '__vmalloc_node_range'
     309 |         stack = __vmalloc_node_range(THREAD_SIZE, THREAD_ALIGN,
         |                 ^~~~~~~~~~~~~~~~~~~~
   include/uapi/linux/const.h:21:25: note: in expansion of macro '__AC'
      21 | #define _AC(X,Y)        __AC(X,Y)
         |                         ^~~~
   arch/x86/include/asm/page_32_types.h:17:33: note: in expansion of macro '_AC'
      17 | #define __PAGE_OFFSET_BASE      _AC(CONFIG_PAGE_OFFSET, UL)
         |                                 ^~~
   arch/x86/include/asm/page_32_types.h:18:33: note: in expansion of macro '__PAGE_OFFSET_BASE'
      18 | #define __PAGE_OFFSET           __PAGE_OFFSET_BASE
         |                                 ^~~~~~~~~~~~~~~~~~
   arch/x86/include/asm/page_32_types.h:48:33: note: in expansion of macro '__PAGE_OFFSET'
      48 | #define TASK_SIZE               __PAGE_OFFSET
         |                                 ^~~~~~~~~~~~~
   arch/um/include/asm/fixmap.h:50:26: note: in expansion of macro 'TASK_SIZE'
      50 | #define FIXADDR_TOP     (TASK_SIZE - 2 * PAGE_SIZE)
         |                          ^~~~~~~~~
   arch/um/include/asm/fixmap.h:52:26: note: in expansion of macro 'FIXADDR_TOP'
      52 | #define FIXADDR_START   (FIXADDR_TOP - FIXADDR_SIZE)
         |                          ^~~~~~~~~~~
   arch/um/include/asm/pgtable.h:51:26: note: in expansion of macro 'FIXADDR_START'
      51 | #define VMALLOC_END     (FIXADDR_START-2*PAGE_SIZE)
         |                          ^~~~~~~~~~~~~
   kernel/fork.c:310:53: note: in expansion of macro 'VMALLOC_END'
     310 |                                      VMALLOC_START, VMALLOC_END,
         |                                                     ^~~~~~~~~~~
   arch/x86/include/asm/page_32_types.h:17:37: note: each undeclared identifier is reported only once for each function it appears in
      17 | #define __PAGE_OFFSET_BASE      _AC(CONFIG_PAGE_OFFSET, UL)
         |                                     ^~~~~~~~~~~~~~~~~~
   include/linux/alloc_tag.h:205:16: note: in definition of macro 'alloc_hooks_tag'
     205 |         typeof(_do_alloc) _res = _do_alloc;                             \
         |                ^~~~~~~~~
   include/linux/vmalloc.h:171:41: note: in expansion of macro 'alloc_hooks'
     171 | #define __vmalloc_node_range(...)       alloc_hooks(__vmalloc_node_range_noprof(__VA_ARGS__))
         |                                         ^~~~~~~~~~~
   kernel/fork.c:309:17: note: in expansion of macro '__vmalloc_node_range'
     309 |         stack = __vmalloc_node_range(THREAD_SIZE, THREAD_ALIGN,
         |                 ^~~~~~~~~~~~~~~~~~~~
   include/uapi/linux/const.h:21:25: note: in expansion of macro '__AC'
      21 | #define _AC(X,Y)        __AC(X,Y)
         |                         ^~~~
   arch/x86/include/asm/page_32_types.h:17:33: note: in expansion of macro '_AC'
      17 | #define __PAGE_OFFSET_BASE      _AC(CONFIG_PAGE_OFFSET, UL)
         |                                 ^~~
   arch/x86/include/asm/page_32_types.h:18:33: note: in expansion of macro '__PAGE_OFFSET_BASE'
      18 | #define __PAGE_OFFSET           __PAGE_OFFSET_BASE
         |                                 ^~~~~~~~~~~~~~~~~~
   arch/x86/include/asm/page_32_types.h:48:33: note: in expansion of macro '__PAGE_OFFSET'
      48 | #define TASK_SIZE               __PAGE_OFFSET
         |                                 ^~~~~~~~~~~~~
   arch/um/include/asm/fixmap.h:50:26: note: in expansion of macro 'TASK_SIZE'
      50 | #define FIXADDR_TOP     (TASK_SIZE - 2 * PAGE_SIZE)
         |                          ^~~~~~~~~
   arch/um/include/asm/fixmap.h:52:26: note: in expansion of macro 'FIXADDR_TOP'
      52 | #define FIXADDR_START   (FIXADDR_TOP - FIXADDR_SIZE)
         |                          ^~~~~~~~~~~
   arch/um/include/asm/pgtable.h:51:26: note: in expansion of macro 'FIXADDR_START'
      51 | #define VMALLOC_END     (FIXADDR_START-2*PAGE_SIZE)
         |                          ^~~~~~~~~~~~~
   kernel/fork.c:310:53: note: in expansion of macro 'VMALLOC_END'
     310 |                                      VMALLOC_START, VMALLOC_END,
         |                                                     ^~~~~~~~~~~
>> kernel/fork.c:309:15: warning: assignment to 'void *' from 'int' makes pointer from integer without a cast [-Wint-conversion]
     309 |         stack = __vmalloc_node_range(THREAD_SIZE, THREAD_ALIGN,
         |               ^
--
   In file included from include/linux/page_counter.h:9,
                    from include/linux/memcontrol.h:18,
                    from include/linux/bpf.h:31,
                    from include/linux/security.h:35,
                    from include/linux/perf_event.h:62,
                    from include/linux/trace_events.h:10,
                    from include/trace/syscall.h:7,
                    from include/linux/syscalls.h:93,
                    from kernel/exec_domain.c:19:
   arch/x86/include/asm/page_types.h:11: warning: "PAGE_SIZE" redefined
      11 | #define PAGE_SIZE               (_AC(1,UL) << PAGE_SHIFT)
         | 
   In file included from arch/um/include/asm/thread_info.h:15,
                    from include/linux/thread_info.h:60,
                    from include/asm-generic/preempt.h:5,
                    from ./arch/um/include/generated/asm/preempt.h:1,
                    from include/linux/preempt.h:79,
                    from include/linux/spinlock.h:56,
                    from include/linux/mmzone.h:8,
                    from include/linux/gfp.h:7,
                    from include/linux/umh.h:4,
                    from include/linux/kmod.h:9,
                    from kernel/exec_domain.c:13:
   arch/um/include/asm/page.h:14: note: this is the location of the previous definition
      14 | #define PAGE_SIZE       (_AC(1, UL) << PAGE_SHIFT)
         | 
   arch/x86/include/asm/page_types.h:30: warning: "PAGE_OFFSET" redefined
      30 | #define PAGE_OFFSET             ((unsigned long)__PAGE_OFFSET)
         | 
   arch/um/include/asm/page.h:93: note: this is the location of the previous definition
      93 | #define PAGE_OFFSET (uml_physmem)
         | 
   In file included from arch/x86/include/asm/page_types.h:43:
>> arch/x86/include/asm/page_32_types.h:22: warning: "THREAD_SIZE_ORDER" redefined
      22 | #define THREAD_SIZE_ORDER       1
         | 
   arch/um/include/asm/thread_info.h:9: note: this is the location of the previous definition
       9 | #define THREAD_SIZE_ORDER CONFIG_KERNEL_STACK_ORDER
         | 
>> arch/x86/include/asm/page_32_types.h:23: warning: "THREAD_SIZE" redefined
      23 | #define THREAD_SIZE             (PAGE_SIZE << THREAD_SIZE_ORDER)
         | 
   arch/um/include/asm/thread_info.h:10: note: this is the location of the previous definition
      10 | #define THREAD_SIZE ((1 << CONFIG_KERNEL_STACK_ORDER) * PAGE_SIZE)
         | 
>> arch/x86/include/asm/page_32_types.h:48: warning: "TASK_SIZE" redefined
      48 | #define TASK_SIZE               __PAGE_OFFSET
         | 
   In file included from arch/x86/um/asm/processor.h:41,
                    from include/linux/spinlock_up.h:8,
                    from include/linux/spinlock.h:97:
   arch/um/include/asm/processor-generic.h:62: note: this is the location of the previous definition
      62 | #define TASK_SIZE (task_size)
         | 
>> arch/x86/include/asm/page_32_types.h:52: warning: "STACK_TOP" redefined
      52 | #define STACK_TOP               TASK_SIZE
         | 
   arch/um/include/asm/processor-generic.h:70: note: this is the location of the previous definition
      70 | #define STACK_TOP       (TASK_SIZE - 2 * PAGE_SIZE)
         | 
--
   In file included from include/linux/page_counter.h:9,
                    from include/linux/memcontrol.h:18,
                    from include/linux/swap.h:9,
                    from include/linux/mm_inline.h:8,
                    from kernel/sys.c:10:
   arch/x86/include/asm/page_types.h:11: warning: "PAGE_SIZE" redefined
      11 | #define PAGE_SIZE               (_AC(1,UL) << PAGE_SHIFT)
         | 
   In file included from arch/um/include/asm/thread_info.h:15,
                    from include/linux/thread_info.h:60,
                    from include/asm-generic/preempt.h:5,
                    from ./arch/um/include/generated/asm/preempt.h:1,
                    from include/linux/preempt.h:79,
                    from include/linux/spinlock.h:56,
                    from include/linux/mmzone.h:8,
                    from include/linux/gfp.h:7,
                    from include/linux/mm.h:7,
                    from kernel/sys.c:9:
   arch/um/include/asm/page.h:14: note: this is the location of the previous definition
      14 | #define PAGE_SIZE       (_AC(1, UL) << PAGE_SHIFT)
         | 
   arch/x86/include/asm/page_types.h:30: warning: "PAGE_OFFSET" redefined
      30 | #define PAGE_OFFSET             ((unsigned long)__PAGE_OFFSET)
         | 
   arch/um/include/asm/page.h:93: note: this is the location of the previous definition
      93 | #define PAGE_OFFSET (uml_physmem)
         | 
   In file included from arch/x86/include/asm/page_types.h:43:
>> arch/x86/include/asm/page_32_types.h:22: warning: "THREAD_SIZE_ORDER" redefined
      22 | #define THREAD_SIZE_ORDER       1
         | 
   arch/um/include/asm/thread_info.h:9: note: this is the location of the previous definition
       9 | #define THREAD_SIZE_ORDER CONFIG_KERNEL_STACK_ORDER
         | 
>> arch/x86/include/asm/page_32_types.h:23: warning: "THREAD_SIZE" redefined
      23 | #define THREAD_SIZE             (PAGE_SIZE << THREAD_SIZE_ORDER)
         | 
   arch/um/include/asm/thread_info.h:10: note: this is the location of the previous definition
      10 | #define THREAD_SIZE ((1 << CONFIG_KERNEL_STACK_ORDER) * PAGE_SIZE)
         | 
>> arch/x86/include/asm/page_32_types.h:48: warning: "TASK_SIZE" redefined
      48 | #define TASK_SIZE               __PAGE_OFFSET
         | 
   In file included from arch/x86/um/asm/processor.h:41,
                    from include/linux/spinlock_up.h:8,
                    from include/linux/spinlock.h:97:
   arch/um/include/asm/processor-generic.h:62: note: this is the location of the previous definition
      62 | #define TASK_SIZE (task_size)
         | 
>> arch/x86/include/asm/page_32_types.h:52: warning: "STACK_TOP" redefined
      52 | #define STACK_TOP               TASK_SIZE
         | 
   arch/um/include/asm/processor-generic.h:70: note: this is the location of the previous definition
      70 | #define STACK_TOP       (TASK_SIZE - 2 * PAGE_SIZE)
         | 
   In file included from include/vdso/const.h:5,
                    from include/linux/const.h:4,
                    from include/linux/bits.h:5,
                    from include/linux/ratelimit_types.h:5,
                    from include/linux/printk.h:9,
                    from include/asm-generic/bug.h:22,
                    from ./arch/um/include/generated/asm/bug.h:1,
                    from include/linux/bug.h:5,
                    from include/linux/mmdebug.h:5,
                    from include/linux/mm.h:6:
   kernel/sys.c: In function 'validate_prctl_map_addr':
   arch/x86/include/asm/page_32_types.h:17:37: error: 'CONFIG_PAGE_OFFSETUL' undeclared (first use in this function); did you mean 'CONFIG_PAGE_SHIFT'?
      17 | #define __PAGE_OFFSET_BASE      _AC(CONFIG_PAGE_OFFSET, UL)
         |                                     ^~~~~~~~~~~~~~~~~~
   include/uapi/linux/const.h:20:26: note: in definition of macro '__AC'
      20 | #define __AC(X,Y)       (X##Y)
         |                          ^
   arch/x86/include/asm/page_32_types.h:17:33: note: in expansion of macro '_AC'
      17 | #define __PAGE_OFFSET_BASE      _AC(CONFIG_PAGE_OFFSET, UL)
         |                                 ^~~
   arch/x86/include/asm/page_32_types.h:18:33: note: in expansion of macro '__PAGE_OFFSET_BASE'
      18 | #define __PAGE_OFFSET           __PAGE_OFFSET_BASE
         |                                 ^~~~~~~~~~~~~~~~~~
   arch/x86/include/asm/page_32_types.h:48:33: note: in expansion of macro '__PAGE_OFFSET'
      48 | #define TASK_SIZE               __PAGE_OFFSET
         |                                 ^~~~~~~~~~~~~
   kernel/sys.c:1942:39: note: in expansion of macro 'TASK_SIZE'
    1942 |         unsigned long mmap_max_addr = TASK_SIZE;
         |                                       ^~~~~~~~~
   arch/x86/include/asm/page_32_types.h:17:37: note: each undeclared identifier is reported only once for each function it appears in
      17 | #define __PAGE_OFFSET_BASE      _AC(CONFIG_PAGE_OFFSET, UL)
         |                                     ^~~~~~~~~~~~~~~~~~
   include/uapi/linux/const.h:20:26: note: in definition of macro '__AC'
      20 | #define __AC(X,Y)       (X##Y)
         |                          ^
   arch/x86/include/asm/page_32_types.h:17:33: note: in expansion of macro '_AC'
      17 | #define __PAGE_OFFSET_BASE      _AC(CONFIG_PAGE_OFFSET, UL)
         |                                 ^~~
   arch/x86/include/asm/page_32_types.h:18:33: note: in expansion of macro '__PAGE_OFFSET_BASE'
      18 | #define __PAGE_OFFSET           __PAGE_OFFSET_BASE
         |                                 ^~~~~~~~~~~~~~~~~~
   arch/x86/include/asm/page_32_types.h:48:33: note: in expansion of macro '__PAGE_OFFSET'
      48 | #define TASK_SIZE               __PAGE_OFFSET
         |                                 ^~~~~~~~~~~~~
   kernel/sys.c:1942:39: note: in expansion of macro 'TASK_SIZE'
    1942 |         unsigned long mmap_max_addr = TASK_SIZE;
         |                                       ^~~~~~~~~
   kernel/sys.c: In function 'prctl_set_mm':
   arch/x86/include/asm/page_32_types.h:17:37: error: 'CONFIG_PAGE_OFFSETUL' undeclared (first use in this function); did you mean 'CONFIG_PAGE_SHIFT'?
      17 | #define __PAGE_OFFSET_BASE      _AC(CONFIG_PAGE_OFFSET, UL)
         |                                     ^~~~~~~~~~~~~~~~~~
   include/uapi/linux/const.h:20:26: note: in definition of macro '__AC'
      20 | #define __AC(X,Y)       (X##Y)
         |                          ^
   arch/x86/include/asm/page_32_types.h:17:33: note: in expansion of macro '_AC'
      17 | #define __PAGE_OFFSET_BASE      _AC(CONFIG_PAGE_OFFSET, UL)
         |                                 ^~~
   arch/x86/include/asm/page_32_types.h:18:33: note: in expansion of macro '__PAGE_OFFSET_BASE'
      18 | #define __PAGE_OFFSET           __PAGE_OFFSET_BASE
         |                                 ^~~~~~~~~~~~~~~~~~
   arch/x86/include/asm/page_32_types.h:48:33: note: in expansion of macro '__PAGE_OFFSET'
      48 | #define TASK_SIZE               __PAGE_OFFSET
         |                                 ^~~~~~~~~~~~~
   kernel/sys.c:2171:21: note: in expansion of macro 'TASK_SIZE'
    2171 |         if (addr >= TASK_SIZE || addr < mmap_min_addr)
         |                     ^~~~~~~~~
..


vim +/THREAD_SIZE_ORDER +22 arch/x86/include/asm/page_32_types.h

a02150610776f6 Kees Cook           2013-07-08  21  
38e7c572ce7310 Thomas Gleixner     2012-05-05 @22  #define THREAD_SIZE_ORDER	1
38e7c572ce7310 Thomas Gleixner     2012-05-05 @23  #define THREAD_SIZE		(PAGE_SIZE << THREAD_SIZE_ORDER)
51c78eb3f0eb03 Jeremy Fitzhardinge 2009-02-08  24  
aa641c287b2f76 Thomas Gleixner     2019-04-14  25  #define IRQ_STACK_SIZE		THREAD_SIZE
aa641c287b2f76 Thomas Gleixner     2019-04-14  26  
51c78eb3f0eb03 Jeremy Fitzhardinge 2009-02-08  27  #define N_EXCEPTION_STACKS	1
51c78eb3f0eb03 Jeremy Fitzhardinge 2009-02-08  28  
51c78eb3f0eb03 Jeremy Fitzhardinge 2009-02-08  29  #ifdef CONFIG_X86_PAE
50896e180c6aa3 Andi Kleen          2018-06-13  30  /*
50896e180c6aa3 Andi Kleen          2018-06-13  31   * This is beyond the 44 bit limit imposed by the 32bit long pfns,
50896e180c6aa3 Andi Kleen          2018-06-13  32   * but we need the full mask to make sure inverted PROT_NONE
50896e180c6aa3 Andi Kleen          2018-06-13  33   * entries have all the host bits set in a guest.
50896e180c6aa3 Andi Kleen          2018-06-13  34   * The real limit is still 44 bits.
50896e180c6aa3 Andi Kleen          2018-06-13  35   */
50896e180c6aa3 Andi Kleen          2018-06-13  36  #define __PHYSICAL_MASK_SHIFT	52
51c78eb3f0eb03 Jeremy Fitzhardinge 2009-02-08  37  #define __VIRTUAL_MASK_SHIFT	32
51c78eb3f0eb03 Jeremy Fitzhardinge 2009-02-08  38  
51c78eb3f0eb03 Jeremy Fitzhardinge 2009-02-08  39  #else  /* !CONFIG_X86_PAE */
51c78eb3f0eb03 Jeremy Fitzhardinge 2009-02-08  40  #define __PHYSICAL_MASK_SHIFT	32
51c78eb3f0eb03 Jeremy Fitzhardinge 2009-02-08  41  #define __VIRTUAL_MASK_SHIFT	32
51c78eb3f0eb03 Jeremy Fitzhardinge 2009-02-08  42  #endif	/* CONFIG_X86_PAE */
51c78eb3f0eb03 Jeremy Fitzhardinge 2009-02-08  43  
999c83e8ffd90c Christoph Hellwig   2020-09-03  44  /*
999c83e8ffd90c Christoph Hellwig   2020-09-03  45   * User space process size: 3GB (default).
999c83e8ffd90c Christoph Hellwig   2020-09-03  46   */
a1d826d475aafe Christoph Hellwig   2020-09-03  47  #define IA32_PAGE_OFFSET	__PAGE_OFFSET
a1d826d475aafe Christoph Hellwig   2020-09-03 @48  #define TASK_SIZE		__PAGE_OFFSET
999c83e8ffd90c Christoph Hellwig   2020-09-03  49  #define TASK_SIZE_LOW		TASK_SIZE
999c83e8ffd90c Christoph Hellwig   2020-09-03  50  #define TASK_SIZE_MAX		TASK_SIZE
999c83e8ffd90c Christoph Hellwig   2020-09-03  51  #define DEFAULT_MAP_WINDOW	TASK_SIZE
999c83e8ffd90c Christoph Hellwig   2020-09-03 @52  #define STACK_TOP		TASK_SIZE
999c83e8ffd90c Christoph Hellwig   2020-09-03  53  #define STACK_TOP_MAX		STACK_TOP
999c83e8ffd90c Christoph Hellwig   2020-09-03  54  

:::::: The code at line 22 was first introduced by commit
:::::: 38e7c572ce7310def003d8bb7c34260f5d8118cb x86: Use common threadinfo allocator

:::::: TO: Thomas Gleixner <tglx@linutronix.de>
:::::: CC: Thomas Gleixner <tglx@linutronix.de>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
