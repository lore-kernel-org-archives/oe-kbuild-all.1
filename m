Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.16])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D35E71E520
	for <oe-kbuild-all@lists.linux.dev>; Tue, 17 Sep 2024 19:42:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.16
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1726602157; cv=none; b=HXDDxOZULxAiAXySdGUrsluPEGXoQPC7uyui6F5MEb7eQEwQdPikgCQ+hatlchGRXeFKA5O/BJIrndcMRiQzsqB3J3RXViIDfOv4m8ChUHjdncWFJlkDhM8lb4DBXL3fYGp0Jh3Fa62OEbygpfZsQMdlpGLBqWOt5ucBVypGLHQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1726602157; c=relaxed/simple;
	bh=smcrznbCh9Exh4+ZEGlX0B1lYeEzq/+qXwt7ADQgp3A=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=u2q2YM6VPeE4K251Mw+3o/CRVDKz8JTq0JKKmWkMeI2uBJeEOe2+xMiK0TX8+vGWD/YYnvMsjdfcSypbtGNePZWpzGVbgz6fwbxZvFdi11mC5/dl3iAYOJGU++2U8xkMmHrRiv3+BXEOarmcRIt9C635qtpInO5FJAOo9DaxGzE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=n536a77I; arc=none smtp.client-ip=192.198.163.16
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="n536a77I"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1726602156; x=1758138156;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=smcrznbCh9Exh4+ZEGlX0B1lYeEzq/+qXwt7ADQgp3A=;
  b=n536a77IGRnc4aKxb071M0X21mJKmmE8l60qbL8T+Kjs+kWx9rRAK/Xb
   vXhH5hX55VPdW8+xTopTsbwNlDd2frymsXmdwlTCm9ohpGcf47FCCfBMt
   Ud3k3q5jpMI0+bY70Vl9s+rcPgBVZ1OJgJ9foTOx1QcxlJEXiUK4lodGS
   pVb9IUoYSai1Mn2K36NflXNdvIFOxI9PGBk4Nyoj/CMEv+1SP2Rwnf63k
   c1DTWWamUGav5p6zPuacz6SV/o7ULSokJxgQMnlyczJ7VhAE8l4eJsmLY
   I5gZtCutVq2nTQqIgSsd+La9OsGNpvDRxRDXMk+x5NmImTtnn7k6RwZW+
   A==;
X-CSE-ConnectionGUID: yGP1hKt5TqeJTu9DNI+C8w==
X-CSE-MsgGUID: GGP2ecwBTHyzTAHXnHmffg==
X-IronPort-AV: E=McAfee;i="6700,10204,11198"; a="13562475"
X-IronPort-AV: E=Sophos;i="6.10,235,1719903600"; 
   d="scan'208";a="13562475"
Received: from orviesa009.jf.intel.com ([10.64.159.149])
  by fmvoesa110.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 17 Sep 2024 12:42:34 -0700
X-CSE-ConnectionGUID: Mg4ZrhAHRGiZg0PPDvlm1A==
X-CSE-MsgGUID: n+7y2UoFQE+zvVh3RO4uwg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.10,235,1719903600"; 
   d="scan'208";a="69291070"
Received: from lkp-server01.sh.intel.com (HELO 53e96f405c61) ([10.239.97.150])
  by orviesa009.jf.intel.com with ESMTP; 17 Sep 2024 12:42:32 -0700
Received: from kbuild by 53e96f405c61 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1sqe5m-000BTa-1i;
	Tue, 17 Sep 2024 19:42:30 +0000
Date: Wed, 18 Sep 2024 03:41:36 +0800
From: kernel test robot <lkp@intel.com>
To: Cristian Ciocaltea <cristian.ciocaltea@collabora.com>
Cc: oe-kbuild-all@lists.linux.dev,
	Linux Memory Management List <linux-mm@kvack.org>,
	Vinod Koul <vkoul@kernel.org>
Subject: [linux-next:master 2212/12283]
 drivers/phy/rockchip/phy-rockchip-samsung-hdptx.c:1031:undefined reference
 to `__clk_get_name'
Message-ID: <202409180305.53PXymZn-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git master
head:   4f3e012d4cfd1d9bf837870c961f462ca9f23ebe
commit: c4b09c562086f32588d962d30d0b7e93fe3e7cbb [2212/12283] phy: phy-rockchip-samsung-hdptx: Add clock provider support
config: m68k-randconfig-r064-20240801 (https://download.01.org/0day-ci/archive/20240918/202409180305.53PXymZn-lkp@intel.com/config)
compiler: m68k-linux-gcc (GCC) 13.3.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240918/202409180305.53PXymZn-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202409180305.53PXymZn-lkp@intel.com/

All errors (new ones prefixed by >>):

   m68k-linux-ld: drivers/phy/rockchip/phy-rockchip-samsung-hdptx.o: in function `rk_hdptx_phy_clk_register':
>> drivers/phy/rockchip/phy-rockchip-samsung-hdptx.c:1031:(.text+0x470): undefined reference to `__clk_get_name'
>> m68k-linux-ld: drivers/phy/rockchip/phy-rockchip-samsung-hdptx.c:1036:(.text+0x4ba): undefined reference to `devm_clk_hw_register'
>> m68k-linux-ld: drivers/phy/rockchip/phy-rockchip-samsung-hdptx.c:1040:(.text+0x4d2): undefined reference to `of_clk_hw_simple_get'
>> m68k-linux-ld: drivers/phy/rockchip/phy-rockchip-samsung-hdptx.c:1040:(.text+0x4da): undefined reference to `devm_of_clk_add_hw_provider'


vim +1031 drivers/phy/rockchip/phy-rockchip-samsung-hdptx.c

  1016	
  1017	static int rk_hdptx_phy_clk_register(struct rk_hdptx_phy *hdptx)
  1018	{
  1019		struct device *dev = hdptx->dev;
  1020		const char *name, *pname;
  1021		struct clk *refclk;
  1022		int ret, id;
  1023	
  1024		refclk = devm_clk_get(dev, "ref");
  1025		if (IS_ERR(refclk))
  1026			return dev_err_probe(dev, PTR_ERR(refclk),
  1027					     "Failed to get ref clock\n");
  1028	
  1029		id = of_alias_get_id(dev->of_node, "hdptxphy");
  1030		name = id > 0 ? "clk_hdmiphy_pixel1" : "clk_hdmiphy_pixel0";
> 1031		pname = __clk_get_name(refclk);
  1032	
  1033		hdptx->hw.init = CLK_HW_INIT(name, pname, &hdptx_phy_clk_ops,
  1034					     CLK_GET_RATE_NOCACHE);
  1035	
> 1036		ret = devm_clk_hw_register(dev, &hdptx->hw);
  1037		if (ret)
  1038			return dev_err_probe(dev, ret, "Failed to register clock\n");
  1039	
> 1040		ret = devm_of_clk_add_hw_provider(dev, of_clk_hw_simple_get, &hdptx->hw);
  1041		if (ret)
  1042			return dev_err_probe(dev, ret,
  1043					     "Failed to register clk provider\n");
  1044		return 0;
  1045	}
  1046	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
