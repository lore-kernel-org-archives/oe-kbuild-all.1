Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.20])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 027CD19BB4
	for <oe-kbuild-all@lists.linux.dev>; Wed,  9 Aug 2023 15:43:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1691595818; x=1723131818;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=6xyIykf6Zzkrmj2Y8BYM9ba0afB8ULiVdcB+KD7Sq3M=;
  b=EGOWyA6uCoSk6vUPQ/HCPER8scBlS7yyp5LFvBp8KjElHYOCY2ytyoXs
   kluQn0vKzlCjfeYu6dn6/Q3d2l5uWnrBwcn0VFtwvI+4KaEbKELxjwP9F
   Vdb1DQO/N49Yhkx0A0rsp+fNw2NhscZScyRRq0UO8bkZny224hWvm0uhX
   o65vbm5fAVo9YY/lx0byFbnKFgBfgwfQqy2ANvBcHG7pssxJj8MuO1tRV
   9YzkupZArz/NsEVk2UlRGugFSWuCxx+VuIhhQSddW2jQS/QKBJeltNOIb
   YKjImh/J1Xw7pk6rVQDD5Svydw4ao13Ig7eie1oDihxRrvR8iBtZXhgwC
   A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10797"; a="361286579"
X-IronPort-AV: E=Sophos;i="6.01,159,1684825200"; 
   d="scan'208";a="361286579"
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
  by orsmga101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 09 Aug 2023 08:43:38 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10797"; a="846020628"
X-IronPort-AV: E=Sophos;i="6.01,159,1684825200"; 
   d="scan'208";a="846020628"
Received: from lkp-server01.sh.intel.com (HELO d1ccc7e87e8f) ([10.239.97.150])
  by fmsmga002.fm.intel.com with ESMTP; 09 Aug 2023 08:43:37 -0700
Received: from kbuild by d1ccc7e87e8f with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1qTlLU-0006Cm-1J;
	Wed, 09 Aug 2023 15:43:36 +0000
Date: Wed, 9 Aug 2023 23:43:00 +0800
From: kernel test robot <lkp@intel.com>
To: Linus Walleij <linus.walleij@linaro.org>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [arm-integrator:virt-to-pfn-v6.5-rc1 10/12]
 arch/riscv/include/asm/page.h:156:34: error: expected identifier or '('
 before '{' token
