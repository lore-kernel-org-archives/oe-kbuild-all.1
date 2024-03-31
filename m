Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.16])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9987F1EA8D
	for <oe-kbuild-all@lists.linux.dev>; Sun, 31 Mar 2024 18:08:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.16
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1711908519; cv=none; b=f2V7JeLZOFopc1Y9kt/YF0sehWIJaIuZQOPineZkOwDhbGJLoIZhDCDMB8fBKX+mL+8HUHqtNRIp+9508yYJU5w3/Az5kw4rjToBdq0ny/4cqPIt9UZDsSJSuAf6wLUz+yAkJrafdLDZUOzQtbI175sdzwuDaZ/MjxCCHC0486I=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1711908519; c=relaxed/simple;
	bh=PsL4Os2zVJnMALvOlKVOitcZU+OFCe1dFDuQXv2hjAA=;
	h=Date:From:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=PIRie8IMJ/L92JZk4cDxwdKQYaEOvCvaFtCiKlBSIln/EdxfR6wqX4Zs3VTYuqnUFVpnLl4qh8Ahw4aX2vSiZkA2WzehB9qq47aXIEt++tfUYZkXhmthVnvFMhHjyVw/gNEOrbAVhjBlGmtp2HCZpDN736IJ03qWF2b5RmnGxm8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=Wl9iCQ6+; arc=none smtp.client-ip=198.175.65.16
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="Wl9iCQ6+"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1711908517; x=1743444517;
  h=date:from:cc:subject:message-id:mime-version;
  bh=PsL4Os2zVJnMALvOlKVOitcZU+OFCe1dFDuQXv2hjAA=;
  b=Wl9iCQ6+8PW7BWe2urjUJKS/5BYI70L1VvqX3CMzLMM0rLZxyCaqeg56
   A1iNB4AzoyhJp9iglrvrRV2Awf35P48ilRp2t6HoeEHlBr4IUxmH8eFgk
   8vQ6Q1BC08l5zAmka5SFoecmjZbhdcmL3njMTuYoP/znJN4PlbTNeCiVM
   AK67NrFXK2zjRuh/9h2U54AgUqMbss9wHbsfLR34YQMImpC60qHEnPA82
   pNSzwQBGHCh+SycMgcYUy8JLJr+310wF/m9cA7ePr4BrgF+SiRmiR5SaN
   SUM5zKDzjxG56+K8e8uZWrSqtEFHQMJAOBbaYAXQ5JHTtF3WDDSuQHr7d
   Q==;
X-CSE-ConnectionGUID: CCIBFHsWR22erkPJq4YKzQ==
X-CSE-MsgGUID: YPDtHWm9QDmeNgBKDctFlw==
X-IronPort-AV: E=McAfee;i="6600,9927,11030"; a="7167922"
X-IronPort-AV: E=Sophos;i="6.07,170,1708416000"; 
   d="scan'208";a="7167922"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
  by orvoesa108.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 31 Mar 2024 11:08:37 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,170,1708416000"; 
   d="scan'208";a="48478790"
Received: from lkp-server01.sh.intel.com (HELO 3d808bfd2502) ([10.239.97.150])
  by orviesa002.jf.intel.com with ESMTP; 31 Mar 2024 11:08:35 -0700
Received: from kbuild by 3d808bfd2502 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1rqzbc-0001KM-2t;
	Sun, 31 Mar 2024 18:08:32 +0000
Date: Mon, 1 Apr 2024 02:08:03 +0800
From: kernel test robot <lkp@intel.com>
Cc: oe-kbuild-all@lists.linux.dev, vigneshr@ti.com, nm@ti.com,
	Jai Luthra <j-luthra@ti.com>
Subject: [ti:ti-rt-linux-6.1.y-cicd 335/382]
 drivers/media/platform/cadence/cdns-csi2rx.c:224:undefined reference to
 `phy_mipi_dphy_get_default_config_for_hsclk'
Message-ID: <202404010237.QdzcLEji-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   git://git.ti.com/ti-linux-kernel/ti-linux-kernel.git ti-rt-linux-6.1.y-cicd
head:   01dbe4e64bacaa4c891c1997f2724c320698d61f
commit: abf5efa8c5ada91dc8d9c8adaa272e7792afaa17 [335/382] media: cadence: csi2rx: Support runtime PM
config: x86_64-randconfig-001-20240331 (https://download.01.org/0day-ci/archive/20240401/202404010237.QdzcLEji-lkp@intel.com/config)
compiler: gcc-11 (Ubuntu 11.4.0-4ubuntu1) 11.4.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240401/202404010237.QdzcLEji-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202404010237.QdzcLEji-lkp@intel.com/

All errors (new ones prefixed by >>):

   ld: drivers/media/platform/cadence/cdns-csi2rx.o: in function `csi2rx_configure_external_dphy':
