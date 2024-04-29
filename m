Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.9])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2C3A67F
	for <oe-kbuild-all@lists.linux.dev>; Mon, 29 Apr 2024 00:18:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.9
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1714349891; cv=none; b=c/+MMV50dqCVpW6mYx8jo0GpeiWtq2ftEgEmaGT8MqNrG20hrFjMpnZkrsm53jYPOBWeXybYXuTalQ02ZMjPvAaFCDyaqME0IJstwRR642vuiMKtBNxrgn8hacg1AmQuXDoSRFWDSYSGqHerFRJ7NowAaGURvBh2Jj7y0Kc1+XY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1714349891; c=relaxed/simple;
	bh=0L0FfkajWjJW1/hpWT4+XxkhY0pYpwyu0ZW2l1uOxiY=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=L+skKmOB3QOM1an2mvbEQaVMyCVcbY8SBQ+eeBHY8V3LZOR5fYsKWZ+dNHASr04DGLMJVDN6YVxAZ8QJWn3+mZ8I5twU6sTjm+YYH8Nhc1En1nOe8NwhZzrNwLUFkSB2SDSfd+WnQ+V0gNuyPATOWCF7nAO+SPeSfOyULxAh/v4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=VRiWirUw; arc=none smtp.client-ip=198.175.65.9
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="VRiWirUw"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1714349890; x=1745885890;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=0L0FfkajWjJW1/hpWT4+XxkhY0pYpwyu0ZW2l1uOxiY=;
  b=VRiWirUwDMe1UfcBu6ctIRrWAt5jT2UQuu//hCVVQ5sTRwbfaZLbbYeo
   gFap5Aef7rtn42PV+5TCIFLeAQJ03LTrYAzWpz732eW3yvx6Jb4DYkxCj
   wsTO/smnqaWCmblN4VeLmTycnSLxCAT0U7Nzul8BzYk/tBeq+p349B1z1
   i0VTxmxxjNtOLIqpoW5zG9aAeqQYiL+qTlRkzFYzpHLhS+mJRjNEBWtWT
   VJ35tRHB+HyTzXhfDz4j1BModN3YxCZoYR5wnblryOxxVoq6N9x3r6JLr
   O12galqtelHwaGZ/10GxNcCaKQ/tmbmdRJ/VYZVMm2/8BrT1gAlpgbKEX
   Q==;
X-CSE-ConnectionGUID: zoB6EQQVR4iPKes8FhmBGw==
X-CSE-MsgGUID: wJd48dfsQoOHxX9qCnQ6YA==
X-IronPort-AV: E=McAfee;i="6600,9927,11057"; a="32502303"
X-IronPort-AV: E=Sophos;i="6.07,238,1708416000"; 
   d="scan'208";a="32502303"
Received: from fmviesa008.fm.intel.com ([10.60.135.148])
  by orvoesa101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 28 Apr 2024 17:18:09 -0700
X-CSE-ConnectionGUID: aZyT68bcQqiBblY+o0iN7A==
X-CSE-MsgGUID: dW9s/Q+GSwOujkCpxv4nTg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,238,1708416000"; 
   d="scan'208";a="25968154"
Received: from lkp-server01.sh.intel.com (HELO e434dd42e5a1) ([10.239.97.150])
  by fmviesa008.fm.intel.com with ESMTP; 28 Apr 2024 17:18:07 -0700
Received: from kbuild by e434dd42e5a1 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1s1Eib-0006oj-0E;
	Mon, 29 Apr 2024 00:18:05 +0000
Date: Mon, 29 Apr 2024 08:17:53 +0800
From: kernel test robot <lkp@intel.com>
To: Otavio Salvador <otavio@ossystems.com.br>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [freescale-fslc:6.6-1.0.x-imx 5011/11728]
 drivers/dma/fsl-edma-v3.c:531:25: warning: shift count >= width of type
