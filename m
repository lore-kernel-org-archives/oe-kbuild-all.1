Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.14])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9AAEF377558
	for <oe-kbuild-all@lists.linux.dev>; Wed, 14 Oct 2026 05:00:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.14
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791954028; cv=none; b=VxQ7OQggSgb0VE2eIMH9uW1hRMs585opTq0c+w2g/v1O65vJS54l1GPk69zkhUDo+4ZF2aEQUSfMCRqKEg7iB4Pc3J/Qz5IL7KI9pHEQ144IqG5H+tCLUal6ZsucJY9Bp8bNOX9eC9KuBX6Tb6JmTChbri5embaehTEY8Xl9Ylg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791954028; c=relaxed/simple;
	bh=cAX0G/IwOmENtavqyQ333RBWqIsuBHGGHOtnKT4Cgb4=;
	h=Date:From:To:Cc:Subject:Message-ID; b=Am8oV+PB+PQkdX4XCPT8fMAVa4krNp5S+4eQLwPeQ/W9UW8/8C2QC74LmhUKVqtuCyXDCrzpwCLoOjKQls2yfrHiSg578WawxBb6iZweu0IN1fsJXOxm7cZDXJEEmx4JHMxu0bqYrXUjUgfhJdL1OmRu1fS6SAi4J+jSnxtWPbI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=Tgyx19jF; arc=none smtp.client-ip=192.198.163.14
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="Tgyx19jF"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1791954026; x=1823490026;
  h=date:from:to:cc:subject:message-id;
  bh=cAX0G/IwOmENtavqyQ333RBWqIsuBHGGHOtnKT4Cgb4=;
  b=Tgyx19jFlYiulDWT+t6vx/ITahJ5fJO1Ud73Fg7qVThQPfhFy8RjZcOJ
   1QTv6IkOg3eN0w0NcZ6aJEOIfFdq/s6mYi18lg33LxEtSowgWKg630aaJ
   yG4eB3uLwIQc67KUx/DRMZpEuwTb2JarkafiOJUssAOEki2pJ8sHrLEf/
   rpNW3FIGWG8h9EjR+n3DHerdtzQ7Xw3Ab1oPvKs69ZTmq55kNuLNOjzFd
   2fWBrZd73qEPakvJw+gpA8JjiGoec9W/ThMXzHo54vQ3kS8cmsBZt3Bfo
   Qc5Q0aouzP9vVy/YfLSTXdu2HahYZt3Il1U76NOTZmgRlPThCix8+UN46
   w==;
X-CSE-ConnectionGUID: WlQiJOlOTzmqEzj9oItHOA==
X-CSE-MsgGUID: 9nn2ajWmQaGxDUdZZ/DMdQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11934"; a="700504"
X-IronPort-AV: E=Sophos;i="6.27,157,1787036400"; 
   d="scan'208";a="700504"
Received: from fmviesa010.fm.intel.com ([10.60.135.150])
  by fmvoesa108.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 13 Oct 2026 22:00:25 -0700
X-CSE-ConnectionGUID: KBUx4JN1T+2lQndvRS5iBA==
X-CSE-MsgGUID: fYVzCn39TEuZ4APIFFQRNg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,157,1787036400"; 
   d="scan'208";a="1787022"
Received: from igk-lkp-server01.igk.intel.com (HELO d0de6c2a75a7) ([10.211.93.152])
  by fmviesa010.fm.intel.com with ESMTP; 13 Oct 2026 22:00:24 -0700
Received: from kbuild by d0de6c2a75a7 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1xGr6D-00000000ArX-23bl;
	Wed, 14 Oct 2026 05:00:21 +0000
Date: Wed, 14 Oct 2026 07:00:07 +0200
From: kernel test robot <lkp@intel.com>
To: cros-kernel-buildreports@googlegroups.com
Cc: oe-kbuild-all@lists.linux.dev
Subject: [android-common:android14-kiwi-6.1 304/304]
 drivers/clk/mediatek/clk-mtk.c:502:2-3: Unneeded semicolon
Message-ID: <202610140659.Tw7DX6oI-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>

tree:   https://android.googlesource.com/kernel/common android14-kiwi-6.1
head:   2a08aa541cb5eaf05a29f7d3e3981d82f3184f34
commit: c1d87d56af063c87961511ee25f6b07a5676d27d [304/304] clk: mediatek: clk-mtk: Extend mtk_clk_simple_probe()
config: arm64-randconfig-r2105-20261014 (https://download.01.org/0day-ci/archive/20261014/202610140659.Tw7DX6oI-lkp@intel.com/config)
compiler: aarch64-linux-gcc (GCC) 13.4.0

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202610140659.Tw7DX6oI-lkp@intel.com/

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
