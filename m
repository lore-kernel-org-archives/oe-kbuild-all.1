Received: from mga02.intel.com (mga02.intel.com [134.134.136.20])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9DFB7136A
	for <oe-kbuild-all@lists.linux.dev>; Tue, 13 Jun 2023 19:32:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1686684740; x=1718220740;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=+jmK1dQ6YD8/nN22ubIrCkP5SHN6JO5IuO0Ktv206FQ=;
  b=ZB9cyxGWS14wKtuSHA84bSsZhpu1peckiP92MuKlxPY01918CUu2g5m0
   A/wFPIoDmjpnE/l23ln9/lVQVlFSp7wwyOEzRW73NzWQyc3ZAQkXVdVcw
   TvSm4qJjSexUIFPHpsrw3PgtPgfnlKdgOltt0rgdwievYgf7vRhzBcDwc
   VNarCgsAWquwVSSQWiynMvbBNLLTy7aW/yhkxZT8BxZTELofvz5xKUgD+
   lyyPo6fvh9mMJ3HqeGymEDvv/gKoxPo0jxFqL8AZP8BTD2tkL1Q0xxp2M
   xS16uYNAhVuei6RPcZ0QlvlFdneRfr7snKK8bdpbmxT18c4XgYctuemRy
   g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10740"; a="348092337"
X-IronPort-AV: E=Sophos;i="6.00,240,1681196400"; 
   d="scan'208";a="348092337"
Received: from orsmga006.jf.intel.com ([10.7.209.51])
  by orsmga101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 13 Jun 2023 12:32:20 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10740"; a="689133841"
X-IronPort-AV: E=Sophos;i="6.00,240,1681196400"; 
   d="scan'208";a="689133841"
Received: from lkp-server01.sh.intel.com (HELO 211f47bdb1cb) ([10.239.97.150])
  by orsmga006.jf.intel.com with ESMTP; 13 Jun 2023 12:32:18 -0700
Received: from kbuild by 211f47bdb1cb with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1q99kX-0001ho-2S;
	Tue, 13 Jun 2023 19:32:17 +0000
Date: Wed, 14 Jun 2023 03:31:16 +0800
From: kernel test robot <lkp@intel.com>
To: Catalin Marinas <catalin.marinas@arm.com>
Cc: oe-kbuild-all@lists.linux.dev,
	Linux Memory Management List <linux-mm@kvack.org>,
	Andrew Morton <akpm@linux-foundation.org>
Subject: [linux-next:master 9057/9385] arch/microblaze/include/asm/page.h:34:
 warning: "ARCH_DMA_MINALIGN" redefined
