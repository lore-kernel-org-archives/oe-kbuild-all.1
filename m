Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.10])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8057A1D0DE9
	for <oe-kbuild-all@lists.linux.dev>; Sat, 14 Sep 2024 18:41:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.10
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1726339278; cv=none; b=m4X1aPpV1BNdNm6pLSbYqZNGdGMCMI4d5dmpAYmhoVTSVA7yTkrdL2fJh5/52SnDNMRfji4yKzpJnqyRSSafYemesPMbupddsDg2hVanVjFlk/smpbSUBYGMp0CRAQO3KtOh+EmcFR/PoMTWahBYEuSj87MU/JoYoLBuam5mrR0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1726339278; c=relaxed/simple;
	bh=hJ4LoLP7TDrT60RX8oZ93W2d9kMVo9IaOVxvE1F7ums=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=QTYirtKEqFCp3L5coPAQRzd54EaAIenukxuC0wKOcWKuR3KERPpJSU3+dcYTTMmMZJpG4lHJLmS5m61HFquZHkCjuzmRJ8aSRGASZo+qtyRJIatPYUCtpqnlPVQOj3+kTypxrfCa13Ks30Tdadg0b8I0qac3Svw+jxteq65r4u8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=hCKRAey2; arc=none smtp.client-ip=198.175.65.10
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="hCKRAey2"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1726339276; x=1757875276;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=hJ4LoLP7TDrT60RX8oZ93W2d9kMVo9IaOVxvE1F7ums=;
  b=hCKRAey2qBxa46uhfrlTRE2OxOSOFUFEnOiUokCG9P9juWve8ugPbDjM
   IdbQf/rNrPBizkBmpTsjk6yY89ijZR7DOrAaZfMrH+X+LEXcItkk1slvc
   hc0i/2e/dysyQ2uL4uOAa2MOdw4QbyJ7QU72oOr35OUN8pC2z8mno7L6m
   1vh1OEEf0ulhCrSghmdsIwZrYdxbpF+T1BKwDrW0vUDXYgE//l/C+k+Bf
   zUv7M04DCv/IutOZI54wudFYly78i1Nbe26Pkq7iw8X2jAkOz/m3PjluO
   ZkyRlPZV5RdVDOsPZK4BqOwZRRCjIQTsovUykRuYityxCpiJPuTEHV9yO
   Q==;
X-CSE-ConnectionGUID: 86BQ9siqQT2ks2Stx9X1tw==
X-CSE-MsgGUID: fjjo6+1CTNmifLmOs4iUMw==
X-IronPort-AV: E=McAfee;i="6700,10204,11195"; a="42700902"
X-IronPort-AV: E=Sophos;i="6.10,229,1719903600"; 
   d="scan'208";a="42700902"
Received: from fmviesa008.fm.intel.com ([10.60.135.148])
  by orvoesa102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 14 Sep 2024 11:41:16 -0700
X-CSE-ConnectionGUID: 3myPoEcoRWyuWOgrQxIFiQ==
X-CSE-MsgGUID: PCI/huepR+C3bNciIZFtEQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.10,229,1719903600"; 
   d="scan'208";a="68542934"
Received: from lkp-server01.sh.intel.com (HELO 53e96f405c61) ([10.239.97.150])
  by fmviesa008.fm.intel.com with ESMTP; 14 Sep 2024 11:41:15 -0700
Received: from kbuild by 53e96f405c61 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1spXho-00084O-2M;
	Sat, 14 Sep 2024 18:41:12 +0000
Date: Sun, 15 Sep 2024 02:41:08 +0800
From: kernel test robot <lkp@intel.com>
To: kernel@openeuler.org, Hongchen Zhang <zhanghongchen@loongson.cn>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [openeuler:OLK-6.6 1693/13948]
 drivers/pci/controller/pci-loongson.c:183:22: sparse: sparse: incorrect type
 in argument 2 (different address spaces)
Message-ID: <202409150229.qo22nype-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://gitee.com/openeuler/kernel.git OLK-6.6
head:   1910604f7315d411c0c10359055daddee968441f
commit: 668ae8b1a55a96a60303d36b81b112a709a324bb [1693/13948] PCI: LS7A2000: fix GPU card error
config: loongarch-randconfig-r133-20240913 (https://download.01.org/0day-ci/archive/20240915/202409150229.qo22nype-lkp@intel.com/config)
compiler: loongarch64-linux-gcc (GCC) 14.1.0
reproduce: (https://download.01.org/0day-ci/archive/20240915/202409150229.qo22nype-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202409150229.qo22nype-lkp@intel.com/

sparse warnings: (new ones prefixed by >>)
>> drivers/pci/controller/pci-loongson.c:183:22: sparse: sparse: incorrect type in argument 2 (different address spaces) @@     expected void volatile [noderef] __iomem *addr @@     got void volatile * @@
   drivers/pci/controller/pci-loongson.c:183:22: sparse:     expected void volatile [noderef] __iomem *addr
   drivers/pci/controller/pci-loongson.c:183:22: sparse:     got void volatile *
   drivers/pci/controller/pci-loongson.c:184:29: sparse: sparse: incorrect type in argument 2 (different address spaces) @@     expected void volatile [noderef] __iomem *addr @@     got void volatile * @@
   drivers/pci/controller/pci-loongson.c:184:29: sparse:     expected void volatile [noderef] __iomem *addr
   drivers/pci/controller/pci-loongson.c:184:29: sparse:     got void volatile *

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
