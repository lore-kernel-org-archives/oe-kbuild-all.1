Received: from mga12.intel.com (mga12.intel.com [192.55.52.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 15587125C7
	for <oe-kbuild-all@lists.linux.dev>; Wed, 21 Jun 2023 14:34:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1687358052; x=1718894052;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=7Yp72vQGrEIEjKhB+n39f7HUmotlLVfqebhy1zryngc=;
  b=kvaJQUiqj+O1zuGQ5W3t6YXU1pPC5pcdBz6FV0JoC2NF58xJBQUDxali
   xQHfyehuPSU4hJh3XkX8oXhyq75xLPNPrsXMmERTASyx6RAQ6wFo8fRL6
   QaqoBKDdKK5K5COp/6QrJN6WL0bH4xuOcH14IEpxgfbTVYlgO5+Sbxgw7
   gXe1p+MGJ2UwLf7UFXbm5XPOZiKBfYTyisbfh6es0j3iE7USOpphrHcVa
   78ctB+Xd52894r+9fxy9m68gYIz216aurDUS7/KnKZWpTmAR6x/low+vb
   cD3+nPvXhe3F9u1z8y8Qs+kIVly1hUNVWNffcE6Hbh+HP+C6zx0awVTNi
   Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10748"; a="339806629"
X-IronPort-AV: E=Sophos;i="6.00,260,1681196400"; 
   d="scan'208";a="339806629"
Received: from orsmga007.jf.intel.com ([10.7.209.58])
  by fmsmga106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 21 Jun 2023 07:34:11 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10748"; a="708725270"
X-IronPort-AV: E=Sophos;i="6.00,260,1681196400"; 
   d="scan'208";a="708725270"
Received: from lkp-server01.sh.intel.com (HELO 783282924a45) ([10.239.97.150])
  by orsmga007.jf.intel.com with ESMTP; 21 Jun 2023 07:34:09 -0700
Received: from kbuild by 783282924a45 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1qByuO-0006tF-34;
	Wed, 21 Jun 2023 14:34:08 +0000
Date: Wed, 21 Jun 2023 22:33:36 +0800
From: kernel test robot <lkp@intel.com>
To: "Mike Rapoport (IBM)" <rppt@kernel.org>
Cc: oe-kbuild-all@lists.linux.dev, Mike Rapoport <rppt@kernel.org>
Subject: [rppt:jitalloc/v2.2 10/12] arch/arm64/mm/init.c:507:18: error:
 'struct execmem_range' has no member named 'text'
Message-ID: <202306212252.IsaOJhEM-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/rppt/linux.git jitalloc/v2.2
head:   4d3b7e33eca22e1fe243f586c13c875d248d29f6
commit: 5f24f0d18c8afbea8c6adc7274c588f256197685 [10/12] arch: make execmem setup available regardless of CONFIG_MODULES
config: arm64-defconfig (https://download.01.org/0day-ci/archive/20230621/202306212252.IsaOJhEM-lkp@intel.com/config)
compiler: aarch64-linux-gcc (GCC) 12.3.0
reproduce: (https://download.01.org/0day-ci/archive/20230621/202306212252.IsaOJhEM-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202306212252.IsaOJhEM-lkp@intel.com/

All errors (new ones prefixed by >>):

>> arch/arm64/mm/init.c:507:18: error: 'struct execmem_range' has no member named 'text'
     507 |                 .text = {
         |                  ^~~~
   arch/arm64/mm/init.c:507:17: warning: braces around scalar initializer
     507 |                 .text = {
         |                 ^
   arch/arm64/mm/init.c:507:17: note: (near initialization for 'execmem_params.jit.start')
>> arch/arm64/mm/init.c:508:25: error: field name not in record or union initializer
     508 |                         .start = VMALLOC_START,
         |                         ^
   arch/arm64/mm/init.c:508:25: note: (near initialization for 'execmem_params.jit.start')
   arch/arm64/mm/init.c:509:25: error: field name not in record or union initializer
     509 |                         .end = VMALLOC_END,
         |                         ^
   arch/arm64/mm/init.c:509:25: note: (near initialization for 'execmem_params.jit.start')
   In file included from include/linux/pgtable.h:6,
                    from arch/arm64/include/asm/io.h:12,
                    from include/linux/io.h:13,
                    from include/linux/irq.h:20,
                    from include/asm-generic/hardirq.h:17,
                    from arch/arm64/include/asm/hardirq.h:17,
                    from include/linux/hardirq.h:11,
                    from include/linux/interrupt.h:11,
                    from include/linux/kernel_stat.h:9,
                    from include/linux/cgroup.h:26,
                    from include/linux/memcontrol.h:13,
                    from include/linux/swap.h:9,
                    from arch/arm64/mm/init.c:12:
   arch/arm64/include/asm/pgtable.h:25:33: warning: excess elements in scalar initializer
      25 | #define VMALLOC_END             (VMEMMAP_START - SZ_256M)
         |                                 ^
   arch/arm64/mm/init.c:509:32: note: in expansion of macro 'VMALLOC_END'
     509 |                         .end = VMALLOC_END,
         |                                ^~~~~~~~~~~
   arch/arm64/include/asm/pgtable.h:25:33: note: (near initialization for 'execmem_params.jit.start')
      25 | #define VMALLOC_END             (VMEMMAP_START - SZ_256M)
         |                                 ^
   arch/arm64/mm/init.c:509:32: note: in expansion of macro 'VMALLOC_END'
     509 |                         .end = VMALLOC_END,
         |                                ^~~~~~~~~~~
   arch/arm64/mm/init.c:510:25: error: field name not in record or union initializer
     510 |                         .alignment = 1,
         |                         ^
   arch/arm64/mm/init.c:510:25: note: (near initialization for 'execmem_params.jit.start')
   arch/arm64/mm/init.c:510:38: warning: excess elements in scalar initializer
     510 |                         .alignment = 1,
         |                                      ^
   arch/arm64/mm/init.c:510:38: note: (near initialization for 'execmem_params.jit.start')
   arch/arm64/mm/init.c: In function 'execmem_arch_params':
   arch/arm64/mm/init.c:527:27: error: 'struct execmem_range' has no member named 'text'
     527 |         execmem_params.jit.text.pgprot = PAGE_KERNEL_ROX;
         |                           ^


vim +507 arch/arm64/mm/init.c

   497	
   498	#ifdef CONFIG_EXECMEM
   499	static struct execmem_params execmem_params __ro_after_init = {
   500		.modules = {
   501			.text = {
   502				.flags = EXECMEM_KASAN_SHADOW,
   503				.alignment = MODULE_ALIGN,
   504			},
   505		},
   506		.jit = {
 > 507			.text = {
 > 508				.start = VMALLOC_START,
   509				.end = VMALLOC_END,
   510				.alignment = 1,
   511			},
   512		},
   513	};
   514	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
