Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.31])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7CFF1C2C4
	for <oe-kbuild-all@lists.linux.dev>; Tue, 17 Oct 2023 06:01:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="gi7jVHki"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1697522467; x=1729058467;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=EHPzBKjE/GJodRIV3gUP13ZD3IOCC1xQpsSVGnvp8hE=;
  b=gi7jVHki0Om/usMJGO6haC8W03824YlXuMnkAXl/vEdm0mrrX5sPV1i7
   Pmu1AA43Oab3KPXCdHiv0XzzXVFgfDJZ+YC+OmZEQSJnaBHGfBwTEfx5h
   aHyexb+LZqnJyiXH3bk+xHZBCIkVZX5Rnm/2eJYJyzkgto32PpRjshDxN
   iAKdxn4mLxXVtfZS/3WhPOwdCNUV4NYZgFpEswUh7+nFnvbvc5uQTK6XS
   9NitWjT562Z83WpWuaJw7K0z9t9QVJ57nTndrndrRJlzE41xKx5n43NV+
   Dpd4jzWO1T3h4I28m6+o5ChQrv9UcWy4ES5AnivsKqNhvOJq0qdgPdCtW
   w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10865"; a="449929434"
X-IronPort-AV: E=Sophos;i="6.03,231,1694761200"; 
   d="scan'208";a="449929434"
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
  by orsmga104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 16 Oct 2023 23:01:04 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10865"; a="872410370"
X-IronPort-AV: E=Sophos;i="6.03,231,1694761200"; 
   d="scan'208";a="872410370"
Received: from lkp-server02.sh.intel.com (HELO f64821696465) ([10.239.97.151])
  by fmsmga002.fm.intel.com with ESMTP; 16 Oct 2023 23:01:03 -0700
Received: from kbuild by f64821696465 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1qsd8X-000961-0g;
	Tue, 17 Oct 2023 06:01:01 +0000
Date: Tue, 17 Oct 2023 13:59:58 +0800
From: kernel test robot <lkp@intel.com>
To: Ladislav Michl <oss-lists@triops.cz>
Cc: oe-kbuild-all@lists.linux.dev
Subject: Re: [RFC] usb: dwc3: dwc3-octeon: Fix USB PHY High-Speed PLL
 Initialization
Message-ID: <202310171355.p5enLEbv-lkp@intel.com>
References: <ZShGmL4mph91Ncib@lenoch>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <ZShGmL4mph91Ncib@lenoch>

Hi Ladislav,

[This is a private test report for your RFC patch.]
kernel test robot noticed the following build warnings:

