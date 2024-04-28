Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.15])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A77C56A8A6
	for <oe-kbuild-all@lists.linux.dev>; Sun, 28 Apr 2024 15:04:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.15
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1714316681; cv=none; b=sh2v/3e+oQ1ovV8cK1B2yGsHQyTPqsZ6UgjPueaxx62jujBGpAzCT1KQi36/MTwJlKTpeqFeMZSaf12WzlNFndLyYqfVd1JaMVebTa2f0YAXD70+Qajdkdqt4lWH0fCaHDcuMw9feaTyOWDtulsw2aCU/pw0CyJyckonUD9lGsM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1714316681; c=relaxed/simple;
	bh=UHWiSoBW0PEdUJI7dKFtAf7cn8PrrGK/1N7L79voasI=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=q6tz/nGplyiJDeQfRwLpg+nmyUMX0yildhtOxUjUNdpTCpoBLOyn4z+9KqntN54C8EgD0jjXoWeHQQzydH41aNohexQzB7ynXGGeyPTQ5uLBjgM/c1zad3qgHHxiihAARCnXdMP2h2JBs8yi/VXQG1mxgF+Wor+Q13gjaEYOESM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=cGkc8Nm7; arc=none smtp.client-ip=198.175.65.15
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="cGkc8Nm7"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1714316678; x=1745852678;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=UHWiSoBW0PEdUJI7dKFtAf7cn8PrrGK/1N7L79voasI=;
  b=cGkc8Nm7gJJYtcUWX+f+clsDWjEBQbV2WCz9VanSBXMpoHl5Gk1hnMj0
   Pki5IhR1GsUHO97Ei6SDO5x3RUnc+ecF2Ju6eCIqiCE16eUTR6Gtl5/0a
   PuJgUoXMJr7i9JYgcgz6/BoMlzknk6I751FJF+fCmSsI67EVoad8UsklD
   iMC55oyckC3WUDtLlGqvN/W8R65qz4NzQkcb5fh4IPJEProBp3IUnwRM3
   Mr0Z5gwt/z6dUNDkQE45bXTNiylzNLxSrMN+nLgp6Wpe5A4aphPxx+XA0
   gOWudd2FMDXfm3A1NPIMniRjelMphkh69X8H1TaRl1ahwUSEQjrBNZUTz
   A==;
X-CSE-ConnectionGUID: d04vh2XYRBee5Es0yLBM/Q==
X-CSE-MsgGUID: B4Pnf1JIQgqTG5U49cCZUQ==
X-IronPort-AV: E=McAfee;i="6600,9927,11057"; a="13762608"
X-IronPort-AV: E=Sophos;i="6.07,237,1708416000"; 
   d="scan'208";a="13762608"
Received: from orviesa008.jf.intel.com ([10.64.159.148])
  by orvoesa107.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 28 Apr 2024 08:04:36 -0700
X-CSE-ConnectionGUID: QkEmUc23TjiTrvmJyLSQKA==
X-CSE-MsgGUID: 3ftXd0SCTL2gvQUFGWe8Zg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,237,1708416000"; 
   d="scan'208";a="26510489"
Received: from lkp-server01.sh.intel.com (HELO e434dd42e5a1) ([10.239.97.150])
  by orviesa008.jf.intel.com with ESMTP; 28 Apr 2024 08:04:35 -0700
Received: from kbuild by e434dd42e5a1 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1s164u-0006QG-0k;
	Sun, 28 Apr 2024 15:04:32 +0000
Date: Sun, 28 Apr 2024 23:04:25 +0800
From: kernel test robot <lkp@intel.com>
To: Otavio Salvador <otavio@ossystems.com.br>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [freescale-fslc:6.6-1.0.x-imx 5011/11728]
 drivers/dma/fsl-edma-v3.c:531:46: warning: left shift count >= width of type
