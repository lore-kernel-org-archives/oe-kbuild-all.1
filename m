Received: from mga17.intel.com (mga17.intel.com [192.55.52.151])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E5660D530
	for <oe-kbuild-all@lists.linux.dev>; Mon, 24 Jul 2023 15:31:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1690212675; x=1721748675;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=VQGqjXf/blcyu2VF2V/LoEVbKeVh3W54kY5LWBASaSs=;
  b=PqZMugeDE/XhJaohQq0J3o5RrwBr8CnnrtGeKrJZF9jD9mj+/Y2hoxDf
   W8nPc5nwqD6UoPNanfmloQHERCv48vB6rveqaz9uHAQVk6FsWU1LIjqXB
   6dWwX0Ihu3KNYpWaKe0wAAtVYq3Ku2NZAIaZQ1Qktvp+YIBH49/KyJk4c
   kurnRAdWsXnl8fEq8ePzqxpEZoEs3yFkvB6K6qSWmVcJIPk2nawNcVPNH
   3vRYE8uxh3pehciWVhlO2BAeGQfI8tp2F//LD41eTdyUnJYFI/eICLty0
   tLg9aR+ooETRqqxcCX9ogkBqmo/Hxop0YFHhSUynd0Mt0K7ehh1/GsAbV
   A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10781"; a="347747094"
X-IronPort-AV: E=Sophos;i="6.01,228,1684825200"; 
   d="scan'208";a="347747094"
Received: from orsmga004.jf.intel.com ([10.7.209.38])
  by fmsmga107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 24 Jul 2023 08:31:14 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10781"; a="849672551"
X-IronPort-AV: E=Sophos;i="6.01,228,1684825200"; 
   d="scan'208";a="849672551"
Received: from lkp-server02.sh.intel.com (HELO 36946fcf73d7) ([10.239.97.151])
  by orsmga004.jf.intel.com with ESMTP; 24 Jul 2023 08:31:12 -0700
Received: from kbuild by 36946fcf73d7 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1qNxWi-0009oi-0z;
	Mon, 24 Jul 2023 15:31:12 +0000
Date: Mon, 24 Jul 2023 23:31:03 +0800
From: kernel test robot <lkp@intel.com>
To: Arnd Bergmann <arnd@arndb.de>
Cc: oe-kbuild-all@lists.linux.dev,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Greg Ungerer <gerg@linux-m68k.org>, Sasha Levin <sashal@kernel.org>
Subject: [stable:linux-5.4.y 384/8912]
 drivers/staging/comedi/drivers/comedi_isadma.c:25:17: error: implicit
 declaration of function 'claim_dma_lock'
Message-ID: <202307242307.QcWflQmy-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hi Arnd,

