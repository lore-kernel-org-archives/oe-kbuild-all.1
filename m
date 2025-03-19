Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.10])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 845F120AF78
	for <oe-kbuild-all@lists.linux.dev>; Wed, 19 Mar 2025 18:31:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.10
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1742409107; cv=none; b=gLYIYmqBxUsx25X1BdOsEsTRPiRW36eHQHPYD476DeEjnUAYiDnN5h2oa4FLYoWoz26Nn/qvLiPa6NSWI878vh+fJhJG2K7DUe9+YrgsD1GaEZ4KwPt06LuF6Mx+BgWXy/aIoF0PAgoq0U4F83ItXPvNx+BtdoME749gWf/oAmo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1742409107; c=relaxed/simple;
	bh=L5Iwrj7nj39EP2MOSWzeT/LiVK4+eFVjy5gDzPEekZA=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=UmDI2W86HReMKWm5vX090nF9f2Loi1q2x7qLIjy1mYxvHqDpn9zx3s36J5T8qmXFPEaEnXvZkaTPoqIJJvPo3vV3RpY8kQyJiM0jdzLOV8hwr+AKttYpmkAkTVaFwa6wqQy3ySEfIl77x0zKyPU6gOqzB5pcbVlWtwbz7y2WnOY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=MQ3ZCQqf; arc=none smtp.client-ip=198.175.65.10
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="MQ3ZCQqf"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1742409106; x=1773945106;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=L5Iwrj7nj39EP2MOSWzeT/LiVK4+eFVjy5gDzPEekZA=;
  b=MQ3ZCQqfQLasJfsTmXWnrPu6WE75tTv7aopXIjSspWc8yNt0IWC4EbIO
   trSoAS5nKTJXks8hce8cDgCAFRQpS5TN1lDY7T6eRnTP7HEBob4EL/eKV
   Y1pHf/uH/7fRYP4Y9IRoF25EpD0Pen+XLoqU7JMqpLqFQAe+wxfukD9RW
   21KFeJKnmbg5I6qWb0AHOJmDYDKnyjTmot9xsnDgw3ew3cxwUu+3r9Bz8
   TXtavL/M1JUYuhaTMzSrYH0dOw8jpX2MDqwLArtPigXQ8JzIBUy1TwL+t
   Okd6Lnrl6tv5bC7ZKkgr6hRxdhUQAvpGmrfjR920x4Cwb6FpqpZj68qzo
   A==;
X-CSE-ConnectionGUID: VhRdRCMaTDOsGCZB97/zHQ==
X-CSE-MsgGUID: xle5g0V2TwOeaMdV9DIOww==
X-IronPort-AV: E=McAfee;i="6700,10204,11378"; a="61010917"
X-IronPort-AV: E=Sophos;i="6.14,259,1736841600"; 
   d="scan'208";a="61010917"
Received: from fmviesa004.fm.intel.com ([10.60.135.144])
  by orvoesa102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 19 Mar 2025 11:31:46 -0700
X-CSE-ConnectionGUID: XVHcttv8QLqk6z57OW9imw==
X-CSE-MsgGUID: AiYHT9Z9SCyG0TQ4vG67kg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.14,259,1736841600"; 
   d="scan'208";a="127824689"
Received: from lkp-server02.sh.intel.com (HELO a4747d147074) ([10.239.97.151])
  by fmviesa004.fm.intel.com with ESMTP; 19 Mar 2025 11:31:40 -0700
Received: from kbuild by a4747d147074 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1tuyCY-000FbC-15;
	Wed, 19 Mar 2025 18:31:38 +0000
Date: Thu, 20 Mar 2025 02:30:45 +0800
From: kernel test robot <lkp@intel.com>
To: Prabhakar <prabhakar.csengg@gmail.com>,
	Andrew Lunn <andrew+netdev@lunn.ch>,
	"David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@google.com>,
	Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Philipp Zabel <p.zabel@pengutronix.de>,
	Geert Uytterhoeven <geert+renesas@glider.be>,
	Magnus Damm <magnus.damm@gmail.com>,
	"Russell King (Oracle)" <rmk+kernel@armlinux.org.uk>,
	Giuseppe Cavallaro <peppe.cavallaro@st.com>,
	Jose Abreu <joabreu@synopsys.com>
Cc: oe-kbuild-all@lists.linux.dev, netdev@vger.kernel.org,
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
	linux-renesas-soc@vger.kernel.org,
	Prabhakar <prabhakar.csengg@gmail.com>,
	Biju Das <biju.das.jz@bp.renesas.com>,
	Fabrizio Castro <fabrizio.castro.jz@renesas.com>,
	Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
Subject: Re: [PATCH net-next v4 3/3] net: stmmac: Add DWMAC glue layer for
 Renesas GBETH
Message-ID: <202503200200.WXMnn3Kq-lkp@intel.com>
References: <20250318205735.122590-4-prabhakar.mahadev-lad.rj@bp.renesas.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250318205735.122590-4-prabhakar.mahadev-lad.rj@bp.renesas.com>