>> drivers/media/platform/cadence/cdns-csi2rx.c:224:(.text+0x1eb): undefined reference to `phy_mipi_dphy_get_default_config_for_hsclk'


vim +224 drivers/media/platform/cadence/cdns-csi2rx.c

1fc3b37f34f69e Maxime Ripard  2018-05-04  208  
f892c1ab1a9175 Pratyush Yadav 2023-04-20  209  static int csi2rx_configure_external_dphy(struct csi2rx_priv *csi2rx)
f892c1ab1a9175 Pratyush Yadav 2023-04-20  210  {
f892c1ab1a9175 Pratyush Yadav 2023-04-20  211  	union phy_configure_opts opts = { };
f892c1ab1a9175 Pratyush Yadav 2023-04-20  212  	struct phy_configure_opts_mipi_dphy *cfg = &opts.mipi_dphy;
f892c1ab1a9175 Pratyush Yadav 2023-04-20  213  	const struct csi2rx_fmt *fmt;
f892c1ab1a9175 Pratyush Yadav 2023-04-20  214  	s64 link_freq;
f892c1ab1a9175 Pratyush Yadav 2023-04-20  215  	int ret;
f892c1ab1a9175 Pratyush Yadav 2023-04-20  216  
f892c1ab1a9175 Pratyush Yadav 2023-04-20  217  	fmt = csi2rx_get_fmt_by_code(csi2rx->fmt.code);
f892c1ab1a9175 Pratyush Yadav 2023-04-20  218  
f892c1ab1a9175 Pratyush Yadav 2023-04-20  219  	link_freq = v4l2_get_link_freq(csi2rx->source_subdev->ctrl_handler,
f892c1ab1a9175 Pratyush Yadav 2023-04-20  220  				       fmt->bpp, 2 * csi2rx->num_lanes);
f892c1ab1a9175 Pratyush Yadav 2023-04-20  221  	if (link_freq < 0)
f892c1ab1a9175 Pratyush Yadav 2023-04-20  222  		return link_freq;
f892c1ab1a9175 Pratyush Yadav 2023-04-20  223  
f892c1ab1a9175 Pratyush Yadav 2023-04-20 @224  	ret = phy_mipi_dphy_get_default_config_for_hsclk(link_freq,
f892c1ab1a9175 Pratyush Yadav 2023-04-20  225  							 csi2rx->num_lanes, cfg);
f892c1ab1a9175 Pratyush Yadav 2023-04-20  226  	if (ret)
f892c1ab1a9175 Pratyush Yadav 2023-04-20  227  		return ret;
f892c1ab1a9175 Pratyush Yadav 2023-04-20  228  
f892c1ab1a9175 Pratyush Yadav 2023-04-20  229  	ret = phy_power_on(csi2rx->dphy);
f892c1ab1a9175 Pratyush Yadav 2023-04-20  230  	if (ret)
f892c1ab1a9175 Pratyush Yadav 2023-04-20  231  		return ret;
f892c1ab1a9175 Pratyush Yadav 2023-04-20  232  
f892c1ab1a9175 Pratyush Yadav 2023-04-20  233  	ret = phy_configure(csi2rx->dphy, &opts);
f892c1ab1a9175 Pratyush Yadav 2023-04-20  234  	if (ret)
f892c1ab1a9175 Pratyush Yadav 2023-04-20  235  		phy_power_off(csi2rx->dphy);
f892c1ab1a9175 Pratyush Yadav 2023-04-20  236  
f892c1ab1a9175 Pratyush Yadav 2023-04-20  237  	return ret;
f892c1ab1a9175 Pratyush Yadav 2023-04-20  238  }
f892c1ab1a9175 Pratyush Yadav 2023-04-20  239  

:::::: The code at line 224 was first introduced by commit
:::::: f892c1ab1a9175a9d59ecd6e62654014937e72a5 media: cadence: csi2rx: Add external DPHY support

:::::: TO: Pratyush Yadav <p.yadav@ti.com>
:::::: CC: Vignesh Raghavendra <vigneshr@ti.com>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