Message-ID: <202308092348.6IAhQXPk-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/linusw/linux-integrator.git virt-to-pfn-v6.5-rc1
head:   b6a25d37eca4850c246b94d73bd2e3c75860d265
commit: a3f18d6c511bc900bacc83834a84d3dc4807846a [10/12] riscv: Make virt_to_pfn() a real function
config: riscv-allnoconfig (https://download.01.org/0day-ci/archive/20230809/202308092348.6IAhQXPk-lkp@intel.com/config)
compiler: riscv64-linux-gcc (GCC) 12.3.0
reproduce: (https://download.01.org/0day-ci/archive/20230809/202308092348.6IAhQXPk-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202308092348.6IAhQXPk-lkp@intel.com/

All errors (new ones prefixed by >>):

   In file included from arch/riscv/include/asm/thread_info.h:11,
                    from include/linux/thread_info.h:60,
                    from include/asm-generic/preempt.h:5,
                    from ./arch/riscv/include/generated/asm/preempt.h:1,
                    from include/linux/preempt.h:79,
                    from include/linux/spinlock.h:56,
                    from include/linux/mmzone.h:8,
                    from include/linux/gfp.h:7,
                    from include/linux/mm.h:7,
                    from arch/riscv/mm/physaddr.c:5:
>> arch/riscv/include/asm/page.h:156:34: error: expected identifier or '(' before '{' token
     156 | #define __va_to_pa_nodebug(x)   ({                                              \
         |                                  ^
   arch/riscv/include/asm/page.h:168:33: note: in expansion of macro '__va_to_pa_nodebug'
     168 | #define __phys_addr_symbol(x)   __va_to_pa_nodebug(x)
         |                                 ^~~~~~~~~~~~~~~~~~
   arch/riscv/mm/physaddr.c:15:13: note: in expansion of macro '__phys_addr_symbol'
      15 | phys_addr_t __phys_addr_symbol(unsigned long x)
         |             ^~~~~~~~~~~~~~~~~~
>> arch/riscv/include/asm/page.h:145:43: error: expected identifier or '(' before 'unsigned'
     145 | #define linear_mapping_va_to_pa(x)      ((unsigned long)(x) - kernel_map.va_pa_offset)
         |                                           ^~~~~~~~
   arch/riscv/mm/physaddr.c:30:13: note: in expansion of macro 'linear_mapping_va_to_pa'
      30 | phys_addr_t linear_mapping_va_to_pa(unsigned long x)
         |             ^~~~~~~~~~~~~~~~~~~~~~~
>> arch/riscv/include/asm/page.h:145:57: error: expected ')' before '(' token
     145 | #define linear_mapping_va_to_pa(x)      ((unsigned long)(x) - kernel_map.va_pa_offset)
         |                                                         ^
   arch/riscv/mm/physaddr.c:30:13: note: in expansion of macro 'linear_mapping_va_to_pa'
      30 | phys_addr_t linear_mapping_va_to_pa(unsigned long x)
         |             ^~~~~~~~~~~~~~~~~~~~~~~
>> arch/riscv/include/asm/page.h:132:43: error: expected identifier or '(' before 'void'
     132 | #define linear_mapping_pa_to_va(x)      ((void *)((unsigned long)(x) + kernel_map.va_pa_offset))
         |                                           ^~~~
   arch/riscv/mm/physaddr.c:38:7: note: in expansion of macro 'linear_mapping_pa_to_va'
      38 | void *linear_mapping_pa_to_va(unsigned long x)
         |       ^~~~~~~~~~~~~~~~~~~~~~~
   arch/riscv/include/asm/page.h:132:50: error: expected ')' before '(' token
     132 | #define linear_mapping_pa_to_va(x)      ((void *)((unsigned long)(x) + kernel_map.va_pa_offset))
         |                                                  ^
   arch/riscv/mm/physaddr.c:38:7: note: in expansion of macro 'linear_mapping_pa_to_va'
      38 | void *linear_mapping_pa_to_va(unsigned long x)
         |       ^~~~~~~~~~~~~~~~~~~~~~~


vim +156 arch/riscv/include/asm/page.h

2bfc6cd81bd17e Alexandre Ghiti 2021-04-11  124  
e5c35fa0401971 Alexandre Ghiti 2021-06-24  125  #define is_kernel_mapping(x)	\
658e2c5125bbbc Alexandre Ghiti 2021-06-17  126  	((x) >= kernel_map.virt_addr && (x) < (kernel_map.virt_addr + kernel_map.size))
0aba691a7443a7 Alexandre Ghiti 2021-07-23  127  
e5c35fa0401971 Alexandre Ghiti 2021-06-24  128  #define is_linear_mapping(x)	\
8b274f2238950c Alexandre Ghiti 2022-02-25  129  	((x) >= PAGE_OFFSET && (!IS_ENABLED(CONFIG_64BIT) || (x) < PAGE_OFFSET + KERN_VIRT_SIZE))
e5c35fa0401971 Alexandre Ghiti 2021-06-24  130  
3335068f87217e Alexandre Ghiti 2023-03-24  131  #ifndef CONFIG_DEBUG_VIRTUAL
658e2c5125bbbc Alexandre Ghiti 2021-06-17 @132  #define linear_mapping_pa_to_va(x)	((void *)((unsigned long)(x) + kernel_map.va_pa_offset))
3335068f87217e Alexandre Ghiti 2023-03-24  133  #else
3335068f87217e Alexandre Ghiti 2023-03-24  134  void *linear_mapping_pa_to_va(unsigned long x);
3335068f87217e Alexandre Ghiti 2023-03-24  135  #endif
44c922572952d8 Vitaly Wool     2021-04-13  136  #define kernel_mapping_pa_to_va(y)	({					\
583286e2072ed2 Samuel Holland  2022-11-26  137  	unsigned long _y = (unsigned long)(y);					\
6d7f91d914bc90 Alexandre Ghiti 2021-07-21  138  	(IS_ENABLED(CONFIG_XIP_KERNEL) && _y < phys_ram_base) ?			\
583286e2072ed2 Samuel Holland  2022-11-26  139  		(void *)(_y + kernel_map.va_kernel_xip_pa_offset) :		\
583286e2072ed2 Samuel Holland  2022-11-26  140  		(void *)(_y + kernel_map.va_kernel_pa_offset + XIP_OFFSET);	\
44c922572952d8 Vitaly Wool     2021-04-13  141  	})
2bfc6cd81bd17e Alexandre Ghiti 2021-04-11  142  #define __pa_to_va_nodebug(x)		linear_mapping_pa_to_va(x)
2bfc6cd81bd17e Alexandre Ghiti 2021-04-11  143  
3335068f87217e Alexandre Ghiti 2023-03-24  144  #ifndef CONFIG_DEBUG_VIRTUAL
658e2c5125bbbc Alexandre Ghiti 2021-06-17 @145  #define linear_mapping_va_to_pa(x)	((unsigned long)(x) - kernel_map.va_pa_offset)
3335068f87217e Alexandre Ghiti 2023-03-24  146  #else
3335068f87217e Alexandre Ghiti 2023-03-24  147  phys_addr_t linear_mapping_va_to_pa(unsigned long x);
3335068f87217e Alexandre Ghiti 2023-03-24  148  #endif
44c922572952d8 Vitaly Wool     2021-04-13  149  #define kernel_mapping_va_to_pa(y) ({						\
583286e2072ed2 Samuel Holland  2022-11-26  150  	unsigned long _y = (unsigned long)(y);					\
59a27e11221338 Alexandre Ghiti 2021-07-21  151  	(IS_ENABLED(CONFIG_XIP_KERNEL) && _y < kernel_map.virt_addr + XIP_OFFSET) ? \
583286e2072ed2 Samuel Holland  2022-11-26  152  		(_y - kernel_map.va_kernel_xip_pa_offset) :			\
583286e2072ed2 Samuel Holland  2022-11-26  153  		(_y - kernel_map.va_kernel_pa_offset - XIP_OFFSET);		\
44c922572952d8 Vitaly Wool     2021-04-13  154  	})
7094e6acaf7ab8 Alexandre Ghiti 2021-06-04  155  
2bfc6cd81bd17e Alexandre Ghiti 2021-04-11 @156  #define __va_to_pa_nodebug(x)	({						\
2bfc6cd81bd17e Alexandre Ghiti 2021-04-11  157  	unsigned long _x = x;							\
e5c35fa0401971 Alexandre Ghiti 2021-06-24  158  	is_linear_mapping(_x) ?							\
2bfc6cd81bd17e Alexandre Ghiti 2021-04-11  159  		linear_mapping_va_to_pa(_x) : kernel_mapping_va_to_pa(_x);	\
2bfc6cd81bd17e Alexandre Ghiti 2021-04-11  160  	})
6435f773d81f02 Zong Li         2020-01-02  161  

:::::: The code at line 156 was first introduced by commit
:::::: 2bfc6cd81bd17e4306e24ee47b9554c967bcb499 riscv: Move kernel mapping outside of linear mapping

:::::: TO: Alexandre Ghiti <alex@ghiti.fr>
:::::: CC: Palmer Dabbelt <palmerdabbelt@google.com>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
