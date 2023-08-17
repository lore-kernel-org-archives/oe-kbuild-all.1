Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.151])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 094AC1FB0
	for <oe-kbuild-all@lists.linux.dev>; Thu, 17 Aug 2023 07:13:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1692256425; x=1723792425;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=2LAVKkL7QSrJpjbk1BMVPm8Ba2HPS6UZlrQh0eUJ6Bc=;
  b=NJxXmui3GvWJlz8uBSrhRj4v0+lYAbpxOtxzfBaMJWVe9s8DBgsyRL8R
   9QCdYD9kGmTjWftBnPGvXrKPJYTLasnR0N5UnCT3GKLcOaAB40B7hSVIz
   +RicgwcP7oZBEMFUTJ0oSC0GTDT3iN2UPa4daMJEGN3ReJNOtnrt47EzC
   /WG3j+ZTfjNlRA2ahkZWPCMva8dcyKgrqr8Tx4sfvqE6iUKgcbdlVOV3J
   jqCxTQzoFb1YWNA1AaBC2+3w6UCL6MoOzwoNz3B3Ee8/x5DII1NZIUP67
   w5kPr49oP02hc3kr697J8v7AaMUQwxSOmBnRW/X83xxd3vKu2UcU6zH0C
   A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10803"; a="353049081"
X-IronPort-AV: E=Sophos;i="6.01,179,1684825200"; 
   d="scan'208";a="353049081"
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
  by fmsmga107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 17 Aug 2023 00:13:44 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.01,202,1684825200"; 
   d="scan'208";a="878104996"
Received: from lkp-server02.sh.intel.com (HELO a9caf1a0cf30) ([10.239.97.151])
  by fmsmga001.fm.intel.com with ESMTP; 17 Aug 2023 00:13:46 -0700
Received: from kbuild by a9caf1a0cf30 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1qWXCC-0000sy-0U;
	Thu, 17 Aug 2023 07:13:32 +0000
Date: Thu, 17 Aug 2023 15:11:12 +0800
From: kernel test robot <lkp@intel.com>
To: Guo Ren <guoren@linux.alibaba.com>
Cc: oe-kbuild-all@lists.linux.dev, Palmer Dabbelt <palmer@rivosinc.com>
Subject: [palmer:fixes 20/22] arch/riscv/kernel/irq.c:94:1: error: s0 cannot
 be used in 'asm' here
