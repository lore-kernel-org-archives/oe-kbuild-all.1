Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.88])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2FFCF6FAF
	for <oe-kbuild-all@lists.linux.dev>; Thu, 10 Aug 2023 08:47:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1691657227; x=1723193227;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=meqM6I8YeIzgVyQPURguYkcphHbWZoeyf1IxQQvqVfE=;
  b=D2JVfOfI9VkgpxrlWEku7clZLvdbrqrLRbeKCZTJWgf3bnyWnmdJp/D5
   lJcYnSZSxjVyq7PAkpUej0qaiw6fm/XGxiv8C4lHC2ddp/f5T3c1yr/fU
   IhfMemjrT9c9PYFHQfFmFLXRYIu/kbeZlwKcpkJDchaXvINIsryyWwcQ1
   2/03DdlpJj+dfv67zJ2wsx9alhBaBcweE/VozpB1F6H96+PZyNiWhaSFX
   cxi3Qxag7VD15khmR4zIA7slBuDLMgI7s0dCLUY6nVjjb8quJ+FmeaMAy
   PeiQnxhha/YCka7CtReQVC17wAzgPFHTn+DyuzyWooZgaswpIqqbG7uJk
   w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10797"; a="402302342"
X-IronPort-AV: E=Sophos;i="6.01,161,1684825200"; 
   d="scan'208";a="402302342"
Received: from fmsmga007.fm.intel.com ([10.253.24.52])
  by fmsmga101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 10 Aug 2023 01:47:06 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10797"; a="735334429"
X-IronPort-AV: E=Sophos;i="6.01,161,1684825200"; 
   d="scan'208";a="735334429"
Received: from lkp-server01.sh.intel.com (HELO d1ccc7e87e8f) ([10.239.97.150])
  by fmsmga007.fm.intel.com with ESMTP; 10 Aug 2023 01:47:04 -0700
Received: from kbuild by d1ccc7e87e8f with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1qU1Jw-0006sA-02;
	Thu, 10 Aug 2023 08:47:04 +0000
Date: Thu, 10 Aug 2023 16:46:50 +0800
From: kernel test robot <lkp@intel.com>
To: Yury Norov <yury.norov@gmail.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [norov:bitmap-fixes 1/12] include/linux/numa.h:48:1: error: expected
 identifier or '('
