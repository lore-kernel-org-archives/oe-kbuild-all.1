Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1DE4215A0
	for <oe-kbuild-all@lists.linux.dev>; Sat,  4 Nov 2023 04:34:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="g2dQjhoM"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1699072484; x=1730608484;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=j/PT25HqOhXtdYpKuTdx9t8NNnxRKyP4hWytxbZ/pw8=;
  b=g2dQjhoMjWO6dOajKNlWiVebe2SLP/e3RR7lBhEwg2F94avf6iIUUvkS
   0Wtl8kB4lpr98TDH/2kR+VwYMgwzP94Jg6aW/a35aHgE0d8pQqOuK8lks
   yfgHAsxQzbqsMNLZkSI7RHsoQxHBu0cEHRi9+iC21uwy4SoNvJPBWxJ4p
   aQM6R4lPbtev3+aVkDx2Zt3fXb87V7f/iFD9EfJxDnrCDyp7JTw91+z9H
   VkFpZnmSnVitl//prixeHIM2P+UZEk65nmbRD4jn/Q8xAycPeqjeE7Fe7
   eRk45Znz1YPA4sInHqIEf7QfBnMwCM12PsSdwz7g2zkuH/oy4CzyEgLus
   A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10883"; a="368396536"
X-IronPort-AV: E=Sophos;i="6.03,276,1694761200"; 
   d="scan'208";a="368396536"
Received: from orsmga004.jf.intel.com ([10.7.209.38])
  by fmsmga106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 03 Nov 2023 21:34:43 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10883"; a="885396372"
X-IronPort-AV: E=Sophos;i="6.03,276,1694761200"; 
   d="scan'208";a="885396372"
Received: from lkp-server01.sh.intel.com (HELO 17d9e85e5079) ([10.239.97.150])
  by orsmga004.jf.intel.com with ESMTP; 03 Nov 2023 21:34:42 -0700
Received: from kbuild by 17d9e85e5079 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1qz8Mp-0003Q4-1l;
	Sat, 04 Nov 2023 04:34:39 +0000
Date: Sat, 4 Nov 2023 12:33:21 +0800
From: kernel test robot <lkp@intel.com>
To: Josh Poimboeuf <jpoimboe@kernel.org>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [jpoimboe:sframe 3/3] mm/init-mm.c:50:33: error: expected expression
 before ',' token
Message-ID: <202311041211.YR3mym5s-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/jpoimboe/linux.git sframe
head:   32e88f45d843ad800e1ff01230eccd93849d2dda
commit: 32e88f45d843ad800e1ff01230eccd93849d2dda [3/3] todo
config: loongarch-randconfig-001-20231104 (https://download.01.org/0day-ci/archive/20231104/202311041211.YR3mym5s-lkp@intel.com/config)
compiler: loongarch64-linux-gcc (GCC) 13.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20231104/202311041211.YR3mym5s-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202311041211.YR3mym5s-lkp@intel.com/

All error/warnings (new ones prefixed by >>):

>> mm/init-mm.c:50:33: error: expected expression before ',' token
      50 |         INIT_MM_CONTEXT(init_mm),
         |                                 ^
>> mm/init-mm.c:50:33: warning: excess elements in struct initializer
   mm/init-mm.c:50:33: note: (near initialization for 'init_mm')
--
   In file included from arch/loongarch/include/asm/thread_info.h:15,
                    from include/linux/thread_info.h:60,
                    from include/asm-generic/current.h:6,
                    from ./arch/loongarch/include/generated/asm/current.h:1,
                    from include/linux/sched.h:12,
                    from kernel/unwind/user.c:4:
   kernel/unwind/user.c: In function 'user_unwind_start':
>> arch/loongarch/include/asm/processor.h:202:47: error: invalid application of 'sizeof' to incomplete type 'struct pt_regs'
     202 |                          THREAD_SIZE - sizeof(struct pt_regs))
         |                                               ^~~~~~
   arch/loongarch/include/asm/processor.h:203:46: note: in expansion of macro '__KSTK_TOS'
     203 | #define task_pt_regs(tsk) ((struct pt_regs *)__KSTK_TOS(tsk))
         |                                              ^~~~~~~~~~
   kernel/unwind/user.c:70:32: note: in expansion of macro 'task_pt_regs'
      70 |         struct pt_regs *regs = task_pt_regs(current);
         |                                ^~~~~~~~~~~~
>> kernel/unwind/user.c:90:21: error: implicit declaration of function 'user_stack_pointer' [-Werror=implicit-function-declaration]
      90 |         state->sp = user_stack_pointer(regs);
         |                     ^~~~~~~~~~~~~~~~~~
>> kernel/unwind/user.c:91:21: error: implicit declaration of function 'instruction_pointer' [-Werror=implicit-function-declaration]
      91 |         state->ip = instruction_pointer(regs);
         |                     ^~~~~~~~~~~~~~~~~~~
>> kernel/unwind/user.c:92:21: error: implicit declaration of function 'frame_pointer' [-Werror=implicit-function-declaration]
      92 |         state->fp = frame_pointer(regs);
         |                     ^~~~~~~~~~~~~
   cc1: some warnings being treated as errors


vim +50 mm/init-mm.c

    21	
    22	/*
    23	 * For dynamically allocated mm_structs, there is a dynamically sized cpumask
    24	 * at the end of the structure, the size of which depends on the maximum CPU
    25	 * number the system can see. That way we allocate only as much memory for
    26	 * mm_cpumask() as needed for the hundreds, or thousands of processes that
    27	 * a system typically runs.
    28	 *
    29	 * Since there is only one init_mm in the entire system, keep it simple
    30	 * and size this cpu_bitmask to NR_CPUS.
    31	 */
    32	struct mm_struct init_mm = {
    33		.mm_mt		= MTREE_INIT_EXT(mm_mt, MM_MT_FLAGS, init_mm.mmap_lock),
    34		.pgd		= swapper_pg_dir,
    35		.mm_users	= ATOMIC_INIT(2),
    36		.mm_count	= ATOMIC_INIT(1),
    37		.write_protect_seq = SEQCNT_ZERO(init_mm.write_protect_seq),
    38		MMAP_LOCK_INITIALIZER(init_mm)
    39		.page_table_lock =  __SPIN_LOCK_UNLOCKED(init_mm.page_table_lock),
    40		.arg_lock	=  __SPIN_LOCK_UNLOCKED(init_mm.arg_lock),
    41		.mmlist		= LIST_HEAD_INIT(init_mm.mmlist),
    42	#ifdef CONFIG_PER_VMA_LOCK
    43		.mm_lock_seq	= 0,
    44	#endif
    45		.user_ns	= &init_user_ns,
    46		.cpu_bitmap	= CPU_BITS_NONE,
    47	#ifdef CONFIG_IOMMU_SVA
    48		.pasid		= IOMMU_PASID_INVALID,
    49	#endif
  > 50		INIT_MM_CONTEXT(init_mm),
    51		.sframe_mt	= MTREE_INIT(sframe_mt, 0),
    52	};
    53	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
