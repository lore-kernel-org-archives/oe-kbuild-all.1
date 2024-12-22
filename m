Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5254F1922E8
	for <oe-kbuild-all@lists.linux.dev>; Sun, 22 Dec 2024 18:45:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.19
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1734893113; cv=none; b=XkMpe5Ykmj+aC29cZ3+J4Op3hUSq+YvFf6tLk9saMXurbgYMsDyFjKWvKRDzKCmCOf5wCbmVE2g7R1vo/mvjezB+VEgj1n/Ps162+10AoXoPUBF5YgJFAC8+gShrbyRULeM67XmeyJIVZYd4lF6d3eNVOF87FH+jghXkH4f+Jq4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1734893113; c=relaxed/simple;
	bh=NUivj7MSDFOAJpnrA8SIrEAbVzg4a1pXgJyCCYAtuGQ=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=o6LrdH+S91djBL44QSuzcnJxuuB9vZq/Z1E6XKQKD5ekv4jfz/5LA8IjrojNSFOQunHDlo1QuXBP2zG/xbBMyRxOjPHSS0gxXSFRRS1Vm5joyfwCtuFkmAB0dwmfa0lDsNaWbTkameofoesSshNpJXEJ0RZzd+067OpGPelKXZI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=RYAKxwbu; arc=none smtp.client-ip=198.175.65.19
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="RYAKxwbu"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1734893111; x=1766429111;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=NUivj7MSDFOAJpnrA8SIrEAbVzg4a1pXgJyCCYAtuGQ=;
  b=RYAKxwbuVu+p/ZZznMiium+NtHqei4Ax8TdLeL7CzCZ8tqnB3kdSOr5l
   NanXHnD3+O1IzXWw/RK/1d236pPhh5fL5j1l+d+mCNheRLePYpwi2fkmj
   tlBxYEZHD3oeXgrWyrGGy/YVySLlcCnuJnI9LnMzCJT9LAWhjKS9aCpPY
   mSYZ8krptSHzC4J2GNWZnY3jhihdmOULU7Lra/ZnBPx279qQQXOd1BiKN
   ffxD/WRb3b7CqjqoTXFostPJRTkJSJU4nrCbnytPJWizWVgseTvq5kwka
   OsB57VKDXIm1FXjhX1emgt7eE2Y4dTK6waxOwCIiyb+pddPypW5IAtjIX
   w==;
X-CSE-ConnectionGUID: lUnrizwZS1yh7FMcybP1lw==
X-CSE-MsgGUID: RI0OC41IRLGT5kSADWwckA==
X-IronPort-AV: E=McAfee;i="6700,10204,11294"; a="35251743"
X-IronPort-AV: E=Sophos;i="6.12,256,1728975600"; 
   d="scan'208";a="35251743"
Received: from orviesa008.jf.intel.com ([10.64.159.148])
  by orvoesa111.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 22 Dec 2024 10:45:11 -0800
X-CSE-ConnectionGUID: rv8SEJRKS2mnIgeMt8U6jw==
X-CSE-MsgGUID: zpEWcuPCRbyYksPBgjzysA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,224,1728975600"; 
   d="scan'208";a="99864457"
Received: from lkp-server01.sh.intel.com (HELO a46f226878e0) ([10.239.97.150])
  by orviesa008.jf.intel.com with ESMTP; 22 Dec 2024 10:45:09 -0800
Received: from kbuild by a46f226878e0 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1tPQwt-00036Z-1U;
	Sun, 22 Dec 2024 18:45:07 +0000
Date: Mon, 23 Dec 2024 02:44:15 +0800
From: kernel test robot <lkp@intel.com>
To: Minas Harutyunyan <Minas.Harutyunyan@synopsys.com>
Cc: oe-kbuild-all@lists.linux.dev, linux-kernel@vger.kernel.org
Subject: drivers/usb/dwc2/core_intr.c:327: warning: Function parameter or
 struct member 'remotewakeup' not described in 'dwc2_wakeup_from_lpm_l1'
Message-ID: <202412230222.HhQkzBih-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hi Minas,