Message-ID: <202308101617.FKNasy0S-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://github.com/norov/linux bitmap-fixes
head:   9afb43a6a90b06db96053e97f26cfdddc08ca372
commit: beec375f74a28a70cfc2160f22585432ee523d5a [1/12] numa_nearest_node
config: x86_64-randconfig-r013-20230809 (https://download.01.org/0day-ci/archive/20230810/202308101617.FKNasy0S-lkp@intel.com/config)
compiler: clang version 16.0.4 (https://github.com/llvm/llvm-project.git ae42196bc493ffe877a7e3dff8be32035dea4d07)
reproduce: (https://download.01.org/0day-ci/archive/20230810/202308101617.FKNasy0S-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202308101617.FKNasy0S-lkp@intel.com/

All errors (new ones prefixed by >>):

   In file included from arch/x86/kernel/asm-offsets.c:9:
   In file included from include/linux/crypto.h:15:
   In file included from include/linux/completion.h:12:
   In file included from include/linux/swait.h:7:
   In file included from include/linux/spinlock.h:56:
   In file included from include/linux/preempt.h:79:
   In file included from arch/x86/include/asm/preempt.h:9:
   In file included from include/linux/thread_info.h:60:
   In file included from arch/x86/include/asm/thread_info.h:53:
   In file included from arch/x86/include/asm/cpufeature.h:5:
   In file included from arch/x86/include/asm/processor.h:23:
   In file included from arch/x86/include/asm/msr.h:11:
   In file included from arch/x86/include/asm/cpumask.h:5:
   In file included from include/linux/cpumask.h:16:
>> include/linux/numa.h:48:1: error: expected identifier or '('
   {
   ^
   In file included from arch/x86/kernel/asm-offsets.c:14:
   In file included from include/linux/suspend.h:5:
   In file included from include/linux/swap.h:9:
   In file included from include/linux/memcontrol.h:13:
   In file included from include/linux/cgroup.h:17:
   In file included from include/linux/fs.h:33:
   In file included from include/linux/percpu-rwsem.h:7:
   In file included from include/linux/rcuwait.h:6:
   In file included from include/linux/sched/signal.h:6:
   include/linux/signal.h:97:11: warning: array index 3 is past the end of the array (that has type 'unsigned long[1]') [-Warray-bounds]
                   return (set->sig[3] | set->sig[2] |
                           ^        ~
   arch/x86/include/asm/signal.h:24:2: note: array 'sig' declared here
           unsigned long sig[_NSIG_WORDS];
           ^
   In file included from arch/x86/kernel/asm-offsets.c:14:
   In file included from include/linux/suspend.h:5:
   In file included from include/linux/swap.h:9:
   In file included from include/linux/memcontrol.h:13:
   In file included from include/linux/cgroup.h:17:
   In file included from include/linux/fs.h:33:
   In file included from include/linux/percpu-rwsem.h:7:
   In file included from include/linux/rcuwait.h:6:
   In file included from include/linux/sched/signal.h:6:
   include/linux/signal.h:97:25: warning: array index 2 is past the end of the array (that has type 'unsigned long[1]') [-Warray-bounds]
                   return (set->sig[3] | set->sig[2] |
                                         ^        ~
   arch/x86/include/asm/signal.h:24:2: note: array 'sig' declared here
           unsigned long sig[_NSIG_WORDS];
           ^
   In file included from arch/x86/kernel/asm-offsets.c:14:
   In file included from include/linux/suspend.h:5:
   In file included from include/linux/swap.h:9:
   In file included from include/linux/memcontrol.h:13:
   In file included from include/linux/cgroup.h:17:
   In file included from include/linux/fs.h:33:
   In file included from include/linux/percpu-rwsem.h:7:
   In file included from include/linux/rcuwait.h:6:
   In file included from include/linux/sched/signal.h:6:
   include/linux/signal.h:98:4: warning: array index 1 is past the end of the array (that has type 'unsigned long[1]') [-Warray-bounds]
                           set->sig[1] | set->sig[0]) == 0;
                           ^        ~
   arch/x86/include/asm/signal.h:24:2: note: array 'sig' declared here
           unsigned long sig[_NSIG_WORDS];
           ^
   In file included from arch/x86/kernel/asm-offsets.c:14:
   In file included from include/linux/suspend.h:5:
   In file included from include/linux/swap.h:9:
   In file included from include/linux/memcontrol.h:13:
   In file included from include/linux/cgroup.h:17:
   In file included from include/linux/fs.h:33:
   In file included from include/linux/percpu-rwsem.h:7:
   In file included from include/linux/rcuwait.h:6:
   In file included from include/linux/sched/signal.h:6:
   include/linux/signal.h:100:11: warning: array index 1 is past the end of the array (that has type 'unsigned long[1]') [-Warray-bounds]
                   return (set->sig[1] | set->sig[0]) == 0;
                           ^        ~
   arch/x86/include/asm/signal.h:24:2: note: array 'sig' declared here
           unsigned long sig[_NSIG_WORDS];
           ^
   In file included from arch/x86/kernel/asm-offsets.c:14:
   In file included from include/linux/suspend.h:5:
   In file included from include/linux/swap.h:9:
   In file included from include/linux/memcontrol.h:13:
   In file included from include/linux/cgroup.h:17:
   In file included from include/linux/fs.h:33:
   In file included from include/linux/percpu-rwsem.h:7:
   In file included from include/linux/rcuwait.h:6:
   In file included from include/linux/sched/signal.h:6:
   include/linux/signal.h:113:11: warning: array index 3 is past the end of the array (that has type 'const unsigned long[1]') [-Warray-bounds]
                   return  (set1->sig[3] == set2->sig[3]) &&
                            ^         ~
   arch/x86/include/asm/signal.h:24:2: note: array 'sig' declared here
           unsigned long sig[_NSIG_WORDS];
           ^
   In file included from arch/x86/kernel/asm-offsets.c:14:
   In file included from include/linux/suspend.h:5:
   In file included from include/linux/swap.h:9:
   In file included from include/linux/memcontrol.h:13:
   In file included from include/linux/cgroup.h:17:
   In file included from include/linux/fs.h:33:
   In file included from include/linux/percpu-rwsem.h:7:
   In file included from include/linux/rcuwait.h:6:
   In file included from include/linux/sched/signal.h:6:
   include/linux/signal.h:113:27: warning: array index 3 is past the end of the array (that has type 'const unsigned long[1]') [-Warray-bounds]
                   return  (set1->sig[3] == set2->sig[3]) &&
                                            ^         ~
   arch/x86/include/asm/signal.h:24:2: note: array 'sig' declared here
           unsigned long sig[_NSIG_WORDS];
           ^
   In file included from arch/x86/kernel/asm-offsets.c:14:
   In file included from include/linux/suspend.h:5:
   In file included from include/linux/swap.h:9:
   In file included from include/linux/memcontrol.h:13:
   In file included from include/linux/cgroup.h:17:
   In file included from include/linux/fs.h:33:
   In file included from include/linux/percpu-rwsem.h:7:
   In file included from include/linux/rcuwait.h:6:


vim +48 include/linux/numa.h

a927bd6ba952d1 Dan Williams 2020-11-21  29  
a927bd6ba952d1 Dan Williams 2020-11-21  30  #ifndef memory_add_physaddr_to_nid
a927bd6ba952d1 Dan Williams 2020-11-21  31  static inline int memory_add_physaddr_to_nid(u64 start)
a927bd6ba952d1 Dan Williams 2020-11-21  32  {
a927bd6ba952d1 Dan Williams 2020-11-21  33  	pr_info_once("Unknown online node for memory at 0x%llx, assuming node 0\n",
a927bd6ba952d1 Dan Williams 2020-11-21  34  			start);
a927bd6ba952d1 Dan Williams 2020-11-21  35  	return 0;
a927bd6ba952d1 Dan Williams 2020-11-21  36  }
a927bd6ba952d1 Dan Williams 2020-11-21  37  #endif
a927bd6ba952d1 Dan Williams 2020-11-21  38  #ifndef phys_to_target_node
a927bd6ba952d1 Dan Williams 2020-11-21  39  static inline int phys_to_target_node(u64 start)
a927bd6ba952d1 Dan Williams 2020-11-21  40  {
a927bd6ba952d1 Dan Williams 2020-11-21  41  	pr_info_once("Unknown target node for memory at 0x%llx, assuming node 0\n",
a927bd6ba952d1 Dan Williams 2020-11-21  42  			start);
a927bd6ba952d1 Dan Williams 2020-11-21  43  	return 0;
a927bd6ba952d1 Dan Williams 2020-11-21  44  }
a927bd6ba952d1 Dan Williams 2020-11-21  45  #endif
a927bd6ba952d1 Dan Williams 2020-11-21  46  #else /* !CONFIG_NUMA */
beec375f74a28a Yury Norov   2023-08-09  47  static inline int numa_nearest_node(int node, unsigned int state);
b2ca916ce392a9 Dan Williams 2020-02-16 @48  {
b2ca916ce392a9 Dan Williams 2020-02-16  49  	return NUMA_NO_NODE;
b2ca916ce392a9 Dan Williams 2020-02-16  50  }
a927bd6ba952d1 Dan Williams 2020-11-21  51  static inline int memory_add_physaddr_to_nid(u64 start)
a927bd6ba952d1 Dan Williams 2020-11-21  52  {
a927bd6ba952d1 Dan Williams 2020-11-21  53  	return 0;
a927bd6ba952d1 Dan Williams 2020-11-21  54  }
a927bd6ba952d1 Dan Williams 2020-11-21  55  static inline int phys_to_target_node(u64 start)
a927bd6ba952d1 Dan Williams 2020-11-21  56  {
a927bd6ba952d1 Dan Williams 2020-11-21  57  	return 0;
a927bd6ba952d1 Dan Williams 2020-11-21  58  }
b2ca916ce392a9 Dan Williams 2020-02-16  59  #endif
b2ca916ce392a9 Dan Williams 2020-02-16  60  

:::::: The code at line 48 was first introduced by commit
:::::: b2ca916ce392a9d4cea3489a3efb2b627b839eaf ACPI: NUMA: Up-level "map to online node" functionality

:::::: TO: Dan Williams <dan.j.williams@intel.com>
:::::: CC: Dan Williams <dan.j.williams@intel.com>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
