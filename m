Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.10])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EF236211273
	for <oe-kbuild-all@lists.linux.dev>; Thu, 12 Dec 2024 09:22:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.10
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1733995359; cv=none; b=eHH4QH/Wmg03NYprvkJAqEB2dX4lZfAI8QG3QXwu6JWUDKCkW9u/GDZBYsuPJb2JQq4mGbdBNYjdE84jrI8oPXvOW0s0mr05RkBGpRSirxnrvK/WSPrSD1C10KitoWIELby57RIFZUi+HUMN8LJM+4Ow+dJv2zB0bIwCrhtUjvs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1733995359; c=relaxed/simple;
	bh=6Dzq0JTMOIyN/mbc/bnZVNS9nnez+ZHQcXWIWwpxIkg=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=S6+tJTGabuTATxoUF/3580KdpQzsxQnZDHWCu1o0UjHl0Bo8LLzTnZdXl99WcEg4jzBiVKRGBYt8uPIFpANUoGKoM0nj4XhTAFV3i2UPyMdENNLc9oEyMJX7/uAjvVywZdO39WHGZKxGfF+uhSpwhock+VbzfYB8e0p8G7f/rmg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=Cki9jYdO; arc=none smtp.client-ip=192.198.163.10
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="Cki9jYdO"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1733995358; x=1765531358;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=6Dzq0JTMOIyN/mbc/bnZVNS9nnez+ZHQcXWIWwpxIkg=;
  b=Cki9jYdOkQfgIIsjt3l9DXR0Vv42zQNdASYE0B+s7r7afVWOE1LDnceP
   WhsA3H1dOHREUglGmFO0vN1D/8Wifmh1OFc2FyucAWlxF/BO42VJqbFVp
   GA48yoR95j72JdhtdKIXo8oQcnYE6/nzKTDlEUZbaUtazmp4PpobpSIue
   ZE7bcJrrlZs2jH7HiNnYqb+RhY8yEC0c13ifxGYFK9z5DGoLswtRxHwpu
   N4tvnUudggJHkX99z0vBF3oKXYZfJOl0YucqO1C8vtqn4T0hdgNHnUbGN
   ZcZjuJT9qh5e+Fk75hjnzVhbWzcCvC+uY/1AGobST5yBGsgcoTwWvxbeJ
   w==;
X-CSE-ConnectionGUID: D5U6drQZSqiU0wZHQpt7Iw==
X-CSE-MsgGUID: h5czlUjeQJ6mvOzC8fVeQg==
X-IronPort-AV: E=McAfee;i="6700,10204,11282"; a="45811375"
X-IronPort-AV: E=Sophos;i="6.12,224,1728975600"; 
   d="scan'208";a="45811375"
Received: from orviesa004.jf.intel.com ([10.64.159.144])
  by fmvoesa104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 12 Dec 2024 01:22:37 -0800
X-CSE-ConnectionGUID: vq/KjCL6TIKnLlTobzbNCA==
X-CSE-MsgGUID: l278F8BoR5iyepml+0uofg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,228,1728975600"; 
   d="scan'208";a="101203304"
Received: from lkp-server01.sh.intel.com (HELO 82a3f569d0cb) ([10.239.97.150])
  by orviesa004.jf.intel.com with ESMTP; 12 Dec 2024 01:22:37 -0800
Received: from kbuild by 82a3f569d0cb with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1tLfOz-0007ef-2r;
	Thu, 12 Dec 2024 09:22:33 +0000
Date: Thu, 12 Dec 2024 17:22:04 +0800
From: kernel test robot <lkp@intel.com>
To: kernel@openeuler.org, Hongchen Zhang <zhanghongchen@loongson.cn>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [openeuler:OLK-6.6 1613/1613]
 drivers/pci/controller/pci-loongson.c:183:22: sparse: sparse: incorrect type
 in argument 2 (different address spaces)
Message-ID: <202412121706.euopGH6a-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://gitee.com/openeuler/kernel.git OLK-6.6
head:   32b5a32c1bb75a6568def0d708b7c3ac5d99e695
commit: 668ae8b1a55a96a60303d36b81b112a709a324bb [1613/1613] PCI: LS7A2000: fix GPU card error
config: loongarch-randconfig-r111-20241210 (https://download.01.org/0day-ci/archive/20241212/202412121706.euopGH6a-lkp@intel.com/config)
compiler: loongarch64-linux-gcc (GCC) 14.2.0
reproduce: (https://download.01.org/0day-ci/archive/20241212/202412121706.euopGH6a-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202412121706.euopGH6a-lkp@intel.com/

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
