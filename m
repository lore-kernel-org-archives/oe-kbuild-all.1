Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.11])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6C00B392831
	for <oe-kbuild-all@lists.linux.dev>; Fri, 27 Mar 2026 12:08:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.11
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774613317; cv=none; b=alCxm+vgEwtRuvPfkzq/qgoLBb9dF21SrfqX+QtzdBRs0pI930TVj3nIW4myQ/CNaffeU+b9C1efxb/tmrJs77hk5XQlfKT4zJ6F/zhriPsDQXZW7bwCVR2Ww3y467A2jPZQoEe1YlzAknfr5oTJC9OGZfkn8ZRBf967AWhHMMc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774613317; c=relaxed/simple;
	bh=lYQ2O5zDHfLelo4sB7hAT7KQj2yRYQNLoVDnxhKI7W0=;
	h=Date:From:To:Cc:Subject:Message-ID; b=emYsfhGSOfxLke1A/RkR/xqhDpjgD5ssVw8bCIoOI5Nga4tlEKRWB6jVr1xhyJ5YVmdHCt2q1tYPJVk3JHLMFMfwDfecqcVg7k7HqQot/kyeeYRpf3cgrQ7LTCw7uo3HZVQf/Td2Cnt6dVm22MJNOz5kOnH9TbH92j/pO1xBxRY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=ArfKm+Y1; arc=none smtp.client-ip=198.175.65.11
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="ArfKm+Y1"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1774613315; x=1806149315;
  h=date:from:to:cc:subject:message-id;
  bh=lYQ2O5zDHfLelo4sB7hAT7KQj2yRYQNLoVDnxhKI7W0=;
  b=ArfKm+Y11uR52WgDBYLkYuoruw9vaVUR3YZMo8xoV4SoRtP2LvSIBDUh
   GUhfTlck4Zpm2JtZ5KtTS0iV39spneF52/3Tg528R7An3lcL9vsnjlGVM
   Fl1YUqAfSRo71rkjmb/O3IewisXb0nEW+yhFoWwI1b9qv5FHDh7o4b9QJ
   HlLmN9DRdi3OYfkMwZ88SbYHZMUBPkeG6xFLwDyb3hQQebuDCsujEiGZx
   cYHugZaW6E4WXkLyVZt/hYFQIOmxoiS5gOwemjfftPt+9WOa3x1JPBP88
   DEU1MHiwLFmWtU0H0vER1dvmoipAEucdZOv4rl3LgRrx48HFyNOcN7Gff
   Q==;
X-CSE-ConnectionGUID: S84vShKmTs29X1YxYtEUeg==
X-CSE-MsgGUID: 9x2hz3DCQzyUJuJhYq37ew==
X-IronPort-AV: E=McAfee;i="6800,10657,11741"; a="85992242"
X-IronPort-AV: E=Sophos;i="6.23,144,1770624000"; 
   d="scan'208";a="85992242"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
  by orvoesa103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 27 Mar 2026 05:08:35 -0700
X-CSE-ConnectionGUID: b1QV/EQIQwOjFTa2DJeq5A==
X-CSE-MsgGUID: wdqzdyf8TrOjxfXiSmQZPw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,144,1770624000"; 
   d="scan'208";a="230071891"
Received: from lkp-server01.sh.intel.com (HELO 3905d212be1b) ([10.239.97.150])
  by fmviesa005.fm.intel.com with ESMTP; 27 Mar 2026 05:08:33 -0700
Received: from kbuild by 3905d212be1b with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1w65zK-00000000AF7-3OJp;
	Fri, 27 Mar 2026 12:08:30 +0000
Date: Fri, 27 Mar 2026 20:07:38 +0800
From: kernel test robot <lkp@intel.com>
To: cros-kernel-buildreports@googlegroups.com
Cc: oe-kbuild-all@lists.linux.dev
Subject: [android-common:android12-kiwi-5.10 218/218]
 drivers/usb/cdns3/drd.c:391:38: sparse: sparse: incorrect type in assignment
 (different address spaces)
Message-ID: <202603271907.5FJQzADN-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>