FYI, the error/warning still remains.

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/stable/linux-stable.git linux-5.4.y
head:   b30db4f7e45f3c17cca2ba5be6f22762837a6e34
commit: 53a72858bcae7eaa7df8d167dbf60682d70f82a6 [384/8912] m68knommu: only set CONFIG_ISA_DMA_API for ColdFire sub-arch
config: m68k-randconfig-r014-20230724 (https://download.01.org/0day-ci/archive/20230724/202307242307.QcWflQmy-lkp@intel.com/config)
compiler: m68k-linux-gcc (GCC) 12.3.0
reproduce: (https://download.01.org/0day-ci/archive/20230724/202307242307.QcWflQmy-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202307242307.QcWflQmy-lkp@intel.com/

All errors (new ones prefixed by >>):

   In file included from include/linux/kernel.h:11,
                    from include/linux/list.h:9,
                    from include/linux/module.h:9,
                    from drivers/staging/comedi/drivers/comedi_isadma.c:7:
   include/linux/scatterlist.h: In function 'sg_set_buf':
   arch/m68k/include/asm/page_mm.h:169:50: warning: ordered comparison of pointer with null pointer [-Wextra]
     169 | #define virt_addr_valid(kaddr)  ((void *)(kaddr) >= (void *)PAGE_OFFSET && (void *)(kaddr) < high_memory)
         |                                                  ^~
   include/linux/compiler.h:78:45: note: in definition of macro 'unlikely'
      78 | # define unlikely(x)    __builtin_expect(!!(x), 0)
         |                                             ^
   include/linux/scatterlist.h:143:9: note: in expansion of macro 'BUG_ON'
     143 |         BUG_ON(!virt_addr_valid(buf));
         |         ^~~~~~
   include/linux/scatterlist.h:143:17: note: in expansion of macro 'virt_addr_valid'
     143 |         BUG_ON(!virt_addr_valid(buf));
         |                 ^~~~~~~~~~~~~~~
   In file included from arch/m68k/include/asm/bug.h:32,
                    from include/linux/bug.h:5,
                    from include/linux/thread_info.h:12,
                    from include/asm-generic/preempt.h:5,
                    from ./arch/m68k/include/generated/asm/preempt.h:1,
                    from include/linux/preempt.h:78,
                    from include/linux/spinlock.h:51,
                    from include/linux/seqlock.h:36,
                    from include/linux/time.h:6,
                    from include/linux/stat.h:19,
                    from include/linux/module.h:10:
   include/linux/dma-mapping.h: In function 'dma_map_resource':
   arch/m68k/include/asm/page_mm.h:169:50: warning: ordered comparison of pointer with null pointer [-Wextra]
     169 | #define virt_addr_valid(kaddr)  ((void *)(kaddr) >= (void *)PAGE_OFFSET && (void *)(kaddr) < high_memory)
         |                                                  ^~
   include/asm-generic/bug.h:139:34: note: in definition of macro 'WARN_ON_ONCE'
     139 |         int __ret_warn_once = !!(condition);                    \
         |                                  ^~~~~~~~~
   arch/m68k/include/asm/page_mm.h:170:33: note: in expansion of macro 'virt_addr_valid'
     170 | #define pfn_valid(pfn)          virt_addr_valid(pfn_to_virt(pfn))
         |                                 ^~~~~~~~~~~~~~~
   include/linux/dma-mapping.h:355:26: note: in expansion of macro 'pfn_valid'
     355 |         if (WARN_ON_ONCE(pfn_valid(PHYS_PFN(phys_addr))))
         |                          ^~~~~~~~~
   drivers/staging/comedi/drivers/comedi_isadma.c: In function 'comedi_isadma_program':
>> drivers/staging/comedi/drivers/comedi_isadma.c:25:17: error: implicit declaration of function 'claim_dma_lock' [-Werror=implicit-function-declaration]
      25 |         flags = claim_dma_lock();
         |                 ^~~~~~~~~~~~~~
>> drivers/staging/comedi/drivers/comedi_isadma.c:31:9: error: implicit declaration of function 'release_dma_lock' [-Werror=implicit-function-declaration]
      31 |         release_dma_lock(flags);
         |         ^~~~~~~~~~~~~~~~
   cc1: some warnings being treated as errors


vim +/claim_dma_lock +25 drivers/staging/comedi/drivers/comedi_isadma.c

20a1ea7d6ba184 H Hartley Sweeten 2015-01-14  16  
20a1ea7d6ba184 H Hartley Sweeten 2015-01-14  17  /**
20a1ea7d6ba184 H Hartley Sweeten 2015-01-14  18   * comedi_isadma_program - program and enable an ISA DMA transfer
20a1ea7d6ba184 H Hartley Sweeten 2015-01-14  19   * @desc:	the ISA DMA cookie to program and enable
20a1ea7d6ba184 H Hartley Sweeten 2015-01-14  20   */
20a1ea7d6ba184 H Hartley Sweeten 2015-01-14  21  void comedi_isadma_program(struct comedi_isadma_desc *desc)
20a1ea7d6ba184 H Hartley Sweeten 2015-01-14  22  {
20a1ea7d6ba184 H Hartley Sweeten 2015-01-14  23  	unsigned long flags;
20a1ea7d6ba184 H Hartley Sweeten 2015-01-14  24  
20a1ea7d6ba184 H Hartley Sweeten 2015-01-14 @25  	flags = claim_dma_lock();
20a1ea7d6ba184 H Hartley Sweeten 2015-01-14  26  	clear_dma_ff(desc->chan);
20a1ea7d6ba184 H Hartley Sweeten 2015-01-14  27  	set_dma_mode(desc->chan, desc->mode);
20a1ea7d6ba184 H Hartley Sweeten 2015-01-14  28  	set_dma_addr(desc->chan, desc->hw_addr);
20a1ea7d6ba184 H Hartley Sweeten 2015-01-14  29  	set_dma_count(desc->chan, desc->size);
20a1ea7d6ba184 H Hartley Sweeten 2015-01-14  30  	enable_dma(desc->chan);
20a1ea7d6ba184 H Hartley Sweeten 2015-01-14 @31  	release_dma_lock(flags);
20a1ea7d6ba184 H Hartley Sweeten 2015-01-14  32  }
20a1ea7d6ba184 H Hartley Sweeten 2015-01-14  33  EXPORT_SYMBOL_GPL(comedi_isadma_program);
20a1ea7d6ba184 H Hartley Sweeten 2015-01-14  34  

:::::: The code at line 25 was first introduced by commit
:::::: 20a1ea7d6ba184a1f6e25e85786738003387cada staging: comedi: comedi_isadma: introduce helper module for ISA DMA

:::::: TO: H Hartley Sweeten <hsweeten@visionengravers.com>
:::::: CC: Greg Kroah-Hartman <gregkh@linuxfoundation.org>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
