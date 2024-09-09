Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.20])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4BEB24C81
	for <oe-kbuild-all@lists.linux.dev>; Mon,  9 Sep 2024 06:13:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.20
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1725862421; cv=none; b=oBWqIy6NjqZGgubzighT5qtwCrzaOf0Uf5KNvQgRjOwIQ+1PFxoi1O3N8GoQV9V8P3Mczgtjy3A/Lq6B5oTgMG6AgOaC3HiZX84txEtDJ+KCwAdAqcooPILGmH3o3oq/IaokzKvmRG90GiarCiXg5V1sbOOKE0IZDjWcDbREYkU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1725862421; c=relaxed/simple;
	bh=gtiRoYAIc/wJJz8mjfDz4qmpe5KBp3/hi8FZ1dNSamA=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=PD87TllB9omhHpH3UK4VdnMzlr+S+rTVYgwOBoKzaMuIkdp4pQ53eLQrm3uEiPJpM9Ffbp17z8odc4VHBQYVQlujtsX0fzaKNQcvVnbBQ/7BTU4Pj/ECjjQlny+jq0F/6ZSpw8Gq4DpxC4PMABDjAsICBIHHY9FVkgnpiI68SmQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=BNI29kdt; arc=none smtp.client-ip=198.175.65.20
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="BNI29kdt"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1725862420; x=1757398420;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=gtiRoYAIc/wJJz8mjfDz4qmpe5KBp3/hi8FZ1dNSamA=;
  b=BNI29kdtymgNqLcIeKqvuXKsnRUGJs2v8z2eIaXpvyk1FBIk+RTA/BGH
   6jz8LU5d623mIimUIqrN2koJIjCMRW9L8S3SUEBq+CeslKgLTXRcwwPnn
   3WtbOASCbx3WYnv5eeBOCMos2c6l4SYE4f3/M71ZjJlhZwaZ2FXWBhGGh
   29oQ7GYBGt5oTcm3SNFuZQ5aVNTsRBywd9Ek+vAzN1kK9t00rVyelFzSv
   E2ZAY4nY33LThPZXf2Sc4Fts0xIcHuGw8YTeE2HR/pqtX0tcXxf7hgMXC
   peFRnP3/6UfmPCrBRknIzhrRly0otVInyzsVxoFEK19Lw1MNcWlJxQw9W
   w==;
X-CSE-ConnectionGUID: 6VMgRHjzRL6hc7B/aKNLnA==
X-CSE-MsgGUID: Wq8JhUq0Rp+SDM7itlyPAQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11189"; a="24329758"
X-IronPort-AV: E=Sophos;i="6.10,213,1719903600"; 
   d="scan'208";a="24329758"
Received: from orviesa004.jf.intel.com ([10.64.159.144])
  by orvoesa112.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 08 Sep 2024 23:13:39 -0700
X-CSE-ConnectionGUID: T5dsg21aTsSPVoyW2HkEcA==
X-CSE-MsgGUID: znd60/UBSzuliEcTqE0NDg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.10,213,1719903600"; 
   d="scan'208";a="71505404"
Received: from lkp-server01.sh.intel.com (HELO 9c6b1c7d3b50) ([10.239.97.150])
  by orviesa004.jf.intel.com with ESMTP; 08 Sep 2024 23:13:36 -0700
Received: from kbuild by 9c6b1c7d3b50 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1snXeX-000EOF-0q;
	Mon, 09 Sep 2024 06:13:33 +0000
Date: Mon, 9 Sep 2024 14:13:25 +0800
From: kernel test robot <lkp@intel.com>
To: kaixuxia@tencent.com, frankjpliu@tencent.com, kasong@tencent.com,
	sagazchen@tencent.com, kernelxing@tencent.com,
	aurelianliu@tencent.com, deshengwu@tencent.com,
	flyingpeng@tencent.com, jason.zeng@intel.com, wu.zheng@intel.com,
	yingbao.jia@intel.com, pei.p.jia@intel.com
Cc: oe-kbuild-all@lists.linux.dev
Subject: [opencloudos:next 31/48]
 drivers/pci/controller/pci-loongson.c:219:22: sparse: sparse: incorrect type
 in argument 2 (different address spaces)
Message-ID: <202409091429.9tatcAEe-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://gitee.com/OpenCloudOS/OpenCloudOS-Kernel.git next
head:   95e99651a23c1ccc103007c3b0532ff97d7c357d
commit: f01438e069eeb6072d6049df27282e29c5b7f386 [31/48] PCI: LS7A2000: fix GPU card error
config: loongarch-randconfig-r111-20240909 (https://download.01.org/0day-ci/archive/20240909/202409091429.9tatcAEe-lkp@intel.com/config)
compiler: loongarch64-linux-gcc (GCC) 14.1.0
reproduce: (https://download.01.org/0day-ci/archive/20240909/202409091429.9tatcAEe-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202409091429.9tatcAEe-lkp@intel.com/

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
