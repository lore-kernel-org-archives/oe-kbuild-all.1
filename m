Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.13])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0D05A48AE27
	for <oe-kbuild-all@lists.linux.dev>; Wed,  1 Jul 2026 12:26:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.13
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782908820; cv=none; b=H4u0AuZ1e6JjhZVTfQBoucO3VK8v0LNNS1W6b2ccNQdxWWn9BWW1iYGIYB1x99Sv9xjgwjVIlCKkj2f8s1yS1RvyzCy/Ossp56kwFvBztgdj/9kpzLGPHCfv6Nb/SL4o+Xf2kTyHgCU06jfnQCWVj/qoQSDtGiYI14YBoquCktg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782908820; c=relaxed/simple;
	bh=RPuJ7JWTdNwA1hMhTNfXDeh3vshHLXIkRz4jYP+Qgnc=;
	h=Date:From:To:Cc:Subject:Message-ID; b=LtWnTKjrzdXdv8gmdlszaFlWT1AwpSmloeASvKadr51USJ3WywQxvTtHZMLEF2n1ZSkUDUSoiu35X4daHvMbriFNYxYpPs7yEuaaRXsRMWdFhNJeAxf1A1d/u76vvln9yAOIWSnxBuDvfovKZycJaoeBOP/nomODRDY5Z20RwMs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=jf1o1v+3; arc=none smtp.client-ip=198.175.65.13
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="jf1o1v+3"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1782908819; x=1814444819;
  h=date:from:to:cc:subject:message-id;
  bh=RPuJ7JWTdNwA1hMhTNfXDeh3vshHLXIkRz4jYP+Qgnc=;
  b=jf1o1v+3ERXIB7GQzIVqMB393tUW/NamqhgwI20GdWYB0gh6c23dG6tj
   ZWuuucRj2eIAfhyDDXa6JpecrQCNuYLhgpqozsvvi819Ji6HTSQJNvrkx
   prAqWQtPbvrUzdSRY+0KQyfo3Ye5OVJnVv0LQeP5pDQ40aqZIA9xHDyW/
   0DRUBQm8VYLLEgH6WNZNAlHZ8cmzx+bwXlGwRbXmNp86jEh1pv/K/pxeS
   Ar3n3+jGJtdNH4tv6w13rVUIAADEdEK6rpb4Og0VmFGjVs9J6wLKEkQhN
   gbxyfK+sSur+fQX30ue0DU68dAzTsIqsZnUiKpB+xqEl8GKcElINZkB9s
   w==;
X-CSE-ConnectionGUID: VkebRaWeRhiEn4kThAF9xw==
X-CSE-MsgGUID: bqVHP7D9QPiApy5DQTng9Q==
X-IronPort-AV: E=McAfee;i="6800,10657,11833"; a="94795053"
X-IronPort-AV: E=Sophos;i="6.25,141,1779174000"; 
   d="scan'208";a="94795053"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
  by orvoesa105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 01 Jul 2026 05:26:58 -0700
X-CSE-ConnectionGUID: m0W9PcAFQsq/1nMbw1spUQ==
X-CSE-MsgGUID: oTskKynSShCV+k9Xd4c9Gw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,141,1779174000"; 
   d="scan'208";a="290676850"
Received: from lkp-server02.sh.intel.com (HELO ea128546eb3d) ([10.239.97.151])
  by orviesa001.jf.intel.com with ESMTP; 01 Jul 2026 05:26:58 -0700
Received: from kbuild by ea128546eb3d with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1weu0K-000000009GX-1Zb4;
	Wed, 01 Jul 2026 12:25:25 +0000
Date: Wed, 01 Jul 2026 20:25:15 +0800
From: kernel test robot <lkp@intel.com>
To: cros-kernel-buildreports@googlegroups.com
Cc: oe-kbuild-all@lists.linux.dev
Subject: [android-common:android14-kiwi-6.1 163/163]
 drivers/clk/mediatek/clk-mtk.c:502:2-3: Unneeded semicolon
Message-ID: <202607012046.iGlugHTe-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>