Message-ID: <202404290818.3V67Rek9-lkp@intel.com>
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
config: hexagon-allmodconfig (https://download.01.org/0day-ci/archive/20240429/202404290818.3V67Rek9-lkp@intel.com/config)
compiler: clang version 19.0.0git (https://github.com/llvm/llvm-project 5ef5eb66fb428aaf61fb51b709f065c069c11242)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240429/202404290818.3V67Rek9-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202404290818.3V67Rek9-lkp@intel.com/

All warnings (new ones prefixed by >>):

   In file included from drivers/dma/fsl-edma-v3.c:19:
   In file included from include/linux/interrupt.h:11:
   In file included from include/linux/hardirq.h:11:
   In file included from ./arch/hexagon/include/generated/asm/hardirq.h:1:
   In file included from include/asm-generic/hardirq.h:17:
   In file included from include/linux/irq.h:20:
   In file included from include/linux/io.h:13:
   In file included from arch/hexagon/include/asm/io.h:337:
   include/asm-generic/io.h:547:31: warning: performing pointer arithmetic on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
     547 |         val = __raw_readb(PCI_IOBASE + addr);
         |                           ~~~~~~~~~~ ^
   include/asm-generic/io.h:560:61: warning: performing pointer arithmetic on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
     560 |         val = __le16_to_cpu((__le16 __force)__raw_readw(PCI_IOBASE + addr));
         |                                                         ~~~~~~~~~~ ^
   include/uapi/linux/byteorder/little_endian.h:37:51: note: expanded from macro '__le16_to_cpu'
      37 | #define __le16_to_cpu(x) ((__force __u16)(__le16)(x))
         |                                                   ^
   In file included from drivers/dma/fsl-edma-v3.c:19:
   In file included from include/linux/interrupt.h:11:
   In file included from include/linux/hardirq.h:11:
   In file included from ./arch/hexagon/include/generated/asm/hardirq.h:1:
   In file included from include/asm-generic/hardirq.h:17:
   In file included from include/linux/irq.h:20:
   In file included from include/linux/io.h:13:
   In file included from arch/hexagon/include/asm/io.h:337:
   include/asm-generic/io.h:573:61: warning: performing pointer arithmetic on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
     573 |         val = __le32_to_cpu((__le32 __force)__raw_readl(PCI_IOBASE + addr));
         |                                                         ~~~~~~~~~~ ^
   include/uapi/linux/byteorder/little_endian.h:35:51: note: expanded from macro '__le32_to_cpu'
      35 | #define __le32_to_cpu(x) ((__force __u32)(__le32)(x))
         |                                                   ^
   In file included from drivers/dma/fsl-edma-v3.c:19:
   In file included from include/linux/interrupt.h:11:
   In file included from include/linux/hardirq.h:11:
   In file included from ./arch/hexagon/include/generated/asm/hardirq.h:1:
   In file included from include/asm-generic/hardirq.h:17:
   In file included from include/linux/irq.h:20:
   In file included from include/linux/io.h:13:
   In file included from arch/hexagon/include/asm/io.h:337:
   include/asm-generic/io.h:584:33: warning: performing pointer arithmetic on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
     584 |         __raw_writeb(value, PCI_IOBASE + addr);
         |                             ~~~~~~~~~~ ^
   include/asm-generic/io.h:594:59: warning: performing pointer arithmetic on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
     594 |         __raw_writew((u16 __force)cpu_to_le16(value), PCI_IOBASE + addr);
         |                                                       ~~~~~~~~~~ ^
   include/asm-generic/io.h:604:59: warning: performing pointer arithmetic on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
     604 |         __raw_writel((u32 __force)cpu_to_le32(value), PCI_IOBASE + addr);
         |                                                       ~~~~~~~~~~ ^
   In file included from drivers/dma/fsl-edma-v3.c:22:
   In file included from include/linux/dma-mapping.h:11:
   In file included from include/linux/scatterlist.h:8:
   In file included from include/linux/mm.h:2168:
   include/linux/vmstat.h:522:36: warning: arithmetic between different enumeration types ('enum node_stat_item' and 'enum lru_list') [-Wenum-enum-conversion]
     522 |         return node_stat_name(NR_LRU_BASE + lru) + 3; // skip "nr_"
         |                               ~~~~~~~~~~~ ^ ~~~
>> drivers/dma/fsl-edma-v3.c:531:25: warning: shift count >= width of type [-Wshift-count-overflow]
     531 |                         cur_addr = (cur_addr << 32) | cur_addr_l;
         |                                              ^  ~~
   drivers/dma/fsl-edma-v3.c:538:25: warning: shift count >= width of type [-Wshift-count-overflow]
     538 |                         cur_addr = (cur_addr << 32) | cur_addr_l;
         |                                              ^  ~~
   drivers/dma/fsl-edma-v3.c:555:26: warning: shift count >= width of type [-Wshift-count-overflow]
     555 |                                 dma_addr = (dma_addr << 32) | dma_addr_l;
         |                                                      ^  ~~
   drivers/dma/fsl-edma-v3.c:560:26: warning: shift count >= width of type [-Wshift-count-overflow]
     560 |                                 dma_addr = (dma_addr << 32) | dma_addr_l;
         |                                                      ^  ~~
   drivers/dma/fsl-edma-v3.c:734:35: warning: shift count >= width of type [-Wshift-count-overflow]
     734 |                 tcd->saddr_h = cpu_to_le32((src >> 32) & 0xffffffff);
         |                                                 ^  ~~
   include/linux/byteorder/generic.h:88:21: note: expanded from macro 'cpu_to_le32'
      88 | #define cpu_to_le32 __cpu_to_le32
         |                     ^
   include/uapi/linux/byteorder/little_endian.h:34:51: note: expanded from macro '__cpu_to_le32'
      34 | #define __cpu_to_le32(x) ((__force __le32)(__u32)(x))
         |                                                   ^
   drivers/dma/fsl-edma-v3.c:736:35: warning: shift count >= width of type [-Wshift-count-overflow]
     736 |                 tcd->daddr_h = cpu_to_le32((dst >> 32) & 0xffffffff);
         |                                                 ^  ~~
   include/linux/byteorder/generic.h:88:21: note: expanded from macro 'cpu_to_le32'
      88 | #define cpu_to_le32 __cpu_to_le32
         |                     ^
   include/uapi/linux/byteorder/little_endian.h:34:51: note: expanded from macro '__cpu_to_le32'
      34 | #define __cpu_to_le32(x) ((__force __le32)(__u32)(x))
         |                                                   ^
   drivers/dma/fsl-edma-v3.c:757:37: warning: shift count >= width of type [-Wshift-count-overflow]
     757 |                 tcd->slast_h = cpu_to_le32((slast >> 32) & 0xffffffff);
         |                                                   ^  ~~
   include/linux/byteorder/generic.h:88:21: note: expanded from macro 'cpu_to_le32'
      88 | #define cpu_to_le32 __cpu_to_le32
         |                     ^
   include/uapi/linux/byteorder/little_endian.h:34:51: note: expanded from macro '__cpu_to_le32'
      34 | #define __cpu_to_le32(x) ((__force __le32)(__u32)(x))
         |                                                   ^
   drivers/dma/fsl-edma-v3.c:763:45: warning: shift count >= width of type [-Wshift-count-overflow]
     763 |                 tcd->dlast_sga_h = cpu_to_le32((dlast_sga >> 32) & 0xffffffff);
         |                                                           ^  ~~
   include/linux/byteorder/generic.h:88:21: note: expanded from macro 'cpu_to_le32'
      88 | #define cpu_to_le32 __cpu_to_le32
         |                     ^
   include/uapi/linux/byteorder/little_endian.h:34:51: note: expanded from macro '__cpu_to_le32'
      34 | #define __cpu_to_le32(x) ((__force __le32)(__u32)(x))
         |                                                   ^
   15 warnings generated.


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