Message-ID: <202404282255.Fzh9nHKq-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://github.com/Freescale/linux-fslc 6.6-1.0.x-imx
head:   37770f55ac9c4f6cd958eb5544939207eed8478f
commit: 9e34c0115e392f9021e734a958aaf846779eec8a [5011/11728] LF-10579-02: dmaengine: fsl-edma-v3: add imx95 edma support
config: m68k-allmodconfig (https://download.01.org/0day-ci/archive/20240428/202404282255.Fzh9nHKq-lkp@intel.com/config)
compiler: m68k-linux-gcc (GCC) 13.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240428/202404282255.Fzh9nHKq-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202404282255.Fzh9nHKq-lkp@intel.com/

All warnings (new ones prefixed by >>):

   drivers/dma/fsl-edma-v3.c: In function 'fsl_edma3_desc_residue':
>> drivers/dma/fsl-edma-v3.c:531:46: warning: left shift count >= width of type [-Wshift-count-overflow]
     531 |                         cur_addr = (cur_addr << 32) | cur_addr_l;
         |                                              ^~
   drivers/dma/fsl-edma-v3.c:538:46: warning: left shift count >= width of type [-Wshift-count-overflow]
     538 |                         cur_addr = (cur_addr << 32) | cur_addr_l;
         |                                              ^~
   drivers/dma/fsl-edma-v3.c:555:54: warning: left shift count >= width of type [-Wshift-count-overflow]
     555 |                                 dma_addr = (dma_addr << 32) | dma_addr_l;
         |                                                      ^~
   drivers/dma/fsl-edma-v3.c:560:54: warning: left shift count >= width of type [-Wshift-count-overflow]
     560 |                                 dma_addr = (dma_addr << 32) | dma_addr_l;
         |                                                      ^~
   In file included from include/linux/swab.h:5,
                    from include/uapi/linux/byteorder/big_endian.h:14,
                    from include/linux/byteorder/big_endian.h:5,
                    from arch/m68k/include/uapi/asm/byteorder.h:5,
                    from include/asm-generic/bitops/le.h:6,
                    from arch/m68k/include/asm/bitops.h:545,
                    from include/linux/bitops.h:68,
                    from include/linux/thread_info.h:27,
                    from include/asm-generic/preempt.h:5,
                    from ./arch/m68k/include/generated/asm/preempt.h:1,
                    from include/linux/preempt.h:79,
                    from arch/m68k/include/asm/irqflags.h:6,
                    from include/linux/irqflags.h:17,
                    from arch/m68k/include/asm/atomic.h:6,
                    from include/linux/atomic.h:7,
                    from include/linux/mm_types_task.h:13,
                    from include/linux/mm_types.h:5,
                    from include/linux/buildid.h:5,
                    from include/linux/module.h:14,
                    from drivers/dma/fsl-edma-v3.c:18:
   drivers/dma/fsl-edma-v3.c: In function 'fsl_edma3_fill_tcd':
>> drivers/dma/fsl-edma-v3.c:734:49: warning: right shift count >= width of type [-Wshift-count-overflow]
     734 |                 tcd->saddr_h = cpu_to_le32((src >> 32) & 0xffffffff);
         |                                                 ^~
   include/uapi/linux/swab.h:118:38: note: in definition of macro '__swab32'
     118 |         (__u32)(__builtin_constant_p(x) ?       \
         |                                      ^
   include/linux/byteorder/generic.h:88:21: note: in expansion of macro '__cpu_to_le32'
      88 | #define cpu_to_le32 __cpu_to_le32
         |                     ^~~~~~~~~~~~~
   drivers/dma/fsl-edma-v3.c:734:32: note: in expansion of macro 'cpu_to_le32'
     734 |                 tcd->saddr_h = cpu_to_le32((src >> 32) & 0xffffffff);
         |                                ^~~~~~~~~~~
>> drivers/dma/fsl-edma-v3.c:734:49: warning: right shift count >= width of type [-Wshift-count-overflow]
     734 |                 tcd->saddr_h = cpu_to_le32((src >> 32) & 0xffffffff);
         |                                                 ^~
   include/uapi/linux/swab.h:19:19: note: in definition of macro '___constant_swab32'
      19 |         (((__u32)(x) & (__u32)0x000000ffUL) << 24) |            \
         |                   ^
   include/uapi/linux/byteorder/big_endian.h:34:43: note: in expansion of macro '__swab32'
      34 | #define __cpu_to_le32(x) ((__force __le32)__swab32((x)))
         |                                           ^~~~~~~~
   include/linux/byteorder/generic.h:88:21: note: in expansion of macro '__cpu_to_le32'
      88 | #define cpu_to_le32 __cpu_to_le32
         |                     ^~~~~~~~~~~~~
   drivers/dma/fsl-edma-v3.c:734:32: note: in expansion of macro 'cpu_to_le32'
     734 |                 tcd->saddr_h = cpu_to_le32((src >> 32) & 0xffffffff);
         |                                ^~~~~~~~~~~
>> drivers/dma/fsl-edma-v3.c:734:49: warning: right shift count >= width of type [-Wshift-count-overflow]
     734 |                 tcd->saddr_h = cpu_to_le32((src >> 32) & 0xffffffff);
         |                                                 ^~
   include/uapi/linux/swab.h:20:19: note: in definition of macro '___constant_swab32'
      20 |         (((__u32)(x) & (__u32)0x0000ff00UL) <<  8) |            \
         |                   ^
   include/uapi/linux/byteorder/big_endian.h:34:43: note: in expansion of macro '__swab32'
      34 | #define __cpu_to_le32(x) ((__force __le32)__swab32((x)))
         |                                           ^~~~~~~~
   include/linux/byteorder/generic.h:88:21: note: in expansion of macro '__cpu_to_le32'
      88 | #define cpu_to_le32 __cpu_to_le32
         |                     ^~~~~~~~~~~~~
   drivers/dma/fsl-edma-v3.c:734:32: note: in expansion of macro 'cpu_to_le32'
     734 |                 tcd->saddr_h = cpu_to_le32((src >> 32) & 0xffffffff);
         |                                ^~~~~~~~~~~
>> drivers/dma/fsl-edma-v3.c:734:49: warning: right shift count >= width of type [-Wshift-count-overflow]
     734 |                 tcd->saddr_h = cpu_to_le32((src >> 32) & 0xffffffff);
         |                                                 ^~
   include/uapi/linux/swab.h:21:19: note: in definition of macro '___constant_swab32'
      21 |         (((__u32)(x) & (__u32)0x00ff0000UL) >>  8) |            \
         |                   ^
   include/uapi/linux/byteorder/big_endian.h:34:43: note: in expansion of macro '__swab32'
      34 | #define __cpu_to_le32(x) ((__force __le32)__swab32((x)))
         |                                           ^~~~~~~~
   include/linux/byteorder/generic.h:88:21: note: in expansion of macro '__cpu_to_le32'
      88 | #define cpu_to_le32 __cpu_to_le32
         |                     ^~~~~~~~~~~~~
   drivers/dma/fsl-edma-v3.c:734:32: note: in expansion of macro 'cpu_to_le32'
     734 |                 tcd->saddr_h = cpu_to_le32((src >> 32) & 0xffffffff);
         |                                ^~~~~~~~~~~
>> drivers/dma/fsl-edma-v3.c:734:49: warning: right shift count >= width of type [-Wshift-count-overflow]
     734 |                 tcd->saddr_h = cpu_to_le32((src >> 32) & 0xffffffff);
         |                                                 ^~
   include/uapi/linux/swab.h:22:19: note: in definition of macro '___constant_swab32'
      22 |         (((__u32)(x) & (__u32)0xff000000UL) >> 24)))
         |                   ^
   include/uapi/linux/byteorder/big_endian.h:34:43: note: in expansion of macro '__swab32'
      34 | #define __cpu_to_le32(x) ((__force __le32)__swab32((x)))
         |                                           ^~~~~~~~
   include/linux/byteorder/generic.h:88:21: note: in expansion of macro '__cpu_to_le32'
      88 | #define cpu_to_le32 __cpu_to_le32
         |                     ^~~~~~~~~~~~~
   drivers/dma/fsl-edma-v3.c:734:32: note: in expansion of macro 'cpu_to_le32'
     734 |                 tcd->saddr_h = cpu_to_le32((src >> 32) & 0xffffffff);
         |                                ^~~~~~~~~~~
