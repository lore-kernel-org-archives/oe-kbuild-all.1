Received: from mga09.intel.com (mga09.intel.com [134.134.136.24])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C80ECEDA
	for <oe-kbuild-all@lists.linux.dev>; Tue, 27 Jun 2023 04:44:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1687841041; x=1719377041;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=GgoL/pG4twlGXtePZB1nKkl8Slkh8/ZhApSutAOvSaw=;
  b=I8AdGqDPyVJls/1BlcayCqw8pmySvF2nYC2q/GM6Sh9Bg1eZIavSIlIY
   jqAkhl7xGgFYoY9qHPq5+lUUSJpKsHKxb9wfLQrJeqAf0Pdaag2TiH4vo
   SZzahmF4V39Ql1VmUW985u6XmFPxxNfFK4jy7hTflqdRlvxnISOVMFz9U
   /woB4kMo00ZJwS4rZjor8pe/Ns69bywtXPDPC8r2gYZXVdTSik0+m3th0
   DYhLrra9cMsQJybnnhpZ4u6dTPRbIlEWNoJYFu0OM9Ck/lrQ2SkTECNZW
   626P9p6XvxNAOYjRECJLb3nNP8aeKi4vdwQvjSS4CitpDRD0CcM8DW4Ph
   g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10753"; a="364017655"
X-IronPort-AV: E=Sophos;i="6.01,161,1684825200"; 
   d="scan'208";a="364017655"
Received: from fmsmga003.fm.intel.com ([10.253.24.29])
  by orsmga102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 26 Jun 2023 21:44:01 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10753"; a="806308421"
X-IronPort-AV: E=Sophos;i="6.01,161,1684825200"; 
   d="scan'208";a="806308421"
Received: from lkp-server01.sh.intel.com (HELO 783282924a45) ([10.239.97.150])
  by FMSMGA003.fm.intel.com with ESMTP; 26 Jun 2023 21:43:57 -0700
Received: from kbuild by 783282924a45 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1qE0YW-000Bij-1o;
	Tue, 27 Jun 2023 04:43:56 +0000
Date: Tue, 27 Jun 2023 12:43:36 +0800
From: kernel test robot <lkp@intel.com>
To: Arnd Bergmann <arnd@arndb.de>
Cc: oe-kbuild-all@lists.linux.dev,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Greg Ungerer <gerg@linux-m68k.org>, Sasha Levin <sashal@kernel.org>
Subject: [stable:linux-5.4.y 384/8851] drivers/scsi/BusLogic.c:2005:47:
 error: 'DMA_MODE_CASCADE' undeclared; did you mean 'DMA_MODE_READ'?
Message-ID: <202306271204.LrEekvKJ-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hi Arnd,

First bad commit (maybe != root cause):

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/stable/linux-stable.git linux-5.4.y
head:   f2b499c27a959d062db9ea5c3036052d90110ee4
commit: 53a72858bcae7eaa7df8d167dbf60682d70f82a6 [384/8851] m68knommu: only set CONFIG_ISA_DMA_API for ColdFire sub-arch
config: m68k-randconfig-r026-20230627 (https://download.01.org/0day-ci/archive/20230627/202306271204.LrEekvKJ-lkp@intel.com/config)
compiler: m68k-linux-gcc (GCC) 12.3.0
reproduce: (https://download.01.org/0day-ci/archive/20230627/202306271204.LrEekvKJ-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202306271204.LrEekvKJ-lkp@intel.com/

All error/warnings (new ones prefixed by >>):

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
                    from include/linux/module.h:10,
                    from drivers/scsi/BusLogic.c:25:
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
https://github.com/intel/lkp-tests/wiki
