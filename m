Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.13])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DFC0B635
	for <oe-kbuild-all@lists.linux.dev>; Sat, 15 Jun 2024 00:10:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.13
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1718410217; cv=none; b=FZyI64K4WnSMGqbf5KHd0hzkQOXi+V/EXX0qCE25An065ihDcn9DiVrhyj6i6CL5h24XBOweVzoSY3yBzVVcDwUIvayqPvURlNruM7RKBAV/GMk9RpduS1jprrC4tt2jvpovWfmflbik/pM7kL4Ds2jsjXUOfeMOJ8bBAsIE+bQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1718410217; c=relaxed/simple;
	bh=QtDFmFKLiPahniN8cgdEuhfkADd6QudsdrzQsBssoW0=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=vEqM/1O8otux137HOuFI96gVk+fQRO+gtIq26VMxlW8+cpDowkfx9X5z9Yj6i/qCWdqlfGvgZFD2X0MEuHlsTu2a6FsDRuqecU4f8F1Njt3Qy+GDnu5idMva3hOCelJn70e3MWPPAG/NpxALwKeuV27tHakgpioJs+Lr3CwElM8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=hg7LrRLF; arc=none smtp.client-ip=192.198.163.13
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="hg7LrRLF"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1718410215; x=1749946215;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=QtDFmFKLiPahniN8cgdEuhfkADd6QudsdrzQsBssoW0=;
  b=hg7LrRLFhnyCimvS3gtrrcC2/ZRihThOt07FVWAiQKeSaHgWPEyYCd+C
   txrG3H5auNxfOmaqQnAm1sgbZmpx4BHtA0sbBCtfVdWLME9wQexdpTvpg
   AjjjJt1+AZD1D/c2RvTVPcL46HkcL1O4FfSGDPtvxgT8EmwLW1Gxk70Yk
   Y7Ok/sb4JLAZOKMqmuN8zjJCXSPw+Rt754tOdoju5vdRiu1ZMzL3UXpEJ
   qRJKSeJrTYWlypdCh2PSkGzo7y2ZFIoIkgojfh8d/JbrS5RRwPyx3jAP9
   lZLKShtGvcERNgs51qd2NX7bhw+hnqKXazwvsYis5LAIgTLt/pq19R2Qq
   w==;
X-CSE-ConnectionGUID: VlcIwKpNS7u9ehtYuB7jDQ==
X-CSE-MsgGUID: kfL/+G7+RWGShktaY07ElQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11103"; a="18243015"
X-IronPort-AV: E=Sophos;i="6.08,239,1712646000"; 
   d="scan'208";a="18243015"
Received: from orviesa010.jf.intel.com ([10.64.159.150])
  by fmvoesa107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 14 Jun 2024 17:09:33 -0700
X-CSE-ConnectionGUID: yRZ1RuLXQIW1thGTPLSHrA==
X-CSE-MsgGUID: UBbVX3kJQ8+aeUUKnbtJ+w==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.08,239,1712646000"; 
   d="scan'208";a="40585935"
Received: from lkp-server01.sh.intel.com (HELO 9e3ee4e9e062) ([10.239.97.150])
  by orviesa010.jf.intel.com with ESMTP; 14 Jun 2024 17:09:30 -0700
Received: from kbuild by 9e3ee4e9e062 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1sIGz1-0001w5-14;
	Sat, 15 Jun 2024 00:09:27 +0000
Date: Sat, 15 Jun 2024 08:09:01 +0800
From: kernel test robot <lkp@intel.com>
To: jasperwang@tencent.com, kaixuxia@tencent.com, frankjpliu@tencent.com,
	kasong@tencent.com, sagazchen@tencent.com, kernelxing@tencent.com,
	aurelianliu@tencent.com, jason.zeng@intel.com, wu.zheng@intel.com,
	yingbao.jia@intel.com, pei.p.jia@intel.com
