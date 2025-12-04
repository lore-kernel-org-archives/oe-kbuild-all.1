Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.10])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 16C0A398F99
	for <oe-kbuild-all@lists.linux.dev>; Thu,  4 Dec 2025 03:46:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.10
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1764820010; cv=none; b=T5WkKuUqW/WbAEroFmjtTIw5JnOMs1DohSGwYZy6DbuxJusSbbKO74WVYm30DvSoelzYPKiW2dqJCNNmzZAaBfz9IF1MUGeIpv4dntLmTz4PgGGE5qQSRv8kcVCMh/gH7dN/FOYnDtrSnn8FfX0yOsuh2MexgNiGmeNvY8lKvWI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1764820010; c=relaxed/simple;
	bh=33ddb2p6qIiFcoW5PIyZkTztobhHU8LwcaFQh4csL80=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=bkxVpgfw4EHgnwEkiz+nputkrl0HIL6ahbYz81uK+0LeHJ/+/60+CR/rEl7YauGAiQlykBswRMmo1aEJUZ3w9N68Ut7MRHPW9D5FdRtbZ2FtRzkMyeLOpMrmKfk6HQ7hO5vwoSI7l10xl6j9+alqC11t9oenecMjO7MoRMNx9Rs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=YmuQnZNN; arc=none smtp.client-ip=192.198.163.10
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="YmuQnZNN"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1764820009; x=1796356009;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=33ddb2p6qIiFcoW5PIyZkTztobhHU8LwcaFQh4csL80=;
  b=YmuQnZNNdxPVq/oaWLHoznsa62X3wdQVSElkdTxycwlnpTn+QCI+ABCQ
   7STJwkY8i8iLuDw+IxMu1oWHGU9QIOMEorJKfyqBOT+tyiTUI13bQDcJS
   yIyeYS6DldaGKPEKf1+45PWevN2VWUlO246jT+ATgrmKUB8t0RcIsT806
   e3Jz9p+LDYCFRZlRUcY4j47ubjKfe4pzpiMCGZ7mxKPj8ElIo4Ihmp9Xw
   pSL6LO9iGUR2NCz0wgCuk6raTIr0K74I2SAT7UINyoKyH/S27hrB3ULJs
   hX3jew0GxEFbN4M9Hp8XNVfL+etIOlVKidf6QsX00LEEJHRb3jcjaCELR
   w==;
X-CSE-ConnectionGUID: BKFIsVh5SoipS6NcRpOJgA==
X-CSE-MsgGUID: 5ch+AWmfSaeiqEAPDZFdFA==
X-IronPort-AV: E=McAfee;i="6800,10657,11631"; a="78183357"
X-IronPort-AV: E=Sophos;i="6.20,247,1758610800"; 
   d="scan'208";a="78183357"
Received: from fmviesa010.fm.intel.com ([10.60.135.150])
  by fmvoesa104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 03 Dec 2025 19:46:46 -0800
X-CSE-ConnectionGUID: s31R7qOqRESSdJ8579ThcA==
X-CSE-MsgGUID: SwdhtT97QZSpmyZLBb9aKQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.20,247,1758610800"; 
   d="scan'208";a="195665202"
Received: from lkp-server01.sh.intel.com (HELO 4664bbef4914) ([10.239.97.150])
  by fmviesa010.fm.intel.com with ESMTP; 03 Dec 2025 19:46:45 -0800
Received: from kbuild by 4664bbef4914 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vR0Il-00000000DPh-28lx;
	Thu, 04 Dec 2025 03:46:43 +0000
Date: Thu, 4 Dec 2025 11:46:02 +0800
From: kernel test robot <lkp@intel.com>
To: "Russell King (Oracle)" <rmk+kernel@armlinux.org.uk>
Cc: oe-kbuild-all@lists.linux.dev
Subject: Re: [PATCH RFC net-next 09/15] net: stmmac: rk: use rk_encode_wm16()
 for RMII clock
Message-ID: <202512041133.i4WHtm2k-lkp@intel.com>
References: <E1vQ5FQ-0000000GNwH-37za@rmk-PC.armlinux.org.uk>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <E1vQ5FQ-0000000GNwH-37za@rmk-PC.armlinux.org.uk>

Hi Russell,

[This is a private test report for your RFC patch.]
kernel test robot noticed the following build errors:

[auto build test ERROR on net-next/main]

