Received: from mga03.intel.com (mga03.intel.com [134.134.136.65])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1B614A4F
	for <oe-kbuild-all@lists.linux.dev>; Sat, 22 Jul 2023 22:19:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1690064369; x=1721600369;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=Reqv6eaeE+RN65zKGU/CX2SW6NSjfCsK9eOepbrBtyc=;
  b=nwKt7s7lXParLWjWB7ELIr1BB0dY1WDr26MXgyWSEFp/dNGSgGK97SWe
   j5uwLGL2K41OMWANiY9hjlw+6EREcTlcQVOztJH55w8oT8UWp1Y7D99jS
   HzXd5aZZity+4bIqvRQaF9+tCP1L6hbvFtGG2JXmOiatR3cZTWqrhdc6s
   8yKgxG0SLBLpL04tc83e/Y7y/fM/kPtUpjvX/RIO7hivydbsT2nmZ/5vz
   jwhib3fZBUw89oL8NmOs+Aa6arfykvXEIZ6sm6gT4JzSgwsISC/5XXryv
   TlTvj63gjXW29kXNbNMFkkBtEQ8+T1GaKmr0xxvPvWaT1+DgFnILxDYP/
   A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10779"; a="370832942"
X-IronPort-AV: E=Sophos;i="6.01,224,1684825200"; 
   d="scan'208";a="370832942"
Received: from fmsmga007.fm.intel.com ([10.253.24.52])
  by orsmga103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 22 Jul 2023 15:19:28 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10779"; a="728473740"
X-IronPort-AV: E=Sophos;i="6.01,224,1684825200"; 
   d="scan'208";a="728473740"
Received: from lkp-server02.sh.intel.com (HELO 36946fcf73d7) ([10.239.97.151])
  by fmsmga007.fm.intel.com with ESMTP; 22 Jul 2023 15:19:27 -0700
Received: from kbuild by 36946fcf73d7 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1qNKwg-0008eP-2K;
	Sat, 22 Jul 2023 22:19:26 +0000
Date: Sun, 23 Jul 2023 06:19:19 +0800
From: kernel test robot <lkp@intel.com>
To: Guo Ren <guoren@linux.alibaba.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [csky-linux:sg2042-master-qspinlock-64ilp32_v3 27/42]
 include/linux/kern_levels.h:5:25: warning: format '%lx' expects argument of
 type 'long unsigned int', but argument 3 has type 'long long unsigned int'
Message-ID: <202307230653.7bc2NC4S-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://github.com/c-sky/csky-linux sg2042-master-qspinlock-64ilp32_v3
head:   7f9f76d36814ed6fcbca4c27a5d2ec3724c46add
commit: 255cb458b187d7958c7e9f27d8f831fee8be8c5d [27/42] riscv: s64ilp32: Add MMU_SV39 mode support
config: riscv-allmodconfig (https://download.01.org/0day-ci/archive/20230723/202307230653.7bc2NC4S-lkp@intel.com/config)
compiler: riscv64-linux-gcc (GCC) 12.3.0
reproduce: (https://download.01.org/0day-ci/archive/20230723/202307230653.7bc2NC4S-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202307230653.7bc2NC4S-lkp@intel.com/

All warnings (new ones prefixed by >>):

   In file included from include/asm-generic/bug.h:22,
                    from arch/riscv/include/asm/bug.h:83,
                    from include/linux/bug.h:5,
                    from include/linux/fortify-string.h:5,
                    from include/linux/string.h:254,
                    from include/linux/bitmap.h:11,
                    from mm/percpu.c:71:
   mm/percpu.c: In function 'pcpu_embed_first_chunk':
>> include/linux/kern_levels.h:5:25: warning: format '%lx' expects argument of type 'long unsigned int', but argument 3 has type 'long long unsigned int' [-Wformat=]
       5 | #define KERN_SOH        "\001"          /* ASCII Start Of Header */
         |                         ^~~~~~
   include/linux/printk.h:427:25: note: in definition of macro 'printk_index_wrap'
     427 |                 _p_func(_fmt, ##__VA_ARGS__);                           \
         |                         ^~~~
   include/linux/printk.h:508:9: note: in expansion of macro 'printk'
     508 |         printk(KERN_WARNING pr_fmt(fmt), ##__VA_ARGS__)
         |         ^~~~~~
   include/linux/kern_levels.h:12:25: note: in expansion of macro 'KERN_SOH'
      12 | #define KERN_WARNING    KERN_SOH "4"    /* warning conditions */
         |                         ^~~~~~~~
   include/linux/printk.h:508:16: note: in expansion of macro 'KERN_WARNING'
     508 |         printk(KERN_WARNING pr_fmt(fmt), ##__VA_ARGS__)
         |                ^~~~~~~~~~~~
   mm/percpu.c:3111:17: note: in expansion of macro 'pr_warn'
    3111 |                 pr_warn("max_distance=0x%lx too large for vmalloc space 0x%lx\n",
         |                 ^~~~~~~
--
   arch/riscv/kernel/crash_core.c: In function 'arch_crash_save_vmcoreinfo':
>> arch/riscv/kernel/crash_core.c:12:58: warning: format '%lx' expects argument of type 'long unsigned int', but argument 2 has type 'long long unsigned int' [-Wformat=]
      12 |         vmcoreinfo_append_str("NUMBER(VMALLOC_START)=0x%lx\n", VMALLOC_START);
         |                                                        ~~^
         |                                                          |
         |                                                          long unsigned int
         |                                                        %llx
   arch/riscv/kernel/crash_core.c:14:58: warning: format '%lx' expects argument of type 'long unsigned int', but argument 2 has type 'long long unsigned int' [-Wformat=]
      14 |         vmcoreinfo_append_str("NUMBER(VMEMMAP_START)=0x%lx\n", VMEMMAP_START);
         |                                                        ~~^
         |                                                          |
         |                                                          long unsigned int
         |                                                        %llx
   arch/riscv/kernel/crash_core.c:15:56: warning: format '%lx' expects argument of type 'long unsigned int', but argument 2 has type 'long long unsigned int' [-Wformat=]
      15 |         vmcoreinfo_append_str("NUMBER(VMEMMAP_END)=0x%lx\n", VMEMMAP_END);
         |                                                      ~~^
         |                                                        |
         |                                                        long unsigned int
         |                                                      %llx


vim +5 include/linux/kern_levels.h

314ba3520e513a Joe Perches 2012-07-30  4  
04d2c8c83d0e3a Joe Perches 2012-07-30 @5  #define KERN_SOH	"\001"		/* ASCII Start Of Header */
04d2c8c83d0e3a Joe Perches 2012-07-30  6  #define KERN_SOH_ASCII	'\001'
04d2c8c83d0e3a Joe Perches 2012-07-30  7  

:::::: The code at line 5 was first introduced by commit
:::::: 04d2c8c83d0e3ac5f78aeede51babb3236200112 printk: convert the format for KERN_<LEVEL> to a 2 byte pattern

:::::: TO: Joe Perches <joe@perches.com>
:::::: CC: Linus Torvalds <torvalds@linux-foundation.org>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
