Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.9])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A28092D0620
	for <oe-kbuild-all@lists.linux.dev>; Mon, 19 Oct 2026 00:41:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.9
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792370467; cv=none; b=f4QX4Y81NrsPLQYgKcJYZg2AETLikKODyZ3Il35ZUCFbC2khLHh7NU4ND2/gFCONKoyLe5DZhGoNl6JkUrJsS/HpR+OYBSMCjX2o1itspN00LhFhfnJ/xkQs7+EofSNL2TMp9/GS33sLXguck/tbjwAtzmi9bVwozUcPIbOhIV4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792370467; c=relaxed/simple;
	bh=NWh6KLe6vYW46z5aWA7+U+aM4WAkaaODlqkQLu5PLbY=;
	h=Date:From:To:Cc:Subject:Message-ID; b=DofVcpVROWLCzNTnajUF3azSj4wERa0SvwdzjGvk9DCt9aO/DFzbySzYE9JpAnJjcpoZLJ3l8pmRJJ1OYJMXso8nU2ADKFnzwa3xnKTU0U++C1brLB8Lj2fkApVc0zkkw1w+g8rvbN5XMHrjoBm8wl/IyYe7CCO3AGPdvnEVIsE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=hRLqEvgL; arc=none smtp.client-ip=192.198.163.9
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="hRLqEvgL"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1792370466; x=1823906466;
  h=date:from:to:cc:subject:message-id;
  bh=NWh6KLe6vYW46z5aWA7+U+aM4WAkaaODlqkQLu5PLbY=;
  b=hRLqEvgLrdctMnfRX5YfpMQXJZy+73jioJIx4PWqSpfsF+rhvrl1QAUP
   oRlfwq/0Fod/eaqSwMZXcXor97axeySN1+iHPJo4BLc+miJUn0S3gOcwL
   A+6HNnhaMq9ZA1YGjCfaG45RaunZEXF1d+2SeiKMojUF+4nfW1USn54bG
   C6SZSUiUBqbC7FaiQqhGmM/d0ePSnKky/Hi3pc6oh07CRsMMIreWGEJY+
   tsnCYZEYc5WJGWxvGitSFV23gWSp77ED42/tSGEvBtmGt5WPpbIdPiiuo
   fw4c3MgsI1NJOtXmGPkusUN3M1qPRXl+t3zrcq/Cg5RcjkjaXak8/fSZv
   Q==;
X-CSE-ConnectionGUID: 603HhWSuSJGSfa58tFl2xw==
X-CSE-MsgGUID: 1mOSIGGWRJaVakxKyXCMeg==
X-IronPort-AV: E=McAfee;i="6800,10657,11939"; a="945219"
X-IronPort-AV: E=Sophos;i="6.27,166,1787036400"; 
   d="scan'208";a="945219"
Received: from orviesa008.jf.intel.com ([10.64.159.148])
  by fmvoesa103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 18 Oct 2026 17:41:02 -0700
X-CSE-ConnectionGUID: tDyH9/BDT6ebFzrJavwQIg==
X-CSE-MsgGUID: +4ocQLblQHu012CW62OqMA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,166,1787036400"; 
   d="scan'208";a="2280235"
Received: from igk-lkp-server01.igk.intel.com (HELO 3c253b998be3) ([10.211.93.152])
  by orviesa008.jf.intel.com with ESMTP; 18 Oct 2026 17:41:01 -0700
Received: from kbuild by 3c253b998be3 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1xIbQw-000000005On-3q7W;
	Mon, 19 Oct 2026 00:40:58 +0000
Date: Mon, 19 Oct 2026 02:40:11 +0200
From: kernel test robot <lkp@intel.com>
To: cros-kernel-buildreports@googlegroups.com
Cc: oe-kbuild-all@lists.linux.dev
Subject: [android-common:android14-kiwi-6.1 336/336]
 drivers/usb/dwc3/core.c:771:22: warning: variable 'hw_mode' set but not used
Message-ID: <202610190223.ldkcTCV3-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>

