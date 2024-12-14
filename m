Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.15])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9EEB8126C10
	for <oe-kbuild-all@lists.linux.dev>; Sat, 14 Dec 2024 09:15:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.15
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1734167737; cv=none; b=XxO2XtgGX00hhDuu8/nirT4IdEw351JAHXOHZmT95X1MReMr4QcWTxNNT2HzC9y69NorfxSaEbsZeQDzIFdED3Ge3LeNKzg/OcFftSAsfPWUdSBl0y7UtPQ/vb1zYPq5wyJXb421uIu1eBF6vLGu/o2i98uus1w/caPpQg9/+QY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1734167737; c=relaxed/simple;
	bh=LBA7KpDtyQ2Ie9EMGsdWY+iEpQ3IVZm0gbciCoA7cfE=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=Qhq0fvdIhfk/l17ALYZLquYeDPF14QVPBmUoNrSvC88ShyPvMJTcuMiAsN2YnvI/BQovrUsOaoMMBX7M9LgYsPyPm+49U4rJGCkFyHbfus3Hm2SNJ9CHfSl726hLi14+2RiCv58sBGUnH9GN+WDcU4d439/Cn4JjT5hoGljoQNo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=NMuEFrmb; arc=none smtp.client-ip=192.198.163.15
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="NMuEFrmb"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1734167736; x=1765703736;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=LBA7KpDtyQ2Ie9EMGsdWY+iEpQ3IVZm0gbciCoA7cfE=;
  b=NMuEFrmbiP1NJJD1phwUsSGG+SYWSuZgRontBMmX4PBcrud/8yexiNs6
   sigl2ztU6Mw4YcU1uo0iQ39NLbnMFkg1AD7CXxd0eE7yiRdpwVVR9nYt7
   U1VjyIGrAnQp/g4LQnLkp01dFcte8D3Vacwx7KEBG/45E6llEwAMZC9US
   S9ck2/ENW92FNp1G771mhuKj4SCbnRFVADUSgUqzfXfYO+i1xRvA8B89F
   7tlEOvKzmRb3HWW4P66pb3duAqgRoDytpTuiXqr9sOvn0rBgPJO7VQNPQ
   tim5TX/ABBrtFKUvxMHHH4tPF40TeRuIOclrB7y0Aay7okdY6BDqqQCYO
   A==;
X-CSE-ConnectionGUID: hZUS+G0aSdaX26eagKVDAQ==
X-CSE-MsgGUID: L8uaC80eQbS5JSh4hT1GzQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11285"; a="34766824"
X-IronPort-AV: E=Sophos;i="6.12,233,1728975600"; 
   d="scan'208";a="34766824"
Received: from fmviesa009.fm.intel.com ([10.60.135.149])
  by fmvoesa109.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 14 Dec 2024 01:15:35 -0800
X-CSE-ConnectionGUID: d95UOF+xTHyoqggDIgehYQ==
X-CSE-MsgGUID: 7lgNnZURQZiNdzqQ+4gGvQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,233,1728975600"; 
   d="scan'208";a="97300976"
Received: from lkp-server01.sh.intel.com (HELO 82a3f569d0cb) ([10.239.97.150])
  by fmviesa009.fm.intel.com with ESMTP; 14 Dec 2024 01:15:34 -0800
Received: from kbuild by 82a3f569d0cb with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1tMOFI-000CoF-0N;
	Sat, 14 Dec 2024 09:15:32 +0000
Date: Sat, 14 Dec 2024 17:14:34 +0800
From: kernel test robot <lkp@intel.com>
To: kernel@openeuler.org, Hongchen Zhang <zhanghongchen@loongson.cn>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [openeuler:OLK-6.6 1613/1613] arch/loongarch/kernel/dma.c:37:42:
 sparse: sparse: incorrect type in argument 1 (different address spaces)
Message-ID: <202412141716.TzMSDkUc-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://gitee.com/openeuler/kernel.git OLK-6.6
head:   d68dc6ee371ec5466be9b2d76bdca0b360940adc
commit: 90d2bbc1ade2216bda17fb582a1aaabf7567478f [1613/1613] LoongArch: use arch specific phys_to_dma
config: loongarch-randconfig-r111-20241210 (https://download.01.org/0day-ci/archive/20241214/202412141716.TzMSDkUc-lkp@intel.com/config)
compiler: loongarch64-linux-gcc (GCC) 14.2.0
reproduce: (https://download.01.org/0day-ci/archive/20241214/202412141716.TzMSDkUc-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202412141716.TzMSDkUc-lkp@intel.com/

sparse warnings: (new ones prefixed by >>)
>> arch/loongarch/kernel/dma.c:37:42: sparse: sparse: incorrect type in argument 1 (different address spaces) @@     expected void const volatile [noderef] __iomem *addr @@     got void volatile * @@
   arch/loongarch/kernel/dma.c:37:42: sparse:     expected void const volatile [noderef] __iomem *addr
   arch/loongarch/kernel/dma.c:37:42: sparse:     got void volatile *
   arch/loongarch/kernel/dma.c: note: in included file (through include/linux/mmzone.h, include/linux/gfp.h, include/linux/slab.h, ...):
   include/linux/page-flags.h:242:46: sparse: sparse: self-comparison always evaluates to false

vim +37 arch/loongarch/kernel/dma.c

    29	
    30	void acpi_arch_dma_setup(struct device *dev)
    31	{
    32		int ret;
    33		u64 mask, end = 0;
    34		const struct bus_dma_region *map = NULL;
    35	
    36		if (node_id_offset == 0) {
  > 37			node_id_offset = ((readl(LS7A_DMA_CFG) & LS7A_DMA_NODE_MASK) >> LS7A_DMA_NODE_SHF);
    38			node_id_offset += 36;
    39		}
    40	
    41		ret = acpi_dma_get_range(dev, &map);
    42		if (!ret && map) {
    43			const struct bus_dma_region *r = map;
    44	
    45			for (end = 0; r->size; r++) {
    46				if (r->dma_start + r->size - 1 > end)
    47					end = r->dma_start + r->size - 1;
    48			}
    49	
    50			mask = DMA_BIT_MASK(ilog2(end) + 1);
    51			dev->bus_dma_limit = end;
    52			dev->dma_range_map = map;
    53			dev->coherent_dma_mask = min(dev->coherent_dma_mask, mask);
    54			*dev->dma_mask = min(*dev->dma_mask, mask);
    55		}
    56	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
