Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.14])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 926BE1CD3F
	for <oe-kbuild-all@lists.linux.dev>; Fri, 27 Sep 2024 14:45:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.14
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1727448351; cv=none; b=lfS4LYajVxx3uj5NBIZPVxNLLO25zaWfPIj3gNQ0hsLfPUSxXLqHTtRZXtWnIKRfPSQaqopQs+XqZoDZrwwhJAMEhoBobfRqY+KI/Aaql7tIrbwJPejKCGxhw6Bnf7utdDhCH816gHx2043NHNa1LQ9jn/UYJyW85x2iIGLjg34=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1727448351; c=relaxed/simple;
	bh=+9hpHhkOfixPRHyqAvEf3y8ZFTzw6WVUPAYmzRqog0k=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=VBGjShomz4JMM0jGrsg4VnlheCZvSa6g1vhdq9M4JHG1LaYwbW8jcOFc8w2gL5P9G3uqSnvqxrPRKTFQTGUFa/BdLFs93eijADxyKTQ9KyUAbyXzUqdsnlKp2tu9lNuNiAiPlO/SARacBps+T9/m9NIYYfR4hmVI7HktAJrfOn0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=T2ijILvw; arc=none smtp.client-ip=198.175.65.14
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="T2ijILvw"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1727448350; x=1758984350;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=+9hpHhkOfixPRHyqAvEf3y8ZFTzw6WVUPAYmzRqog0k=;
  b=T2ijILvwRvp42/8RYPRDfGaE6V8GQwXqEh3CTtf5iyWHv4zfJJChxR0U
   6XeAZpRhEW1tDcWaWWICgAETc7/3UV5PntmoTohgIDnMyfj7a7nCETetT
   AJIJyZNeZVy11/dkpzWIKFxOBTbGp0/xouKnWVxefI86GihcZ+orHsJZf
   N2T0byobJTVtv1UdI0QICmjsEwhn7tIHCYhoGdfvyJMX/53EwdXBkVwAx
   lt5fsO7WJbojMyBKpyrJv2pG8yd8xRmoBLoPJOM+x1aD1yReJpVaR8bSi
   fTFHDo56yq/EyYyUP1F/7yyV3NwTTfXbHD/kwOEMitd70q0YFtAr7QWh4
   g==;
X-CSE-ConnectionGUID: 6SM1solIQG2cL+c0P4taKw==
X-CSE-MsgGUID: hC3g9BTiR4ez6f/13dx2Tg==
X-IronPort-AV: E=McAfee;i="6700,10204,11208"; a="30383273"
X-IronPort-AV: E=Sophos;i="6.11,158,1725346800"; 
   d="scan'208";a="30383273"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
  by orvoesa106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 27 Sep 2024 07:45:29 -0700
X-CSE-ConnectionGUID: X2yUP3R8QBCRH2od6weKpg==
X-CSE-MsgGUID: UwniWodsR4miPxv8IrdrtQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.11,158,1725346800"; 
   d="scan'208";a="110047252"
Received: from lkp-server01.sh.intel.com (HELO 53e96f405c61) ([10.239.97.150])
  by orviesa001.jf.intel.com with ESMTP; 27 Sep 2024 07:45:27 -0700
Received: from kbuild by 53e96f405c61 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1suCDk-000MFq-0Q;
	Fri, 27 Sep 2024 14:45:24 +0000
Date: Fri, 27 Sep 2024 22:44:52 +0800
From: kernel test robot <lkp@intel.com>
To: Piyush Mehta <piyush.mehta@amd.com>
Cc: oe-kbuild-all@lists.linux.dev, git@amd.com,
	Michal Simek <monstr@monstr.eu>,
	Radhey Shyam Pandey <radhey.shyam.pandey@amd.com>
Subject: [xilinx-xlnx:xlnx_rebase_v6.6_LTS_2024.1_update 643/1001]
 drivers/usb/dwc3/core.c:2206:undefined reference to `ulpi_write'
Message-ID: <202409272253.VPiZg8cV-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://github.com/Xilinx/linux-xlnx xlnx_rebase_v6.6_LTS_2024.1_update
head:   5365c13a86998da06d845c918f849b30b8735538
commit: aca8761729017fb7d788d9c07e6c50b169b425f6 [643/1001] usb: dwc3: core: Add support for disabling vbus when suspended
config: xtensa-randconfig-002-20240927 (https://download.01.org/0day-ci/archive/20240927/202409272253.VPiZg8cV-lkp@intel.com/config)
compiler: xtensa-linux-gcc (GCC) 14.1.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240927/202409272253.VPiZg8cV-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202409272253.VPiZg8cV-lkp@intel.com/

All errors (new ones prefixed by >>):

   xtensa-linux-ld: section .text VMA [d0003000,d1b0d023] overlaps section .xiptext VMA [d0000928,d0005331]
   xtensa-linux-ld: drivers/usb/dwc3/core.o: in function `dwc3_remove':
