Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.115])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1B89310962
	for <oe-kbuild-all@lists.linux.dev>; Mon, 25 Sep 2023 17:22:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1695662535; x=1727198535;
  h=date:from:cc:subject:message-id:mime-version;
  bh=GUGykoT6/GkCtiz3R3KswapSgRFMW5RzZZpljeXpI1U=;
  b=eYSwBVq5HHuyFCp7YcgmKje4XjZkp+FmnFz61r/2Rx8mBKypekB7ON2r
   oU5VHCl5fHcq0OliUmSJXe6lrtKCEMtcUORuoCnPq2nEkN2jZ26T/yl80
   ha3wr5ENxHV0Lhu7GtB89qSSoFI1+GC4fDFTd1FKUi0NGcM3gWwVQqEcJ
   5AoGBpe/Grom5niTDY+aEEvcPjt4i8xCWG4mttQPNrrlu3CxWIjceJrUq
   VwQoQ46PUlV7Z2YiSFDb/56MFmDiMNDHrQXrrHabpOasSFEmAdPrMNagD
   cZBeKHvV8pilziQvBQ9xKulyFMi073r9YT3QsKToEeUuIbz0z9xPdnKSj
   w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10843"; a="381217137"
X-IronPort-AV: E=Sophos;i="6.03,175,1694761200"; 
   d="scan'208";a="381217137"
Received: from fmsmga005.fm.intel.com ([10.253.24.32])
  by fmsmga103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 25 Sep 2023 10:21:49 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10843"; a="1079305049"
X-IronPort-AV: E=Sophos;i="6.03,175,1694761200"; 
   d="scan'208";a="1079305049"
Received: from lkp-server02.sh.intel.com (HELO 32c80313467c) ([10.239.97.151])
  by fmsmga005.fm.intel.com with ESMTP; 25 Sep 2023 10:21:48 -0700
Received: from kbuild by 32c80313467c with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1qkpHG-0001qz-0f
	for oe-kbuild-all@lists.linux.dev;
	Mon, 25 Sep 2023 17:21:46 +0000
Date: Tue, 26 Sep 2023 01:20:59 +0800
From: kernel test robot <lkp@intel.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [jsarha:topic/chromeos-4.19-s0ix 9724/9999]
 drivers/gpu/drm/bridge/synopsys/dw-hdmi.c:2160:39: sparse: sparse: cast
 truncates bits from constant value (ffffff7f becomes 7f)
