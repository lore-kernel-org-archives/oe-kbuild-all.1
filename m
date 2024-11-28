Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.16])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 969801A08BC
	for <oe-kbuild-all@lists.linux.dev>; Thu, 28 Nov 2024 13:11:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.16
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1732799479; cv=none; b=N2qz+vLqiyVQSPv5lN3XYFv8kWBGmCNwkRcyl85Yz5PgzKK5ISJdalKKS4tz2U+WPoklhS5wbkZCJt8WId7iI95A8QYI6eoWBGlF5grJJvMEQBa4D8j5TaCyOxc4MzYPS1VXK3UgQDgFtv+dX+D6YnJ1mdH1huC1a1D2VgklVgI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1732799479; c=relaxed/simple;
	bh=w/PFMzZp6Y6m5gwwK/HSfPya01mFWtn/W+p1sibCfrg=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Yf6ghXaoo4lHTwZHTPWsm7hjpRv9P8SfIQBt88G65SldScjCcRZR8HgSl/OqFsoWM7+wBRtMc1zuxZAXJ98LuaUy7EsBLqtIHN+vqs0Zb0WXPkdPSgzcYEj1WOhZqpl7q5QS0xfCiCnMMD4pjInldykGSTEvUd/G5qzu2XI51/g=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=VortOaPC; arc=none smtp.client-ip=198.175.65.16
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="VortOaPC"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1732799478; x=1764335478;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=w/PFMzZp6Y6m5gwwK/HSfPya01mFWtn/W+p1sibCfrg=;
  b=VortOaPCKTXDDSxDJ9gIYiariKX0TJ+WjlVrBz9JD68hn8/yqKc6tEZp
   W2z5g+FwWDsPbPuapUl/RBtMtCXJE1CkC9hJ950HFXsYnl4u5anlsCaoQ
   wf0busHHx023gjV/N4ULi7sKKfE1VvptqbBS4rkhaRYn3WmpG1hdRThb1
   wzz6rhERq3TRF31jfCTKbItldzCIkW4K0s5w/68B2QeHhRh/7DtYKuoxg
   yuNiImbfbwH1YeQXi2WENLnKZP/qLquuQpLH4+hoQdywdmtHinzr0DEGL
   cr3uHOeRQII2TL2vAzFPmKAjbkHtfAQGlXiZ2WMmUrH8dXIO7jr6k4w2F
   Q==;
X-CSE-ConnectionGUID: wvWc5Nl/S1qbHF/TjWBgtA==
X-CSE-MsgGUID: aVuHb/hMRRGosgueATmcFw==
X-IronPort-AV: E=McAfee;i="6700,10204,11270"; a="33173913"
X-IronPort-AV: E=Sophos;i="6.12,192,1728975600"; 
   d="scan'208";a="33173913"
Received: from fmviesa007.fm.intel.com ([10.60.135.147])
  by orvoesa108.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 28 Nov 2024 05:11:18 -0800
X-CSE-ConnectionGUID: mk66Grx/RCyRKbN743VkcA==
X-CSE-MsgGUID: y46BxMjXTtOyIWcDtTH/3Q==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,192,1728975600"; 
   d="scan'208";a="92041171"
Received: from lkp-server01.sh.intel.com (HELO 8122d2fc1967) ([10.239.97.150])
  by fmviesa007.fm.intel.com with ESMTP; 28 Nov 2024 05:11:16 -0800
Received: from kbuild by 8122d2fc1967 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1tGeIb-0009bL-33;
	Thu, 28 Nov 2024 13:11:13 +0000
Date: Thu, 28 Nov 2024 21:10:51 +0800
From: kernel test robot <lkp@intel.com>
To: "Russell King (Oracle)" <rmk+kernel@armlinux.org.uk>
Cc: oe-kbuild-all@lists.linux.dev
Subject: Re: [PATCH RFC net-next 23/23] net: stmmac: convert to phylink
 managed EEE support
Message-ID: <202411282020.o7B4Gjt2-lkp@intel.com>
References: <E1tFv4y-005yjc-MG@rmk-PC.armlinux.org.uk>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <E1tFv4y-005yjc-MG@rmk-PC.armlinux.org.uk>

Hi Russell,

[This is a private test report for your RFC patch.]
kernel test robot noticed the following build errors:

[auto build test ERROR on net-next/main]

url:    https://github.com/intel-lab-lkp/linux/commits/Russell-King/net-phy-ensure-that-genphy_c45_an_config_eee_aneg-sees-new-value-of-phydev-eee_cfg-eee_enabled/20241128-140608
base:   net-next/main
patch link:    https://lore.kernel.org/r/E1tFv4y-005yjc-MG%40rmk-PC.armlinux.org.uk
patch subject: [PATCH RFC net-next 23/23] net: stmmac: convert to phylink managed EEE support
config: arm-spear13xx_defconfig (https://download.01.org/0day-ci/archive/20241128/202411282020.o7B4Gjt2-lkp@intel.com/config)
compiler: arm-linux-gnueabi-gcc (GCC) 14.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20241128/202411282020.o7B4Gjt2-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202411282020.o7B4Gjt2-lkp@intel.com/

All errors (new ones prefixed by >>):

>> drivers/net/ethernet/stmicro/stmmac/stmmac_main.c:1117:10: error: 'const struct phylink_mac_ops' has no member named 'mac_mac_enable_tx_lpi'; did you mean 'mac_enable_tx_lpi'?
    1117 |         .mac_mac_enable_tx_lpi = stmmac_mac_enable_tx_lpi,
         |          ^~~~~~~~~~~~~~~~~~~~~
         |          mac_enable_tx_lpi


vim +1117 drivers/net/ethernet/stmicro/stmmac/stmmac_main.c

  1109	
  1110	static const struct phylink_mac_ops stmmac_phylink_mac_ops = {
  1111		.mac_get_caps = stmmac_mac_get_caps,
  1112		.mac_select_pcs = stmmac_mac_select_pcs,
  1113		.mac_config = stmmac_mac_config,
  1114		.mac_link_down = stmmac_mac_link_down,
  1115		.mac_link_up = stmmac_mac_link_up,
  1116		.mac_disable_tx_lpi = stmmac_mac_disable_tx_lpi,
> 1117		.mac_mac_enable_tx_lpi = stmmac_mac_enable_tx_lpi,
  1118	};
  1119	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
