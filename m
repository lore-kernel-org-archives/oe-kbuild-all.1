Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A10E93A7F41
	for <oe-kbuild-all@lists.linux.dev>; Thu, 25 Jun 2026 16:37:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.17
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782405477; cv=none; b=AqEVBdoyfnraS4oPgaTaGSgT4A+LKghNpEc85+umT094/hS8ENPHjHmKFIZvVlzitlazoG0Mzwaw79naJ9QtFPnJm0oXyUPatODIH7uQuFjwTrmn30ew65CBZXUZ03Aj7T3EEfzQzObG+IhRAqxkdN6z1E785fsQYZUjPQLzIeo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782405477; c=relaxed/simple;
	bh=W++hp/6nPL1+esyF78/2CLYLXPwJbZnSEO/WO4afs/o=;
	h=Date:From:To:Cc:Subject:Message-ID; b=G0GwNl7IdHoUf6FuIS3Va3nWHDLjhpGgaTgdzV1/6i0QCjqicuat7o5mVwrptk7fMxRXwZpFLxtXzE+iIGuMjKfsWWhl+jYpONyDpxpOgi5lWvVx+oJIt9NYR+0ObfHArV4vAFhbYmRq0+mzZ1B5/HfX3bLs0qbclrEbirpjhEM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=ASa3fF32; arc=none smtp.client-ip=198.175.65.17
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="ASa3fF32"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1782405475; x=1813941475;
  h=date:from:to:cc:subject:message-id;
  bh=W++hp/6nPL1+esyF78/2CLYLXPwJbZnSEO/WO4afs/o=;
  b=ASa3fF32jqoRrDo2GNwgb3JyW8cIBWwkMb2dQHbDyubJIqUaFCTiXtue
   DhueKcdZFctm0naP5MS3kXgK16xGdGLyg1Tvj8oMdL7/QVt5YaBf6kEGb
   AGTK+WYTwWYi64rbhYEg85SDsFjB6ekLkzGoyiI7TcgGpUYktqWzPbFhR
   n5wPg2Hyspq3zwFyv9hg5BVf3A2PdIOwtgxqaWBwPlXTyJUQwcm63+tGn
   /M2gsfPhjyPf7b6iRuioVZTNg5TjacMa6iCetG5wdRmcEcrOKSTL6/aVi
   yI0+cOl1ap/MQ597Gu3sO/ZAoDJmqiXmY0t4MMP2ZrULqehODlFmWe9sf
   g==;
X-CSE-ConnectionGUID: YFz6iA9OTvSPjzKLjc0iIw==
X-CSE-MsgGUID: 8usHDIc8Sw+DQbeObg/17g==
X-IronPort-AV: E=McAfee;i="6800,10657,11828"; a="83189297"
X-IronPort-AV: E=Sophos;i="6.24,224,1774335600"; 
   d="scan'208";a="83189297"
Received: from fmviesa007.fm.intel.com ([10.60.135.147])
  by orvoesa109.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 25 Jun 2026 09:37:53 -0700
X-CSE-ConnectionGUID: xDHv9Uv2SoWluGV07jcAhw==
X-CSE-MsgGUID: w8K3XZ1sS9iyp9hHqaL5jw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.24,224,1774335600"; 
   d="scan'208";a="247591553"
Received: from lkp-server02.sh.intel.com (HELO ea128546eb3d) ([10.239.97.151])
  by fmviesa007.fm.intel.com with ESMTP; 25 Jun 2026 09:37:51 -0700
Received: from kbuild by ea128546eb3d with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1wcn5I-000000004JF-3XyV;
	Thu, 25 Jun 2026 16:37:48 +0000
Date: Fri, 26 Jun 2026 00:37:42 +0800
From: kernel test robot <lkp@intel.com>
To: Conor Dooley <conor.dooley@microchip.com>
Cc: oe-kbuild-all@lists.linux.dev, linux-kernel@vger.kernel.org,
 Philipp Zabel <p.zabel@pengutronix.de>
Subject: drivers/clk/microchip/clk-mpfs.c:505:60: sparse: sparse:
 incorrect type in argument 2 (different address spaces)
Message-ID: <202606260045.CSWcl6Fm-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git master
head:   ab9de95c9cf952332ab79453b4b5d1bfca8e514f
commit: 781f60e45bdfe351aad692ac0fa89e36f8bf4a36 reset: mpfs: add non-auxiliary bus probing
date:   8 months ago
config: sparc-randconfig-r131-20260625 (https://download.01.org/0day-ci/archive/20260626/202606260045.CSWcl6Fm-lkp@intel.com/config)
compiler: sparc64-linux-gcc (GCC) 14.3.0
sparse: v0.6.5-rc1
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260626/202606260045.CSWcl6Fm-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Fixes: 781f60e45bdf ("reset: mpfs: add non-auxiliary bus probing")
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202606260045.CSWcl6Fm-lkp@intel.com/

sparse warnings: (new ones prefixed by >>)
>> drivers/clk/microchip/clk-mpfs.c:505:60: sparse: sparse: incorrect type in argument 2 (different address spaces) @@     expected void [noderef] __iomem *base @@     got struct regmap *regmap @@
   drivers/clk/microchip/clk-mpfs.c:505:60: sparse:     expected void [noderef] __iomem *base
   drivers/clk/microchip/clk-mpfs.c:505:60: sparse:     got struct regmap *regmap

vim +505 drivers/clk/microchip/clk-mpfs.c

   485	
   486	static inline int mpfs_clk_old_format_probe(struct mpfs_clock_data *clk_data,
   487						    struct platform_device *pdev)
   488	{
   489		struct device *dev = &pdev->dev;
   490	
   491		dev_warn(&pdev->dev, "falling back to old devicetree format");
   492	
   493		clk_data->base = devm_platform_ioremap_resource(pdev, 0);
   494		if (IS_ERR(clk_data->base))
   495			return PTR_ERR(clk_data->base);
   496	
   497		clk_data->msspll_base = devm_platform_ioremap_resource(pdev, 1);
   498		if (IS_ERR(clk_data->msspll_base))
   499			return PTR_ERR(clk_data->msspll_base);
   500	
   501		clk_data->regmap = devm_regmap_init_mmio(dev, clk_data->base, &mpfs_clk_regmap_config);
   502		if (IS_ERR(clk_data->regmap))
   503			return PTR_ERR(clk_data->regmap);
   504	
 > 505		return mpfs_reset_controller_register(dev, clk_data->regmap);
   506	}
   507	

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
