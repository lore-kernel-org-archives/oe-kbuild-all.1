Received: from mga03.intel.com (mga03.intel.com [134.134.136.65])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CFAD63C10
	for <oe-kbuild-all@lists.linux.dev>; Tue, 14 Mar 2023 11:49:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1678794580; x=1710330580;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=eGwyfUDXClLuSPr4Mnp4l7eVNx8OHJkPYJkdRZzi4go=;
  b=bGja7yWvb49SRsAswCT8xhd7OPl2o9ClkF5bmIwMVcCygcveLGA5EZUA
   WjzcO0CUL6iBpL3jFPhYa7PpVZS+Szsi0b3nvviPJMQ/s8YAkoscBgNGP
   GL7BVoBo6wDgetK5DiBGohPMA7M40oNoua9GK857deT9a1DDfqmbBx9kK
   PLj8kqp35iPLR78WDmL+Yxb4Im89bl3ldLoG/6NpZLu6UFijpsZR8wjFv
   N5CqDX7VcYFyw2MCu1PtQsxw+IVPbm8+bMqXiEPvfH/PcutFREnazlwJ4
   hjfRlnlVZrHVtdIqdE+xpNYuvyc1tx2ELnFdLr+ajxLo5/AeRvUp5tJ9y
   Q==;
X-IronPort-AV: E=McAfee;i="6500,9779,10648"; a="339765140"
X-IronPort-AV: E=Sophos;i="5.98,259,1673942400"; 
   d="scan'208";a="339765140"
Received: from fmsmga008.fm.intel.com ([10.253.24.58])
  by orsmga103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 14 Mar 2023 04:49:37 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10648"; a="743294137"
X-IronPort-AV: E=Sophos;i="5.98,259,1673942400"; 
   d="scan'208";a="743294137"
Received: from lkp-server01.sh.intel.com (HELO b613635ddfff) ([10.239.97.150])
  by fmsmga008.fm.intel.com with ESMTP; 14 Mar 2023 04:49:34 -0700
Received: from kbuild by b613635ddfff with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1pc39p-0006sz-32;
	Tue, 14 Mar 2023 11:49:33 +0000
Date: Tue, 14 Mar 2023 19:48:51 +0800
From: kernel test robot <lkp@intel.com>
To: Linus Walleij <linus.walleij@linaro.org>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [arm-integrator:kernel-in-vmalloc-v6.2-rc3-just-ttbr0-split-pointless-c13
 18/31] arch/riscv/include/asm/page.h:142:34: error: expected identifier or
 '(' before '{' token
Message-ID: <202303141957.MDqAGIEh-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hi Linus,