Hi Prabhakar,

kernel test robot noticed the following build errors:

[auto build test ERROR on net-next/main]

url:    https://github.com/intel-lab-lkp/linux/commits/Prabhakar/dt-bindings-net-dwmac-Increase-maxItems-for-interrupts-and-interrupt-names/20250319-050021
base:   net-next/main
patch link:    https://lore.kernel.org/r/20250318205735.122590-4-prabhakar.mahadev-lad.rj%40bp.renesas.com
patch subject: [PATCH net-next v4 3/3] net: stmmac: Add DWMAC glue layer for Renesas GBETH
config: m68k-allmodconfig (https://download.01.org/0day-ci/archive/20250320/202503200200.WXMnn3Kq-lkp@intel.com/config)
compiler: m68k-linux-gcc (GCC) 8.5.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250320/202503200200.WXMnn3Kq-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202503200200.WXMnn3Kq-lkp@intel.com/

All errors (new ones prefixed by >>):

   drivers/net/ethernet/stmicro/stmmac/dwmac-renesas-gbeth.c: In function 'renesas_gbeth_probe':
>> drivers/net/ethernet/stmicro/stmmac/dwmac-renesas-gbeth.c:125:7: error: 'STMMAC_FLAG_EN_TX_LPI_CLK_PHY_CAP' undeclared (first use in this function); did you mean 'STMMAC_FLAG_EN_TX_LPI_CLOCKGATING'?
          STMMAC_FLAG_EN_TX_LPI_CLK_PHY_CAP |
          ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
          STMMAC_FLAG_EN_TX_LPI_CLOCKGATING
   drivers/net/ethernet/stmicro/stmmac/dwmac-renesas-gbeth.c:125:7: note: each undeclared identifier is reported only once for each function it appears in


vim +125 drivers/net/ethernet/stmicro/stmmac/dwmac-renesas-gbeth.c

    72	
    73	static int renesas_gbeth_probe(struct platform_device *pdev)
    74	{
    75		struct plat_stmmacenet_data *plat_dat;
    76		struct stmmac_resources stmmac_res;
    77		struct device *dev = &pdev->dev;
    78		struct renesas_gbeth *gbeth;
    79		unsigned int i;
    80		int err;
    81	
    82		err = stmmac_get_platform_resources(pdev, &stmmac_res);
    83		if (err)
    84			return dev_err_probe(dev, err,
    85					     "failed to get resources\n");
    86	
    87		plat_dat = devm_stmmac_probe_config_dt(pdev, stmmac_res.mac);
    88		if (IS_ERR(plat_dat))
    89			return dev_err_probe(dev, PTR_ERR(plat_dat),
    90					     "dt configuration failed\n");
    91	
    92		gbeth = devm_kzalloc(dev, sizeof(*gbeth), GFP_KERNEL);
    93		if (!gbeth)
    94			return -ENOMEM;
    95	
    96		plat_dat->num_clks = ARRAY_SIZE(renesas_gbeth_clks);
    97		plat_dat->clks = devm_kcalloc(dev, plat_dat->num_clks,
    98					      sizeof(*plat_dat->clks), GFP_KERNEL);
    99		if (!plat_dat->clks)
   100			return -ENOMEM;
   101	
   102		for (i = 0; i < plat_dat->num_clks; i++)
   103			plat_dat->clks[i].id = renesas_gbeth_clks[i];
   104	
   105		err = devm_clk_bulk_get(dev, plat_dat->num_clks, plat_dat->clks);
   106		if (err < 0)
   107			return err;
   108	
   109		plat_dat->clk_tx_i = renesas_gbeth_find_clk(plat_dat, "tx");
   110		if (!plat_dat->clk_tx_i)
   111			return dev_err_probe(dev, -EINVAL,
   112					     "error finding tx clock\n");
   113	
   114		gbeth->rstc = devm_reset_control_get_exclusive(dev, NULL);
   115		if (IS_ERR(gbeth->rstc))
   116			return PTR_ERR(gbeth->rstc);
   117	
   118		gbeth->dev = dev;
   119		gbeth->regs = stmmac_res.addr;
   120		gbeth->plat_dat = plat_dat;
   121		plat_dat->bsp_priv = gbeth;
   122		plat_dat->set_clk_tx_rate = stmmac_set_clk_tx_rate;
   123		plat_dat->clks_config = renesas_gbeth_clks_config;
   124		plat_dat->flags |= STMMAC_FLAG_HWTSTAMP_CORRECT_LATENCY |
 > 125				   STMMAC_FLAG_EN_TX_LPI_CLK_PHY_CAP |
   126				   STMMAC_FLAG_SPH_DISABLE;
   127	
   128		err = renesas_gbeth_clks_config(gbeth, true);
   129		if (err)
   130			return err;
   131	
   132		err = stmmac_dvr_probe(dev, plat_dat, &stmmac_res);
   133		if (err)
   134			renesas_gbeth_clks_config(gbeth, false);
   135	
   136		return err;
   137	}
   138	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
