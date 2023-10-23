Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.126])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EEF6F1BDCF
	for <oe-kbuild-all@lists.linux.dev>; Mon, 23 Oct 2023 20:23:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="YwPKv1B8"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1698092596; x=1729628596;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=A9ZSPItAKvTLIVEad+ZO9uOp8RPDEFrpCEelH7yBDaA=;
  b=YwPKv1B8H8zxWNXIGFD/STLFv6EQr3sNUKbEiblI5lRHEB9SERY62EkX
   PVqXy751n+HRne86FhFGZ0qIzOs5Fx0ubK1hVYDJGohLkx30Bf/iDWGqY
   Zdp3790LbFEXW+6lDMVZ41ASuL8woAYOHA1iysx4UYDU4mHteZ4U1v6gH
   CtvmUSoU9XpOUZYT1b3BmROxNfWRir9d1WJGpG5d7XzI/it07FG7W9hyx
   0NqW1eurvrRjnUBLov0T/ETpemNhoFqmPQpiLEKiYKkLBSd/mnjPlba52
   TZSI+/IPQiw50aLiJckaWvcLEsXH8YJy8yEdiI206359B+5cCShZLLco5
   g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10872"; a="371989653"
X-IronPort-AV: E=Sophos;i="6.03,246,1694761200"; 
   d="scan'208";a="371989653"
Received: from orsmga003.jf.intel.com ([10.7.209.27])
  by orsmga106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 23 Oct 2023 13:23:16 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10872"; a="708040870"
X-IronPort-AV: E=Sophos;i="6.03,246,1694761200"; 
   d="scan'208";a="708040870"
Received: from lkp-server01.sh.intel.com (HELO 8917679a5d3e) ([10.239.97.150])
  by orsmga003.jf.intel.com with ESMTP; 23 Oct 2023 13:23:14 -0700
Received: from kbuild by 8917679a5d3e with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1qv1SC-0007Fl-1E;
	Mon, 23 Oct 2023 20:23:12 +0000
Date: Tue, 24 Oct 2023 04:22:38 +0800
From: kernel test robot <lkp@intel.com>
To: Otavio Salvador <otavio@ossystems.com.br>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [freescale-fslc:pr/642 136/30000] drivers/usb/cdns3/core.c:661:46:
 sparse: sparse: incorrect type in argument 1 (different address spaces)
