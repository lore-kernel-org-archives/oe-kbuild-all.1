Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.151])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0F46219D
	for <oe-kbuild-all@lists.linux.dev>; Mon,  7 Aug 2023 01:12:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1691370733; x=1722906733;
  h=date:from:cc:subject:message-id:mime-version;
  bh=271S4J3j+FSe+3Y8XHSVaJTGkOlmMxkVfHIaGin/v/M=;
  b=JSy6iwdYOZArvOXIzgiTrAG/85Kvm4IR3LZirXelnlCFPqo1HRuD43PI
   LcGOKJjeqcQByX02hsREz+Gv1z4fidubHWXuvpZUyfN1uE5+awPdnYB4t
   WQfGw0s7orTTBS01wujg8UCwekStKIYFvo8brOU8T2VdVnckc4Jm5WpYT
   akNIqMBmj3QMd25QZxo/7ZnmKR7taEjlGSdgV3v1etgGjZ4ixDEnhYJJA
   AnXxENixMu7kcZiGqxArmNyqSQvoolKCjzMAb/OMLYaTJOfX36/iFTmax
   KBVVedtKf6Kw1DfyHvlOXMCh1ssWnEQ/fd+SA88KqwGZbxspQs1cY5TF5
   g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10794"; a="350736314"
X-IronPort-AV: E=Sophos;i="6.01,261,1684825200"; 
   d="scan'208";a="350736314"
Received: from orsmga008.jf.intel.com ([10.7.209.65])
  by fmsmga107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 06 Aug 2023 18:12:12 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10794"; a="760273872"
X-IronPort-AV: E=Sophos;i="6.01,261,1684825200"; 
   d="scan'208";a="760273872"
Received: from lkp-server01.sh.intel.com (HELO d1ccc7e87e8f) ([10.239.97.150])
  by orsmga008.jf.intel.com with ESMTP; 06 Aug 2023 18:12:11 -0700
Received: from kbuild by d1ccc7e87e8f with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1qSon4-0004S7-0p
	for oe-kbuild-all@lists.linux.dev;
	Mon, 07 Aug 2023 01:12:10 +0000
Date: Mon, 7 Aug 2023 09:11:42 +0800
From: kernel test robot <lkp@intel.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [intel-lts:4.19/android_s 14660/30000] kernel/sched/stubs.c:8:5:
 warning: no previous prototype for 'sched_isolate_cpu'
Message-ID: <202308070938.Vs2uFYOF-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hi Quentin,

FYI, the error/warning still remains.

tree:   https://github.com/intel/linux-intel-lts.git 4.19/android_s
head:   7f46da99d47faba52b98b09371755ba4821a116d
commit: eead51495c8760858c32d9ad0332ffc94397aa82 [14660/30000] ANDROID: GKI: sched: stub sched_isolate symbols
config: h8300-allnoconfig (https://download.01.org/0day-ci/archive/20230807/202308070938.Vs2uFYOF-lkp@intel.com/config)
compiler: h8300-linux-gcc (GCC) 12.3.0
reproduce: (https://download.01.org/0day-ci/archive/20230807/202308070938.Vs2uFYOF-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202308070938.Vs2uFYOF-lkp@intel.com/

All warnings (new ones prefixed by >>):

   In file included from arch/h8300/include/asm/bug.h:8,
                    from include/linux/bug.h:5,
                    from include/linux/thread_info.h:12,
                    from include/asm-generic/current.h:5,
                    from ./arch/h8300/include/generated/asm/current.h:1,
                    from include/linux/sched.h:12,
                    from kernel/sched/sched.h:5,
                    from kernel/sched/stubs.c:6:
   include/linux/dma-mapping.h: In function 'dma_map_resource':
   include/asm-generic/page.h:91:40: warning: comparison of unsigned expression in '>= 0' is always true [-Wtype-limits]
      91 | #define pfn_valid(pfn)          ((pfn) >= ARCH_PFN_OFFSET && ((pfn) - ARCH_PFN_OFFSET) < max_mapnr)
         |                                        ^~
   include/asm-generic/bug.h:188:36: note: in definition of macro 'BUG_ON'
     188 | #define BUG_ON(condition) do { if (condition) BUG(); } while (0)
         |                                    ^~~~~~~~~
   include/linux/dma-mapping.h:338:16: note: in expansion of macro 'pfn_valid'
     338 |         BUG_ON(pfn_valid(PHYS_PFN(phys_addr)));
         |                ^~~~~~~~~
   kernel/sched/stubs.c: At top level:
>> kernel/sched/stubs.c:8:5: warning: no previous prototype for 'sched_isolate_cpu' [-Wmissing-prototypes]
       8 | int sched_isolate_cpu(int cpu)
         |     ^~~~~~~~~~~~~~~~~
>> kernel/sched/stubs.c:14:5: warning: no previous prototype for 'sched_unisolate_cpu_unlocked' [-Wmissing-prototypes]
      14 | int sched_unisolate_cpu_unlocked(int cpu)
         |     ^~~~~~~~~~~~~~~~~~~~~~~~~~~~
>> kernel/sched/stubs.c:20:5: warning: no previous prototype for 'sched_unisolate_cpu' [-Wmissing-prototypes]
      20 | int sched_unisolate_cpu(int cpu)
         |     ^~~~~~~~~~~~~~~~~~~
>> kernel/sched/stubs.c:26:5: warning: no previous prototype for 'set_task_boost' [-Wmissing-prototypes]
      26 | int set_task_boost(int boost, u64 period)
         |     ^~~~~~~~~~~~~~


vim +/sched_isolate_cpu +8 kernel/sched/stubs.c

     7	
   > 8	int sched_isolate_cpu(int cpu)
     9	{
    10		return -EINVAL;
    11	}
    12	EXPORT_SYMBOL_GPL(sched_isolate_cpu);
    13	
  > 14	int sched_unisolate_cpu_unlocked(int cpu)
    15	{
    16		return -EINVAL;
    17	}
    18	EXPORT_SYMBOL_GPL(sched_unisolate_cpu_unlocked);
    19	
  > 20	int sched_unisolate_cpu(int cpu)
    21	{
    22		return -EINVAL;
    23	}
    24	EXPORT_SYMBOL_GPL(sched_unisolate_cpu);
    25	
  > 26	int set_task_boost(int boost, u64 period)

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