tree:   https://android.googlesource.com/kernel/common android12-kiwi-5.10
head:   11d64ee60c8304d3468e4ced34971775c95e3429
commit: 8382cdf0ab5df84cae9603de927145a7f140b937 [218/218] usb: cdns3: Add support for DRD CDNSP
config: arm-randconfig-r121-20260325 (https://download.01.org/0day-ci/archive/20260327/202603271907.5FJQzADN-lkp@intel.com/config)
compiler: arm-linux-gnueabi-gcc (GCC) 13.4.0
sparse: v0.6.5-rc1
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260327/202603271907.5FJQzADN-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202603271907.5FJQzADN-lkp@intel.com/

sparse warnings: (new ones prefixed by >>)
   drivers/usb/cdns3/drd.c:44:38: sparse: sparse: incorrect type in assignment (different base types) @@     expected unsigned int [noderef] [usertype] __iomem *override_reg @@     got restricted __le32 * @@
   drivers/usb/cdns3/drd.c:44:38: sparse:     expected unsigned int [noderef] [usertype] __iomem *override_reg
   drivers/usb/cdns3/drd.c:44:38: sparse:     got restricted __le32 *
   drivers/usb/cdns3/drd.c:46:38: sparse: sparse: incorrect type in assignment (different base types) @@     expected unsigned int [noderef] [usertype] __iomem *override_reg @@     got restricted __le32 * @@
   drivers/usb/cdns3/drd.c:46:38: sparse:     expected unsigned int [noderef] [usertype] __iomem *override_reg
   drivers/usb/cdns3/drd.c:46:38: sparse:     got restricted __le32 *
   drivers/usb/cdns3/drd.c:48:38: sparse: sparse: incorrect type in assignment (different base types) @@     expected unsigned int [noderef] [usertype] __iomem *override_reg @@     got restricted __le32 * @@
   drivers/usb/cdns3/drd.c:48:38: sparse:     expected unsigned int [noderef] [usertype] __iomem *override_reg
   drivers/usb/cdns3/drd.c:48:38: sparse:     got restricted __le32 *
   drivers/usb/cdns3/drd.c:67:39: sparse: sparse: incorrect type in argument 1 (different address spaces) @@     expected void const volatile [noderef] __iomem *addr @@     got restricted __le32 * @@
   drivers/usb/cdns3/drd.c:67:39: sparse:     expected void const volatile [noderef] __iomem *addr
   drivers/usb/cdns3/drd.c:67:39: sparse:     got restricted __le32 *
   drivers/usb/cdns3/drd.c:69:33: sparse: sparse: incorrect type in argument 2 (different address spaces) @@     expected void volatile [noderef] __iomem *addr @@     got restricted __le32 * @@
   drivers/usb/cdns3/drd.c:69:33: sparse:     expected void volatile [noderef] __iomem *addr
   drivers/usb/cdns3/drd.c:69:33: sparse:     got restricted __le32 *
   drivers/usb/cdns3/drd.c:92:14: sparse: sparse: incorrect type in argument 1 (different address spaces) @@     expected void const volatile [noderef] __iomem *addr @@     got restricted __le32 * @@
   drivers/usb/cdns3/drd.c:92:14: sparse:     expected void const volatile [noderef] __iomem *addr
   drivers/usb/cdns3/drd.c:92:14: sparse:     got restricted __le32 *
   drivers/usb/cdns3/drd.c:102:19: sparse: sparse: incorrect type in argument 1 (different address spaces) @@     expected void const volatile [noderef] __iomem *addr @@     got restricted __le32 * @@
   drivers/usb/cdns3/drd.c:102:19: sparse:     expected void const volatile [noderef] __iomem *addr
   drivers/usb/cdns3/drd.c:102:19: sparse:     got restricted __le32 *
   drivers/usb/cdns3/drd.c:135:9: sparse: sparse: incorrect type in argument 2 (different address spaces) @@     expected void volatile [noderef] __iomem *addr @@     got restricted __le32 * @@
   drivers/usb/cdns3/drd.c:135:9: sparse:     expected void volatile [noderef] __iomem *addr
   drivers/usb/cdns3/drd.c:135:9: sparse:     got restricted __le32 *
   drivers/usb/cdns3/drd.c:144:9: sparse: sparse: incorrect type in argument 2 (different address spaces) @@     expected void volatile [noderef] __iomem *addr @@     got restricted __le32 * @@
   drivers/usb/cdns3/drd.c:144:9: sparse:     expected void volatile [noderef] __iomem *addr
   drivers/usb/cdns3/drd.c:144:9: sparse:     got restricted __le32 *
   drivers/usb/cdns3/drd.c:160:9: sparse: sparse: incorrect type in argument 2 (different address spaces) @@     expected void volatile [noderef] __iomem *addr @@     got restricted __le32 * @@
   drivers/usb/cdns3/drd.c:160:9: sparse:     expected void volatile [noderef] __iomem *addr
   drivers/usb/cdns3/drd.c:160:9: sparse:     got restricted __le32 *
   drivers/usb/cdns3/drd.c:169:15: sparse: sparse: incorrect type in argument 1 (different address spaces) @@     expected void const volatile [noderef] __iomem *addr @@     got restricted __le32 * @@
   drivers/usb/cdns3/drd.c:169:15: sparse:     expected void const volatile [noderef] __iomem *addr
   drivers/usb/cdns3/drd.c:169:15: sparse:     got restricted __le32 *
   drivers/usb/cdns3/drd.c:169:15: sparse: sparse: incorrect type in argument 1 (different address spaces) @@     expected void const volatile [noderef] __iomem *addr @@     got restricted __le32 * @@
   drivers/usb/cdns3/drd.c:169:15: sparse:     expected void const volatile [noderef] __iomem *addr
   drivers/usb/cdns3/drd.c:169:15: sparse:     got restricted __le32 *
   drivers/usb/cdns3/drd.c:187:9: sparse: sparse: incorrect type in argument 2 (different address spaces) @@     expected void volatile [noderef] __iomem *addr @@     got restricted __le32 * @@
   drivers/usb/cdns3/drd.c:187:9: sparse:     expected void volatile [noderef] __iomem *addr
   drivers/usb/cdns3/drd.c:187:9: sparse:     got restricted __le32 *
   drivers/usb/cdns3/drd.c:192:9: sparse: sparse: incorrect type in argument 1 (different address spaces) @@     expected void const volatile [noderef] __iomem *addr @@     got restricted __le32 * @@
   drivers/usb/cdns3/drd.c:192:9: sparse:     expected void const volatile [noderef] __iomem *addr
   drivers/usb/cdns3/drd.c:192:9: sparse:     got restricted __le32 *
   drivers/usb/cdns3/drd.c:192:9: sparse: sparse: incorrect type in argument 1 (different address spaces) @@     expected void const volatile [noderef] __iomem *addr @@     got restricted __le32 * @@
   drivers/usb/cdns3/drd.c:192:9: sparse:     expected void const volatile [noderef] __iomem *addr
   drivers/usb/cdns3/drd.c:192:9: sparse:     got restricted __le32 *
   drivers/usb/cdns3/drd.c:211:9: sparse: sparse: incorrect type in argument 2 (different address spaces) @@     expected void volatile [noderef] __iomem *addr @@     got restricted __le32 * @@
   drivers/usb/cdns3/drd.c:211:9: sparse:     expected void volatile [noderef] __iomem *addr
   drivers/usb/cdns3/drd.c:211:9: sparse:     got restricted __le32 *
   drivers/usb/cdns3/drd.c:220:15: sparse: sparse: incorrect type in argument 1 (different address spaces) @@     expected void const volatile [noderef] __iomem *addr @@     got restricted __le32 * @@
   drivers/usb/cdns3/drd.c:220:15: sparse:     expected void const volatile [noderef] __iomem *addr
   drivers/usb/cdns3/drd.c:220:15: sparse:     got restricted __le32 *
   drivers/usb/cdns3/drd.c:220:15: sparse: sparse: incorrect type in argument 1 (different address spaces) @@     expected void const volatile [noderef] __iomem *addr @@     got restricted __le32 * @@
   drivers/usb/cdns3/drd.c:220:15: sparse:     expected void const volatile [noderef] __iomem *addr
   drivers/usb/cdns3/drd.c:220:15: sparse:     got restricted __le32 *
   drivers/usb/cdns3/drd.c:244:9: sparse: sparse: incorrect type in argument 2 (different address spaces) @@     expected void volatile [noderef] __iomem *addr @@     got restricted __le32 * @@
   drivers/usb/cdns3/drd.c:244:9: sparse:     expected void volatile [noderef] __iomem *addr
   drivers/usb/cdns3/drd.c:244:9: sparse:     got restricted __le32 *
   drivers/usb/cdns3/drd.c:248:9: sparse: sparse: incorrect type in argument 1 (different address spaces) @@     expected void const volatile [noderef] __iomem *addr @@     got restricted __le32 * @@
   drivers/usb/cdns3/drd.c:248:9: sparse:     expected void const volatile [noderef] __iomem *addr
   drivers/usb/cdns3/drd.c:248:9: sparse:     got restricted __le32 *
   drivers/usb/cdns3/drd.c:248:9: sparse: sparse: incorrect type in argument 1 (different address spaces) @@     expected void const volatile [noderef] __iomem *addr @@     got restricted __le32 * @@
   drivers/usb/cdns3/drd.c:248:9: sparse:     expected void const volatile [noderef] __iomem *addr
   drivers/usb/cdns3/drd.c:248:9: sparse:     got restricted __le32 *
   drivers/usb/cdns3/drd.c:266:9: sparse: sparse: incorrect type in argument 2 (different address spaces) @@     expected void volatile [noderef] __iomem *addr @@     got restricted __le32 * @@
   drivers/usb/cdns3/drd.c:266:9: sparse:     expected void volatile [noderef] __iomem *addr
   drivers/usb/cdns3/drd.c:266:9: sparse:     got restricted __le32 *
   drivers/usb/cdns3/drd.c:335:15: sparse: sparse: incorrect type in argument 1 (different address spaces) @@     expected void const volatile [noderef] __iomem *addr @@     got restricted __le32 * @@
   drivers/usb/cdns3/drd.c:335:15: sparse:     expected void const volatile [noderef] __iomem *addr
   drivers/usb/cdns3/drd.c:335:15: sparse:     got restricted __le32 *
   drivers/usb/cdns3/drd.c:354:9: sparse: sparse: incorrect type in argument 2 (different address spaces) @@     expected void volatile [noderef] __iomem *addr @@     got restricted __le32 * @@
   drivers/usb/cdns3/drd.c:354:9: sparse:     expected void volatile [noderef] __iomem *addr
   drivers/usb/cdns3/drd.c:354:9: sparse:     got restricted __le32 *
   drivers/usb/cdns3/drd.c:377:27: sparse: sparse: incorrect type in assignment (different address spaces) @@     expected struct cdns3_otg_legacy_regs *otg_v0_regs @@     got void [noderef] __iomem *[assigned] regs @@
   drivers/usb/cdns3/drd.c:377:27: sparse:     expected struct cdns3_otg_legacy_regs *otg_v0_regs
   drivers/usb/cdns3/drd.c:377:27: sparse:     got void [noderef] __iomem *[assigned] regs
   drivers/usb/cdns3/drd.c:378:14: sparse: sparse: incorrect type in argument 1 (different address spaces) @@     expected void const volatile [noderef] __iomem *addr @@     got restricted __le32 * @@
   drivers/usb/cdns3/drd.c:378:14: sparse:     expected void const volatile [noderef] __iomem *addr
   drivers/usb/cdns3/drd.c:378:14: sparse:     got restricted __le32 *
   drivers/usb/cdns3/drd.c:382:32: sparse: sparse: incorrect type in assignment (different address spaces) @@     expected struct cdns3_otg_common_regs *otg_regs @@     got void [noderef] __iomem *[assigned] regs @@
   drivers/usb/cdns3/drd.c:382:32: sparse:     expected struct cdns3_otg_common_regs *otg_regs
   drivers/usb/cdns3/drd.c:382:32: sparse:     got void [noderef] __iomem *[assigned] regs
   drivers/usb/cdns3/drd.c:385:17: sparse: sparse: incorrect type in argument 2 (different address spaces) @@     expected void volatile [noderef] __iomem *addr @@     got restricted __le32 * @@
   drivers/usb/cdns3/drd.c:385:17: sparse:     expected void volatile [noderef] __iomem *addr
   drivers/usb/cdns3/drd.c:385:17: sparse:     got restricted __le32 *
   drivers/usb/cdns3/drd.c:386:17: sparse: sparse: incorrect type in argument 1 (different address spaces) @@     expected void const volatile [noderef] __iomem *addr @@     got restricted __le32 * @@
   drivers/usb/cdns3/drd.c:386:17: sparse:     expected void const volatile [noderef] __iomem *addr
   drivers/usb/cdns3/drd.c:386:17: sparse:     got restricted __le32 *
   drivers/usb/cdns3/drd.c:390:35: sparse: sparse: incorrect type in assignment (different address spaces) @@     expected struct cdns3_otg_regs *otg_v1_regs @@     got void [noderef] __iomem *[assigned] regs @@
   drivers/usb/cdns3/drd.c:390:35: sparse:     expected struct cdns3_otg_regs *otg_v1_regs
   drivers/usb/cdns3/drd.c:390:35: sparse:     got void [noderef] __iomem *[assigned] regs
>> drivers/usb/cdns3/drd.c:391:38: sparse: sparse: incorrect type in assignment (different address spaces) @@     expected struct cdnsp_otg_regs *otg_cdnsp_regs @@     got void [noderef] __iomem *[assigned] regs @@
   drivers/usb/cdns3/drd.c:391:38: sparse:     expected struct cdnsp_otg_regs *otg_cdnsp_regs
   drivers/usb/cdns3/drd.c:391:38: sparse:     got void [noderef] __iomem *[assigned] regs
>> drivers/usb/cdns3/drd.c:395:41: sparse: sparse: restricted __le32 degrades to integer
   drivers/usb/cdns3/drd.c:402:25: sparse: sparse: incorrect type in argument 2 (different address spaces) @@     expected void volatile [noderef] __iomem *addr @@     got restricted __le32 * @@
   drivers/usb/cdns3/drd.c:402:25: sparse:     expected void volatile [noderef] __iomem *addr
   drivers/usb/cdns3/drd.c:402:25: sparse:     got restricted __le32 *
   drivers/usb/cdns3/drd.c:406:17: sparse: sparse: incorrect type in argument 1 (different address spaces) @@     expected void const volatile [noderef] __iomem *addr @@     got restricted __le32 * @@
   drivers/usb/cdns3/drd.c:406:17: sparse:     expected void const volatile [noderef] __iomem *addr
   drivers/usb/cdns3/drd.c:406:17: sparse:     got restricted __le32 *
   drivers/usb/cdns3/drd.c:406:17: sparse: sparse: incorrect type in argument 1 (different address spaces) @@     expected void const volatile [noderef] __iomem *addr @@     got restricted __le32 * @@
   drivers/usb/cdns3/drd.c:406:17: sparse:     expected void const volatile [noderef] __iomem *addr
   drivers/usb/cdns3/drd.c:406:17: sparse:     got restricted __le32 *
   drivers/usb/cdns3/drd.c:411:17: sparse: sparse: incorrect type in argument 1 (different address spaces) @@     expected void const volatile [noderef] __iomem *addr @@     got restricted __le32 * @@
   drivers/usb/cdns3/drd.c:411:17: sparse:     expected void const volatile [noderef] __iomem *addr
   drivers/usb/cdns3/drd.c:411:17: sparse:     got restricted __le32 *
   drivers/usb/cdns3/drd.c:440:17: sparse: sparse: incorrect type in argument 1 (different address spaces) @@     expected void const volatile [noderef] __iomem *addr @@     got restricted __le32 * @@
   drivers/usb/cdns3/drd.c:440:17: sparse:     expected void const volatile [noderef] __iomem *addr
   drivers/usb/cdns3/drd.c:440:17: sparse:     got restricted __le32 *

vim +391 drivers/usb/cdns3/drd.c

   357	
   358	int cdns3_drd_init(struct cdns3 *cdns)
   359	{
   360		void __iomem *regs;
   361		u32 state;
   362		int ret;
   363	
   364		regs = devm_ioremap_resource(cdns->dev, &cdns->otg_res);
   365		if (IS_ERR(regs))
   366			return PTR_ERR(regs);
   367	
   368		/* Detection of DRD version. Controller has been released
   369		 * in three versions. All are very similar and are software compatible,
   370		 * but they have same changes in register maps.
   371		 * The first register in oldest version is command register and it's
   372		 * read only. Driver should read 0 from it. On the other hand, in v1
   373		 * and v2 the first register contains device ID number which is not
   374		 * set to 0. Driver uses this fact to detect the proper version of
   375		 * controller.
   376		 */
   377		cdns->otg_v0_regs = regs;
   378		if (!readl(&cdns->otg_v0_regs->cmd)) {
   379			cdns->version  = CDNS3_CONTROLLER_V0;
   380			cdns->otg_v1_regs = NULL;
   381			cdns->otg_cdnsp_regs = NULL;
   382			cdns->otg_regs = regs;
   383			cdns->otg_irq_regs = (struct cdns3_otg_irq_regs *)
   384					     &cdns->otg_v0_regs->ien;
   385			writel(1, &cdns->otg_v0_regs->simulate);
   386			dev_dbg(cdns->dev, "DRD version v0 (%08x)\n",
   387				 readl(&cdns->otg_v0_regs->version));
   388		} else {
   389			cdns->otg_v0_regs = NULL;
   390			cdns->otg_v1_regs = regs;
 > 391			cdns->otg_cdnsp_regs = regs;
   392	
   393			cdns->otg_regs = (void *)&cdns->otg_v1_regs->cmd;
   394	
 > 395			if (cdns->otg_cdnsp_regs->did == OTG_CDNSP_DID) {
   396				cdns->otg_irq_regs = (struct cdns3_otg_irq_regs *)
   397						      &cdns->otg_cdnsp_regs->ien;
   398				cdns->version  = CDNSP_CONTROLLER_V2;
   399			} else {
   400				cdns->otg_irq_regs = (struct cdns3_otg_irq_regs *)
   401						      &cdns->otg_v1_regs->ien;
   402				writel(1, &cdns->otg_v1_regs->simulate);
   403				cdns->version  = CDNS3_CONTROLLER_V1;
   404			}
   405	
   406			dev_dbg(cdns->dev, "DRD version v1 (ID: %08x, rev: %08x)\n",
   407				 readl(&cdns->otg_v1_regs->did),
   408				 readl(&cdns->otg_v1_regs->rid));
   409		}
   410	
   411		state = OTGSTS_STRAP(readl(&cdns->otg_regs->sts));
   412	
   413		/* Update dr_mode according to STRAP configuration. */
   414		cdns->dr_mode = USB_DR_MODE_OTG;
   415	
   416		if ((cdns->version == CDNSP_CONTROLLER_V2 &&
   417		     state == OTGSTS_CDNSP_STRAP_HOST) ||
   418		    (cdns->version != CDNSP_CONTROLLER_V2 &&
   419		     state == OTGSTS_STRAP_HOST)) {
   420			dev_dbg(cdns->dev, "Controller strapped to HOST\n");
   421			cdns->dr_mode = USB_DR_MODE_HOST;
   422		} else if ((cdns->version == CDNSP_CONTROLLER_V2 &&
   423			    state == OTGSTS_CDNSP_STRAP_GADGET) ||
   424			   (cdns->version != CDNSP_CONTROLLER_V2 &&
   425			    state == OTGSTS_STRAP_GADGET)) {
   426			dev_dbg(cdns->dev, "Controller strapped to PERIPHERAL\n");
   427			cdns->dr_mode = USB_DR_MODE_PERIPHERAL;
   428		}
   429	
   430		ret = devm_request_threaded_irq(cdns->dev, cdns->otg_irq,
   431						cdns3_drd_irq,
   432						cdns3_drd_thread_irq,
   433						IRQF_SHARED,
   434						dev_name(cdns->dev), cdns);
   435		if (ret) {
   436			dev_err(cdns->dev, "couldn't get otg_irq\n");
   437			return ret;
   438		}
   439	
   440		state = readl(&cdns->otg_regs->sts);
   441		if (OTGSTS_OTG_NRDY(state)) {
   442			dev_err(cdns->dev, "Cadence USB3 OTG device not ready\n");
   443			return -ENODEV;
   444		}
   445	
   446		return 0;
   447	}
   448	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
