Received: from mga12.intel.com (mga12.intel.com [192.55.52.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2EA87EACE
	for <oe-kbuild-all@lists.linux.dev>; Sat, 22 Jul 2023 08:02:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1690012950; x=1721548950;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=1v73VymrjUuhQvhi0t0pP6pzSrK1puDptsDzZYNuSzg=;
  b=B1ou/M4WljYNhVEj5pZgZac4mjCq1x02SscL84bt5MzsvkQjfAYy9Kqk
   XVCon7fnL0ox2eyYZPmYUr+KBspb6OF27yqDRL03ZTfU1pPDUE4FSB8jl
   8qrc4P3ZxXJHvdxLww0suZrmeBCe4YeYG62cQggPP2nnsDQL1AVTfzpKF
   tAa75e0WOG15RXX5ZpBIW59qJFjBZWcAH80wnjfLH4cBhdcNibY6cZPnG
   ytqtsK3gioEhRQNRrFtxpUBxV34UG9UOAWNjyz/gQ6/8/gbFM5G6zlJIs
   SF9mesJRcmrg6TPsEjn2qCLfy1wDYZCtv04/y494pS+nQLOM0fV3YVTWy
   Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10778"; a="346778319"
X-IronPort-AV: E=Sophos;i="6.01,224,1684825200"; 
   d="scan'208";a="346778319"
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
  by fmsmga106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 22 Jul 2023 01:02:29 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10778"; a="838821411"
X-IronPort-AV: E=Sophos;i="6.01,224,1684825200"; 
   d="scan'208";a="838821411"
Received: from lkp-server02.sh.intel.com (HELO 36946fcf73d7) ([10.239.97.151])
  by fmsmga002.fm.intel.com with ESMTP; 22 Jul 2023 01:02:27 -0700
Received: from kbuild by 36946fcf73d7 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1qN7ZK-00089J-2s;
	Sat, 22 Jul 2023 08:02:26 +0000
Date: Sat, 22 Jul 2023 16:01:57 +0800
From: kernel test robot <lkp@intel.com>
To: Manuel Lauss <manuel.lauss@gmail.com>
Cc: oe-kbuild-all@lists.linux.dev,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Thomas Bogendoerfer <tsbogend@alpha.franken.de>,
	Sasha Levin <sashal@kernel.org>
Subject: [stable:linux-5.10.y 9848/9999]
 arch/mips/alchemy/common/dbdma.c:632:14: error: 'dma_default_coherent'
 undeclared; did you mean 'dma_free_coherent'?
Message-ID: <202307221515.My2ygI9q-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/stable/linux-stable.git linux-5.10.y
head:   381518b4a9165cd793599c1668c82079fcbcbe1f
commit: 619672bf2d04cdc1bc3925defd0312c2ef11e5d0 [9848/9999] MIPS: Alchemy: fix dbdma2
config: mips-db1xxx_defconfig (https://download.01.org/0day-ci/archive/20230722/202307221515.My2ygI9q-lkp@intel.com/config)
compiler: mipsel-linux-gcc (GCC) 12.3.0
reproduce: (https://download.01.org/0day-ci/archive/20230722/202307221515.My2ygI9q-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202307221515.My2ygI9q-lkp@intel.com/

All errors (new ones prefixed by >>):

   arch/mips/alchemy/common/dbdma.c: In function 'au1xxx_dbdma_put_source':
>> arch/mips/alchemy/common/dbdma.c:632:14: error: 'dma_default_coherent' undeclared (first use in this function); did you mean 'dma_free_coherent'?
     632 |         if (!dma_default_coherent)
         |              ^~~~~~~~~~~~~~~~~~~~
         |              dma_free_coherent
   arch/mips/alchemy/common/dbdma.c:632:14: note: each undeclared identifier is reported only once for each function it appears in
   arch/mips/alchemy/common/dbdma.c: In function 'au1xxx_dbdma_put_dest':
   arch/mips/alchemy/common/dbdma.c:695:14: error: 'dma_default_coherent' undeclared (first use in this function); did you mean 'dma_free_coherent'?
     695 |         if (!dma_default_coherent)
         |              ^~~~~~~~~~~~~~~~~~~~
         |              dma_free_coherent


vim +632 arch/mips/alchemy/common/dbdma.c

   586	
   587	/*
   588	 * Put a source buffer into the DMA ring.
   589	 * This updates the source pointer and byte count.  Normally used
   590	 * for memory to fifo transfers.
   591	 */
   592	u32 au1xxx_dbdma_put_source(u32 chanid, dma_addr_t buf, int nbytes, u32 flags)
   593	{
   594		chan_tab_t		*ctp;
   595		au1x_ddma_desc_t	*dp;
   596	
   597		/*
   598		 * I guess we could check this to be within the
   599		 * range of the table......
   600		 */
   601		ctp = *(chan_tab_t **)chanid;
   602	
   603		/*
   604		 * We should have multiple callers for a particular channel,
   605		 * an interrupt doesn't affect this pointer nor the descriptor,
   606		 * so no locking should be needed.
   607		 */
   608		dp = ctp->put_ptr;
   609	
   610		/*
   611		 * If the descriptor is valid, we are way ahead of the DMA
   612		 * engine, so just return an error condition.
   613		 */
   614		if (dp->dscr_cmd0 & DSCR_CMD0_V)
   615			return 0;
   616	
   617		/* Load up buffer address and byte count. */
   618		dp->dscr_source0 = buf & ~0UL;
   619		dp->dscr_cmd1 = nbytes;
   620		/* Check flags */
   621		if (flags & DDMA_FLAGS_IE)
   622			dp->dscr_cmd0 |= DSCR_CMD0_IE;
   623		if (flags & DDMA_FLAGS_NOIE)
   624			dp->dscr_cmd0 &= ~DSCR_CMD0_IE;
   625	
   626		/*
   627		 * There is an erratum on certain Au1200/Au1550 revisions that could
   628		 * result in "stale" data being DMA'ed. It has to do with the snoop
   629		 * logic on the cache eviction buffer.  dma_default_coherent is set
   630		 * to false on these parts.
   631		 */
 > 632		if (!dma_default_coherent)
   633			dma_cache_wback_inv(KSEG0ADDR(buf), nbytes);
   634		dp->dscr_cmd0 |= DSCR_CMD0_V;	/* Let it rip */
   635		wmb(); /* drain writebuffer */
   636		dma_cache_wback_inv((unsigned long)dp, sizeof(*dp));
   637		ctp->chan_ptr->ddma_dbell = 0;
   638		wmb(); /* force doorbell write out to dma engine */
   639	
   640		/* Get next descriptor pointer. */
   641		ctp->put_ptr = phys_to_virt(DSCR_GET_NXTPTR(dp->dscr_nxtptr));
   642	
   643		/* Return something non-zero. */
   644		return nbytes;
   645	}
   646	EXPORT_SYMBOL(au1xxx_dbdma_put_source);
   647	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
