Received: from mga05.intel.com (mga05.intel.com [192.55.52.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 75E622116
	for <oe-kbuild-all@lists.linux.dev>; Tue, 11 Apr 2023 06:37:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1681195022; x=1712731022;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=+oaXs8ADlquWzga6eR4Z2xnBHi0wzLCQP0dykEF7SQM=;
  b=lJsl26DdmrTCx5xl8BG2TJq7+ihnd0nyGOL7DCs7GlYWqfRcmjDUAbYv
   yqxwFl+lO5BWLyy5eV19KCVJgbl6WWZnF7GmvKI1Ptmj1J1kfModfsu8f
   efHHMqFvPZXUIfzEqillMc4Z/BfjwPftjscXgauJD8ZaYNjnkeRCETvHk
   l5g/Q+SZen3ZzuKzrvG3PQmT2k+FBuTKHDT+TTNtQNi2B+KTS5n+9qEjd
   1D+IkMD5seB8oOmwQh16KPzE4qiY86WfSje65Z5ibPnYBe06B35LaDcV3
   Lbr0CwGC5V9P53giBv6JIc/l/l4k/6KcoAjc8WewtOeD2YM9YEpFkgo2Q
   A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10676"; a="429827205"
X-IronPort-AV: E=Sophos;i="5.98,336,1673942400"; 
   d="scan'208";a="429827205"
Received: from fmsmga004.fm.intel.com ([10.253.24.48])
  by fmsmga105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 10 Apr 2023 23:36:59 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10676"; a="757703199"
X-IronPort-AV: E=Sophos;i="5.98,336,1673942400"; 
   d="scan'208";a="757703199"
Received: from lkp-server01.sh.intel.com (HELO b613635ddfff) ([10.239.97.150])
  by fmsmga004.fm.intel.com with ESMTP; 10 Apr 2023 23:36:57 -0700
Received: from kbuild by b613635ddfff with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1pm7ce-000W2f-39;
	Tue, 11 Apr 2023 06:36:56 +0000
Date: Tue, 11 Apr 2023 14:36:29 +0800
From: kernel test robot <lkp@intel.com>
To: Arnd Bergmann <arnd@arndb.de>
Cc: oe-kbuild-all@lists.linux.dev,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Greg Ungerer <gerg@linux-m68k.org>, Sasha Levin <sashal@kernel.org>
Subject: [stable:linux-5.4.y 384/8053] drivers/scsi/BusLogic.c:2005:47:
 error: 'DMA_MODE_CASCADE' undeclared; did you mean 'DMA_MODE_READ'?
Message-ID: <202304111443.hB6grejl-lkp@intel.com>
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
head:   32bea3bac5ca484c6f7e302c8c96fc686f62e7b4
commit: 53a72858bcae7eaa7df8d167dbf60682d70f82a6 [384/8053] m68knommu: only set CONFIG_ISA_DMA_API for ColdFire sub-arch
config: m68k-randconfig-r035-20230410 (https://download.01.org/0day-ci/archive/20230411/202304111443.hB6grejl-lkp@intel.com/config)
compiler: m68k-linux-gcc (GCC) 12.1.0
reproduce (this is a W=1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # https://git.kernel.org/pub/scm/linux/kernel/git/stable/linux-stable.git/commit/?id=53a72858bcae7eaa7df8d167dbf60682d70f82a6
        git remote add stable https://git.kernel.org/pub/scm/linux/kernel/git/stable/linux-stable.git
        git fetch --no-tags stable linux-5.4.y
        git checkout 53a72858bcae7eaa7df8d167dbf60682d70f82a6
        # save the config file
        mkdir build_dir && cp config build_dir/.config
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=gcc-12.1.0 make.cross W=1 O=build_dir ARCH=m68k olddefconfig
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=gcc-12.1.0 make.cross W=1 O=build_dir ARCH=m68k SHELL=/bin/bash drivers/

If you fix the issue, kindly add following tag where applicable
| Reported-by: kernel test robot <lkp@intel.com>
| Link: https://lore.kernel.org/oe-kbuild-all/202304111443.hB6grejl-lkp@intel.com/

All error/warnings (new ones prefixed by >>):

   In file included from include/linux/kernel.h:11,
                    from include/linux/list.h:9,
                    from include/linux/module.h:9,
                    from drivers/scsi/BusLogic.c:25:
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
   include/asm-generic/bug.h:182:32: note: in definition of macro 'WARN_ON'
     182 |         int __ret_warn_on = !!(condition);                              \
         |                                ^~~~~~~~~
   include/linux/dma-mapping.h:355:13: note: in expansion of macro 'WARN_ON_ONCE'
     355 |         if (WARN_ON_ONCE(pfn_valid(PHYS_PFN(phys_addr))))
         |             ^~~~~~~~~~~~
   arch/m68k/include/asm/page_mm.h:170:33: note: in expansion of macro 'virt_addr_valid'
     170 | #define pfn_valid(pfn)          virt_addr_valid(pfn_to_virt(pfn))
         |                                 ^~~~~~~~~~~~~~~
   include/linux/dma-mapping.h:355:26: note: in expansion of macro 'pfn_valid'
     355 |         if (WARN_ON_ONCE(pfn_valid(PHYS_PFN(phys_addr))))
         |                          ^~~~~~~~~
   drivers/scsi/BusLogic.c: In function 'blogic_rdconfig':
>> drivers/scsi/BusLogic.c:1734:46: warning: ordered comparison of pointer with null pointer [-Wextra]
    1734 |                         (void *) high_memory > (void *) MAX_DMA_ADDRESS)
         |                                              ^
   drivers/scsi/BusLogic.c:1747:46: warning: ordered comparison of pointer with null pointer [-Wextra]
    1747 |                         (void *) high_memory > (void *) MAX_DMA_ADDRESS)
         |                                              ^
   drivers/scsi/BusLogic.c: In function 'blogic_getres':
>> drivers/scsi/BusLogic.c:2005:47: error: 'DMA_MODE_CASCADE' undeclared (first use in this function); did you mean 'DMA_MODE_READ'?
    2005 |                 set_dma_mode(adapter->dma_ch, DMA_MODE_CASCADE);
         |                                               ^~~~~~~~~~~~~~~~
         |                                               DMA_MODE_READ
   drivers/scsi/BusLogic.c:2005:47: note: each undeclared identifier is reported only once for each function it appears in
   drivers/scsi/BusLogic.c: In function 'blogic_msg':
   drivers/scsi/BusLogic.c:3589:9: warning: function 'blogic_msg' might be a candidate for 'gnu_printf' format attribute [-Wsuggest-attribute=format]
    3589 |         len = vsprintf(buf, fmt, args);
         |         ^~~

Kconfig warnings: (for reference only)
   WARNING: unmet direct dependencies detected for NEED_MULTIPLE_NODES
   Depends on [n]: DISCONTIGMEM [=n] || NUMA
   Selected by [y]:
   - SINGLE_MEMORY_CHUNK [=y] && MMU [=y]


vim +2005 drivers/scsi/BusLogic.c

^1da177e4c3f41 Linus Torvalds 2005-04-16  1979  
839cb99e8f7483 Khalid Aziz    2013-05-16  1980  static bool __init blogic_getres(struct blogic_adapter *adapter)
^1da177e4c3f41 Linus Torvalds 2005-04-16  1981  {
839cb99e8f7483 Khalid Aziz    2013-05-16  1982  	if (adapter->irq_ch == 0) {
839cb99e8f7483 Khalid Aziz    2013-05-16  1983  		blogic_err("NO LEGAL INTERRUPT CHANNEL ASSIGNED - DETACHING\n",
839cb99e8f7483 Khalid Aziz    2013-05-16  1984  				adapter);
^1da177e4c3f41 Linus Torvalds 2005-04-16  1985  		return false;
^1da177e4c3f41 Linus Torvalds 2005-04-16  1986  	}
^1da177e4c3f41 Linus Torvalds 2005-04-16  1987  	/*
^1da177e4c3f41 Linus Torvalds 2005-04-16  1988  	   Acquire shared access to the IRQ Channel.
^1da177e4c3f41 Linus Torvalds 2005-04-16  1989  	 */
839cb99e8f7483 Khalid Aziz    2013-05-16  1990  	if (request_irq(adapter->irq_ch, blogic_inthandler, IRQF_SHARED,
839cb99e8f7483 Khalid Aziz    2013-05-16  1991  				adapter->full_model, adapter) < 0) {
839cb99e8f7483 Khalid Aziz    2013-05-16  1992  		blogic_err("UNABLE TO ACQUIRE IRQ CHANNEL %d - DETACHING\n",
839cb99e8f7483 Khalid Aziz    2013-05-16  1993  				adapter, adapter->irq_ch);
^1da177e4c3f41 Linus Torvalds 2005-04-16  1994  		return false;
^1da177e4c3f41 Linus Torvalds 2005-04-16  1995  	}
839cb99e8f7483 Khalid Aziz    2013-05-16  1996  	adapter->irq_acquired = true;
^1da177e4c3f41 Linus Torvalds 2005-04-16  1997  	/*
^1da177e4c3f41 Linus Torvalds 2005-04-16  1998  	   Acquire exclusive access to the DMA Channel.
^1da177e4c3f41 Linus Torvalds 2005-04-16  1999  	 */
839cb99e8f7483 Khalid Aziz    2013-05-16  2000  	if (adapter->dma_ch > 0) {
839cb99e8f7483 Khalid Aziz    2013-05-16  2001  		if (request_dma(adapter->dma_ch, adapter->full_model) < 0) {
839cb99e8f7483 Khalid Aziz    2013-05-16  2002  			blogic_err("UNABLE TO ACQUIRE DMA CHANNEL %d - DETACHING\n", adapter, adapter->dma_ch);
^1da177e4c3f41 Linus Torvalds 2005-04-16  2003  			return false;
^1da177e4c3f41 Linus Torvalds 2005-04-16  2004  		}
839cb99e8f7483 Khalid Aziz    2013-05-16 @2005  		set_dma_mode(adapter->dma_ch, DMA_MODE_CASCADE);
839cb99e8f7483 Khalid Aziz    2013-05-16  2006  		enable_dma(adapter->dma_ch);
839cb99e8f7483 Khalid Aziz    2013-05-16  2007  		adapter->dma_chan_acquired = true;
^1da177e4c3f41 Linus Torvalds 2005-04-16  2008  	}
^1da177e4c3f41 Linus Torvalds 2005-04-16  2009  	/*
^1da177e4c3f41 Linus Torvalds 2005-04-16  2010  	   Indicate the System Resource Acquisition completed successfully,
^1da177e4c3f41 Linus Torvalds 2005-04-16  2011  	 */
^1da177e4c3f41 Linus Torvalds 2005-04-16  2012  	return true;
^1da177e4c3f41 Linus Torvalds 2005-04-16  2013  }
^1da177e4c3f41 Linus Torvalds 2005-04-16  2014  

:::::: The code at line 2005 was first introduced by commit
:::::: 839cb99e8f748391059d10388c8aea48a88c142c [SCSI] BusLogic: Fix style issues

:::::: TO: Khalid Aziz <khalid.aziz@oracle.com>
:::::: CC: James Bottomley <JBottomley@Parallels.com>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests
