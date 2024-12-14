Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.11])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 66F851B21B7
	for <oe-kbuild-all@lists.linux.dev>; Sat, 14 Dec 2024 22:05:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.11
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1734213931; cv=none; b=W0tk5yP/yL4UimWqREpesxCBhu2ieY9fYgRTpUmgGJ34oyuSuVBQjMDD1/+m9dTwY4ml6BsdzsDgyFIMShiQ3eHILFeSxP3vuX4qWKPfRlecpqzhw4pAar4R+EFztQN6cXNrmbJRopooQb3zP1I1afm08XLHzHpB84ObLRU9EYo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1734213931; c=relaxed/simple;
	bh=sOxJ2S4X0okd4x9A30jCNTDMGGVN1Btj4g7/IVhU/N0=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=IzROI0T85+3h2HE/P/m2w0d3dtJ7T3PfUzBS3lYSJFZH8+EyeMxzNe+Gz+iIowR642waF35BUyreDXMVtKHYLIS+BCNqYMS4kgKO/fPrE/a3FMLTqEYA860pf72GmXk0cDGRlImoAAeA055addpDaV02DbuFsdd9THIan8di6RM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=TTtO5Uk9; arc=none smtp.client-ip=192.198.163.11
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="TTtO5Uk9"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1734213929; x=1765749929;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=sOxJ2S4X0okd4x9A30jCNTDMGGVN1Btj4g7/IVhU/N0=;
  b=TTtO5Uk9A27JDmgqVwVFE6ib9alIbslpbEpi6YWLak5WMSnQetXDtEq3
   1G2hrd8cfMaQuBmvBUzmcRBiqrQvvJaQ75XYSNDrfY3LkB2UDfWNGAXC+
   Ht9RFYKU2UaHfSxfuhn5JAe5/m1VdSw13AYbFL1GdVwbnLKcPzcaFMzvd
   sv42LbNDN6S318b8R571bC7PUcJpZ1wk5HdxODk1U80btL7Pdu/jcJ+Dp
   tFcrR6g0rfRfULBEML/LrYaK+xeXD+kmte4DLZ/ZQxpJBqOmSf74lTMYj
   mn5MxTmZH6C6Ib048Vfkqn2FeWQRp64Kl8Tb5nUzey4l/5YOazHGMcvaZ
   A==;
X-CSE-ConnectionGUID: 0Sazw19bQbq17XPPV4Yvmw==
X-CSE-MsgGUID: EvsQAnI/QISPCwrWSFakQg==
X-IronPort-AV: E=McAfee;i="6700,10204,11286"; a="45243728"
X-IronPort-AV: E=Sophos;i="6.12,235,1728975600"; 
   d="scan'208";a="45243728"
Received: from fmviesa007.fm.intel.com ([10.60.135.147])
  by fmvoesa105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 14 Dec 2024 14:05:28 -0800
X-CSE-ConnectionGUID: tGCeydyrT2+xQWh77P15ig==
X-CSE-MsgGUID: 0eWzanrgTei7loXJV1oeJQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,235,1728975600"; 
   d="scan'208";a="96716806"
Received: from lkp-server01.sh.intel.com (HELO 82a3f569d0cb) ([10.239.97.150])
  by fmviesa007.fm.intel.com with ESMTP; 14 Dec 2024 14:05:27 -0800
Received: from kbuild by 82a3f569d0cb with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1tMaGL-000DHA-1z;
	Sat, 14 Dec 2024 22:05:25 +0000
Date: Sun, 15 Dec 2024 06:04:39 +0800
From: kernel test robot <lkp@intel.com>
To: kernel@openeuler.org, Hongchen Zhang <zhanghongchen@loongson.cn>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [openeuler:OLK-6.6 1613/1613]
 drivers/pci/controller/pci-loongson.c:183:22: sparse: sparse: incorrect type
 in argument 2 (different address spaces)
Message-ID: <202412150516.jwknHegy-lkp@intel.com>
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
commit: 668ae8b1a55a96a60303d36b81b112a709a324bb [1613/1613] PCI: LS7A2000: fix GPU card error
config: loongarch-randconfig-r111-20241210 (https://download.01.org/0day-ci/archive/20241215/202412150516.jwknHegy-lkp@intel.com/config)
compiler: loongarch64-linux-gcc (GCC) 14.2.0
reproduce: (https://download.01.org/0day-ci/archive/20241215/202412150516.jwknHegy-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202412150516.jwknHegy-lkp@intel.com/

sparse warnings: (new ones prefixed by >>)
>> drivers/pci/controller/pci-loongson.c:183:22: sparse: sparse: incorrect type in argument 2 (different address spaces) @@     expected void volatile [noderef] __iomem *addr @@     got void volatile * @@
   drivers/pci/controller/pci-loongson.c:183:22: sparse:     expected void volatile [noderef] __iomem *addr
   drivers/pci/controller/pci-loongson.c:183:22: sparse:     got void volatile *
   drivers/pci/controller/pci-loongson.c:184:29: sparse: sparse: incorrect type in argument 2 (different address spaces) @@     expected void volatile [noderef] __iomem *addr @@     got void volatile * @@
   drivers/pci/controller/pci-loongson.c:184:29: sparse:     expected void volatile [noderef] __iomem *addr
   drivers/pci/controller/pci-loongson.c:184:29: sparse:     got void volatile *
   drivers/pci/controller/pci-loongson.c: note: in included file (through include/linux/mmzone.h, include/linux/gfp.h, include/linux/xarray.h, ...):
   include/linux/page-flags.h:242:46: sparse: sparse: self-comparison always evaluates to false

vim +183 drivers/pci/controller/pci-loongson.c

   151	
   152	static void loongson_display_quirk(struct pci_dev *dev)
   153	{
   154		u32 val;
   155		u64 mask, size;
   156		u64 max_size = 0;
   157		int i, num;
   158		struct pci_bus *bus = dev->bus;
   159	
   160		if (!dev->bus->number) {
   161			if (!(dev->vendor == PCI_VENDOR_ID_LOONGSON && dev->device == 0x7a25))
   162				return;
   163		} else {
   164			while (!pci_is_root_bus(bus->parent))
   165				bus = bus->parent;
   166	
   167			/* ensure slot is 7a2000 */
   168			if (bus->self->vendor != PCI_VENDOR_ID_LOONGSON || bus->self->device < 0x7a39)
   169				return;
   170		}
   171		max_size = 0;
   172		for (i = 0; i < DEVICE_COUNT_RESOURCE; i++) {
   173			if (dev->resource[i].flags & IORESOURCE_MEM) {
   174				size = dev->resource[i].end - dev->resource[i].start;
   175				if (size > max_size) {
   176					max_size = size;
   177					num = i;
   178				}
   179			}
   180		}
   181		mask = ~(dev->resource[num].end - dev->resource[num].start);
   182		val = (dev->resource[num].start >> (24 - 16)) | ((mask >> 24) & 0xffff);
 > 183		writel(val, (volatile void *)0x80000efdfb000174UL);
   184		writel(0x80000000, (volatile void *)0x80000efdfb000170UL);
   185	}
   186	DECLARE_PCI_FIXUP_FINAL(PCI_VENDOR_ID_LOONGSON, 0x7a25, loongson_display_quirk);
   187	DECLARE_PCI_FIXUP_CLASS_FINAL(PCI_ANY_ID, PCI_ANY_ID,
   188					PCI_BASE_CLASS_DISPLAY, 16, loongson_display_quirk);
   189	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