url:    https://github.com/intel-lab-lkp/linux/commits/Russell-King-Oracle/net-stmmac-rk-add-GMAC_CLK_xx-constants-simplify-RGMII-definitions/20251202-025335
base:   net-next/main
patch link:    https://lore.kernel.org/r/E1vQ5FQ-0000000GNwH-37za%40rmk-PC.armlinux.org.uk
patch subject: [PATCH RFC net-next 09/15] net: stmmac: rk: use rk_encode_wm16() for RMII clock
config: i386-allyesconfig (https://download.01.org/0day-ci/archive/20251204/202512041133.i4WHtm2k-lkp@intel.com/config)
compiler: gcc-14 (Debian 14.2.0-19) 14.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20251204/202512041133.i4WHtm2k-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202512041133.i4WHtm2k-lkp@intel.com/

All errors (new ones prefixed by >>):

   drivers/net/ethernet/stmicro/stmmac/dwmac-rk.c:498:21: error: variable 'rk3308_reg_speed_data' has initializer but incomplete type
     498 | static const struct rk_reg_speed_data rk3308_reg_speed_data = {
         |                     ^~~~~~~~~~~~~~~~~
   drivers/net/ethernet/stmicro/stmmac/dwmac-rk.c: In function 'rk3308_set_speed':
   drivers/net/ethernet/stmicro/stmmac/dwmac-rk.c:504:43: error: incompatible type for argument 2 of 'rk_set_reg_speed'
     504 |         return rk_set_reg_speed(bsp_priv, &rk3308_reg_speed_data,
         |                                           ^~~~~~~~~~~~~~~~~~~~~~
         |                                           |
         |                                           const struct rk_reg_speed_data *
   drivers/net/ethernet/stmicro/stmmac/dwmac-rk.c:144:45: note: expected 'phy_interface_t' but argument is of type 'const struct rk_reg_speed_data *'
     144 |                             phy_interface_t interface, int speed)
         |                             ~~~~~~~~~~~~~~~~^~~~~~~~~
   drivers/net/ethernet/stmicro/stmmac/dwmac-rk.c:504:16: error: too many arguments to function 'rk_set_reg_speed'
     504 |         return rk_set_reg_speed(bsp_priv, &rk3308_reg_speed_data,
         |                ^~~~~~~~~~~~~~~~
   drivers/net/ethernet/stmicro/stmmac/dwmac-rk.c:143:12: note: declared here
     143 | static int rk_set_reg_speed(struct rk_priv_data *bsp_priv,
         |            ^~~~~~~~~~~~~~~~
   drivers/net/ethernet/stmicro/stmmac/dwmac-rk.c: In function 'rk3528_set_to_rmii':
>> drivers/net/ethernet/stmicro/stmmac/dwmac-rk.c:893:30: error: 'RK3528_GMAC0_CLK_RMII_DIV2' undeclared (first use in this function); did you mean 'RK3528_GMAC0_CLK_RMII_GATE'?
     893 |                              RK3528_GMAC0_CLK_RMII_DIV2);
         |                              ^~~~~~~~~~~~~~~~~~~~~~~~~~
         |                              RK3528_GMAC0_CLK_RMII_GATE
   drivers/net/ethernet/stmicro/stmmac/dwmac-rk.c:893:30: note: each undeclared identifier is reported only once for each function it appears in
   drivers/net/ethernet/stmicro/stmmac/dwmac-rk.c: At top level:
   drivers/net/ethernet/stmicro/stmmac/dwmac-rk.c:498:39: error: storage size of 'rk3308_reg_speed_data' isn't known
     498 | static const struct rk_reg_speed_data rk3308_reg_speed_data = {
         |                                       ^~~~~~~~~~~~~~~~~~~~~
   drivers/net/ethernet/stmicro/stmmac/dwmac-rk.c: In function 'rk3308_set_speed':
   drivers/net/ethernet/stmicro/stmmac/dwmac-rk.c:506:1: warning: control reaches end of non-void function [-Wreturn-type]
     506 | }
         | ^


vim +893 drivers/net/ethernet/stmicro/stmmac/dwmac-rk.c

1725f0eb37d621 David Wu 2025-03-19  884  
1725f0eb37d621 David Wu 2025-03-19  885  static void rk3528_set_to_rmii(struct rk_priv_data *bsp_priv)
1725f0eb37d621 David Wu 2025-03-19  886  {
1725f0eb37d621 David Wu 2025-03-19  887  	if (bsp_priv->id == 1)
1725f0eb37d621 David Wu 2025-03-19  888  		regmap_write(bsp_priv->grf, RK3528_VPU_GRF_GMAC_CON5,
1725f0eb37d621 David Wu 2025-03-19  889  			     RK3528_GMAC1_PHY_INTF_SEL_RMII);
1725f0eb37d621 David Wu 2025-03-19  890  	else
1725f0eb37d621 David Wu 2025-03-19  891  		regmap_write(bsp_priv->grf, RK3528_VO_GRF_GMAC_CON,
1725f0eb37d621 David Wu 2025-03-19  892  			     RK3528_GMAC0_PHY_INTF_SEL_RMII |
1725f0eb37d621 David Wu 2025-03-19 @893  			     RK3528_GMAC0_CLK_RMII_DIV2);
1725f0eb37d621 David Wu 2025-03-19  894  }
1725f0eb37d621 David Wu 2025-03-19  895  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