Cc: oe-kbuild-all@lists.linux.dev
Subject: [opencloudos:next 31/48]
 drivers/pci/controller/pci-loongson.c:219:22: sparse: sparse: incorrect type
 in argument 2 (different address spaces)
Message-ID: <202406150856.t6mV9EI1-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://gitee.com/OpenCloudOS/OpenCloudOS-Kernel.git next
head:   ca7064b2308b42201419e17b030e6a9347be29cd
commit: f01438e069eeb6072d6049df27282e29c5b7f386 [31/48] PCI: LS7A2000: fix GPU card error
config: loongarch-randconfig-r121-20240615 (https://download.01.org/0day-ci/archive/20240615/202406150856.t6mV9EI1-lkp@intel.com/config)
compiler: loongarch64-linux-gcc (GCC) 13.2.0
reproduce: (https://download.01.org/0day-ci/archive/20240615/202406150856.t6mV9EI1-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202406150856.t6mV9EI1-lkp@intel.com/

sparse warnings: (new ones prefixed by >>)
>> drivers/pci/controller/pci-loongson.c:219:22: sparse: sparse: incorrect type in argument 2 (different address spaces) @@     expected void volatile [noderef] __iomem *addr @@     got void * @@
   drivers/pci/controller/pci-loongson.c:219:22: sparse:     expected void volatile [noderef] __iomem *addr
   drivers/pci/controller/pci-loongson.c:219:22: sparse:     got void *
   drivers/pci/controller/pci-loongson.c:220:29: sparse: sparse: incorrect type in argument 2 (different address spaces) @@     expected void volatile [noderef] __iomem *addr @@     got void * @@
   drivers/pci/controller/pci-loongson.c:220:29: sparse:     expected void volatile [noderef] __iomem *addr
   drivers/pci/controller/pci-loongson.c:220:29: sparse:     got void *
   drivers/pci/controller/pci-loongson.c: note: in included file (through include/linux/mmzone.h, include/linux/gfp.h, include/linux/xarray.h, ...):
   include/linux/page-flags.h:242:46: sparse: sparse: self-comparison always evaluates to false

vim +219 drivers/pci/controller/pci-loongson.c

   187	
   188	static void loongson_display_quirk(struct pci_dev *dev)
   189	{
   190		u32 val;
   191		u64 mask, size;
   192		u64 max_size = 0;
   193		int i, num;
   194		struct pci_bus *bus = dev->bus;
   195	
   196		if (!dev->bus->number) {
   197			if (!(dev->vendor == PCI_VENDOR_ID_LOONGSON && dev->device == 0x7a25))
   198				return;
   199		} else {
   200			while (!pci_is_root_bus(bus->parent))
   201				bus = bus->parent;
   202	
   203			/* ensure slot is 7a2000 */
   204			if (bus->self->vendor != PCI_VENDOR_ID_LOONGSON || bus->self->device < 0x7a39)
   205				return;
   206		}
   207		max_size = 0;
   208		for (i = 0; i < DEVICE_COUNT_RESOURCE; i++) {
   209			if (dev->resource[i].flags & IORESOURCE_MEM) {
   210				size = dev->resource[i].end - dev->resource[i].start;
   211				if (size > max_size) {
   212					max_size = size;
   213					num = i;
   214				}
   215			}
   216		}
   217		mask = ~(dev->resource[num].end - dev->resource[num].start);
   218		val = (dev->resource[num].start >> (24 - 16)) | ((mask >> 24) & 0xffff);
 > 219		writel(val, (void *)0x80000efdfb000174UL);
   220		writel(0x80000000, (void *)0x80000efdfb000170UL);
   221	}
   222	DECLARE_PCI_FIXUP_FINAL(PCI_VENDOR_ID_LOONGSON, 0x7a25, loongson_display_quirk);
   223	DECLARE_PCI_FIXUP_CLASS_FINAL(PCI_ANY_ID, PCI_ANY_ID,
   224					PCI_BASE_CLASS_DISPLAY, 16, loongson_display_quirk);
   225	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