>> drivers/usb/dwc3/core.c:2206:(.text+0x5e98): undefined reference to `ulpi_write'
   xtensa-linux-ld: drivers/usb/dwc3/core.o: in function `dwc3_suspend_common':
   drivers/usb/dwc3/core.c:2221:(.text+0x603e): undefined reference to `ulpi_write'
   xtensa-linux-ld: drivers/usb/dwc3/core.o: in function `dwc3_core_init_for_resume':
   drivers/usb/dwc3/core.c:2279:(.text+0x87e0): undefined reference to `ulpi_write'
   xtensa-linux-ld: drivers/usb/dwc3/core.o: in function `dwc3_resume_common':
   drivers/usb/dwc3/core.c:2305:(.text+0x89ce): undefined reference to `ulpi_write'


vim +2206 drivers/usb/dwc3/core.c

fe8abf332b8f66 Masahiro Yamada  2018-05-16  2205  
c4a5153e87fdf6 Manu Gautam      2018-01-18 @2206  static int dwc3_suspend_common(struct dwc3 *dwc, pm_message_t msg)
7415f17c9560c9 Felipe Balbi     2012-04-30  2207  {
fc8bb91bc83ef8 Felipe Balbi     2016-05-16  2208  	unsigned long	flags;
bcb128777af5e9 Manu Gautam      2018-05-09  2209  	u32 reg;
7415f17c9560c9 Felipe Balbi     2012-04-30  2210  
689bf72c6e0dc9 Manu Gautam      2017-09-27  2211  	switch (dwc->current_dr_role) {
689bf72c6e0dc9 Manu Gautam      2017-09-27  2212  	case DWC3_GCTL_PRTCAP_DEVICE:
0227cc84c44417 Li Jun           2020-02-20  2213  		if (pm_runtime_suspended(dwc->dev))
0227cc84c44417 Li Jun           2020-02-20  2214  			break;
7415f17c9560c9 Felipe Balbi     2012-04-30  2215  		dwc3_gadget_suspend(dwc);
41a91c606e7d2b Marek Szyprowski 2019-03-27  2216  		synchronize_irq(dwc->irq_gadget);
689bf72c6e0dc9 Manu Gautam      2017-09-27  2217  		dwc3_core_exit(dwc);
51f5d49ad6f011 Felipe Balbi     2016-05-16  2218  		break;
689bf72c6e0dc9 Manu Gautam      2017-09-27  2219  	case DWC3_GCTL_PRTCAP_HOST:
aca8761729017f Piyush Mehta     2023-12-12  2220  		if (!device_wakeup_path(dwc->dev) && dwc->ulpi)
aca8761729017f Piyush Mehta     2023-12-12  2221  			ulpi_write(dwc->ulpi, ULPI_OTG_CTRL_CLEAR,
aca8761729017f Piyush Mehta     2023-12-12  2222  				   OTG_CTRL_DRVVBUS_OFFSET);
aca8761729017f Piyush Mehta     2023-12-12  2223  
e3fafbd8e36530 Johan Hovold     2022-08-04  2224  		if (!PMSG_IS_AUTO(msg) && !device_may_wakeup(dwc->dev)) {
c4a5153e87fdf6 Manu Gautam      2018-01-18  2225  			dwc3_core_exit(dwc);
c4a5153e87fdf6 Manu Gautam      2018-01-18  2226  			break;
bcb128777af5e9 Manu Gautam      2018-05-09  2227  		}
bcb128777af5e9 Manu Gautam      2018-05-09  2228  
bcb128777af5e9 Manu Gautam      2018-05-09  2229  		/* Let controller to suspend HSPHY before PHY driver suspends */
bcb128777af5e9 Manu Gautam      2018-05-09  2230  		if (dwc->dis_u2_susphy_quirk ||
bcb128777af5e9 Manu Gautam      2018-05-09  2231  		    dwc->dis_enblslpm_quirk) {
bcb128777af5e9 Manu Gautam      2018-05-09  2232  			reg = dwc3_readl(dwc->regs, DWC3_GUSB2PHYCFG(0));
bcb128777af5e9 Manu Gautam      2018-05-09  2233  			reg |=  DWC3_GUSB2PHYCFG_ENBLSLPM |
bcb128777af5e9 Manu Gautam      2018-05-09  2234  				DWC3_GUSB2PHYCFG_SUSPHY;
bcb128777af5e9 Manu Gautam      2018-05-09  2235  			dwc3_writel(dwc->regs, DWC3_GUSB2PHYCFG(0), reg);
bcb128777af5e9 Manu Gautam      2018-05-09  2236  
bcb128777af5e9 Manu Gautam      2018-05-09  2237  			/* Give some time for USB2 PHY to suspend */
bcb128777af5e9 Manu Gautam      2018-05-09  2238  			usleep_range(5000, 6000);
bcb128777af5e9 Manu Gautam      2018-05-09  2239  		}
bcb128777af5e9 Manu Gautam      2018-05-09  2240  
bcb128777af5e9 Manu Gautam      2018-05-09  2241  		phy_pm_runtime_put_sync(dwc->usb2_generic_phy);
bcb128777af5e9 Manu Gautam      2018-05-09  2242  		phy_pm_runtime_put_sync(dwc->usb3_generic_phy);
bcb128777af5e9 Manu Gautam      2018-05-09  2243  		break;
f09cc79b4b338e Roger Quadros    2018-02-27  2244  	case DWC3_GCTL_PRTCAP_OTG:
f09cc79b4b338e Roger Quadros    2018-02-27  2245  		/* do nothing during runtime_suspend */
f09cc79b4b338e Roger Quadros    2018-02-27  2246  		if (PMSG_IS_AUTO(msg))
f09cc79b4b338e Roger Quadros    2018-02-27  2247  			break;
f09cc79b4b338e Roger Quadros    2018-02-27  2248  
f09cc79b4b338e Roger Quadros    2018-02-27  2249  		if (dwc->current_otg_role == DWC3_OTG_ROLE_DEVICE) {
f09cc79b4b338e Roger Quadros    2018-02-27  2250  			spin_lock_irqsave(&dwc->lock, flags);
f09cc79b4b338e Roger Quadros    2018-02-27  2251  			dwc3_gadget_suspend(dwc);
f09cc79b4b338e Roger Quadros    2018-02-27  2252  			spin_unlock_irqrestore(&dwc->lock, flags);
41a91c606e7d2b Marek Szyprowski 2019-03-27  2253  			synchronize_irq(dwc->irq_gadget);
f09cc79b4b338e Roger Quadros    2018-02-27  2254  		}
f09cc79b4b338e Roger Quadros    2018-02-27  2255  
f09cc79b4b338e Roger Quadros    2018-02-27  2256  		dwc3_otg_exit(dwc);
f09cc79b4b338e Roger Quadros    2018-02-27  2257  		dwc3_core_exit(dwc);
f09cc79b4b338e Roger Quadros    2018-02-27  2258  		break;
7415f17c9560c9 Felipe Balbi     2012-04-30  2259  	default:
51f5d49ad6f011 Felipe Balbi     2016-05-16  2260  		/* do nothing */
7415f17c9560c9 Felipe Balbi     2012-04-30  2261  		break;
7415f17c9560c9 Felipe Balbi     2012-04-30  2262  	}
7415f17c9560c9 Felipe Balbi     2012-04-30  2263  
2790ed87f0ae56 Manish Narani    2023-12-12  2264  	/* Put the core into D3 state */
2790ed87f0ae56 Manish Narani    2023-12-12  2265  	if (dwc->dwc3_pmu) {
2790ed87f0ae56 Manish Narani    2023-12-12  2266  		int ret;
2790ed87f0ae56 Manish Narani    2023-12-12  2267  
2790ed87f0ae56 Manish Narani    2023-12-12  2268  		ret = regulator_disable(dwc->dwc3_pmu);
2790ed87f0ae56 Manish Narani    2023-12-12  2269  		if (ret) {
2790ed87f0ae56 Manish Narani    2023-12-12  2270  			dev_err(dwc->dev,
2790ed87f0ae56 Manish Narani    2023-12-12  2271  				"Failed to disable dwc3_pmu supply\n");
2790ed87f0ae56 Manish Narani    2023-12-12  2272  			return ret;
2790ed87f0ae56 Manish Narani    2023-12-12  2273  		}
2790ed87f0ae56 Manish Narani    2023-12-12  2274  	}
2790ed87f0ae56 Manish Narani    2023-12-12  2275  
7415f17c9560c9 Felipe Balbi     2012-04-30  2276  	return 0;
7415f17c9560c9 Felipe Balbi     2012-04-30  2277  }
7415f17c9560c9 Felipe Balbi     2012-04-30  2278  

:::::: The code at line 2206 was first introduced by commit
:::::: c4a5153e87fdf6805f63ff57556260e2554155a5 usb: dwc3: core: Power-off core/PHYs on system_suspend in host mode

:::::: TO: Manu Gautam <mgautam@codeaurora.org>
:::::: CC: Felipe Balbi <felipe.balbi@linux.intel.com>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