Message-ID: <202309260119.BVruDqEH-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://github.com/jsarha/linux topic/chromeos-4.19-s0ix
head:   430bdaa0a8c38697780f45a148964d71951df11f
commit: 3e0b620a47e1670e4a3029ebc7f54da59d852799 [9724/9999] CHROMIUM: drm/bridge: dw-hdmi: Add HDCP support
config: i386-randconfig-062-20230925 (https://download.01.org/0day-ci/archive/20230926/202309260119.BVruDqEH-lkp@intel.com/config)
compiler: gcc-11 (Debian 11.3.0-12) 11.3.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20230926/202309260119.BVruDqEH-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202309260119.BVruDqEH-lkp@intel.com/

sparse warnings: (new ones prefixed by >>)
>> drivers/gpu/drm/bridge/synopsys/dw-hdmi.c:2160:39: sparse: sparse: cast truncates bits from constant value (ffffff7f becomes 7f)
   drivers/gpu/drm/bridge/synopsys/dw-hdmi.c:2720:39: sparse: sparse: cast truncates bits from constant value (ffffff7f becomes 7f)
   drivers/gpu/drm/bridge/synopsys/dw-hdmi.c:2889:30: sparse: sparse: cast truncates bits from constant value (ffffff0d becomes d)
   drivers/gpu/drm/bridge/synopsys/dw-hdmi.c:2308: warning: Function parameter or member 'work' not described in 'dw_hdmi_hdcp_periodic_work'

vim +2160 drivers/gpu/drm/bridge/synopsys/dw-hdmi.c

  2107	
  2108	static void initialize_hdmi_ih_mutes(struct dw_hdmi *hdmi)
  2109	{
  2110		u8 ih_mute;
  2111	
  2112		/*
  2113		 * Boot up defaults are:
  2114		 * HDMI_IH_MUTE   = 0x03 (disabled)
  2115		 * HDMI_IH_MUTE_* = 0x00 (enabled)
  2116		 *
  2117		 * Disable top level interrupt bits in HDMI block
  2118		 */
  2119		ih_mute = hdmi_readb(hdmi, HDMI_IH_MUTE) |
  2120			  HDMI_IH_MUTE_MUTE_WAKEUP_INTERRUPT |
  2121			  HDMI_IH_MUTE_MUTE_ALL_INTERRUPT;
  2122	
  2123		hdmi_writeb(hdmi, ih_mute, HDMI_IH_MUTE);
  2124	
  2125		/* by default mask all interrupts */
  2126		hdmi_writeb(hdmi, 0xff, HDMI_VP_MASK);
  2127		hdmi_writeb(hdmi, 0xff, HDMI_FC_MASK0);
  2128		hdmi_writeb(hdmi, 0xff, HDMI_FC_MASK1);
  2129		hdmi_writeb(hdmi, 0xff, HDMI_FC_MASK2);
  2130		hdmi_writeb(hdmi, 0xff, HDMI_PHY_MASK0);
  2131		hdmi_writeb(hdmi, 0xff, HDMI_PHY_I2CM_INT_ADDR);
  2132		hdmi_writeb(hdmi, 0xff, HDMI_PHY_I2CM_CTLINT_ADDR);
  2133		hdmi_writeb(hdmi, 0xff, HDMI_AUD_INT);
  2134		hdmi_writeb(hdmi, 0xff, HDMI_AUD_SPDIFINT);
  2135		hdmi_writeb(hdmi, 0xff, HDMI_AUD_HBR_MASK);
  2136		hdmi_writeb(hdmi, 0xff, HDMI_GP_MASK);
  2137		hdmi_writeb(hdmi, 0xff, HDMI_A_APIINTMSK);
  2138		hdmi_writeb(hdmi, 0xff, HDMI_I2CM_INT);
  2139		hdmi_writeb(hdmi, 0xff, HDMI_I2CM_CTLINT);
  2140	
  2141		/* Disable interrupts in the IH_MUTE_* registers */
  2142		hdmi_writeb(hdmi, 0xff, HDMI_IH_MUTE_FC_STAT0);
  2143		hdmi_writeb(hdmi, 0xff, HDMI_IH_MUTE_FC_STAT1);
  2144		hdmi_writeb(hdmi, 0xff, HDMI_IH_MUTE_FC_STAT2);
  2145		hdmi_writeb(hdmi, 0xff, HDMI_IH_MUTE_AS_STAT0);
  2146		hdmi_writeb(hdmi, 0xff, HDMI_IH_MUTE_PHY_STAT0);
  2147		hdmi_writeb(hdmi, 0xff, HDMI_IH_MUTE_I2CM_STAT0);
  2148		hdmi_writeb(hdmi, 0xff, HDMI_IH_MUTE_CEC_STAT0);
  2149		hdmi_writeb(hdmi, 0xff, HDMI_IH_MUTE_VP_STAT0);
  2150		hdmi_writeb(hdmi, 0xff, HDMI_IH_MUTE_I2CMPHY_STAT0);
  2151		hdmi_writeb(hdmi, 0xff, HDMI_IH_MUTE_AHBDMAAUD_STAT0);
  2152	
  2153		/* Enable top level interrupt bits in HDMI block */
  2154		ih_mute &= ~(HDMI_IH_MUTE_MUTE_WAKEUP_INTERRUPT |
  2155			    HDMI_IH_MUTE_MUTE_ALL_INTERRUPT);
  2156		hdmi_writeb(hdmi, ih_mute, HDMI_IH_MUTE);
  2157	
  2158		/* Unmask HDCP engaged interrupt */
  2159		if (hdmi->hdcp_support)
> 2160			hdmi_writeb(hdmi, (u8)~HDMI_A_APIINTSTAT_HDCP_ENGAGED,
  2161				    HDMI_A_APIINTMSK);
  2162	}
  2163	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