tree:   https://android.googlesource.com/kernel/common android14-kiwi-6.1
head:   85239205a20932568f405bb06f7dc3187e755674
commit: 9f49b974c86db9070c108e904ead1aadddb7e5a6 [336/336] BACKPORT: usb: dwc3: core: Refactor PHY logic to support Multiport Controller
config: arm64-randconfig-2000-20261018 (https://download.01.org/0day-ci/archive/20261019/202610190223.ldkcTCV3-lkp@intel.com/config)
compiler: aarch64-linux-gcc (GCC) 11.5.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20261019/202610190223.ldkcTCV3-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202610190223.ldkcTCV3-lkp@intel.com/

All warnings (new ones prefixed by >>):

   drivers/usb/dwc3/core.c: In function 'dwc3_hs_phy_setup':
>> drivers/usb/dwc3/core.c:771:22: warning: variable 'hw_mode' set but not used [-Wunused-but-set-variable]
     771 |         unsigned int hw_mode;
         |                      ^~~~~~~


vim +/hw_mode +771 drivers/usb/dwc3/core.c

   768	
   769	static int dwc3_hs_phy_setup(struct dwc3 *dwc, int index)
   770	{
 > 771		unsigned int hw_mode;
   772		u32 reg;
   773	
   774		hw_mode = DWC3_GHWPARAMS0_MODE(dwc->hwparams.hwparams0);
   775		reg = dwc3_readl(dwc->regs, DWC3_GUSB2PHYCFG(index));
   776	
   777		/* Select the HS PHY interface */
   778		switch (DWC3_GHWPARAMS3_HSPHY_IFC(dwc->hwparams.hwparams3)) {
   779		case DWC3_GHWPARAMS3_HSPHY_IFC_UTMI_ULPI:
   780			if (dwc->hsphy_interface &&
   781					!strncmp(dwc->hsphy_interface, "utmi", 4)) {
   782				reg &= ~DWC3_GUSB2PHYCFG_ULPI_UTMI;
   783				break;
   784			} else if (dwc->hsphy_interface &&
   785					!strncmp(dwc->hsphy_interface, "ulpi", 4)) {
   786				reg |= DWC3_GUSB2PHYCFG_ULPI_UTMI;
   787				dwc3_writel(dwc->regs, DWC3_GUSB2PHYCFG(index), reg);
   788			} else {
   789				/* Relying on default value. */
   790				if (!(reg & DWC3_GUSB2PHYCFG_ULPI_UTMI))
   791					break;
   792			}
   793			fallthrough;
   794		case DWC3_GHWPARAMS3_HSPHY_IFC_ULPI:
   795		default:
   796			break;
   797		}
   798	
   799		switch (dwc->hsphy_mode) {
   800		case USBPHY_INTERFACE_MODE_UTMI:
   801			reg &= ~(DWC3_GUSB2PHYCFG_PHYIF_MASK |
   802			       DWC3_GUSB2PHYCFG_USBTRDTIM_MASK);
   803			reg |= DWC3_GUSB2PHYCFG_PHYIF(UTMI_PHYIF_8_BIT) |
   804			       DWC3_GUSB2PHYCFG_USBTRDTIM(USBTRDTIM_UTMI_8_BIT);
   805			break;
   806		case USBPHY_INTERFACE_MODE_UTMIW:
   807			reg &= ~(DWC3_GUSB2PHYCFG_PHYIF_MASK |
   808			       DWC3_GUSB2PHYCFG_USBTRDTIM_MASK);
   809			reg |= DWC3_GUSB2PHYCFG_PHYIF(UTMI_PHYIF_16_BIT) |
   810			       DWC3_GUSB2PHYCFG_USBTRDTIM(USBTRDTIM_UTMI_16_BIT);
   811			break;
   812		default:
   813			break;
   814		}
   815	
   816		/*
   817		 * Above DWC_usb3.0 1.94a, it is recommended to set
   818		 * DWC3_GUSB2PHYCFG_SUSPHY to '0' during coreConsultant configuration.
   819		 * So default value will be '0' when the core is reset. Application
   820		 * needs to set it to '1' after the core initialization is completed.
   821		 *
   822		 * Similarly for DRD controllers, GUSB2PHYCFG.SUSPHY must be cleared
   823		 * after power-on reset, and it can be set after core initialization.
   824		 */
   825		reg &= ~DWC3_GUSB2PHYCFG_SUSPHY;
   826	
   827		if (dwc->dis_enblslpm_quirk)
   828			reg &= ~DWC3_GUSB2PHYCFG_ENBLSLPM;
   829		else
   830			reg |= DWC3_GUSB2PHYCFG_ENBLSLPM;
   831	
   832		if (dwc->dis_u2_freeclk_exists_quirk || dwc->gfladj_refclk_lpm_sel)
   833			reg &= ~DWC3_GUSB2PHYCFG_U2_FREECLK_EXISTS;
   834	
   835		dwc3_writel(dwc->regs, DWC3_GUSB2PHYCFG(index), reg);
   836	
   837		return 0;
   838	}
   839	

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