FYI, the error/warning still remains.

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/linusw/linux-integrator.git kernel-in-vmalloc-v6.2-rc3-just-ttbr0-split-pointless-c13
head:   961fd7e75191ae82383f80c1dfd97559f14965b8
commit: d047dc9f56633d427434d6593fce94cf1190abe8 [18/31] riscv: Make virt_to_pfn() a real function
config: riscv-allnoconfig (https://download.01.org/0day-ci/archive/20230314/202303141957.MDqAGIEh-lkp@intel.com/config)
compiler: riscv64-linux-gcc (GCC) 12.1.0
reproduce (this is a W=1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # https://git.kernel.org/pub/scm/linux/kernel/git/linusw/linux-integrator.git/commit/?id=d047dc9f56633d427434d6593fce94cf1190abe8
        git remote add arm-integrator https://git.kernel.org/pub/scm/linux/kernel/git/linusw/linux-integrator.git
        git fetch --no-tags arm-integrator kernel-in-vmalloc-v6.2-rc3-just-ttbr0-split-pointless-c13
        git checkout d047dc9f56633d427434d6593fce94cf1190abe8
        # save the config file
        mkdir build_dir && cp config build_dir/.config
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=gcc-12.1.0 make.cross W=1 O=build_dir ARCH=riscv olddefconfig
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=gcc-12.1.0 make.cross W=1 O=build_dir ARCH=riscv SHELL=/bin/bash arch/riscv/mm/

If you fix the issue, kindly add following tag where applicable
| Reported-by: kernel test robot <lkp@intel.com>
| Link: https://lore.kernel.org/oe-kbuild-all/202303141957.MDqAGIEh-lkp@intel.com/

All errors (new ones prefixed by >>):

   In file included from arch/riscv/include/asm/thread_info.h:11,
                    from include/linux/thread_info.h:60,
                    from include/asm-generic/preempt.h:5,
                    from ./arch/riscv/include/generated/asm/preempt.h:1,
                    from include/linux/preempt.h:78,
                    from include/linux/spinlock.h:56,
                    from include/linux/mmzone.h:8,
                    from include/linux/gfp.h:7,
                    from include/linux/mm.h:7,
                    from arch/riscv/mm/physaddr.c:5:
>> arch/riscv/include/asm/page.h:142:34: error: expected identifier or '(' before '{' token
     142 | #define __va_to_pa_nodebug(x)   ({                                              \
         |                                  ^
   arch/riscv/include/asm/page.h:154:33: note: in expansion of macro '__va_to_pa_nodebug'
     154 | #define __phys_addr_symbol(x)   __va_to_pa_nodebug(x)
         |                                 ^~~~~~~~~~~~~~~~~~
   arch/riscv/mm/physaddr.c:15:13: note: in expansion of macro '__phys_addr_symbol'
      15 | phys_addr_t __phys_addr_symbol(unsigned long x)
         |             ^~~~~~~~~~~~~~~~~~


vim +142 arch/riscv/include/asm/page.h

2bfc6cd81bd17e Alexandre Ghiti 2021-04-11  133  
658e2c5125bbbc Alexandre Ghiti 2021-06-17  134  #define linear_mapping_va_to_pa(x)	((unsigned long)(x) - kernel_map.va_pa_offset)
44c922572952d8 Vitaly Wool     2021-04-13  135  #define kernel_mapping_va_to_pa(y) ({						\
583286e2072ed2 Samuel Holland  2022-11-26  136  	unsigned long _y = (unsigned long)(y);					\
59a27e11221338 Alexandre Ghiti 2021-07-21  137  	(IS_ENABLED(CONFIG_XIP_KERNEL) && _y < kernel_map.virt_addr + XIP_OFFSET) ? \
583286e2072ed2 Samuel Holland  2022-11-26  138  		(_y - kernel_map.va_kernel_xip_pa_offset) :			\
583286e2072ed2 Samuel Holland  2022-11-26  139  		(_y - kernel_map.va_kernel_pa_offset - XIP_OFFSET);		\
44c922572952d8 Vitaly Wool     2021-04-13  140  	})
7094e6acaf7ab8 Alexandre Ghiti 2021-06-04  141  
2bfc6cd81bd17e Alexandre Ghiti 2021-04-11 @142  #define __va_to_pa_nodebug(x)	({						\
2bfc6cd81bd17e Alexandre Ghiti 2021-04-11  143  	unsigned long _x = x;							\
e5c35fa0401971 Alexandre Ghiti 2021-06-24  144  	is_linear_mapping(_x) ?							\
2bfc6cd81bd17e Alexandre Ghiti 2021-04-11  145  		linear_mapping_va_to_pa(_x) : kernel_mapping_va_to_pa(_x);	\
2bfc6cd81bd17e Alexandre Ghiti 2021-04-11  146  	})
6435f773d81f02 Zong Li         2020-01-02  147  

:::::: The code at line 142 was first introduced by commit
:::::: 2bfc6cd81bd17e4306e24ee47b9554c967bcb499 riscv: Move kernel mapping outside of linear mapping

:::::: TO: Alexandre Ghiti <alex@ghiti.fr>
:::::: CC: Palmer Dabbelt <palmerdabbelt@google.com>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests
