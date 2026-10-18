Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AB7BC3D567E
	for <oe-kbuild-all@lists.linux.dev>; Sun, 18 Oct 2026 23:08:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.17
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792364923; cv=none; b=eUOgA2byiSa6RtjtDD3EkTeMep/NHS141I9mp6YDMvPctMuJOTMXum0xSh+8+Hu+OT1JWknTTr4RXtUnDXyKnSAIVLfKrSCtlBQO39lY0IFm97KWKlbKnSAygpSmu6vLuBKnhFSJ8lnUS8JYwROOBxh5W2kmcJN9oMLNthCTmpE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792364923; c=relaxed/simple;
	bh=0hSeuCbiMucQcOuXsQbU1CKZY5n+9uO0bH6gFILa20o=;
	h=Date:From:To:Cc:Subject:Message-ID; b=e2CPPa45WteKz4xh7lO9yDmIpZ4RFTBMp/1d14on675CciMLl+XTTTDTJztSxD0wCGjRfpaXCWh453mgj85TKRLqCC0Tjd5KaF1iUZSWqqdw2kC/x4BkrJEzMJuKO56wH+bU6AqxJmHFwRx5ggrXIrGdLO0GtNL+gyrag4uxNq0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=Qg6P0MRb; arc=none smtp.client-ip=198.175.65.17
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="Qg6P0MRb"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1792364921; x=1823900921;
  h=date:from:to:cc:subject:message-id;
  bh=0hSeuCbiMucQcOuXsQbU1CKZY5n+9uO0bH6gFILa20o=;
  b=Qg6P0MRbFiQC7s3rffo523kOTezLF3EOIRoRzIwyN12IQ8uD2Bh/pFrG
   jCLyHVaym7MoLyKqaspAPf/Jg5YIsdKKs5+z33MdenM5SzLHjvtPVwxgD
   l3qDthUNny1c3WyZRLmK3TJ+7Goz53QbvM/T10kr3eN1aphsvK+y45Of0
   EnvEy+H7ZAlur/j2IosBmY1JL94SOCMfhWm6O+MrT/yzgjbSGdAmytdtP
   fLSNM9mp/v7gkyB+zhASP4SO87czl6Fnxp57CqWo3eCU5pKaUvJovaOvU
   BY+JRQ+r4YqK0Jbz2F7nNPWLeOKjPCvLQXn+x5UjfaqEFH7zIRgE4HzXt
   A==;
X-CSE-ConnectionGUID: ohpt7jneQv6e/wY8WxKKag==
X-CSE-MsgGUID: nTBtuOHwQRalXclwdSPr2A==
X-IronPort-AV: E=McAfee;i="6800,10657,11939"; a="1065362"
X-IronPort-AV: E=Sophos;i="6.27,166,1787036400"; 
   d="scan'208";a="1065362"
Received: from fmviesa012.fm.intel.com ([10.60.135.152])
  by orvoesa109.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 18 Oct 2026 16:08:38 -0700
X-CSE-ConnectionGUID: f8upGntIR3yGrQfQQO+mwg==
X-CSE-MsgGUID: J81uWZVlQ5OrxvMMAyHTCw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,166,1787036400"; 
   d="scan'208";a="4142080"
Received: from igk-lkp-server01.igk.intel.com (HELO 3c253b998be3) ([10.211.93.152])
  by fmviesa012.fm.intel.com with ESMTP; 18 Oct 2026 16:08:36 -0700
Received: from kbuild by 3c253b998be3 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1xIZzW-000000005Kl-2nlo;
	Sun, 18 Oct 2026 23:08:34 +0000
Date: Mon, 19 Oct 2026 01:07:44 +0200
From: kernel test robot <lkp@intel.com>
To: cros-kernel-buildreports@googlegroups.com
Cc: oe-kbuild-all@lists.linux.dev
Subject: [android-common:android14-kiwi-6.1 336/336]
 drivers/usb/dwc2/core_intr.c:327: warning: Function parameter or member
 'remotewakeup' not described in 'dwc2_wakeup_from_lpm_l1'
Message-ID: <202610190144.U3MUzlFl-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>

