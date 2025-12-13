Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.14])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D7E2B3C465
	for <oe-kbuild-all@lists.linux.dev>; Sat, 13 Dec 2025 03:57:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.14
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1765598280; cv=none; b=ONmWept2jM9W80hKbVoV54uLfU/tdLfZUHoSDRvPRXomtwlKEUXN5pu8/ireAEMYft6zlgzHBsqOQEdEnWti75rn8eaZn55oGJR1gSHVYPPOJEKBaF9Du/Ivq1BLEoTGkD1kr7LtfcF3ippkZOq8g9QxPFZhiV1h3aUOQQC56DU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1765598280; c=relaxed/simple;
	bh=88MjMjjM1Li2PkdWPfBVMw6OluhHcGEDb09s9KNxQFA=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=F2Vtk68U3DAzs7DIrnw7Ga10EAIbijcAdN+AgOGUfpyGp98NfmgOWwuECLnOYo+qq8X4LjGD04hMEF3vPrqLjaMBvXsLzZLC6GBqdQ7/HVWubgZAL36pabypHuMoqSVWC/lIUOBmWl94AiszLukwMSxgVxyi1x6Sl+rqLGKGtR8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=EoLw8NwV; arc=none smtp.client-ip=198.175.65.14
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="EoLw8NwV"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1765598278; x=1797134278;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=88MjMjjM1Li2PkdWPfBVMw6OluhHcGEDb09s9KNxQFA=;
  b=EoLw8NwVPZPskW2oCqNiDlqYC/YNG28WEXdDbec3sS8fyfjYBV8dZX/M
   1jRZA2JbIvE0et0URuv7SouDB0FuHHEkrrIGnBSeLn4Q6KJmajU7Y3G+k
   Ml5Jt5om10SO9WorO9/uhuAdPT2lZkRuL/xeUIyy/RfecpUO98Q+WD1YB
   WJ+y8mznGxLouBdjnIduLlNXIi8vUrNPUsyOxeqvSJGyWhGsQFQggDZdB
   adV/on5puE9oUuagvY1a5JNbitxFJse5VYgYL+dLAmqetJXLWWzDiKwMx
   Lr6kxXYzkuuitNQzCtIehV6O0QHdjZv0iQ4uh+FAjUdA55oaMEnebLnU4
   g==;
X-CSE-ConnectionGUID: YiWQbsZpQe6qFfWJtoFDcQ==
X-CSE-MsgGUID: a8Y0RrC5RvOI7LrFDUpqVQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11640"; a="71456620"
X-IronPort-AV: E=Sophos;i="6.21,145,1763452800"; 
   d="scan'208";a="71456620"
Received: from orviesa003.jf.intel.com ([10.64.159.143])
  by orvoesa106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 12 Dec 2025 19:57:57 -0800
X-CSE-ConnectionGUID: 5d8+9CJ2TbiWy8ui3sk6yQ==
X-CSE-MsgGUID: gX6Tp7k4RwWzy7jaLJDqEg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,145,1763452800"; 
   d="scan'208";a="201429324"
Received: from lkp-server01.sh.intel.com (HELO d335e3c6db51) ([10.239.97.150])
  by orviesa003.jf.intel.com with ESMTP; 12 Dec 2025 19:57:57 -0800
Received: from kbuild by d335e3c6db51 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vUGlV-0000000071D-4BnZ;
	Sat, 13 Dec 2025 03:57:53 +0000
Date: Sat, 13 Dec 2025 11:57:46 +0800
From: kernel test robot <lkp@intel.com>
To: cros-kernel-buildreports@googlegroups.com
Cc: oe-kbuild-all@lists.linux.dev
Subject: [android-common:android15-6.6 0/2] drivers/usb/dwc2/core_intr.c:327:
 warning: Function parameter or member 'remotewakeup' not described in
 'dwc2_wakeup_from_lpm_l1'
