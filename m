Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.7])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7764126293
	for <oe-kbuild-all@lists.linux.dev>; Mon,  4 Mar 2024 18:10:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.7
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1709575824; cv=none; b=qMP75sxqkmkx5H+NLSHRcAKock3bPzXSb2x4wUI2RsW3PDSoM+dR/FGjqIgMGdgvVUfa041st83KOughAVbe84oRR5iJ3pJozldizC9IWBtuoqERwSo3qur+Z9urni3vOUQeaaGeZkn4NXDfnoN39F5Bi0ed/V/Ox1+5Z/cWNfc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1709575824; c=relaxed/simple;
	bh=CBz/xRTNiKDbZ9M3GMB2l66g1bnnqYR5f2PzoVIcVrs=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=n42rRc9mJ+we24PxGDZM0eRSC0B0rqUDUBy9fn/Z6GVkHNnbNC9kTexpsXyT9JUVWwiuT6f8qF9iTbTiJokn9S+svfxSXirnHPCvC2JZ5q+muz8GjmhaPSw0fE+XZFzZL/gIzyMPgH2eqN3ALAP5vwMgpmhesO0GIRwhVbj0xF4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=BPJ/pHAv; arc=none smtp.client-ip=192.198.163.7
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="BPJ/pHAv"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1709575822; x=1741111822;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=CBz/xRTNiKDbZ9M3GMB2l66g1bnnqYR5f2PzoVIcVrs=;
  b=BPJ/pHAv39ZzOx5Z/g2/W6lLmwWsm9tLu5zwaYIH4vgxpM9kvpLV9pAZ
   XTpNLB3gF5RWzX9B4xbvXgB4xrCcIJFKCOvP1DR7nrussDmuN11zYx47d
   OX4rLCMLzIaqvqDgy/4f6vyu7Ysl2AGagrhplGM2EJxxS+GrrYIgnxlBx
   BPGwLBftUUTyL9xRAVhMKPvGP0KcqyURyk6us/3NwsDMRSsPiD2Z1q47+
   YXVuBenntm63E0mkbuIyxEFQaMYZJKnXrIAZgQV71xKQ3mM/EFx1nrsHP
   f7ltqBRTVU7tY59Li0N9/LiufyoT20CD+Ws/RHuKQdzMR63Rjy+3LVFq7
   g==;
X-IronPort-AV: E=McAfee;i="6600,9927,11003"; a="29510754"
X-IronPort-AV: E=Sophos;i="6.06,204,1705392000"; 
   d="scan'208";a="29510754"
Received: from fmviesa009.fm.intel.com ([10.60.135.149])
  by fmvoesa101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 04 Mar 2024 10:10:21 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.06,204,1705392000"; 
   d="scan'208";a="8996961"
Received: from lkp-server01.sh.intel.com (HELO b21307750695) ([10.239.97.150])
  by fmviesa009.fm.intel.com with ESMTP; 04 Mar 2024 10:10:18 -0800
Received: from kbuild by b21307750695 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1rhClU-0002gr-1x;
	Mon, 04 Mar 2024 18:10:16 +0000
Date: Tue, 5 Mar 2024 02:09:31 +0800
From: kernel test robot <lkp@intel.com>
To: jasperwang@tencent.com, kaixuxia@tencent.com, frankjpliu@tencent.com,
	kasong@tencent.com, sagazchen@tencent.com, kernelxing@tencent.com,
	aurelianliu@tencent.com, jason.zeng@intel.com, wu.zheng@intel.com,
	yingbao.jia@intel.com, pei.p.jia@intel.com
Cc: oe-kbuild-all@lists.linux.dev
Subject: drivers/vfio/platform/reset/vfio_platform_amdxgbe.c:33:44: sparse:
 sparse: incorrect type in argument 2 (different address spaces)
Message-ID: <202403050218.jPy7l2jv-lkp@intel.com>
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
config: arm64-randconfig-r131-20240303 (https://download.01.org/0day-ci/archive/20240305/202403050218.jPy7l2jv-lkp@intel.com/config)
compiler: aarch64-linux-gcc (GCC) 13.2.0
reproduce: (https://download.01.org/0day-ci/archive/20240305/202403050218.jPy7l2jv-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202403050218.jPy7l2jv-lkp@intel.com/

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