>> drivers/dma/fsl-edma-v3.c:734:49: warning: right shift count >= width of type [-Wshift-count-overflow]
     734 |                 tcd->saddr_h = cpu_to_le32((src >> 32) & 0xffffffff);
         |                                                 ^~
   include/uapi/linux/swab.h:120:19: note: in definition of macro '__swab32'
     120 |         __fswab32(x))
         |                   ^
   include/linux/byteorder/generic.h:88:21: note: in expansion of macro '__cpu_to_le32'
      88 | #define cpu_to_le32 __cpu_to_le32
         |                     ^~~~~~~~~~~~~
   drivers/dma/fsl-edma-v3.c:734:32: note: in expansion of macro 'cpu_to_le32'
     734 |                 tcd->saddr_h = cpu_to_le32((src >> 32) & 0xffffffff);
         |                                ^~~~~~~~~~~
   drivers/dma/fsl-edma-v3.c:736:49: warning: right shift count >= width of type [-Wshift-count-overflow]
     736 |                 tcd->daddr_h = cpu_to_le32((dst >> 32) & 0xffffffff);
         |                                                 ^~
   include/uapi/linux/swab.h:118:38: note: in definition of macro '__swab32'
     118 |         (__u32)(__builtin_constant_p(x) ?       \
         |                                      ^
   include/linux/byteorder/generic.h:88:21: note: in expansion of macro '__cpu_to_le32'
      88 | #define cpu_to_le32 __cpu_to_le32
         |                     ^~~~~~~~~~~~~
   drivers/dma/fsl-edma-v3.c:736:32: note: in expansion of macro 'cpu_to_le32'
     736 |                 tcd->daddr_h = cpu_to_le32((dst >> 32) & 0xffffffff);
         |                                ^~~~~~~~~~~
   drivers/dma/fsl-edma-v3.c:736:49: warning: right shift count >= width of type [-Wshift-count-overflow]
     736 |                 tcd->daddr_h = cpu_to_le32((dst >> 32) & 0xffffffff);
         |                                                 ^~
   include/uapi/linux/swab.h:19:19: note: in definition of macro '___constant_swab32'
      19 |         (((__u32)(x) & (__u32)0x000000ffUL) << 24) |            \
         |                   ^
   include/uapi/linux/byteorder/big_endian.h:34:43: note: in expansion of macro '__swab32'
      34 | #define __cpu_to_le32(x) ((__force __le32)__swab32((x)))
         |                                           ^~~~~~~~
   include/linux/byteorder/generic.h:88:21: note: in expansion of macro '__cpu_to_le32'
      88 | #define cpu_to_le32 __cpu_to_le32
         |                     ^~~~~~~~~~~~~
   drivers/dma/fsl-edma-v3.c:736:32: note: in expansion of macro 'cpu_to_le32'
     736 |                 tcd->daddr_h = cpu_to_le32((dst >> 32) & 0xffffffff);
         |                                ^~~~~~~~~~~
   drivers/dma/fsl-edma-v3.c:736:49: warning: right shift count >= width of type [-Wshift-count-overflow]
     736 |                 tcd->daddr_h = cpu_to_le32((dst >> 32) & 0xffffffff);
         |                                                 ^~
   include/uapi/linux/swab.h:20:19: note: in definition of macro '___constant_swab32'
      20 |         (((__u32)(x) & (__u32)0x0000ff00UL) <<  8) |            \
         |                   ^
   include/uapi/linux/byteorder/big_endian.h:34:43: note: in expansion of macro '__swab32'
      34 | #define __cpu_to_le32(x) ((__force __le32)__swab32((x)))
         |                                           ^~~~~~~~
   include/linux/byteorder/generic.h:88:21: note: in expansion of macro '__cpu_to_le32'
      88 | #define cpu_to_le32 __cpu_to_le32
         |                     ^~~~~~~~~~~~~
   drivers/dma/fsl-edma-v3.c:736:32: note: in expansion of macro 'cpu_to_le32'
     736 |                 tcd->daddr_h = cpu_to_le32((dst >> 32) & 0xffffffff);
         |                                ^~~~~~~~~~~
   drivers/dma/fsl-edma-v3.c:736:49: warning: right shift count >= width of type [-Wshift-count-overflow]
     736 |                 tcd->daddr_h = cpu_to_le32((dst >> 32) & 0xffffffff);
         |                                                 ^~
   include/uapi/linux/swab.h:21:19: note: in definition of macro '___constant_swab32'
      21 |         (((__u32)(x) & (__u32)0x00ff0000UL) >>  8) |            \
         |                   ^
   include/uapi/linux/byteorder/big_endian.h:34:43: note: in expansion of macro '__swab32'
      34 | #define __cpu_to_le32(x) ((__force __le32)__swab32((x)))
         |                                           ^~~~~~~~
   include/linux/byteorder/generic.h:88:21: note: in expansion of macro '__cpu_to_le32'
      88 | #define cpu_to_le32 __cpu_to_le32
         |                     ^~~~~~~~~~~~~
   drivers/dma/fsl-edma-v3.c:736:32: note: in expansion of macro 'cpu_to_le32'
     736 |                 tcd->daddr_h = cpu_to_le32((dst >> 32) & 0xffffffff);
         |                                ^~~~~~~~~~~
   drivers/dma/fsl-edma-v3.c:736:49: warning: right shift count >= width of type [-Wshift-count-overflow]
     736 |                 tcd->daddr_h = cpu_to_le32((dst >> 32) & 0xffffffff);
         |                                                 ^~
   include/uapi/linux/swab.h:22:19: note: in definition of macro '___constant_swab32'
      22 |         (((__u32)(x) & (__u32)0xff000000UL) >> 24)))
         |                   ^
   include/uapi/linux/byteorder/big_endian.h:34:43: note: in expansion of macro '__swab32'
      34 | #define __cpu_to_le32(x) ((__force __le32)__swab32((x)))
         |                                           ^~~~~~~~
   include/linux/byteorder/generic.h:88:21: note: in expansion of macro '__cpu_to_le32'
      88 | #define cpu_to_le32 __cpu_to_le32
         |                     ^~~~~~~~~~~~~
   drivers/dma/fsl-edma-v3.c:736:32: note: in expansion of macro 'cpu_to_le32'
     736 |                 tcd->daddr_h = cpu_to_le32((dst >> 32) & 0xffffffff);
         |                                ^~~~~~~~~~~
   drivers/dma/fsl-edma-v3.c:736:49: warning: right shift count >= width of type [-Wshift-count-overflow]
     736 |                 tcd->daddr_h = cpu_to_le32((dst >> 32) & 0xffffffff);
         |                                                 ^~
   include/uapi/linux/swab.h:120:19: note: in definition of macro '__swab32'
     120 |         __fswab32(x))
         |                   ^
   include/linux/byteorder/generic.h:88:21: note: in expansion of macro '__cpu_to_le32'
      88 | #define cpu_to_le32 __cpu_to_le32
         |                     ^~~~~~~~~~~~~
   drivers/dma/fsl-edma-v3.c:736:32: note: in expansion of macro 'cpu_to_le32'
     736 |                 tcd->daddr_h = cpu_to_le32((dst >> 32) & 0xffffffff);
         |                                ^~~~~~~~~~~
   drivers/dma/fsl-edma-v3.c:757:51: warning: right shift count >= width of type [-Wshift-count-overflow]
     757 |                 tcd->slast_h = cpu_to_le32((slast >> 32) & 0xffffffff);
         |                                                   ^~
   include/uapi/linux/swab.h:118:38: note: in definition of macro '__swab32'
     118 |         (__u32)(__builtin_constant_p(x) ?       \


vim +531 drivers/dma/fsl-edma-v3.c

   494	
   495	static size_t fsl_edma3_desc_residue(struct fsl_edma3_chan *fsl_chan,
   496			struct virt_dma_desc *vdesc, bool in_progress)
   497	{
   498		struct fsl_edma3_desc *edesc = fsl_chan->edesc;
   499		void __iomem *addr = fsl_chan->membase;
   500		enum dma_transfer_direction dir = fsl_chan->fsc.dir;
   501		dma_addr_t cur_addr, dma_addr;
   502		size_t len, size;
   503		u32 nbytes = 0;
   504		int i;
   505	
   506		if (fsl_chan->edma3->drvdata->edma_v5) {
   507			struct fsl_edma3_hw_tcd_v5         *vtcd;
   508			u32 cur_addr_l, cur_addr_h;
   509			u32 dma_addr_l, dma_addr_h;
   510	
   511			/* calculate the total size in this desc */
   512			for (len = i = 0; i < fsl_chan->edesc->n_tcds; i++) {
   513				vtcd = edesc->tcd[i].vtcd;
   514				if ((vtcd->nbytes & EDMA_TCD_NBYTES_DMLOE) ||
   515				    (vtcd->nbytes & EDMA_TCD_NBYTES_SMLOE))
   516					nbytes = EDMA_TCD_NBYTES_MLOFF_NBYTES(vtcd->nbytes);
   517				else
   518					nbytes = le32_to_cpu(vtcd->nbytes);
   519				len += nbytes * le16_to_cpu(vtcd->biter);
   520			}
   521	
   522			if (!in_progress)
   523				return len;
   524	
   525			if (dir == DMA_MEM_TO_DEV) {
   526				do {
   527					cur_addr_h = readl(addr + EDMA_V5_TCD_SADDR_H);
   528					cur_addr_l = readl(addr + EDMA_V5_TCD_SADDR_L);
   529				} while (cur_addr_h != readl(addr + EDMA_V5_TCD_SADDR_H));
   530				cur_addr = cur_addr_h;
 > 531				cur_addr = (cur_addr << 32) | cur_addr_l;
   532			} else {
   533				do {
   534					cur_addr_h = readl(addr + EDMA_V5_TCD_DADDR_H);
   535					cur_addr_l = readl(addr + EDMA_V5_TCD_DADDR_L);
   536				} while (cur_addr_h != readl(addr + EDMA_V5_TCD_DADDR_H));
   537				cur_addr = cur_addr_h;
   538				cur_addr = (cur_addr << 32) | cur_addr_l;
   539			}
   540			/* figure out the finished and calculate the residue */
   541			for (i = 0; i < fsl_chan->edesc->n_tcds; i++) {
   542				vtcd = edesc->tcd[i].vtcd;
   543				if ((vtcd->nbytes & EDMA_TCD_NBYTES_DMLOE) ||
   544				    (vtcd->nbytes & EDMA_TCD_NBYTES_SMLOE))
   545					nbytes = EDMA_TCD_NBYTES_MLOFF_NBYTES(vtcd->nbytes);
   546				else
   547					nbytes = le32_to_cpu(vtcd->nbytes);
   548	
   549				size = nbytes * le16_to_cpu(vtcd->biter);
   550	
   551				if (dir == DMA_MEM_TO_DEV) {
   552					dma_addr_l = le32_to_cpu(vtcd->saddr_l);
   553					dma_addr_h = le32_to_cpu(vtcd->saddr_h);
   554					dma_addr = dma_addr_h;
   555					dma_addr = (dma_addr << 32) | dma_addr_l;
   556				} else {
   557					dma_addr_l = le32_to_cpu(vtcd->daddr_l);
   558					dma_addr_h = le32_to_cpu(vtcd->daddr_h);
   559					dma_addr = dma_addr_h;
   560					dma_addr = (dma_addr << 32) | dma_addr_l;
   561				}
   562				len -= size;
   563				if (cur_addr >= dma_addr && cur_addr < dma_addr + size) {
   564					len += dma_addr + size - cur_addr;
   565					break;
   566				}
   567			}
   568		} else {
   569	
   570			struct fsl_edma3_hw_tcd         *vtcd;
   571			/* calculate the total size in this desc */
   572			for (len = i = 0; i < fsl_chan->edesc->n_tcds; i++) {
   573				vtcd = edesc->tcd[i].vtcd;
   574				if ((vtcd->nbytes & EDMA_TCD_NBYTES_DMLOE) ||
   575				    (vtcd->nbytes & EDMA_TCD_NBYTES_SMLOE))
   576					nbytes = EDMA_TCD_NBYTES_MLOFF_NBYTES(vtcd->nbytes);
   577				else
   578					nbytes = le32_to_cpu(vtcd->nbytes);
   579				len += nbytes * le16_to_cpu(vtcd->biter);
   580			}
   581	
   582			if (!in_progress)
   583				return len;
   584	
   585			if (dir == DMA_MEM_TO_DEV)
   586				cur_addr = readl(addr + EDMA_TCD_SADDR);
   587			else
   588				cur_addr = readl(addr + EDMA_TCD_DADDR);
   589	
   590			/* figure out the finished and calculate the residue */
   591			for (i = 0; i < fsl_chan->edesc->n_tcds; i++) {
   592				vtcd = edesc->tcd[i].vtcd;
   593				if ((vtcd->nbytes & EDMA_TCD_NBYTES_DMLOE) ||
   594				    (vtcd->nbytes & EDMA_TCD_NBYTES_SMLOE))
   595					nbytes = EDMA_TCD_NBYTES_MLOFF_NBYTES(vtcd->nbytes);
   596				else
   597					nbytes = le32_to_cpu(vtcd->nbytes);
   598	
   599				size = nbytes * le16_to_cpu(vtcd->biter);
   600	
   601				if (dir == DMA_MEM_TO_DEV)
   602					dma_addr = le32_to_cpu(vtcd->saddr);
   603				else
   604					dma_addr = le32_to_cpu(vtcd->daddr);
   605	
   606				len -= size;
   607				if (cur_addr >= dma_addr && cur_addr < dma_addr + size) {
   608					len += dma_addr + size - cur_addr;
   609					break;
   610				}
   611			}
   612		}
   613	
   614		return len;
   615	}
   616	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