[auto build test WARNING on usb/usb-testing]
[also build test WARNING on usb/usb-next usb/usb-linus westeri-thunderbolt/next linus/master v6.6-rc6 next-20231016]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Ladislav-Michl/usb-dwc3-dwc3-octeon-Fix-USB-PHY-High-Speed-PLL-Initialization/20231017-112612
base:   https://git.kernel.org/pub/scm/linux/kernel/git/gregkh/usb.git usb-testing
patch link:    https://lore.kernel.org/r/ZShGmL4mph91Ncib%40lenoch
patch subject: [RFC] usb: dwc3: dwc3-octeon: Fix USB PHY High-Speed PLL Initialization
config: m68k-allyesconfig (https://download.01.org/0day-ci/archive/20231017/202310171355.p5enLEbv-lkp@intel.com/config)
compiler: m68k-linux-gcc (GCC) 13.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20231017/202310171355.p5enLEbv-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202310171355.p5enLEbv-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> drivers/usb/dwc3/dwc3-octeon.c:614: warning: This comment starts with '/**', but isn't a kernel-doc comment. Refer Documentation/doc-guide/kernel-doc.rst
    * Performs a full reset of the UPHY PLL. Note that this is normally done


vim +614 drivers/usb/dwc3/dwc3-octeon.c

   612	
   613	/**
 > 614	 * Performs a full reset of the UPHY PLL. Note that this is normally done
   615	 * internally by a state machine when the UPHY is brought out of reset but this
   616	 * version gives far more time for things to settle before continuing.
   617	 */
   618	static int dwc3_uphy_pll_reset(struct dwc3_octeon *octeon)
   619	{
   620		u16 ctrl, pwr;
   621	
   622		/* 1. Turn on write enable so we can assert reset to the PLL VCO */
   623		ctrl = dwc3_octeon_indirect_read(octeon, DWC3_INT_IND_UPHY_PLL_RESET);
   624		ctrl |= DWC3_INT_IND_UPHY_PLL_RESET_WE;
   625		dwc3_octeon_indirect_write(octeon, DWC3_INT_IND_UPHY_PLL_RESET, ctrl);
   626	
   627		/* 2. Turn on write enable for PLL power control */
   628		pwr = dwc3_octeon_indirect_read(octeon, DWC3_INT_IND_UPHY_PLL_PU);
   629		pwr |= DWC3_INT_IND_UPHY_PLL_PU_WE;
   630		dwc3_octeon_indirect_write(octeon, DWC3_INT_IND_UPHY_PLL_PU, pwr);
   631	
   632		/* 3. Assert VCO reset */
   633		ctrl |= DWC3_INT_IND_UPHY_PLL_RESET_VCO_RST;
   634		dwc3_octeon_indirect_write(octeon, DWC3_INT_IND_UPHY_PLL_RESET, ctrl);
   635	
   636		/* 4. Power off the PLL */
   637		pwr &= ~DWC3_INT_IND_UPHY_PLL_PU_POWER_EN;
   638		dwc3_octeon_indirect_write(octeon, DWC3_INT_IND_UPHY_PLL_PU, pwr);
   639		usleep_range(1000, 2000);
   640	
   641		/* 5. Power on the PLL while VCO is held in reset */
   642		pwr |= DWC3_INT_IND_UPHY_PLL_PU_POWER_EN;
   643		dwc3_octeon_indirect_write(octeon, DWC3_INT_IND_UPHY_PLL_PU, pwr);
   644	
   645		/* Wait for things to stabilize before taking VCO out of reset */
   646		usleep_range(1000, 2000);
   647	
   648		/* 6. Take the VCO out of reset */
   649		ctrl &= ~DWC3_INT_IND_UPHY_PLL_RESET_VCO_RST;
   650		dwc3_octeon_indirect_write(octeon, DWC3_INT_IND_UPHY_PLL_RESET, ctrl);
   651		usleep_range(1000, 2000);
   652	
   653		/* 7. Put the VCO back in reset */
   654		ctrl |= ~DWC3_INT_IND_UPHY_PLL_RESET_VCO_RST;
   655		dwc3_octeon_indirect_write(octeon, DWC3_INT_IND_UPHY_PLL_RESET, ctrl);
   656	
   657		/* 8. Power off the PLL */
   658		pwr &= ~DWC3_INT_IND_UPHY_PLL_PU_POWER_EN;
   659		dwc3_octeon_indirect_write(octeon, DWC3_INT_IND_UPHY_PLL_PU, pwr);
   660		usleep_range(1000, 2000);
   661	
   662		/* 9. Power on the PLL while VCO is held in reset */
   663		pwr |= DWC3_INT_IND_UPHY_PLL_PU_POWER_EN;
   664		dwc3_octeon_indirect_write(octeon, DWC3_INT_IND_UPHY_PLL_PU, pwr);
   665	
   666		/* 10. Take the VCO out of reset */
   667		ctrl &= ~DWC3_INT_IND_UPHY_PLL_RESET_VCO_RST;
   668		dwc3_octeon_indirect_write(octeon, DWC3_INT_IND_UPHY_PLL_RESET, ctrl);
   669	
   670		/* 11. Turn off write enables */
   671		pwr &= ~DWC3_INT_IND_UPHY_PLL_PU_WE;
   672		dwc3_octeon_indirect_write(octeon, DWC3_INT_IND_UPHY_PLL_PU, pwr);
   673	
   674		ctrl &= ~DWC3_INT_IND_UPHY_PLL_RESET_WE;
   675		dwc3_octeon_indirect_write(octeon, DWC3_INT_IND_UPHY_PLL_RESET, ctrl);
   676	
   677		usleep_range(1000, 2000);
   678	
   679		/* Return if we have lock or not */
   680		return dwc3_octeon_pll_locked(octeon);
   681	}
   682	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