Message-ID: <202308171548.dvWDsXu9-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/palmer/linux.git fixes
head:   ca09f772cccaeec4cd05a21528c37a260aa2dd2c
commit: ebc9cb03b21e263db607a7604134a195aa314ebb [20/22] riscv: stack: Fixup independent softirq stack for CONFIG_FRAME_POINTER=n
config: riscv-randconfig-r072-20230817 (https://download.01.org/0day-ci/archive/20230817/202308171548.dvWDsXu9-lkp@intel.com/config)
compiler: riscv32-linux-gcc (GCC) 12.3.0
reproduce: (https://download.01.org/0day-ci/archive/20230817/202308171548.dvWDsXu9-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202308171548.dvWDsXu9-lkp@intel.com/

All errors (new ones prefixed by >>):

   arch/riscv/kernel/irq.c: In function 'do_softirq_own_stack':
>> arch/riscv/kernel/irq.c:94:1: error: s0 cannot be used in 'asm' here
      94 | }
         | ^
>> arch/riscv/kernel/irq.c:94:1: error: s0 cannot be used in 'asm' here


vim +/asm +94 arch/riscv/kernel/irq.c

dd69d07a5a6c5a Guo Ren 2023-06-13  62  
dd69d07a5a6c5a Guo Ren 2023-06-13  63  #ifdef CONFIG_HAVE_SOFTIRQ_ON_OWN_STACK
dd69d07a5a6c5a Guo Ren 2023-06-13  64  void do_softirq_own_stack(void)
dd69d07a5a6c5a Guo Ren 2023-06-13  65  {
dd69d07a5a6c5a Guo Ren 2023-06-13  66  #ifdef CONFIG_IRQ_STACKS
dd69d07a5a6c5a Guo Ren 2023-06-13  67  	if (on_thread_stack()) {
dd69d07a5a6c5a Guo Ren 2023-06-13  68  		ulong *sp = per_cpu(irq_stack_ptr, smp_processor_id())
dd69d07a5a6c5a Guo Ren 2023-06-13  69  					+ IRQ_STACK_SIZE/sizeof(ulong);
dd69d07a5a6c5a Guo Ren 2023-06-13  70  		__asm__ __volatile(
dd69d07a5a6c5a Guo Ren 2023-06-13  71  		"addi	sp, sp, -"RISCV_SZPTR  "\n"
dd69d07a5a6c5a Guo Ren 2023-06-13  72  		REG_S"  ra, (sp)		\n"
dd69d07a5a6c5a Guo Ren 2023-06-13  73  		"addi	sp, sp, -"RISCV_SZPTR  "\n"
dd69d07a5a6c5a Guo Ren 2023-06-13  74  		REG_S"  s0, (sp)		\n"
dd69d07a5a6c5a Guo Ren 2023-06-13  75  		"addi	s0, sp, 2*"RISCV_SZPTR "\n"
dd69d07a5a6c5a Guo Ren 2023-06-13  76  		"move	sp, %[sp]		\n"
dd69d07a5a6c5a Guo Ren 2023-06-13  77  		"call	__do_softirq		\n"
dd69d07a5a6c5a Guo Ren 2023-06-13  78  		"addi	sp, s0, -2*"RISCV_SZPTR"\n"
dd69d07a5a6c5a Guo Ren 2023-06-13  79  		REG_L"  s0, (sp)		\n"
dd69d07a5a6c5a Guo Ren 2023-06-13  80  		"addi	sp, sp, "RISCV_SZPTR   "\n"
dd69d07a5a6c5a Guo Ren 2023-06-13  81  		REG_L"  ra, (sp)		\n"
dd69d07a5a6c5a Guo Ren 2023-06-13  82  		"addi	sp, sp, "RISCV_SZPTR   "\n"
dd69d07a5a6c5a Guo Ren 2023-06-13  83  		:
dd69d07a5a6c5a Guo Ren 2023-06-13  84  		: [sp] "r" (sp)
dd69d07a5a6c5a Guo Ren 2023-06-13  85  		: "a0", "a1", "a2", "a3", "a4", "a5", "a6", "a7",
dd69d07a5a6c5a Guo Ren 2023-06-13  86  		  "t0", "t1", "t2", "t3", "t4", "t5", "t6",
ebc9cb03b21e26 Guo Ren 2023-07-15  87  #ifndef CONFIG_FRAME_POINTER
ebc9cb03b21e26 Guo Ren 2023-07-15  88  		  "s0",
ebc9cb03b21e26 Guo Ren 2023-07-15  89  #endif
dd69d07a5a6c5a Guo Ren 2023-06-13  90  		  "memory");
dd69d07a5a6c5a Guo Ren 2023-06-13  91  	} else
dd69d07a5a6c5a Guo Ren 2023-06-13  92  #endif
dd69d07a5a6c5a Guo Ren 2023-06-13  93  		__do_softirq();
dd69d07a5a6c5a Guo Ren 2023-06-13 @94  }
dd69d07a5a6c5a Guo Ren 2023-06-13  95  #endif /* CONFIG_HAVE_SOFTIRQ_ON_OWN_STACK */
dd69d07a5a6c5a Guo Ren 2023-06-13  96  

:::::: The code at line 94 was first introduced by commit
:::::: dd69d07a5a6c5a9ada85321ab0695e7978fc6f3e riscv: stack: Support HAVE_SOFTIRQ_ON_OWN_STACK

:::::: TO: Guo Ren <guoren@linux.alibaba.com>
:::::: CC: Palmer Dabbelt <palmer@rivosinc.com>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
