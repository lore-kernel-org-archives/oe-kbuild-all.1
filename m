Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.9])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5626567A19
	for <oe-kbuild-all@lists.linux.dev>; Sun,  3 Mar 2024 19:42:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.9
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1709494926; cv=none; b=k1JVk5z42N7qFoZC7Ciyft5XL1eBhwg6iPRIqcACLuxrHW/g65ZtvthV3XT20RyGyBF+rtQj7iEYtzFh5duLZN21L/ozLGNUMPY7BBuLgvftn/FICeb4ZKwtDvH68PUWI/w9icGW4BeOpfD13nHYP8STaToWm70ebdNYG1FltmM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1709494926; c=relaxed/simple;
	bh=IimADOz3cZMHh2e9cndFz9ePl2dGmwB5lVjaZNtJxy8=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=Zpp/4owimUTTpg+ZglRfPZGZAZAlsRfbIbGNHf4Xu0aVbJB86LtaqSZFcEiEn2hZGVUK4Pte12JYc9eNZPrkclJVrjqaNe1jXU+dKPJpcZNjMWGVI0DTs3Yo+K2KeYPP0SfuFnh336KotDRBPN6zkhXxrR66OFLNNVMwYMvm9aM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=hm/+E1Jk; arc=none smtp.client-ip=192.198.163.9
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="hm/+E1Jk"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1709494923; x=1741030923;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=IimADOz3cZMHh2e9cndFz9ePl2dGmwB5lVjaZNtJxy8=;
  b=hm/+E1JkEiHa65J78NjCEN2yzan0xZLepInSTr5i9muJ49dOs4B94h+H
   usFpxe/0HYyWFj5yGaC56gmW57A5Wi34bVCnKiHOlqHMRVU+qwKK9PMbc
   Z1yG20zyV0IXT5afkrOPAS3zF5nSVbvWO93J889g9yP7YhwczKj27hGSY
   JuouKjisYczDjR5EIfGjafwdIqFNrJw/e3JgxZu4R6nHGVxfksqliK8YR
   OVUbNjQK7efZcsk4tiEGSTZ9MaAnjTgHF0eOJum1No7ZeBbqw/Qih3t1X
   YrpgAPPEXAaAMYogWpkyJs8MXNB2MAyQBjeFBG9nvDKKzwmAYyJbiW9yE
   Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,11002"; a="14691686"
X-IronPort-AV: E=Sophos;i="6.06,201,1705392000"; 
   d="scan'208";a="14691686"
Received: from fmviesa007.fm.intel.com ([10.60.135.147])
  by fmvoesa103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 03 Mar 2024 11:42:02 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.06,201,1705392000"; 
   d="scan'208";a="8656005"
Received: from lkp-server01.sh.intel.com (HELO b21307750695) ([10.239.97.150])
  by fmviesa007.fm.intel.com with ESMTP; 03 Mar 2024 11:41:59 -0800
Received: from kbuild by b21307750695 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1rgrif-00023m-0w;
	Sun, 03 Mar 2024 19:41:57 +0000
Date: Mon, 4 Mar 2024 03:41:22 +0800
From: kernel test robot <lkp@intel.com>
To: jasperwang@tencent.com, kaixuxia@tencent.com, frankjpliu@tencent.com,
	kasong@tencent.com, sagazchen@tencent.com, kernelxing@tencent.com,
	aurelianliu@tencent.com, jason.zeng@intel.com, wu.zheng@intel.com,
	yingbao.jia@intel.com, pei.p.jia@intel.com
Cc: oe-kbuild-all@lists.linux.dev
Subject: drivers/vfio/platform/reset/vfio_platform_amdxgbe.c:33:44: sparse:
 sparse: incorrect type in argument 2 (different address spaces)
Message-ID: <202403040325.RRbzn2ux-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hi Jason,

First bad commit (maybe != root cause):

