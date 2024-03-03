Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.14])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 38C527E6
	for <oe-kbuild-all@lists.linux.dev>; Sun,  3 Mar 2024 01:01:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.14
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1709427668; cv=none; b=VWqTBgnmqJA5llN/hMT9tKJsbBllpuvICf3IW6obQD0bj5DFVK4P76pLwKBmx/8Hcd5Pg3PUduMJCjTiu211m3NO4/V5O4wRNQTsYwa9PY+7Kb146JOQ1agXY6dp/SXWeIGrfTPFLM1YfPYTdEFGiJsN3wfBuZ1atzOuRYnSmzQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1709427668; c=relaxed/simple;
	bh=YVjsjZa4BxFM3NzpeI+YOz05mX3xfBPglK/kXWcDEbE=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=u/oWHWyQP4MvFFankIwDS+dSOzAOTimAZ1I1szkjT9SxbdzTkWKWuM78I5UJXF3aoiEUp43aGhNn8Kfg7+QiI1ryEkjRf5qJPos2Yst8GFqIOk1BJ3Rp6A4qguuAj1FIR+v1dL8CY6nlh9XVDwFOXAlS+hncR01R5oNCoCljql4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=QUBbFJnP; arc=none smtp.client-ip=198.175.65.14
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="QUBbFJnP"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1709427666; x=1740963666;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=YVjsjZa4BxFM3NzpeI+YOz05mX3xfBPglK/kXWcDEbE=;
  b=QUBbFJnPV18gGZ01f4ySvopDhzP/svNa1ljxXZV6KLAWgC4FIEjbhxvT
   gXlKS/j20zMBMkJo1f9iSprU305np99J97X6jsEkul06YUlDqVZF6rVXx
   GHqlLol5/YrSEA8N4t2tvZ49HR/NV64ddegXgj6PIgp3d1hY/Sw8wrgQY
   tMBHGVW0OqPQJ/7JLOrkafxjRiNqr+0zLhg4u8IIb5COKNePEQXl6pgSt
   hrqO9CSZnbAVntdWix0V9WrsT8KbO8OoFk0E3FDl7cqDBgrlNKwJWBoD7
   1oX7DvoDW7M948CNoFcgFex0FLKrnSn3SplhKoXXH3cEdv87UVVdUMBL4
   g==;
X-IronPort-AV: E=McAfee;i="6600,9927,11001"; a="7757976"
X-IronPort-AV: E=Sophos;i="6.06,200,1705392000"; 
   d="scan'208";a="7757976"
Received: from orviesa008.jf.intel.com ([10.64.159.148])
  by orvoesa106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 02 Mar 2024 17:01:06 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.06,200,1705392000"; 
   d="scan'208";a="9157193"
Received: from lkp-server01.sh.intel.com (HELO b21307750695) ([10.239.97.150])
  by orviesa008.jf.intel.com with ESMTP; 02 Mar 2024 17:01:05 -0800
Received: from kbuild by b21307750695 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1rgaDu-0000PS-0b;
	Sun, 03 Mar 2024 01:01:02 +0000
Date: Sun, 3 Mar 2024 09:00:55 +0800
From: kernel test robot <lkp@intel.com>
To: kernel@openeuler.org, Hongchen Zhang <zhanghongchen@loongson.cn>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [openeuler:OLK-6.6 1693/3769]
 drivers/pci/controller/pci-loongson.c:183:22: sparse: sparse: incorrect type
 in argument 2 (different address spaces)
Message-ID: <202403030850.TjIcnZbF-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://gitee.com/openeuler/kernel.git OLK-6.6
head:   fbcd4a3032a53350f6d182c9daeaa4c46e65d964
commit: 668ae8b1a55a96a60303d36b81b112a709a324bb [1693/3769] PCI: LS7A2000: fix GPU card error
config: loongarch-randconfig-r112-20240302 (https://download.01.org/0day-ci/archive/20240303/202403030850.TjIcnZbF-lkp@intel.com/config)
compiler: loongarch64-linux-gcc (GCC) 13.2.0
reproduce: (https://download.01.org/0day-ci/archive/20240303/202403030850.TjIcnZbF-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202403030850.TjIcnZbF-lkp@intel.com/

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
