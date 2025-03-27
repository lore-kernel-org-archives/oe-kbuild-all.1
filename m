Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.21])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id ED8CA1C8634
	for <oe-kbuild-all@lists.linux.dev>; Thu, 27 Mar 2025 21:04:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.21
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743109500; cv=none; b=t6f63B5Hw7tMCZMlvHsB2CEBl4h3o1NIkisyHJo9con3QEIYee9qZAZI9vVhQqpZ1uE19UGtriuTetU/NAOopxVw8ez4ZlWdhoYSq/eiaoQcyGFtNcoO0ZTBrnYbxJ3JhkrZcsZCmYsUTBTt8ldOReaSsLoiuaGNdSlXiShwJQs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743109500; c=relaxed/simple;
	bh=0jm4SOCqqfVIZ1NKuUZ+TtWMLZJ6vIdt+IpzDGZWHR0=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=DljUGeoax0mfNwM6A9kJmRlU7mgm9blmWXGJp/DYZouwMgLAPWaNLnlVPbpFlD0ieFYabfFj8p2TJg7FeQNz/5DNOyQZgwFUyOcWxHy+GQhy5TZA/oCelGFiQ34sNgeH3z0u0yEVEn58Qq5glJqcht4DjKE9s+qkR+IZcQHQOu8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=iCiwxL4E; arc=none smtp.client-ip=198.175.65.21
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="iCiwxL4E"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1743109498; x=1774645498;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=0jm4SOCqqfVIZ1NKuUZ+TtWMLZJ6vIdt+IpzDGZWHR0=;
  b=iCiwxL4EumUZXxeqyg2wKQ2J0KE408Oo+dBxiWUX75oi4E9GOFxBBO68
   24UDAH8LBsxd4QueJz3Ffz4+vWVzti04Cc5WNhieWQlspkjl9ub8HlrXY
   iQEwAeOnClUrnQGw6cAtotBmfYOp0WWs6S7kJuuws70egD/IgILDzmbi2
   MfbCa7ytX3XkgXOjyEb41yy4eTEsUoejYVERu6Bzef2morQZrWcHPteAn
   znwpX80vSSxgQZYdiebwDOSUcGryqzAsi8ruqflI9CMtPyOiYKhzzwOGD
   dv44wjkqiDbjemUl0HrFsOjhkSOYsF1Eb9VtaUicggS+Aq8GlnHLdVQRK
   w==;
X-CSE-ConnectionGUID: mYiz2dG3QkahEzsNBQ03ig==
X-CSE-MsgGUID: Y4T9I3StRkGxpmkmNegQzA==
X-IronPort-AV: E=McAfee;i="6700,10204,11385"; a="44381427"
X-IronPort-AV: E=Sophos;i="6.14,281,1736841600"; 
   d="scan'208";a="44381427"
Received: from fmviesa009.fm.intel.com ([10.60.135.149])
  by orvoesa113.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 27 Mar 2025 14:04:57 -0700
X-CSE-ConnectionGUID: eefJf67dR9+2HBpx+qdr3Q==
X-CSE-MsgGUID: VeyfkMcWSwiMs8rVStvKmA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.14,281,1736841600"; 
   d="scan'208";a="126064391"
Received: from lkp-server02.sh.intel.com (HELO e98e3655d6d2) ([10.239.97.151])
  by fmviesa009.fm.intel.com with ESMTP; 27 Mar 2025 14:04:57 -0700
Received: from kbuild by e98e3655d6d2 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1txuPG-0006xP-12;
	Thu, 27 Mar 2025 21:04:54 +0000
Date: Fri, 28 Mar 2025 05:04:53 +0800
From: kernel test robot <lkp@intel.com>
To: Marek Vasut <marek.vasut+renesas@mailbox.org>
Cc: oe-kbuild-all@lists.linux.dev,
	Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
Subject: [morimoto:sound-msiof-2025-03-26-2 5/25]
 drivers/pci/controller/dwc/pcie-rcar-gen4.c:207 rcar_gen4_pcie_common_init()
 warn: inconsistent indenting
Message-ID: <202503280403.Fc5yg5uk-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://github.com/morimoto/linux sound-msiof-2025-03-26-2
head:   2518ccf64c65482b415e5a831057998bfe2bda1d
commit: 36ce57f993eaf28cad2f7a37cd32d7563d4716e4 [5/25] FIXME: Special PCIe post-reset delay
config: microblaze-randconfig-r073-20250328 (https://download.01.org/0day-ci/archive/20250328/202503280403.Fc5yg5uk-lkp@intel.com/config)
compiler: microblaze-linux-gcc (GCC) 12.4.0

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202503280403.Fc5yg5uk-lkp@intel.com/

New smatch warnings:
drivers/pci/controller/dwc/pcie-rcar-gen4.c:207 rcar_gen4_pcie_common_init() warn: inconsistent indenting

Old smatch warnings:
drivers/pci/controller/dwc/pcie-rcar-gen4.c:212 rcar_gen4_pcie_common_init() warn: inconsistent indenting

vim +207 drivers/pci/controller/dwc/pcie-rcar-gen4.c

   172	
   173	static int rcar_gen4_pcie_common_init(struct rcar_gen4_pcie *rcar)
   174	{
   175		struct dw_pcie *dw = &rcar->dw;
   176		u32 val;
   177		int ret;
   178	
   179		ret = clk_bulk_prepare_enable(DW_PCIE_NUM_CORE_CLKS, dw->core_clks);
   180		if (ret) {
   181			dev_err(dw->dev, "Enabling core clocks failed\n");
   182			return ret;
   183		}
   184	
   185		if (!reset_control_status(dw->core_rsts[DW_PCIE_PWR_RST].rstc))
   186			reset_control_assert(dw->core_rsts[DW_PCIE_PWR_RST].rstc);
   187	
   188		val = readl(rcar->base + PCIEMSR0);
   189		if (rcar->drvdata->mode == DW_PCIE_RC_TYPE) {
   190			val |= DEVICE_TYPE_RC;
   191		} else if (rcar->drvdata->mode == DW_PCIE_EP_TYPE) {
   192			val |= DEVICE_TYPE_EP;
   193		} else {
   194			ret = -EINVAL;
   195			goto err_unprepare;
   196		}
   197	
   198		if (dw->num_lanes < 4)
   199			val |= BIFUR_MOD_SET_ON;
   200	
   201		writel(val, rcar->base + PCIEMSR0);
   202	
   203		ret = reset_control_deassert(dw->core_rsts[DW_PCIE_PWR_RST].rstc);
   204		if (ret)
   205			goto err_unprepare;
   206	
 > 207	mdelay(100);
   208	
   209		if (rcar->drvdata->additional_common_init)
   210			rcar->drvdata->additional_common_init(rcar);
   211	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