FYI, the error/warning still remains.

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git master
head:   48f506ad0b683d3e7e794efa60c5785c4fdc86fa
commit: 5d69a3b54e5a630c90d82a4c2bdce3d53dc78710 usb: dwc2: gadget: LPM flow fix
date:   9 months ago
config: nios2-randconfig-001-20241220 (https://download.01.org/0day-ci/archive/20241223/202412230222.HhQkzBih-lkp@intel.com/config)
compiler: nios2-linux-gcc (GCC) 14.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20241223/202412230222.HhQkzBih-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202412230222.HhQkzBih-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> drivers/usb/dwc2/core_intr.c:327: warning: Function parameter or struct member 'remotewakeup' not described in 'dwc2_wakeup_from_lpm_l1'


vim +327 drivers/usb/dwc2/core_intr.c

56f5b1cff22a1d drivers/staging/dwc2/core_intr.c Paul Zimmerman    2013-03-11  319  
273d576c4d41d0 drivers/usb/dwc2/core_intr.c     Sevak Arakelyan   2018-01-24  320  /**
273d576c4d41d0 drivers/usb/dwc2/core_intr.c     Sevak Arakelyan   2018-01-24  321   * dwc2_wakeup_from_lpm_l1 - Exit the device from LPM L1 state
273d576c4d41d0 drivers/usb/dwc2/core_intr.c     Sevak Arakelyan   2018-01-24  322   *
273d576c4d41d0 drivers/usb/dwc2/core_intr.c     Sevak Arakelyan   2018-01-24  323   * @hsotg: Programming view of DWC_otg controller
273d576c4d41d0 drivers/usb/dwc2/core_intr.c     Sevak Arakelyan   2018-01-24  324   *
273d576c4d41d0 drivers/usb/dwc2/core_intr.c     Sevak Arakelyan   2018-01-24  325   */
5d69a3b54e5a63 drivers/usb/dwc2/core_intr.c     Minas Harutyunyan 2024-03-13  326  void dwc2_wakeup_from_lpm_l1(struct dwc2_hsotg *hsotg, bool remotewakeup)
273d576c4d41d0 drivers/usb/dwc2/core_intr.c     Sevak Arakelyan   2018-01-24 @327  {
273d576c4d41d0 drivers/usb/dwc2/core_intr.c     Sevak Arakelyan   2018-01-24  328  	u32 glpmcfg;
5d69a3b54e5a63 drivers/usb/dwc2/core_intr.c     Minas Harutyunyan 2024-03-13  329  	u32 pcgctl;
5d69a3b54e5a63 drivers/usb/dwc2/core_intr.c     Minas Harutyunyan 2024-03-13  330  	u32 dctl;
273d576c4d41d0 drivers/usb/dwc2/core_intr.c     Sevak Arakelyan   2018-01-24  331  
273d576c4d41d0 drivers/usb/dwc2/core_intr.c     Sevak Arakelyan   2018-01-24  332  	if (hsotg->lx_state != DWC2_L1) {
273d576c4d41d0 drivers/usb/dwc2/core_intr.c     Sevak Arakelyan   2018-01-24  333  		dev_err(hsotg->dev, "Core isn't in DWC2_L1 state\n");
273d576c4d41d0 drivers/usb/dwc2/core_intr.c     Sevak Arakelyan   2018-01-24  334  		return;
273d576c4d41d0 drivers/usb/dwc2/core_intr.c     Sevak Arakelyan   2018-01-24  335  	}
273d576c4d41d0 drivers/usb/dwc2/core_intr.c     Sevak Arakelyan   2018-01-24  336  
f25c42b8d604fb drivers/usb/dwc2/core_intr.c     Gevorg Sahakyan   2018-07-26  337  	glpmcfg = dwc2_readl(hsotg, GLPMCFG);
273d576c4d41d0 drivers/usb/dwc2/core_intr.c     Sevak Arakelyan   2018-01-24  338  	if (dwc2_is_device_mode(hsotg)) {
5d69a3b54e5a63 drivers/usb/dwc2/core_intr.c     Minas Harutyunyan 2024-03-13  339  		dev_dbg(hsotg->dev, "Exit from L1 state, remotewakeup=%d\n", remotewakeup);
273d576c4d41d0 drivers/usb/dwc2/core_intr.c     Sevak Arakelyan   2018-01-24  340  		glpmcfg &= ~GLPMCFG_ENBLSLPM;
5d69a3b54e5a63 drivers/usb/dwc2/core_intr.c     Minas Harutyunyan 2024-03-13  341  		glpmcfg &= ~GLPMCFG_HIRD_THRES_MASK;
f25c42b8d604fb drivers/usb/dwc2/core_intr.c     Gevorg Sahakyan   2018-07-26  342  		dwc2_writel(hsotg, glpmcfg, GLPMCFG);
273d576c4d41d0 drivers/usb/dwc2/core_intr.c     Sevak Arakelyan   2018-01-24  343  
5d69a3b54e5a63 drivers/usb/dwc2/core_intr.c     Minas Harutyunyan 2024-03-13  344  		pcgctl = dwc2_readl(hsotg, PCGCTL);
5d69a3b54e5a63 drivers/usb/dwc2/core_intr.c     Minas Harutyunyan 2024-03-13  345  		pcgctl &= ~PCGCTL_ENBL_SLEEP_GATING;
5d69a3b54e5a63 drivers/usb/dwc2/core_intr.c     Minas Harutyunyan 2024-03-13  346  		dwc2_writel(hsotg, pcgctl, PCGCTL);
5d69a3b54e5a63 drivers/usb/dwc2/core_intr.c     Minas Harutyunyan 2024-03-13  347  
f25c42b8d604fb drivers/usb/dwc2/core_intr.c     Gevorg Sahakyan   2018-07-26  348  		glpmcfg = dwc2_readl(hsotg, GLPMCFG);
5d69a3b54e5a63 drivers/usb/dwc2/core_intr.c     Minas Harutyunyan 2024-03-13  349  		if (glpmcfg & GLPMCFG_ENBESL) {
5d69a3b54e5a63 drivers/usb/dwc2/core_intr.c     Minas Harutyunyan 2024-03-13  350  			glpmcfg |= GLPMCFG_RSTRSLPSTS;
5d69a3b54e5a63 drivers/usb/dwc2/core_intr.c     Minas Harutyunyan 2024-03-13  351  			dwc2_writel(hsotg, glpmcfg, GLPMCFG);
5d69a3b54e5a63 drivers/usb/dwc2/core_intr.c     Minas Harutyunyan 2024-03-13  352  		}
273d576c4d41d0 drivers/usb/dwc2/core_intr.c     Sevak Arakelyan   2018-01-24  353  
5d69a3b54e5a63 drivers/usb/dwc2/core_intr.c     Minas Harutyunyan 2024-03-13  354  		if (remotewakeup) {
5d69a3b54e5a63 drivers/usb/dwc2/core_intr.c     Minas Harutyunyan 2024-03-13  355  			if (dwc2_hsotg_wait_bit_set(hsotg, GLPMCFG, GLPMCFG_L1RESUMEOK, 1000)) {
5d69a3b54e5a63 drivers/usb/dwc2/core_intr.c     Minas Harutyunyan 2024-03-13  356  				dev_warn(hsotg->dev, "%s: timeout GLPMCFG_L1RESUMEOK\n", __func__);
5d69a3b54e5a63 drivers/usb/dwc2/core_intr.c     Minas Harutyunyan 2024-03-13  357  				goto fail;
5d69a3b54e5a63 drivers/usb/dwc2/core_intr.c     Minas Harutyunyan 2024-03-13  358  				return;
5d69a3b54e5a63 drivers/usb/dwc2/core_intr.c     Minas Harutyunyan 2024-03-13  359  			}
273d576c4d41d0 drivers/usb/dwc2/core_intr.c     Sevak Arakelyan   2018-01-24  360  
5d69a3b54e5a63 drivers/usb/dwc2/core_intr.c     Minas Harutyunyan 2024-03-13  361  			dctl = dwc2_readl(hsotg, DCTL);
5d69a3b54e5a63 drivers/usb/dwc2/core_intr.c     Minas Harutyunyan 2024-03-13  362  			dctl |= DCTL_RMTWKUPSIG;
5d69a3b54e5a63 drivers/usb/dwc2/core_intr.c     Minas Harutyunyan 2024-03-13  363  			dwc2_writel(hsotg, dctl, DCTL);
273d576c4d41d0 drivers/usb/dwc2/core_intr.c     Sevak Arakelyan   2018-01-24  364  
5d69a3b54e5a63 drivers/usb/dwc2/core_intr.c     Minas Harutyunyan 2024-03-13  365  			if (dwc2_hsotg_wait_bit_set(hsotg, GINTSTS, GINTSTS_WKUPINT, 1000)) {
5d69a3b54e5a63 drivers/usb/dwc2/core_intr.c     Minas Harutyunyan 2024-03-13  366  				dev_warn(hsotg->dev, "%s: timeout GINTSTS_WKUPINT\n", __func__);
5d69a3b54e5a63 drivers/usb/dwc2/core_intr.c     Minas Harutyunyan 2024-03-13  367  				goto fail;
273d576c4d41d0 drivers/usb/dwc2/core_intr.c     Sevak Arakelyan   2018-01-24  368  				return;
273d576c4d41d0 drivers/usb/dwc2/core_intr.c     Sevak Arakelyan   2018-01-24  369  			}
273d576c4d41d0 drivers/usb/dwc2/core_intr.c     Sevak Arakelyan   2018-01-24  370  		}
273d576c4d41d0 drivers/usb/dwc2/core_intr.c     Sevak Arakelyan   2018-01-24  371  
5d69a3b54e5a63 drivers/usb/dwc2/core_intr.c     Minas Harutyunyan 2024-03-13  372  		glpmcfg = dwc2_readl(hsotg, GLPMCFG);
5d69a3b54e5a63 drivers/usb/dwc2/core_intr.c     Minas Harutyunyan 2024-03-13  373  		if (glpmcfg & GLPMCFG_COREL1RES_MASK || glpmcfg & GLPMCFG_SLPSTS ||
5d69a3b54e5a63 drivers/usb/dwc2/core_intr.c     Minas Harutyunyan 2024-03-13  374  		    glpmcfg & GLPMCFG_L1RESUMEOK) {
5d69a3b54e5a63 drivers/usb/dwc2/core_intr.c     Minas Harutyunyan 2024-03-13  375  			goto fail;
5d69a3b54e5a63 drivers/usb/dwc2/core_intr.c     Minas Harutyunyan 2024-03-13  376  			return;
5d69a3b54e5a63 drivers/usb/dwc2/core_intr.c     Minas Harutyunyan 2024-03-13  377  		}
c655557c12ded7 drivers/usb/dwc2/core_intr.c     Grigor Tovmasyan  2018-01-24  378  
c655557c12ded7 drivers/usb/dwc2/core_intr.c     Grigor Tovmasyan  2018-01-24  379  		/* Inform gadget to exit from L1 */
c655557c12ded7 drivers/usb/dwc2/core_intr.c     Grigor Tovmasyan  2018-01-24  380  		call_gadget(hsotg, resume);
5d69a3b54e5a63 drivers/usb/dwc2/core_intr.c     Minas Harutyunyan 2024-03-13  381  		/* Change to L0 state */
5d69a3b54e5a63 drivers/usb/dwc2/core_intr.c     Minas Harutyunyan 2024-03-13  382  		hsotg->lx_state = DWC2_L0;
5d69a3b54e5a63 drivers/usb/dwc2/core_intr.c     Minas Harutyunyan 2024-03-13  383  		hsotg->bus_suspended = false;
5d69a3b54e5a63 drivers/usb/dwc2/core_intr.c     Minas Harutyunyan 2024-03-13  384  fail:		dwc2_gadget_init_lpm(hsotg);
5d69a3b54e5a63 drivers/usb/dwc2/core_intr.c     Minas Harutyunyan 2024-03-13  385  	} else {
5d69a3b54e5a63 drivers/usb/dwc2/core_intr.c     Minas Harutyunyan 2024-03-13  386  		/* TODO */
5d69a3b54e5a63 drivers/usb/dwc2/core_intr.c     Minas Harutyunyan 2024-03-13  387  		dev_err(hsotg->dev, "Host side LPM is not supported.\n");
5d69a3b54e5a63 drivers/usb/dwc2/core_intr.c     Minas Harutyunyan 2024-03-13  388  		return;
5d69a3b54e5a63 drivers/usb/dwc2/core_intr.c     Minas Harutyunyan 2024-03-13  389  	}
273d576c4d41d0 drivers/usb/dwc2/core_intr.c     Sevak Arakelyan   2018-01-24  390  }
273d576c4d41d0 drivers/usb/dwc2/core_intr.c     Sevak Arakelyan   2018-01-24  391  

:::::: The code at line 327 was first introduced by commit
:::::: 273d576c4d41d0577551176040c9c78d30c0cf16 usb: dwc2: gadget: Add functionality to exit from LPM L1 state

:::::: TO: Sevak Arakelyan <sevaka@synopsys.com>
:::::: CC: Felipe Balbi <felipe.balbi@linux.intel.com>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