tree:   https://android.googlesource.com/kernel/common android14-kiwi-6.1
head:   7ea8561424f829e489de39c2eb31a398cc827369
commit: c1d87d56af063c87961511ee25f6b07a5676d27d [163/163] clk: mediatek: clk-mtk: Extend mtk_clk_simple_probe()
config: arm64-randconfig-r061-20260701 (https://download.01.org/0day-ci/archive/20260701/202607012046.iGlugHTe-lkp@intel.com/config)
compiler: aarch64-linux-gcc (GCC) 14.3.0

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202607012046.iGlugHTe-lkp@intel.com/

cocci warnings: (new ones prefixed by >>)
>> drivers/clk/mediatek/clk-mtk.c:502:2-3: Unneeded semicolon

vim +502 drivers/clk/mediatek/clk-mtk.c

   449	
   450	int mtk_clk_simple_probe(struct platform_device *pdev)
   451	{
   452		const struct mtk_clk_desc *mcd;
   453		struct clk_hw_onecell_data *clk_data;
   454		struct device_node *node = pdev->dev.of_node;
   455		void __iomem *base;
   456		int num_clks, r;
   457	
   458		mcd = of_device_get_match_data(&pdev->dev);
   459		if (!mcd)
   460			return -EINVAL;
   461	
   462		/* Composite clocks needs us to pass iomem pointer */
   463		if (mcd->composite_clks) {
   464			if (!mcd->shared_io)
   465				base = devm_platform_ioremap_resource(pdev, 0);
   466			else
   467				base = of_iomap(node, 0);
   468	
   469			if (IS_ERR_OR_NULL(base))
   470				return IS_ERR(base) ? PTR_ERR(base) : -ENOMEM;
   471		}
   472	
   473		/* Calculate how many clk_hw_onecell_data entries to allocate */
   474		num_clks = mcd->num_clks + mcd->num_composite_clks;
   475		num_clks += mcd->num_fixed_clks + mcd->num_factor_clks;
   476		num_clks += mcd->num_mux_clks;
   477	
   478		clk_data = mtk_alloc_clk_data(num_clks);
   479		if (!clk_data)
   480			return -ENOMEM;
   481	
   482		if (mcd->fixed_clks) {
   483			r = mtk_clk_register_fixed_clks(mcd->fixed_clks,
   484							mcd->num_fixed_clks, clk_data);
   485			if (r)
   486				goto free_data;
   487		}
   488	
   489		if (mcd->factor_clks) {
   490			r = mtk_clk_register_factors(mcd->factor_clks,
   491						     mcd->num_factor_clks, clk_data);
   492			if (r)
   493				goto unregister_fixed_clks;
   494		}
   495	
   496		if (mcd->mux_clks) {
   497			r = mtk_clk_register_muxes(&pdev->dev, mcd->mux_clks,
   498						   mcd->num_mux_clks, node,
   499						   mcd->clk_lock, clk_data);
   500			if (r)
   501				goto unregister_factors;
 > 502		};
   503	
   504		if (mcd->composite_clks) {
   505			/* We don't check composite_lock because it's optional */
   506			r = mtk_clk_register_composites(&pdev->dev,
   507							mcd->composite_clks,
   508							mcd->num_composite_clks,
   509							base, mcd->clk_lock, clk_data);
   510			if (r)
   511				goto unregister_muxes;
   512		}
   513	
   514		if (mcd->clks) {
   515			r = mtk_clk_register_gates(&pdev->dev, node, mcd->clks,
   516						   mcd->num_clks, clk_data);
   517			if (r)
   518				goto unregister_composites;
   519		}
   520	
   521		r = of_clk_add_hw_provider(node, of_clk_hw_onecell_get, clk_data);
   522		if (r)
   523			goto unregister_clks;
   524	
   525		platform_set_drvdata(pdev, clk_data);
   526	
   527		if (mcd->rst_desc) {
   528			r = mtk_register_reset_controller_with_dev(&pdev->dev,
   529								   mcd->rst_desc);
   530			if (r)
   531				goto unregister_clks;
   532		}
   533	
   534		return r;
   535	
   536	unregister_clks:
   537		if (mcd->clks)
   538			mtk_clk_unregister_gates(mcd->clks, mcd->num_clks, clk_data);
   539	unregister_composites:
   540		if (mcd->composite_clks)
   541			mtk_clk_unregister_composites(mcd->composite_clks,
   542						      mcd->num_composite_clks, clk_data);
   543	unregister_muxes:
   544		if (mcd->mux_clks)
   545			mtk_clk_unregister_muxes(mcd->mux_clks,
   546						 mcd->num_mux_clks, clk_data);
   547	unregister_factors:
   548		if (mcd->factor_clks)
   549			mtk_clk_unregister_factors(mcd->factor_clks,
   550						   mcd->num_factor_clks, clk_data);
   551	unregister_fixed_clks:
   552		if (mcd->fixed_clks)
   553			mtk_clk_unregister_fixed_clks(mcd->fixed_clks,
   554						      mcd->num_fixed_clks, clk_data);
   555	free_data:
   556		mtk_free_clk_data(clk_data);
   557		if (mcd->shared_io && base)
   558			iounmap(base);
   559		return r;
   560	}
   561	EXPORT_SYMBOL_GPL(mtk_clk_simple_probe);
   562	

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