Message-ID: <202310240402.Exb8upfH-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://github.com/Freescale/linux-fslc pr/642
head:   c8b7cf62c7fea8456dec789d550b8006d73b8f04
commit: 7692d3bf1f316d49478b9796e22244bece63db25 [136/30000] MLK-16976-4 usb: cdns3: add power management support
config: i386-randconfig-063-20231021 (https://download.01.org/0day-ci/archive/20231024/202310240402.Exb8upfH-lkp@intel.com/config)
compiler: gcc-12 (Debian 12.2.0-14) 12.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20231024/202310240402.Exb8upfH-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202310240402.Exb8upfH-lkp@intel.com/

sparse warnings: (new ones prefixed by >>)
>> drivers/usb/cdns3/core.c:661:46: sparse: sparse: incorrect type in argument 1 (different address spaces) @@     expected void const volatile [noderef] <asn:2> *addr @@     got void * @@
   drivers/usb/cdns3/core.c:661:46: sparse:     expected void const volatile [noderef] <asn:2> *addr
   drivers/usb/cdns3/core.c:661:46: sparse:     got void *
>> drivers/usb/cdns3/core.c:663:46: sparse: sparse: incorrect type in argument 2 (different address spaces) @@     expected void volatile [noderef] <asn:2> *addr @@     got void * @@
   drivers/usb/cdns3/core.c:663:46: sparse:     expected void volatile [noderef] <asn:2> *addr
   drivers/usb/cdns3/core.c:663:46: sparse:     got void *
   drivers/usb/cdns3/core.c:666:46: sparse: sparse: incorrect type in argument 1 (different address spaces) @@     expected void const volatile [noderef] <asn:2> *addr @@     got void * @@
   drivers/usb/cdns3/core.c:666:46: sparse:     expected void const volatile [noderef] <asn:2> *addr
   drivers/usb/cdns3/core.c:666:46: sparse:     got void *
   drivers/usb/cdns3/core.c:668:46: sparse: sparse: incorrect type in argument 2 (different address spaces) @@     expected void volatile [noderef] <asn:2> *addr @@     got void * @@
   drivers/usb/cdns3/core.c:668:46: sparse:     expected void volatile [noderef] <asn:2> *addr
   drivers/usb/cdns3/core.c:668:46: sparse:     got void *
>> drivers/usb/cdns3/core.c:757:34: sparse: sparse: incorrect type in argument 1 (different address spaces) @@     expected void *none_core_regs @@     got void [noderef] <asn:2> *none_core_regs @@
   drivers/usb/cdns3/core.c:757:34: sparse:     expected void *none_core_regs
   drivers/usb/cdns3/core.c:757:34: sparse:     got void [noderef] <asn:2> *none_core_regs
   drivers/usb/cdns3/core.c:767:34: sparse: sparse: incorrect type in argument 1 (different address spaces) @@     expected void *none_core_regs @@     got void [noderef] <asn:2> *none_core_regs @@
   drivers/usb/cdns3/core.c:767:34: sparse:     expected void *none_core_regs
   drivers/usb/cdns3/core.c:767:34: sparse:     got void [noderef] <asn:2> *none_core_regs

vim +661 drivers/usb/cdns3/core.c

   654	
   655	static void cdns3_set_wakeup(void *none_core_regs, bool enable)
   656	{
   657		u32 value;
   658	
   659		if (enable) {
   660			/* Enable wakeup and phy_refclk_req */
 > 661			value = readl(none_core_regs + USB3_INT_REG);
   662			value |= OTG_WAKEUP_EN | DEVU3_WAEKUP_EN;
 > 663			writel(value, none_core_regs + USB3_INT_REG);
   664		} else {
   665			/* disable wakeup and phy_refclk_req */
   666			value = readl(none_core_regs + USB3_INT_REG);
   667			value &= ~(OTG_WAKEUP_EN | DEVU3_WAEKUP_EN);
   668			writel(value, none_core_regs + USB3_INT_REG);
   669		}
   670	}
   671	
   672	static void cdns3_enter_suspend(struct cdns3 *cdns, bool suspend, bool wakeup)
   673	{
   674		void __iomem *otg_regs = cdns->otg_regs;
   675		void __iomem *xhci_regs = cdns->xhci_regs;
   676		void __iomem *phy_regs = cdns->phy_regs;
   677		void __iomem *none_core_regs = cdns->none_core_regs;
   678		u32 value;
   679		int timeout_us = 100000;
   680	
   681		if (cdns->role != CDNS3_ROLE_HOST)
   682			return;
   683	
   684		if (suspend) {
   685			value = readl(otg_regs + OTGREFCLK);
   686			value |= OTG_STB_CLK_SWITCH_EN;
   687			writel(value, otg_regs + OTGREFCLK);
   688	
   689			value = readl(xhci_regs + XECP_PORT_CAP_REG);
   690			value |= LPM_2_STB_SWITCH_EN;
   691			writel(value, xhci_regs + XECP_PORT_CAP_REG);
   692			if (cdns3_role(cdns)->suspend)
   693				cdns3_role(cdns)->suspend(cdns, wakeup);
   694	
   695			/* RXDET_IN_P3_32KHZ, Receiver detect slow clock enable */
   696			value = readl(phy_regs + TB_ADDR_TX_RCVDETSC_CTRL);
   697			value |= RXDET_IN_P3_32KHZ;
   698			writel(value, phy_regs + TB_ADDR_TX_RCVDETSC_CTRL);
   699			/*
   700			 * SW should ensure LPM_2_STB_SWITCH_EN and RXDET_IN_P3_32KHZ
   701			 * are aligned before setting CFG_RXDET_P3_EN
   702			 */
   703			value = readl(xhci_regs + XECP_AUX_CTRL_REG1);
   704			value |= CFG_RXDET_P3_EN;
   705			writel(value, xhci_regs + XECP_AUX_CTRL_REG1);
   706			/* SW request low power when all usb ports allow to it ??? */
   707			value = readl(xhci_regs + XECP_PM_PMCSR);
   708			value |= PS_D0;
   709			writel(value, xhci_regs + XECP_PM_PMCSR);
   710	
   711			/* mdctrl_clk_sel */
   712			value = readl(none_core_regs + USB3_CORE_CTRL1);
   713			value |= MDCTRL_CLK_SEL;
   714			writel(value, none_core_regs + USB3_CORE_CTRL1);
   715	
   716			/* wait for mdctrl_clk_status */
   717			value = readl(none_core_regs + USB3_CORE_STATUS);
   718			while (!(value & MDCTRL_CLK_STATUS) && timeout_us-- > 0) {
   719				value = readl(none_core_regs + USB3_CORE_STATUS);
   720				udelay(1);
   721			}
   722	
   723			if (timeout_us <= 0)
   724				dev_err(cdns->dev, "wait mdctrl_clk_status timeout\n");
   725	
   726			dev_dbg(cdns->dev, "mdctrl_clk_status is set\n");
   727	
   728			/* wait lpm_clk_req to be 0 */
   729			value = readl(none_core_regs + USB3_INT_REG);
   730			timeout_us = 100000;
   731			while ((value & LPM_CLK_REQ) && timeout_us-- > 0) {
   732				value = readl(none_core_regs + USB3_INT_REG);
   733				udelay(1);
   734			}
   735	
   736			if (timeout_us <= 0)
   737				dev_err(cdns->dev, "wait lpm_clk_req timeout\n");
   738	
   739			dev_dbg(cdns->dev, "lpm_clk_req cleared\n");
   740	
   741			/* wait phy_refclk_req to be 0 */
   742			value = readl(none_core_regs + USB3_SSPHY_STATUS);
   743			timeout_us = 100000;
   744			while ((value & PHY_REFCLK_REQ) && timeout_us-- > 0) {
   745				value = readl(none_core_regs + USB3_SSPHY_STATUS);
   746				udelay(1);
   747			}
   748	
   749			if (timeout_us <= 0)
   750				dev_err(cdns->dev, "wait phy_refclk_req timeout\n");
   751	
   752			dev_dbg(cdns->dev, "phy_refclk_req cleared\n");
   753	
   754			/* rxdet fix in P3, default is 0x5098 */
   755			writel(0x509b, phy_regs + TB_ADDR_TX_PSC_A3);
   756	
 > 757			cdns3_set_wakeup(none_core_regs, true);
   758		} else {
   759			value = readl(none_core_regs + USB3_INT_REG);
   760			/* wait CLK_125_REQ to be 1 */
   761			value = readl(none_core_regs + USB3_INT_REG);
   762			while (!(value & CLK_125_REQ) && timeout_us-- > 0) {
   763				value = readl(none_core_regs + USB3_INT_REG);
   764				udelay(1);
   765			}
   766	
   767			cdns3_set_wakeup(none_core_regs, false);
   768	
   769			/* SW request D0 */
   770			value = readl(xhci_regs + XECP_PM_PMCSR);
   771			value &= ~PS_D0;
   772			writel(value, xhci_regs + XECP_PM_PMCSR);
   773	
   774			/* clr CFG_RXDET_P3_EN */
   775			value = readl(xhci_regs + XECP_AUX_CTRL_REG1);
   776			value &= ~CFG_RXDET_P3_EN;
   777			writel(value, xhci_regs + XECP_AUX_CTRL_REG1);
   778	
   779			/* clear RXDET_IN_P3_32KHZ */
   780			value = readl(phy_regs + TB_ADDR_TX_RCVDETSC_CTRL);
   781			value &= ~RXDET_IN_P3_32KHZ;
   782			writel(value, phy_regs + TB_ADDR_TX_RCVDETSC_CTRL);
   783	
   784			/* clear mdctrl_clk_sel */
   785			value = readl(none_core_regs + USB3_CORE_CTRL1);
   786			value &= ~MDCTRL_CLK_SEL;
   787			writel(value, none_core_regs + USB3_CORE_CTRL1);
   788	
   789			/* wait for mdctrl_clk_status is cleared */
   790			value = readl(none_core_regs + USB3_CORE_STATUS);
   791			timeout_us = 100000;
   792			while ((value & MDCTRL_CLK_STATUS) && timeout_us-- > 0) {
   793				value = readl(none_core_regs + USB3_CORE_STATUS);
   794				udelay(1);
   795			}
   796	
   797			if (timeout_us <= 0)
   798				dev_err(cdns->dev, "wait mdctrl_clk_status timeout\n");
   799	
   800			dev_dbg(cdns->dev, "mdctrl_clk_status cleared\n");
   801	
   802			writel(0x5098, phy_regs + TB_ADDR_TX_PSC_A3);
   803	
   804			/* Wait until OTG_NRDY is 0 */
   805			value = readl(otg_regs + OTGSTS);
   806			timeout_us = 100000;
   807			while ((value & OTG_NRDY) && timeout_us-- > 0) {
   808				value = readl(otg_regs + OTGSTS);
   809				udelay(1);
   810			}
   811	
   812			if (timeout_us <= 0)
   813				dev_err(cdns->dev, "wait OTG ready timeout\n");
   814	
   815			value = readl(none_core_regs + USB3_CORE_STATUS);
   816			timeout_us = 100000;
   817			while (!(value & HOST_POWER_ON_READY) && timeout_us-- > 0) {
   818				value = readl(none_core_regs + USB3_CORE_STATUS);
   819				udelay(1);
   820			}
   821	
   822			if (timeout_us <= 0)
   823				dev_err(cdns->dev, "wait xhci_power_on_ready timeout\n");
   824		}
   825	}
   826	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
