Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CBE563A5E7D
	for <oe-kbuild-all@lists.linux.dev>; Thu,  5 Mar 2026 13:57:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.17
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772719028; cv=none; b=L/wkcazl1DoznUXYVaJQJ8BwfZiQoTJsYlRFnPMVmY4wqVgqbjRCy3G5Y13S/San4l/U1u+MpPh9hSp8514TRxoILtjNsSDJPsgpvfjO8g5EPCBQWFrTSLc07GXnb1OYwxABoG9/4hA30cO0swfK0PMJLy9ebqiwT54+G4yIwzY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772719028; c=relaxed/simple;
	bh=poGK/GShrrB4V3g54WLVcWMToHkSf+Zwx4XTf2hdksQ=;
	h=Date:From:To:Cc:Subject:Message-ID; b=sU7K+lkOyT621Pvo37bMFoZR/ZbARCXUGn6UumTO5iQaEbOTeUHaKxAhAK8R3PRv0C3bFUsaSHAxyAQSfcwKGZyPXAtm3impC/BMmn7GUsnp4qNmSYqsTnX8tH5+W7kSUxlpnv+RJshICzvVuxiDWPhmdGKnMKQn02vTnlZK31c=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=DlHGMYut; arc=none smtp.client-ip=192.198.163.17
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="DlHGMYut"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1772719027; x=1804255027;
  h=date:from:to:cc:subject:message-id;
  bh=poGK/GShrrB4V3g54WLVcWMToHkSf+Zwx4XTf2hdksQ=;
  b=DlHGMYutHrz/4y/XGnIHikZ+ovIhoA9zgkMVGjz4HGVNz1IOnoGrF2xE
   ryodTIaqSxS5/VwYgKe0hpqRTB3eJrfd2cv4iAgDpiE8MIObNYYrdsK1k
   Jw8eXR3hZGIgj7yuxecRe47j1bG/ZXfCO5U15xozptqHCBDuhNRtZwAWj
   CP7iX8dgqg9W7bE/3xBvercynHYIDRfTlnteNAj9uzH2KR6K1esR4ADmK
   KIcclRq2YSMHcgxmJcdPzzr5WShyxrqU8WFaPDXmOtzBh3bO5PaPM9hVK
   zKud71/Q7iQH8XJHd5lnikvRXnZ4r+Kiz+RZsf8fyKsPwTHvRdlZbJEbV
   g==;
X-CSE-ConnectionGUID: 3U32w6bDQjSnNcm64TBjTQ==
X-CSE-MsgGUID: ucuy+Li0RIu0EXIhz7Aqcg==
X-IronPort-AV: E=McAfee;i="6800,10657,11720"; a="73721594"
X-IronPort-AV: E=Sophos;i="6.23,103,1770624000"; 
   d="scan'208";a="73721594"
Received: from orviesa004.jf.intel.com ([10.64.159.144])
  by fmvoesa111.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 05 Mar 2026 05:57:06 -0800
X-CSE-ConnectionGUID: kvKfOdtbSluntJPK3DWhng==
X-CSE-MsgGUID: 4JtaVjoFRQ23UWuzd0DVRg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,103,1770624000"; 
   d="scan'208";a="223179386"
Received: from lkp-server01.sh.intel.com (HELO cadc4577a874) ([10.239.97.150])
  by orviesa004.jf.intel.com with ESMTP; 05 Mar 2026 05:57:04 -0800
Received: from kbuild by cadc4577a874 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vy9CH-000000000hE-3qGW;
	Thu, 05 Mar 2026 13:57:01 +0000
Date: Thu, 05 Mar 2026 21:56:35 +0800
From: kernel test robot <lkp@intel.com>
To: cros-kernel-buildreports@googlegroups.com
Cc: oe-kbuild-all@lists.linux.dev
Subject: [android-common:upstream-linux-6.1.y 533/533]
 drivers/clk/mediatek/clk-mtk.c:502:2-3: Unneeded semicolon
Message-ID: <202603052151.i9yKYpCo-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>

tree:   https://android.googlesource.com/kernel/common upstream-linux-6.1.y
head:   2f66dd9cff421f27dbe192f2035ce61b811561b1
commit: c1d87d56af063c87961511ee25f6b07a5676d27d [533/533] clk: mediatek: clk-mtk: Extend mtk_clk_simple_probe()
config: arm64-randconfig-r053-20260305 (https://download.01.org/0day-ci/archive/20260305/202603052151.i9yKYpCo-lkp@intel.com/config)
compiler: aarch64-linux-gcc (GCC) 13.4.0

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202603052151.i9yKYpCo-lkp@intel.com/

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