tree:   https://gitee.com/OpenCloudOS/OpenCloudOS-Kernel.git linux-5.4/lts/5.4.119-20.0009
head:   3bf5c3f6e32e9cfe13f09bac3ae93b8e39d472c1
commit: c29a8fe73857e9fa29d3d4bc9897fb7f126a7af2 vfio: IOMMU_API should be selected
date:   2 years, 11 months ago
config: arm64-randconfig-r131-20240303 (https://download.01.org/0day-ci/archive/20240304/202403040325.RRbzn2ux-lkp@intel.com/config)
compiler: aarch64-linux-gcc (GCC) 13.2.0
reproduce: (https://download.01.org/0day-ci/archive/20240304/202403040325.RRbzn2ux-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202403040325.RRbzn2ux-lkp@intel.com/

sparse warnings: (new ones prefixed by >>)
>> drivers/vfio/platform/reset/vfio_platform_amdxgbe.c:33:44: sparse: sparse: incorrect type in argument 2 (different address spaces) @@     expected void volatile [noderef] <asn:2> *addr @@     got void * @@
   drivers/vfio/platform/reset/vfio_platform_amdxgbe.c:33:44: sparse:     expected void volatile [noderef] <asn:2> *addr
   drivers/vfio/platform/reset/vfio_platform_amdxgbe.c:33:44: sparse:     got void *
>> drivers/vfio/platform/reset/vfio_platform_amdxgbe.c:34:33: sparse: sparse: incorrect type in argument 1 (different address spaces) @@     expected void const volatile [noderef] <asn:2> *addr @@     got void * @@
   drivers/vfio/platform/reset/vfio_platform_amdxgbe.c:34:33: sparse:     expected void const volatile [noderef] <asn:2> *addr
   drivers/vfio/platform/reset/vfio_platform_amdxgbe.c:34:33: sparse:     got void *
   drivers/vfio/platform/reset/vfio_platform_amdxgbe.c:44:44: sparse: sparse: incorrect type in argument 2 (different address spaces) @@     expected void volatile [noderef] <asn:2> *addr @@     got void * @@
   drivers/vfio/platform/reset/vfio_platform_amdxgbe.c:44:44: sparse:     expected void volatile [noderef] <asn:2> *addr
   drivers/vfio/platform/reset/vfio_platform_amdxgbe.c:44:44: sparse:     got void *
   drivers/vfio/platform/reset/vfio_platform_amdxgbe.c:45:33: sparse: sparse: incorrect type in argument 2 (different address spaces) @@     expected void volatile [noderef] <asn:2> *addr @@     got void * @@
   drivers/vfio/platform/reset/vfio_platform_amdxgbe.c:45:33: sparse:     expected void volatile [noderef] <asn:2> *addr
   drivers/vfio/platform/reset/vfio_platform_amdxgbe.c:45:33: sparse:     got void *
>> drivers/vfio/platform/reset/vfio_platform_amdxgbe.c:69:41: sparse: sparse: incorrect type in argument 1 (different address spaces) @@     expected void *ioaddr @@     got void [noderef] <asn:2> *ioaddr @@
   drivers/vfio/platform/reset/vfio_platform_amdxgbe.c:69:41: sparse:     expected void *ioaddr
   drivers/vfio/platform/reset/vfio_platform_amdxgbe.c:69:41: sparse:     got void [noderef] <asn:2> *ioaddr
   drivers/vfio/platform/reset/vfio_platform_amdxgbe.c:71:30: sparse: sparse: incorrect type in argument 1 (different address spaces) @@     expected void *ioaddr @@     got void [noderef] <asn:2> *ioaddr @@
   drivers/vfio/platform/reset/vfio_platform_amdxgbe.c:71:30: sparse:     expected void *ioaddr
   drivers/vfio/platform/reset/vfio_platform_amdxgbe.c:71:30: sparse:     got void [noderef] <asn:2> *ioaddr
   drivers/vfio/platform/reset/vfio_platform_amdxgbe.c:76:49: sparse: sparse: incorrect type in argument 1 (different address spaces) @@     expected void *ioaddr @@     got void [noderef] <asn:2> *ioaddr @@
   drivers/vfio/platform/reset/vfio_platform_amdxgbe.c:76:49: sparse:     expected void *ioaddr
   drivers/vfio/platform/reset/vfio_platform_amdxgbe.c:76:49: sparse:     got void [noderef] <asn:2> *ioaddr
   drivers/vfio/platform/reset/vfio_platform_amdxgbe.c:85:37: sparse: sparse: incorrect type in argument 1 (different address spaces) @@     expected void *ioaddr @@     got void [noderef] <asn:2> *ioaddr @@
   drivers/vfio/platform/reset/vfio_platform_amdxgbe.c:85:37: sparse:     expected void *ioaddr
   drivers/vfio/platform/reset/vfio_platform_amdxgbe.c:85:37: sparse:     got void [noderef] <asn:2> *ioaddr
   drivers/vfio/platform/reset/vfio_platform_amdxgbe.c:87:30: sparse: sparse: incorrect type in argument 1 (different address spaces) @@     expected void *ioaddr @@     got void [noderef] <asn:2> *ioaddr @@
   drivers/vfio/platform/reset/vfio_platform_amdxgbe.c:87:30: sparse:     expected void *ioaddr
   drivers/vfio/platform/reset/vfio_platform_amdxgbe.c:87:30: sparse:     got void [noderef] <asn:2> *ioaddr
   drivers/vfio/platform/reset/vfio_platform_amdxgbe.c:90:30: sparse: sparse: incorrect type in argument 1 (different address spaces) @@     expected void *ioaddr @@     got void [noderef] <asn:2> *ioaddr @@
   drivers/vfio/platform/reset/vfio_platform_amdxgbe.c:90:30: sparse:     expected void *ioaddr
   drivers/vfio/platform/reset/vfio_platform_amdxgbe.c:90:30: sparse:     got void [noderef] <asn:2> *ioaddr
   drivers/vfio/platform/reset/vfio_platform_amdxgbe.c:93:30: sparse: sparse: incorrect type in argument 1 (different address spaces) @@     expected void *ioaddr @@     got void [noderef] <asn:2> *ioaddr @@
   drivers/vfio/platform/reset/vfio_platform_amdxgbe.c:93:30: sparse:     expected void *ioaddr
   drivers/vfio/platform/reset/vfio_platform_amdxgbe.c:93:30: sparse:     got void [noderef] <asn:2> *ioaddr

vim +33 drivers/vfio/platform/reset/vfio_platform_amdxgbe.c

^590eaf1fec755 Kaixu Xia 2021-03-16   26  
^590eaf1fec755 Kaixu Xia 2021-03-16   27  static unsigned int xmdio_read(void *ioaddr, unsigned int mmd,
^590eaf1fec755 Kaixu Xia 2021-03-16   28  			       unsigned int reg)
^590eaf1fec755 Kaixu Xia 2021-03-16   29  {
^590eaf1fec755 Kaixu Xia 2021-03-16   30  	unsigned int mmd_address, value;
^590eaf1fec755 Kaixu Xia 2021-03-16   31  
^590eaf1fec755 Kaixu Xia 2021-03-16   32  	mmd_address = (mmd << 16) | ((reg) & 0xffff);
^590eaf1fec755 Kaixu Xia 2021-03-16  @33  	iowrite32(mmd_address >> 8, ioaddr + (PCS_MMD_SELECT << 2));
^590eaf1fec755 Kaixu Xia 2021-03-16  @34  	value = ioread32(ioaddr + ((mmd_address & 0xff) << 2));
^590eaf1fec755 Kaixu Xia 2021-03-16   35  	return value;
^590eaf1fec755 Kaixu Xia 2021-03-16   36  }
^590eaf1fec755 Kaixu Xia 2021-03-16   37  
^590eaf1fec755 Kaixu Xia 2021-03-16   38  static void xmdio_write(void *ioaddr, unsigned int mmd,
^590eaf1fec755 Kaixu Xia 2021-03-16   39  			unsigned int reg, unsigned int value)
^590eaf1fec755 Kaixu Xia 2021-03-16   40  {
^590eaf1fec755 Kaixu Xia 2021-03-16   41  	unsigned int mmd_address;
^590eaf1fec755 Kaixu Xia 2021-03-16   42  
^590eaf1fec755 Kaixu Xia 2021-03-16   43  	mmd_address = (mmd << 16) | ((reg) & 0xffff);
^590eaf1fec755 Kaixu Xia 2021-03-16   44  	iowrite32(mmd_address >> 8, ioaddr + (PCS_MMD_SELECT << 2));
^590eaf1fec755 Kaixu Xia 2021-03-16   45  	iowrite32(value, ioaddr + ((mmd_address & 0xff) << 2));
^590eaf1fec755 Kaixu Xia 2021-03-16   46  }
^590eaf1fec755 Kaixu Xia 2021-03-16   47  
^590eaf1fec755 Kaixu Xia 2021-03-16   48  static int vfio_platform_amdxgbe_reset(struct vfio_platform_device *vdev)
^590eaf1fec755 Kaixu Xia 2021-03-16   49  {
^590eaf1fec755 Kaixu Xia 2021-03-16   50  	struct vfio_platform_region *xgmac_regs = &vdev->regions[0];
^590eaf1fec755 Kaixu Xia 2021-03-16   51  	struct vfio_platform_region *xpcs_regs = &vdev->regions[1];
^590eaf1fec755 Kaixu Xia 2021-03-16   52  	u32 dma_mr_value, pcs_value, value;
^590eaf1fec755 Kaixu Xia 2021-03-16   53  	unsigned int count;
^590eaf1fec755 Kaixu Xia 2021-03-16   54  
^590eaf1fec755 Kaixu Xia 2021-03-16   55  	if (!xgmac_regs->ioaddr) {
^590eaf1fec755 Kaixu Xia 2021-03-16   56  		xgmac_regs->ioaddr =
^590eaf1fec755 Kaixu Xia 2021-03-16   57  			ioremap_nocache(xgmac_regs->addr, xgmac_regs->size);
^590eaf1fec755 Kaixu Xia 2021-03-16   58  		if (!xgmac_regs->ioaddr)
^590eaf1fec755 Kaixu Xia 2021-03-16   59  			return -ENOMEM;
^590eaf1fec755 Kaixu Xia 2021-03-16   60  	}
^590eaf1fec755 Kaixu Xia 2021-03-16   61  	if (!xpcs_regs->ioaddr) {
^590eaf1fec755 Kaixu Xia 2021-03-16   62  		xpcs_regs->ioaddr =
^590eaf1fec755 Kaixu Xia 2021-03-16   63  			ioremap_nocache(xpcs_regs->addr, xpcs_regs->size);
^590eaf1fec755 Kaixu Xia 2021-03-16   64  		if (!xpcs_regs->ioaddr)
^590eaf1fec755 Kaixu Xia 2021-03-16   65  			return -ENOMEM;
^590eaf1fec755 Kaixu Xia 2021-03-16   66  	}
^590eaf1fec755 Kaixu Xia 2021-03-16   67  
^590eaf1fec755 Kaixu Xia 2021-03-16   68  	/* reset the PHY through MDIO*/
^590eaf1fec755 Kaixu Xia 2021-03-16  @69  	pcs_value = xmdio_read(xpcs_regs->ioaddr, MDIO_MMD_PCS, MDIO_CTRL1);
^590eaf1fec755 Kaixu Xia 2021-03-16   70  	pcs_value |= MDIO_CTRL1_RESET;
^590eaf1fec755 Kaixu Xia 2021-03-16   71  	xmdio_write(xpcs_regs->ioaddr, MDIO_MMD_PCS, MDIO_CTRL1, pcs_value);
^590eaf1fec755 Kaixu Xia 2021-03-16   72  
^590eaf1fec755 Kaixu Xia 2021-03-16   73  	count = 50;
^590eaf1fec755 Kaixu Xia 2021-03-16   74  	do {
^590eaf1fec755 Kaixu Xia 2021-03-16   75  		msleep(20);
^590eaf1fec755 Kaixu Xia 2021-03-16   76  		pcs_value = xmdio_read(xpcs_regs->ioaddr, MDIO_MMD_PCS,
^590eaf1fec755 Kaixu Xia 2021-03-16   77  					MDIO_CTRL1);
^590eaf1fec755 Kaixu Xia 2021-03-16   78  	} while ((pcs_value & MDIO_CTRL1_RESET) && --count);
^590eaf1fec755 Kaixu Xia 2021-03-16   79  
^590eaf1fec755 Kaixu Xia 2021-03-16   80  	if (pcs_value & MDIO_CTRL1_RESET)
^590eaf1fec755 Kaixu Xia 2021-03-16   81  		dev_warn(vdev->device, "%s: XGBE PHY reset timeout\n",
^590eaf1fec755 Kaixu Xia 2021-03-16   82  			 __func__);
^590eaf1fec755 Kaixu Xia 2021-03-16   83  
^590eaf1fec755 Kaixu Xia 2021-03-16   84  	/* disable auto-negotiation */
^590eaf1fec755 Kaixu Xia 2021-03-16   85  	value = xmdio_read(xpcs_regs->ioaddr, MDIO_MMD_AN, MDIO_CTRL1);
^590eaf1fec755 Kaixu Xia 2021-03-16   86  	value &= ~MDIO_AN_CTRL1_ENABLE;
^590eaf1fec755 Kaixu Xia 2021-03-16   87  	xmdio_write(xpcs_regs->ioaddr, MDIO_MMD_AN, MDIO_CTRL1, value);
^590eaf1fec755 Kaixu Xia 2021-03-16   88  
^590eaf1fec755 Kaixu Xia 2021-03-16   89  	/* disable AN IRQ */
^590eaf1fec755 Kaixu Xia 2021-03-16   90  	xmdio_write(xpcs_regs->ioaddr, MDIO_MMD_AN, MDIO_AN_INTMASK, 0);
^590eaf1fec755 Kaixu Xia 2021-03-16   91  
^590eaf1fec755 Kaixu Xia 2021-03-16   92  	/* clear AN IRQ */
^590eaf1fec755 Kaixu Xia 2021-03-16   93  	xmdio_write(xpcs_regs->ioaddr, MDIO_MMD_AN, MDIO_AN_INT, 0);
^590eaf1fec755 Kaixu Xia 2021-03-16   94  
^590eaf1fec755 Kaixu Xia 2021-03-16   95  	/* MAC software reset */
^590eaf1fec755 Kaixu Xia 2021-03-16   96  	dma_mr_value = ioread32(xgmac_regs->ioaddr + DMA_MR);
^590eaf1fec755 Kaixu Xia 2021-03-16   97  	dma_mr_value |= 0x1;
^590eaf1fec755 Kaixu Xia 2021-03-16   98  	iowrite32(dma_mr_value, xgmac_regs->ioaddr + DMA_MR);
^590eaf1fec755 Kaixu Xia 2021-03-16   99  
^590eaf1fec755 Kaixu Xia 2021-03-16  100  	usleep_range(10, 15);
^590eaf1fec755 Kaixu Xia 2021-03-16  101  
^590eaf1fec755 Kaixu Xia 2021-03-16  102  	count = 2000;
^590eaf1fec755 Kaixu Xia 2021-03-16  103  	while (--count && (ioread32(xgmac_regs->ioaddr + DMA_MR) & 1))
^590eaf1fec755 Kaixu Xia 2021-03-16  104  		usleep_range(500, 600);
^590eaf1fec755 Kaixu Xia 2021-03-16  105  
^590eaf1fec755 Kaixu Xia 2021-03-16  106  	if (!count)
^590eaf1fec755 Kaixu Xia 2021-03-16  107  		dev_warn(vdev->device, "%s: MAC SW reset failed\n", __func__);
^590eaf1fec755 Kaixu Xia 2021-03-16  108  
^590eaf1fec755 Kaixu Xia 2021-03-16  109  	return 0;
^590eaf1fec755 Kaixu Xia 2021-03-16  110  }
^590eaf1fec755 Kaixu Xia 2021-03-16  111  

:::::: The code at line 33 was first introduced by commit
:::::: 590eaf1fec755215547690e787cc7d83f58ea948 Init Repo base on linux 5.4.32 long term, and add base tlinux kernel interfaces.

:::::: TO: Kaixu Xia <kaixuxia@tencent.com>
:::::: CC: Kaixu Xia <kaixuxia@tencent.com>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