tree:   https://android.googlesource.com/kernel/common android14-kiwi-6.1
head:   85239205a20932568f405bb06f7dc3187e755674
commit: 19ca7ef7d83974574b0edc8894607d1544f157d6 [336/336] usb: dwc2: gadget: LPM flow fix
config: arm64-randconfig-2000-20261018 (https://download.01.org/0day-ci/archive/20261019/202610190144.U3MUzlFl-lkp@intel.com/config)
compiler: aarch64-linux-gcc (GCC) 11.5.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20261019/202610190144.U3MUzlFl-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202610190144.U3MUzlFl-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> drivers/usb/dwc2/core_intr.c:327: warning: Function parameter or member 'remotewakeup' not described in 'dwc2_wakeup_from_lpm_l1'


vim +327 drivers/usb/dwc2/core_intr.c

56f5b1cff22a1d6 drivers/staging/dwc2/core_intr.c Paul Zimmerman    2013-03-11  319  
273d576c4d41d05 drivers/usb/dwc2/core_intr.c     Sevak Arakelyan   2018-01-24  320  /**
273d576c4d41d05 drivers/usb/dwc2/core_intr.c     Sevak Arakelyan   2018-01-24  321   * dwc2_wakeup_from_lpm_l1 - Exit the device from LPM L1 state
273d576c4d41d05 drivers/usb/dwc2/core_intr.c     Sevak Arakelyan   2018-01-24  322   *
273d576c4d41d05 drivers/usb/dwc2/core_intr.c     Sevak Arakelyan   2018-01-24  323   * @hsotg: Programming view of DWC_otg controller
273d576c4d41d05 drivers/usb/dwc2/core_intr.c     Sevak Arakelyan   2018-01-24  324   *
273d576c4d41d05 drivers/usb/dwc2/core_intr.c     Sevak Arakelyan   2018-01-24  325   */
19ca7ef7d839745 drivers/usb/dwc2/core_intr.c     Minas Harutyunyan 2024-03-13  326  void dwc2_wakeup_from_lpm_l1(struct dwc2_hsotg *hsotg, bool remotewakeup)
273d576c4d41d05 drivers/usb/dwc2/core_intr.c     Sevak Arakelyan   2018-01-24 @327  {
273d576c4d41d05 drivers/usb/dwc2/core_intr.c     Sevak Arakelyan   2018-01-24  328  	u32 glpmcfg;
19ca7ef7d839745 drivers/usb/dwc2/core_intr.c     Minas Harutyunyan 2024-03-13  329  	u32 pcgctl;
19ca7ef7d839745 drivers/usb/dwc2/core_intr.c     Minas Harutyunyan 2024-03-13  330  	u32 dctl;
273d576c4d41d05 drivers/usb/dwc2/core_intr.c     Sevak Arakelyan   2018-01-24  331  
273d576c4d41d05 drivers/usb/dwc2/core_intr.c     Sevak Arakelyan   2018-01-24  332  	if (hsotg->lx_state != DWC2_L1) {
273d576c4d41d05 drivers/usb/dwc2/core_intr.c     Sevak Arakelyan   2018-01-24  333  		dev_err(hsotg->dev, "Core isn't in DWC2_L1 state\n");
273d576c4d41d05 drivers/usb/dwc2/core_intr.c     Sevak Arakelyan   2018-01-24  334  		return;
273d576c4d41d05 drivers/usb/dwc2/core_intr.c     Sevak Arakelyan   2018-01-24  335  	}
273d576c4d41d05 drivers/usb/dwc2/core_intr.c     Sevak Arakelyan   2018-01-24  336  
f25c42b8d604fbc drivers/usb/dwc2/core_intr.c     Gevorg Sahakyan   2018-07-26  337  	glpmcfg = dwc2_readl(hsotg, GLPMCFG);
273d576c4d41d05 drivers/usb/dwc2/core_intr.c     Sevak Arakelyan   2018-01-24  338  	if (dwc2_is_device_mode(hsotg)) {
19ca7ef7d839745 drivers/usb/dwc2/core_intr.c     Minas Harutyunyan 2024-03-13  339  		dev_dbg(hsotg->dev, "Exit from L1 state, remotewakeup=%d\n", remotewakeup);
273d576c4d41d05 drivers/usb/dwc2/core_intr.c     Sevak Arakelyan   2018-01-24  340  		glpmcfg &= ~GLPMCFG_ENBLSLPM;
19ca7ef7d839745 drivers/usb/dwc2/core_intr.c     Minas Harutyunyan 2024-03-13  341  		glpmcfg &= ~GLPMCFG_HIRD_THRES_MASK;
f25c42b8d604fbc drivers/usb/dwc2/core_intr.c     Gevorg Sahakyan   2018-07-26  342  		dwc2_writel(hsotg, glpmcfg, GLPMCFG);
273d576c4d41d05 drivers/usb/dwc2/core_intr.c     Sevak Arakelyan   2018-01-24  343  
19ca7ef7d839745 drivers/usb/dwc2/core_intr.c     Minas Harutyunyan 2024-03-13  344  		pcgctl = dwc2_readl(hsotg, PCGCTL);
19ca7ef7d839745 drivers/usb/dwc2/core_intr.c     Minas Harutyunyan 2024-03-13  345  		pcgctl &= ~PCGCTL_ENBL_SLEEP_GATING;
19ca7ef7d839745 drivers/usb/dwc2/core_intr.c     Minas Harutyunyan 2024-03-13  346  		dwc2_writel(hsotg, pcgctl, PCGCTL);
19ca7ef7d839745 drivers/usb/dwc2/core_intr.c     Minas Harutyunyan 2024-03-13  347  
f25c42b8d604fbc drivers/usb/dwc2/core_intr.c     Gevorg Sahakyan   2018-07-26  348  		glpmcfg = dwc2_readl(hsotg, GLPMCFG);
19ca7ef7d839745 drivers/usb/dwc2/core_intr.c     Minas Harutyunyan 2024-03-13  349  		if (glpmcfg & GLPMCFG_ENBESL) {
19ca7ef7d839745 drivers/usb/dwc2/core_intr.c     Minas Harutyunyan 2024-03-13  350  			glpmcfg |= GLPMCFG_RSTRSLPSTS;
19ca7ef7d839745 drivers/usb/dwc2/core_intr.c     Minas Harutyunyan 2024-03-13  351  			dwc2_writel(hsotg, glpmcfg, GLPMCFG);
19ca7ef7d839745 drivers/usb/dwc2/core_intr.c     Minas Harutyunyan 2024-03-13  352  		}
273d576c4d41d05 drivers/usb/dwc2/core_intr.c     Sevak Arakelyan   2018-01-24  353  
19ca7ef7d839745 drivers/usb/dwc2/core_intr.c     Minas Harutyunyan 2024-03-13  354  		if (remotewakeup) {
19ca7ef7d839745 drivers/usb/dwc2/core_intr.c     Minas Harutyunyan 2024-03-13  355  			if (dwc2_hsotg_wait_bit_set(hsotg, GLPMCFG, GLPMCFG_L1RESUMEOK, 1000)) {
19ca7ef7d839745 drivers/usb/dwc2/core_intr.c     Minas Harutyunyan 2024-03-13  356  				dev_warn(hsotg->dev, "%s: timeout GLPMCFG_L1RESUMEOK\n", __func__);
19ca7ef7d839745 drivers/usb/dwc2/core_intr.c     Minas Harutyunyan 2024-03-13  357  				goto fail;
19ca7ef7d839745 drivers/usb/dwc2/core_intr.c     Minas Harutyunyan 2024-03-13  358  				return;
19ca7ef7d839745 drivers/usb/dwc2/core_intr.c     Minas Harutyunyan 2024-03-13  359  			}
273d576c4d41d05 drivers/usb/dwc2/core_intr.c     Sevak Arakelyan   2018-01-24  360  
19ca7ef7d839745 drivers/usb/dwc2/core_intr.c     Minas Harutyunyan 2024-03-13  361  			dctl = dwc2_readl(hsotg, DCTL);
19ca7ef7d839745 drivers/usb/dwc2/core_intr.c     Minas Harutyunyan 2024-03-13  362  			dctl |= DCTL_RMTWKUPSIG;
19ca7ef7d839745 drivers/usb/dwc2/core_intr.c     Minas Harutyunyan 2024-03-13  363  			dwc2_writel(hsotg, dctl, DCTL);
273d576c4d41d05 drivers/usb/dwc2/core_intr.c     Sevak Arakelyan   2018-01-24  364  
19ca7ef7d839745 drivers/usb/dwc2/core_intr.c     Minas Harutyunyan 2024-03-13  365  			if (dwc2_hsotg_wait_bit_set(hsotg, GINTSTS, GINTSTS_WKUPINT, 1000)) {
19ca7ef7d839745 drivers/usb/dwc2/core_intr.c     Minas Harutyunyan 2024-03-13  366  				dev_warn(hsotg->dev, "%s: timeout GINTSTS_WKUPINT\n", __func__);
19ca7ef7d839745 drivers/usb/dwc2/core_intr.c     Minas Harutyunyan 2024-03-13  367  				goto fail;
273d576c4d41d05 drivers/usb/dwc2/core_intr.c     Sevak Arakelyan   2018-01-24  368  				return;
273d576c4d41d05 drivers/usb/dwc2/core_intr.c     Sevak Arakelyan   2018-01-24  369  			}
273d576c4d41d05 drivers/usb/dwc2/core_intr.c     Sevak Arakelyan   2018-01-24  370  		}
273d576c4d41d05 drivers/usb/dwc2/core_intr.c     Sevak Arakelyan   2018-01-24  371  
19ca7ef7d839745 drivers/usb/dwc2/core_intr.c     Minas Harutyunyan 2024-03-13  372  		glpmcfg = dwc2_readl(hsotg, GLPMCFG);
19ca7ef7d839745 drivers/usb/dwc2/core_intr.c     Minas Harutyunyan 2024-03-13  373  		if (glpmcfg & GLPMCFG_COREL1RES_MASK || glpmcfg & GLPMCFG_SLPSTS ||
19ca7ef7d839745 drivers/usb/dwc2/core_intr.c     Minas Harutyunyan 2024-03-13  374  		    glpmcfg & GLPMCFG_L1RESUMEOK) {
19ca7ef7d839745 drivers/usb/dwc2/core_intr.c     Minas Harutyunyan 2024-03-13  375  			goto fail;
19ca7ef7d839745 drivers/usb/dwc2/core_intr.c     Minas Harutyunyan 2024-03-13  376  			return;
19ca7ef7d839745 drivers/usb/dwc2/core_intr.c     Minas Harutyunyan 2024-03-13  377  		}
c655557c12ded72 drivers/usb/dwc2/core_intr.c     Grigor Tovmasyan  2018-01-24  378  
c655557c12ded72 drivers/usb/dwc2/core_intr.c     Grigor Tovmasyan  2018-01-24  379  		/* Inform gadget to exit from L1 */
c655557c12ded72 drivers/usb/dwc2/core_intr.c     Grigor Tovmasyan  2018-01-24  380  		call_gadget(hsotg, resume);
19ca7ef7d839745 drivers/usb/dwc2/core_intr.c     Minas Harutyunyan 2024-03-13  381  		/* Change to L0 state */
19ca7ef7d839745 drivers/usb/dwc2/core_intr.c     Minas Harutyunyan 2024-03-13  382  		hsotg->lx_state = DWC2_L0;
19ca7ef7d839745 drivers/usb/dwc2/core_intr.c     Minas Harutyunyan 2024-03-13  383  		hsotg->bus_suspended = false;
19ca7ef7d839745 drivers/usb/dwc2/core_intr.c     Minas Harutyunyan 2024-03-13  384  fail:		dwc2_gadget_init_lpm(hsotg);
19ca7ef7d839745 drivers/usb/dwc2/core_intr.c     Minas Harutyunyan 2024-03-13  385  	} else {
19ca7ef7d839745 drivers/usb/dwc2/core_intr.c     Minas Harutyunyan 2024-03-13  386  		/* TODO */
19ca7ef7d839745 drivers/usb/dwc2/core_intr.c     Minas Harutyunyan 2024-03-13  387  		dev_err(hsotg->dev, "Host side LPM is not supported.\n");
19ca7ef7d839745 drivers/usb/dwc2/core_intr.c     Minas Harutyunyan 2024-03-13  388  		return;
19ca7ef7d839745 drivers/usb/dwc2/core_intr.c     Minas Harutyunyan 2024-03-13  389  	}
273d576c4d41d05 drivers/usb/dwc2/core_intr.c     Sevak Arakelyan   2018-01-24  390  }
273d576c4d41d05 drivers/usb/dwc2/core_intr.c     Sevak Arakelyan   2018-01-24  391  

:::::: The code at line 327 was first introduced by commit
:::::: 273d576c4d41d0577551176040c9c78d30c0cf16 usb: dwc2: gadget: Add functionality to exit from LPM L1 state

:::::: TO: Sevak Arakelyan <sevaka@synopsys.com>
:::::: CC: Felipe Balbi <felipe.balbi@linux.intel.com>

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