Message-ID: <202306140347.S9nJS3Al-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git master
head:   1f6ce8392d6ff486af5ca96df9ded5882c4b6977
commit: cc7335787e73348bb173dda3c17ecc7adc78d8d5 [9057/9385] mm/slab: decouple ARCH_KMALLOC_MINALIGN from ARCH_DMA_MINALIGN
config: microblaze-buildonly-randconfig-r002-20230612 (https://download.01.org/0day-ci/archive/20230614/202306140347.S9nJS3Al-lkp@intel.com/config)
compiler: microblaze-linux-gcc (GCC) 12.3.0
reproduce (this is a W=1 build):
        mkdir -p ~/bin
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git/commit/?id=cc7335787e73348bb173dda3c17ecc7adc78d8d5
        git remote add linux-next https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git
        git fetch --no-tags linux-next master
        git checkout cc7335787e73348bb173dda3c17ecc7adc78d8d5
        # save the config file
        mkdir build_dir && cp config build_dir/.config
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=gcc-12.3.0 ~/bin/make.cross W=1 O=build_dir ARCH=microblaze olddefconfig
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=gcc-12.3.0 ~/bin/make.cross W=1 O=build_dir ARCH=microblaze prepare

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202306140347.S9nJS3Al-lkp@intel.com/

All warnings (new ones prefixed by >>):

   In file included from include/linux/shm.h:6,
                    from include/linux/sched.h:16,
                    from arch/microblaze/kernel/asm-offsets.c:13:
>> arch/microblaze/include/asm/page.h:34: warning: "ARCH_DMA_MINALIGN" redefined
      34 | #define ARCH_DMA_MINALIGN       L1_CACHE_BYTES
         | 
   In file included from include/linux/debug_locks.h:6,
                    from include/linux/mutex.h:21,
                    from include/linux/rhashtable-types.h:14,
                    from include/linux/ipc.h:7,
                    from include/uapi/linux/sem.h:5,
                    from include/linux/sem.h:5,
                    from include/linux/sched.h:15:
   include/linux/cache.h:104: note: this is the location of the previous definition
     104 | #define ARCH_DMA_MINALIGN __alignof__(unsigned long long)
         | 
--
   In file included from include/linux/shm.h:6,
                    from include/linux/sched.h:16,
                    from include/linux/ptrace.h:6,
                    from include/uapi/asm-generic/bpf_perf_event.h:4,
                    from ./arch/microblaze/include/generated/uapi/asm/bpf_perf_event.h:1,
                    from include/uapi/linux/bpf_perf_event.h:11,
                    from kernel/bpf/btf.c:6:
>> arch/microblaze/include/asm/page.h:34: warning: "ARCH_DMA_MINALIGN" redefined
      34 | #define ARCH_DMA_MINALIGN       L1_CACHE_BYTES
         | 
   In file included from include/linux/debug_locks.h:6,
                    from include/linux/mutex.h:21,
                    from include/linux/rhashtable-types.h:14,
                    from include/linux/ipc.h:7,
                    from include/uapi/linux/sem.h:5,
                    from include/linux/sem.h:5,
                    from include/linux/sched.h:15:
   include/linux/cache.h:104: note: this is the location of the previous definition
     104 | #define ARCH_DMA_MINALIGN __alignof__(unsigned long long)
         | 
   kernel/bpf/btf.c: In function 'btf_seq_show':
   kernel/bpf/btf.c:7071:29: warning: function 'btf_seq_show' might be a candidate for 'gnu_printf' format attribute [-Wsuggest-attribute=format]
    7071 |         seq_vprintf((struct seq_file *)show->target, fmt, args);
         |                             ^~~~~~~~
   kernel/bpf/btf.c: In function 'btf_snprintf_show':
   kernel/bpf/btf.c:7108:9: warning: function 'btf_snprintf_show' might be a candidate for 'gnu_printf' format attribute [-Wsuggest-attribute=format]
    7108 |         len = vsnprintf(show->target, ssnprintf->len_left, fmt, args);
         |         ^~~
--
   In file included from include/linux/mm_types_task.h:16,
                    from include/linux/mm_types.h:5,
                    from include/linux/bpf.h:16,
                    from include/linux/filter.h:9,
                    from kernel/bpf/core.c:21:
>> arch/microblaze/include/asm/page.h:34: warning: "ARCH_DMA_MINALIGN" redefined
      34 | #define ARCH_DMA_MINALIGN       L1_CACHE_BYTES
         | 
   In file included from include/linux/time.h:5,
                    from include/linux/ktime.h:24,
                    from include/linux/timer.h:6,
                    from include/linux/workqueue.h:9,
                    from include/linux/bpf.h:10:
   include/linux/cache.h:104: note: this is the location of the previous definition
     104 | #define ARCH_DMA_MINALIGN __alignof__(unsigned long long)
         | 
   kernel/bpf/core.c:1638:12: warning: no previous prototype for 'bpf_probe_read_kernel' [-Wmissing-prototypes]
    1638 | u64 __weak bpf_probe_read_kernel(void *dst, u32 size, const void *unsafe_ptr)
         |            ^~~~~~~~~~~~~~~~~~~~~
--
   In file included from include/linux/shm.h:6,
                    from include/linux/sched.h:16,
                    from arch/microblaze/kernel/asm-offsets.c:13:
>> arch/microblaze/include/asm/page.h:34: warning: "ARCH_DMA_MINALIGN" redefined
      34 | #define ARCH_DMA_MINALIGN       L1_CACHE_BYTES
         | 
   In file included from include/linux/debug_locks.h:6,
                    from include/linux/mutex.h:21,
                    from include/linux/rhashtable-types.h:14,
                    from include/linux/ipc.h:7,
                    from include/uapi/linux/sem.h:5,
                    from include/linux/sem.h:5,
                    from include/linux/sched.h:15:
   include/linux/cache.h:104: note: this is the location of the previous definition
     104 | #define ARCH_DMA_MINALIGN __alignof__(unsigned long long)
         | 


vim +/ARCH_DMA_MINALIGN +34 arch/microblaze/include/asm/page.h

4b87d7a4f91d31 Michal Simek    2009-03-27  32  
de925d9d3b6439 Michal Simek    2010-04-26  33  /* MS be sure that SLAB allocates aligned objects */
a6eb9fe105d5de FUJITA Tomonori 2010-08-10 @34  #define ARCH_DMA_MINALIGN	L1_CACHE_BYTES
de925d9d3b6439 Michal Simek    2010-04-26  35  

:::::: The code at line 34 was first introduced by commit
:::::: a6eb9fe105d5de0053b261148cee56c94b4720ca dma-mapping: rename ARCH_KMALLOC_MINALIGN to ARCH_DMA_MINALIGN

:::::: TO: FUJITA Tomonori <fujita.tomonori@lab.ntt.co.jp>
:::::: CC: Linus Torvalds <torvalds@linux-foundation.org>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
