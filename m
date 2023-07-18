Received: from mga05.intel.com (mga05.intel.com [192.55.52.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8B9A8184
	for <oe-kbuild-all@lists.linux.dev>; Tue, 18 Jul 2023 00:48:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1689641296; x=1721177296;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=QwAyL1M3WRBKOMa3Zf24uotXPPr/Q1uHTZN+/i2wvh0=;
  b=elEh7CxRgvVZrS8QgljDJoWP+IZ8kZQLNkE5vSnh+eT2E43gluAcDlYZ
   RESQzlooMQNPPo9nuGL4HJ0p9Pu1SVatmRrDdYHyXEcUwvehr9fMMBx08
   N5AMdkVmV9Yeaux+fkw3QZUkbpILdhV8OR3MMtu5IIH8FpPA2bybVRL0N
   IELIsuHuS2t8ye/hFvc8z9/vqplzzDyds9BTXkybF/RLhdTGMQCy5BgAW
   SO9im9SjSobrHGGdU4xNypdbkdJefMjUmpix5lKKKrKSeRexHUitK7RFi
   lqT1iuEvjBbTgyuePnjB91LGC1U6VQBddFpFozVV4z7hKCbRkUEOLW93T
   w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10774"; a="452452809"
X-IronPort-AV: E=Sophos;i="6.01,211,1684825200"; 
   d="scan'208";a="452452809"
Received: from orsmga003.jf.intel.com ([10.7.209.27])
  by fmsmga105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 17 Jul 2023 17:48:15 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10774"; a="673717201"
X-IronPort-AV: E=Sophos;i="6.01,211,1684825200"; 
   d="scan'208";a="673717201"
Received: from lkp-server01.sh.intel.com (HELO c544d7fc5005) ([10.239.97.150])
  by orsmga003.jf.intel.com with ESMTP; 17 Jul 2023 17:48:14 -0700
Received: from kbuild by c544d7fc5005 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1qLYsv-000A2S-24;
	Tue, 18 Jul 2023 00:48:13 +0000
Date: Tue, 18 Jul 2023 08:47:42 +0800
From: kernel test robot <lkp@intel.com>
To: "Russell King (Oracle)" <rmk+kernel@armlinux.org.uk>
Cc: oe-kbuild-all@lists.linux.dev, linux-arm-kernel@lists.infradead.org
Subject: [arm:ktext-current 1/19] kernel/scs.c:46:47: sparse: sparse:
 incompatible types in comparison expression (different type sizes):
Message-ID: <202307180826.AwqM3ku6-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   git://git.armlinux.org.uk/~rmk/linux-arm.git ktext-current
head:   49e3458967802a6981190b5a1fa9fd66dbf58f8c
commit: 631e7c45f5d4cf043cd236a921c341e3dd9f1909 [1/19] arm64: place kernel in its own L0 page table entry
config: arm64-randconfig-r083-20230717 (https://download.01.org/0day-ci/archive/20230718/202307180826.AwqM3ku6-lkp@intel.com/config)
compiler: aarch64-linux-gcc (GCC) 12.3.0
reproduce: (https://download.01.org/0day-ci/archive/20230718/202307180826.AwqM3ku6-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202307180826.AwqM3ku6-lkp@intel.com/

sparse warnings: (new ones prefixed by >>)
>> kernel/scs.c:46:47: sparse: sparse: incompatible types in comparison expression (different type sizes):
>> kernel/scs.c:46:47: sparse:    unsigned int *
>> kernel/scs.c:46:47: sparse:    unsigned long *
--
>> lib/test_debug_virtual.c:27:22: sparse: sparse: incompatible types in comparison expression (different type sizes):
>> lib/test_debug_virtual.c:27:22: sparse:    unsigned int *
>> lib/test_debug_virtual.c:27:22: sparse:    unsigned long *
>> lib/test_debug_virtual.c:27:15: sparse: sparse: cast from unknown type
--
>> arch/arm64/kernel/module.c:79:9: sparse: sparse: incompatible types in comparison expression (different type sizes):
>> arch/arm64/kernel/module.c:79:9: sparse:    unsigned int *
>> arch/arm64/kernel/module.c:79:9: sparse:    unsigned long *
>> arch/arm64/kernel/module.c:79:9: sparse: sparse: incompatible types in comparison expression (different type sizes):
>> arch/arm64/kernel/module.c:79:9: sparse:    unsigned int *
>> arch/arm64/kernel/module.c:79:9: sparse:    unsigned long *
--
>> arch/arm64/net/bpf_jit_comp.c:1622:30: sparse: sparse: incompatible types in comparison expression (different type sizes):
>> arch/arm64/net/bpf_jit_comp.c:1622:30: sparse:    unsigned int *
>> arch/arm64/net/bpf_jit_comp.c:1622:30: sparse:    unsigned long *
--
   arch/arm64/kernel/probes/kprobes.c:102:21: sparse: sparse: cast to restricted __le32
   arch/arm64/kernel/probes/kprobes.c:102:21: sparse: sparse: cast to restricted __le32
   arch/arm64/kernel/probes/kprobes.c:102:21: sparse: sparse: cast to restricted __le32
   arch/arm64/kernel/probes/kprobes.c:102:21: sparse: sparse: cast to restricted __le32
   arch/arm64/kernel/probes/kprobes.c:102:21: sparse: sparse: cast to restricted __le32
   arch/arm64/kernel/probes/kprobes.c:102:21: sparse: sparse: cast to restricted __le32
>> arch/arm64/kernel/probes/kprobes.c:134:51: sparse: sparse: incompatible types in comparison expression (different type sizes):
>> arch/arm64/kernel/probes/kprobes.c:134:51: sparse:    unsigned int *
>> arch/arm64/kernel/probes/kprobes.c:134:51: sparse:    unsigned long *
--
>> kernel/module/main.c:1607:46: sparse: sparse: incompatible types in comparison expression (different type sizes):
>> kernel/module/main.c:1607:46: sparse:    unsigned int *
>> kernel/module/main.c:1607:46: sparse:    unsigned long *
--
   kernel/bpf/core.c:232:49: sparse: sparse: arithmetics on pointers to functions
>> kernel/bpf/core.c:965:16: sparse: sparse: incompatible types in comparison expression (different type sizes):
>> kernel/bpf/core.c:965:16: sparse:    unsigned int *
>> kernel/bpf/core.c:965:16: sparse:    unsigned long *
   kernel/bpf/core.c:965:30: sparse: sparse: incompatible types in comparison expression (different type sizes):
   kernel/bpf/core.c:965:30: sparse:    unsigned int *
   kernel/bpf/core.c:965:30: sparse:    unsigned long *
   kernel/bpf/core.c: note: in included file (through include/trace/trace_events.h, include/trace/define_trace.h, include/trace/events/xdp.h, ...):
   include/trace/events/xdp.h:320:1: sparse: sparse: Using plain integer as NULL pointer
   include/trace/events/xdp.h:347:1: sparse: sparse: Using plain integer as NULL pointer
   include/trace/events/xdp.h:381:1: sparse: sparse: Using plain integer as NULL pointer
   kernel/bpf/core.c: note: in included file (through include/linux/rbtree_latch.h, include/linux/bpf.h, include/linux/filter.h):
   include/linux/rbtree.h:74:9: sparse: sparse: incompatible types in comparison expression (different address spaces):
   include/linux/rbtree.h:74:9: sparse:    struct rb_node [noderef] __rcu *
   include/linux/rbtree.h:74:9: sparse:    struct rb_node *
   include/linux/rbtree.h:74:9: sparse: sparse: incompatible types in comparison expression (different address spaces):
   include/linux/rbtree.h:74:9: sparse:    struct rb_node [noderef] __rcu *
   include/linux/rbtree.h:74:9: sparse:    struct rb_node *

vim +46 kernel/scs.c

a2abe7cbd8fe2d Sami Tolvanen    2020-11-30  30  
a2abe7cbd8fe2d Sami Tolvanen    2020-11-30  31  static void *__scs_alloc(int node)
a2abe7cbd8fe2d Sami Tolvanen    2020-11-30  32  {
a2abe7cbd8fe2d Sami Tolvanen    2020-11-30  33  	int i;
a2abe7cbd8fe2d Sami Tolvanen    2020-11-30  34  	void *s;
a2abe7cbd8fe2d Sami Tolvanen    2020-11-30  35  
a2abe7cbd8fe2d Sami Tolvanen    2020-11-30  36  	for (i = 0; i < NR_CACHED_SCS; i++) {
a2abe7cbd8fe2d Sami Tolvanen    2020-11-30  37  		s = this_cpu_xchg(scs_cache[i], NULL);
a2abe7cbd8fe2d Sami Tolvanen    2020-11-30  38  		if (s) {
f6e39794f4b6da Andrey Konovalov 2022-03-24  39  			s = kasan_unpoison_vmalloc(s, SCS_SIZE,
f6e39794f4b6da Andrey Konovalov 2022-03-24  40  						   KASAN_VMALLOC_PROT_NORMAL);
a2abe7cbd8fe2d Sami Tolvanen    2020-11-30  41  			memset(s, 0, SCS_SIZE);
f6e39794f4b6da Andrey Konovalov 2022-03-24  42  			goto out;
a2abe7cbd8fe2d Sami Tolvanen    2020-11-30  43  		}
a2abe7cbd8fe2d Sami Tolvanen    2020-11-30  44  	}
a2abe7cbd8fe2d Sami Tolvanen    2020-11-30  45  
f6e39794f4b6da Andrey Konovalov 2022-03-24 @46  	s = __vmalloc_node_range(SCS_SIZE, 1, VMALLOC_START, VMALLOC_END,
a2abe7cbd8fe2d Sami Tolvanen    2020-11-30  47  				    GFP_SCS, PAGE_KERNEL, 0, node,
a2abe7cbd8fe2d Sami Tolvanen    2020-11-30  48  				    __builtin_return_address(0));
f6e39794f4b6da Andrey Konovalov 2022-03-24  49  
f6e39794f4b6da Andrey Konovalov 2022-03-24  50  out:
f6e39794f4b6da Andrey Konovalov 2022-03-24  51  	return kasan_reset_tag(s);
a2abe7cbd8fe2d Sami Tolvanen    2020-11-30  52  }
a2abe7cbd8fe2d Sami Tolvanen    2020-11-30  53  

:::::: The code at line 46 was first introduced by commit
:::::: f6e39794f4b6da7ca9b77f2f9ad11fd6f0ac83e5 kasan, vmalloc: only tag normal vmalloc allocations

:::::: TO: Andrey Konovalov <andreyknvl@google.com>
:::::: CC: Linus Torvalds <torvalds@linux-foundation.org>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