Message-ID: <202512131134.OcPh2QVP-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://android.googlesource.com/kernel/common android15-6.6
head:   5580efd2c7e4791254a0c26f9791aaa33dd70484
commit: 3e417f31b06aa43e74ce44c99e949b50fb53c025 [0/2] usb: dwc2: gadget: LPM flow fix
config: i386-randconfig-011-20251213 (https://download.01.org/0day-ci/archive/20251213/202512131134.OcPh2QVP-lkp@intel.com/config)
compiler: gcc-14 (Debian 14.2.0-19) 14.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20251213/202512131134.OcPh2QVP-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202512131134.OcPh2QVP-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> drivers/usb/dwc2/core_intr.c:327: warning: Function parameter or member 'remotewakeup' not described in 'dwc2_wakeup_from_lpm_l1'


vim +327 drivers/usb/dwc2/core_intr.c

56f5b1cff22a1d drivers/staging/dwc2/core_intr.c Paul Zimmerman    2013-03-11  319  
273d576c4d41d0 drivers/usb/dwc2/core_intr.c     Sevak Arakelyan   2018-01-24  320  /**
273d576c4d41d0 drivers/usb/dwc2/core_intr.c     Sevak Arakelyan   2018-01-24  321   * dwc2_wakeup_from_lpm_l1 - Exit the device from LPM L1 state
273d576c4d41d0 drivers/usb/dwc2/core_intr.c     Sevak Arakelyan   2018-01-24  322   *
273d576c4d41d0 drivers/usb/dwc2/core_intr.c     Sevak Arakelyan   2018-01-24  323   * @hsotg: Programming view of DWC_otg controller
273d576c4d41d0 drivers/usb/dwc2/core_intr.c     Sevak Arakelyan   2018-01-24  324   *
273d576c4d41d0 drivers/usb/dwc2/core_intr.c     Sevak Arakelyan   2018-01-24  325   */
3e417f31b06aa4 drivers/usb/dwc2/core_intr.c     Minas Harutyunyan 2024-03-13  326  void dwc2_wakeup_from_lpm_l1(struct dwc2_hsotg *hsotg, bool remotewakeup)
273d576c4d41d0 drivers/usb/dwc2/core_intr.c     Sevak Arakelyan   2018-01-24 @327  {
273d576c4d41d0 drivers/usb/dwc2/core_intr.c     Sevak Arakelyan   2018-01-24  328  	u32 glpmcfg;
3e417f31b06aa4 drivers/usb/dwc2/core_intr.c     Minas Harutyunyan 2024-03-13  329  	u32 pcgctl;
3e417f31b06aa4 drivers/usb/dwc2/core_intr.c     Minas Harutyunyan 2024-03-13  330  	u32 dctl;
273d576c4d41d0 drivers/usb/dwc2/core_intr.c     Sevak Arakelyan   2018-01-24  331  
273d576c4d41d0 drivers/usb/dwc2/core_intr.c     Sevak Arakelyan   2018-01-24  332  	if (hsotg->lx_state != DWC2_L1) {
273d576c4d41d0 drivers/usb/dwc2/core_intr.c     Sevak Arakelyan   2018-01-24  333  		dev_err(hsotg->dev, "Core isn't in DWC2_L1 state\n");
273d576c4d41d0 drivers/usb/dwc2/core_intr.c     Sevak Arakelyan   2018-01-24  334  		return;
273d576c4d41d0 drivers/usb/dwc2/core_intr.c     Sevak Arakelyan   2018-01-24  335  	}
273d576c4d41d0 drivers/usb/dwc2/core_intr.c     Sevak Arakelyan   2018-01-24  336  
f25c42b8d604fb drivers/usb/dwc2/core_intr.c     Gevorg Sahakyan   2018-07-26  337  	glpmcfg = dwc2_readl(hsotg, GLPMCFG);
273d576c4d41d0 drivers/usb/dwc2/core_intr.c     Sevak Arakelyan   2018-01-24  338  	if (dwc2_is_device_mode(hsotg)) {
3e417f31b06aa4 drivers/usb/dwc2/core_intr.c     Minas Harutyunyan 2024-03-13  339  		dev_dbg(hsotg->dev, "Exit from L1 state, remotewakeup=%d\n", remotewakeup);
273d576c4d41d0 drivers/usb/dwc2/core_intr.c     Sevak Arakelyan   2018-01-24  340  		glpmcfg &= ~GLPMCFG_ENBLSLPM;
3e417f31b06aa4 drivers/usb/dwc2/core_intr.c     Minas Harutyunyan 2024-03-13  341  		glpmcfg &= ~GLPMCFG_HIRD_THRES_MASK;
f25c42b8d604fb drivers/usb/dwc2/core_intr.c     Gevorg Sahakyan   2018-07-26  342  		dwc2_writel(hsotg, glpmcfg, GLPMCFG);
273d576c4d41d0 drivers/usb/dwc2/core_intr.c     Sevak Arakelyan   2018-01-24  343  
3e417f31b06aa4 drivers/usb/dwc2/core_intr.c     Minas Harutyunyan 2024-03-13  344  		pcgctl = dwc2_readl(hsotg, PCGCTL);
3e417f31b06aa4 drivers/usb/dwc2/core_intr.c     Minas Harutyunyan 2024-03-13  345  		pcgctl &= ~PCGCTL_ENBL_SLEEP_GATING;
3e417f31b06aa4 drivers/usb/dwc2/core_intr.c     Minas Harutyunyan 2024-03-13  346  		dwc2_writel(hsotg, pcgctl, PCGCTL);
3e417f31b06aa4 drivers/usb/dwc2/core_intr.c     Minas Harutyunyan 2024-03-13  347  
f25c42b8d604fb drivers/usb/dwc2/core_intr.c     Gevorg Sahakyan   2018-07-26  348  		glpmcfg = dwc2_readl(hsotg, GLPMCFG);
3e417f31b06aa4 drivers/usb/dwc2/core_intr.c     Minas Harutyunyan 2024-03-13  349  		if (glpmcfg & GLPMCFG_ENBESL) {
3e417f31b06aa4 drivers/usb/dwc2/core_intr.c     Minas Harutyunyan 2024-03-13  350  			glpmcfg |= GLPMCFG_RSTRSLPSTS;
3e417f31b06aa4 drivers/usb/dwc2/core_intr.c     Minas Harutyunyan 2024-03-13  351  			dwc2_writel(hsotg, glpmcfg, GLPMCFG);
3e417f31b06aa4 drivers/usb/dwc2/core_intr.c     Minas Harutyunyan 2024-03-13  352  		}
273d576c4d41d0 drivers/usb/dwc2/core_intr.c     Sevak Arakelyan   2018-01-24  353  
3e417f31b06aa4 drivers/usb/dwc2/core_intr.c     Minas Harutyunyan 2024-03-13  354  		if (remotewakeup) {
3e417f31b06aa4 drivers/usb/dwc2/core_intr.c     Minas Harutyunyan 2024-03-13  355  			if (dwc2_hsotg_wait_bit_set(hsotg, GLPMCFG, GLPMCFG_L1RESUMEOK, 1000)) {
3e417f31b06aa4 drivers/usb/dwc2/core_intr.c     Minas Harutyunyan 2024-03-13  356  				dev_warn(hsotg->dev, "%s: timeout GLPMCFG_L1RESUMEOK\n", __func__);
3e417f31b06aa4 drivers/usb/dwc2/core_intr.c     Minas Harutyunyan 2024-03-13  357  				goto fail;
3e417f31b06aa4 drivers/usb/dwc2/core_intr.c     Minas Harutyunyan 2024-03-13  358  				return;
3e417f31b06aa4 drivers/usb/dwc2/core_intr.c     Minas Harutyunyan 2024-03-13  359  			}
273d576c4d41d0 drivers/usb/dwc2/core_intr.c     Sevak Arakelyan   2018-01-24  360  
3e417f31b06aa4 drivers/usb/dwc2/core_intr.c     Minas Harutyunyan 2024-03-13  361  			dctl = dwc2_readl(hsotg, DCTL);
3e417f31b06aa4 drivers/usb/dwc2/core_intr.c     Minas Harutyunyan 2024-03-13  362  			dctl |= DCTL_RMTWKUPSIG;
3e417f31b06aa4 drivers/usb/dwc2/core_intr.c     Minas Harutyunyan 2024-03-13  363  			dwc2_writel(hsotg, dctl, DCTL);
273d576c4d41d0 drivers/usb/dwc2/core_intr.c     Sevak Arakelyan   2018-01-24  364  
3e417f31b06aa4 drivers/usb/dwc2/core_intr.c     Minas Harutyunyan 2024-03-13  365  			if (dwc2_hsotg_wait_bit_set(hsotg, GINTSTS, GINTSTS_WKUPINT, 1000)) {
3e417f31b06aa4 drivers/usb/dwc2/core_intr.c     Minas Harutyunyan 2024-03-13  366  				dev_warn(hsotg->dev, "%s: timeout GINTSTS_WKUPINT\n", __func__);
3e417f31b06aa4 drivers/usb/dwc2/core_intr.c     Minas Harutyunyan 2024-03-13  367  				goto fail;
273d576c4d41d0 drivers/usb/dwc2/core_intr.c     Sevak Arakelyan   2018-01-24  368  				return;
273d576c4d41d0 drivers/usb/dwc2/core_intr.c     Sevak Arakelyan   2018-01-24  369  			}
273d576c4d41d0 drivers/usb/dwc2/core_intr.c     Sevak Arakelyan   2018-01-24  370  		}
273d576c4d41d0 drivers/usb/dwc2/core_intr.c     Sevak Arakelyan   2018-01-24  371  
3e417f31b06aa4 drivers/usb/dwc2/core_intr.c     Minas Harutyunyan 2024-03-13  372  		glpmcfg = dwc2_readl(hsotg, GLPMCFG);
3e417f31b06aa4 drivers/usb/dwc2/core_intr.c     Minas Harutyunyan 2024-03-13  373  		if (glpmcfg & GLPMCFG_COREL1RES_MASK || glpmcfg & GLPMCFG_SLPSTS ||
3e417f31b06aa4 drivers/usb/dwc2/core_intr.c     Minas Harutyunyan 2024-03-13  374  		    glpmcfg & GLPMCFG_L1RESUMEOK) {
3e417f31b06aa4 drivers/usb/dwc2/core_intr.c     Minas Harutyunyan 2024-03-13  375  			goto fail;
3e417f31b06aa4 drivers/usb/dwc2/core_intr.c     Minas Harutyunyan 2024-03-13  376  			return;
3e417f31b06aa4 drivers/usb/dwc2/core_intr.c     Minas Harutyunyan 2024-03-13  377  		}
c655557c12ded7 drivers/usb/dwc2/core_intr.c     Grigor Tovmasyan  2018-01-24  378  
c655557c12ded7 drivers/usb/dwc2/core_intr.c     Grigor Tovmasyan  2018-01-24  379  		/* Inform gadget to exit from L1 */
c655557c12ded7 drivers/usb/dwc2/core_intr.c     Grigor Tovmasyan  2018-01-24  380  		call_gadget(hsotg, resume);
3e417f31b06aa4 drivers/usb/dwc2/core_intr.c     Minas Harutyunyan 2024-03-13  381  		/* Change to L0 state */
3e417f31b06aa4 drivers/usb/dwc2/core_intr.c     Minas Harutyunyan 2024-03-13  382  		hsotg->lx_state = DWC2_L0;
3e417f31b06aa4 drivers/usb/dwc2/core_intr.c     Minas Harutyunyan 2024-03-13  383  		hsotg->bus_suspended = false;
3e417f31b06aa4 drivers/usb/dwc2/core_intr.c     Minas Harutyunyan 2024-03-13  384  fail:		dwc2_gadget_init_lpm(hsotg);
3e417f31b06aa4 drivers/usb/dwc2/core_intr.c     Minas Harutyunyan 2024-03-13  385  	} else {
3e417f31b06aa4 drivers/usb/dwc2/core_intr.c     Minas Harutyunyan 2024-03-13  386  		/* TODO */
3e417f31b06aa4 drivers/usb/dwc2/core_intr.c     Minas Harutyunyan 2024-03-13  387  		dev_err(hsotg->dev, "Host side LPM is not supported.\n");
3e417f31b06aa4 drivers/usb/dwc2/core_intr.c     Minas Harutyunyan 2024-03-13  388  		return;
3e417f31b06aa4 drivers/usb/dwc2/core_intr.c     Minas Harutyunyan 2024-03-13  389  	}
273d576c4d41d0 drivers/usb/dwc2/core_intr.c     Sevak Arakelyan   2018-01-24  390  }
273d576c4d41d0 drivers/usb/dwc2/core_intr.c     Sevak Arakelyan   2018-01-24  391  

:::::: The code at line 327 was first introduced by commit
:::::: 273d576c4d41d0577551176040c9c78d30c0cf16 usb: dwc2: gadget: Add functionality to exit from LPM L1 state

:::::: TO: Sevak Arakelyan <sevaka@synopsys.com>
:::::: CC: Felipe Balbi <felipe.balbi@linux.intel.com>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
