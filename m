Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.20])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D840B358D32
	for <oe-kbuild-all@lists.linux.dev>; Wed, 29 Jul 2026 16:48:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.20
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785343726; cv=none; b=YrSIXW8mUTJkNwxV/Rvy9CT0TfBmBACMicpaR6P92iEBDa26ygEYlXYsJUTa6HjRbqzLywF0yGsMSHXS2YxYCrVtpurgfjfEldbrclOQgiF4uuVWigtIpl2I+Ex7ii7IytcFzRn7MmPBLOyWXUfwfYxPNJntTT9DcIoH798J+7c=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785343726; c=relaxed/simple;
	bh=Hsf6+8kH40L302oIV4pXWRNtnxUzILE2nZ3SXT07f28=;
	h=Date:From:To:Cc:Subject:Message-ID; b=L7nJ0C8gJ03ib/TxTc+5ohqV1BO5riuOo9frh4h8PjhMZc27U22KCW+n4ZeLfAhr7fh4L4tqIeo6lb1KQkgi1Dq7mQbCtz7BHAsgWM5FzK//JUgD5O/MFdlT3qX61Bw/M9N+4k54ARenfilQTWM1y3/6rJajU7PdIF+mvdIuASI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=dgGedUox; arc=none smtp.client-ip=198.175.65.20
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="dgGedUox"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1785343724; x=1816879724;
  h=date:from:to:cc:subject:message-id;
  bh=Hsf6+8kH40L302oIV4pXWRNtnxUzILE2nZ3SXT07f28=;
  b=dgGedUoxq7jhgWtREHtPv8D2zdFzBj/MY9yyBjaStRYEx+e3Wf22a3Kd
   IJShATHraNtJJrA7vfMH6NY3Bsh2h3kNKtdHx6p1ZCxYgbRezUrMBxAWJ
   YV2rEqxpN0yabbkwpbN73Zg91anefb9pBRvyjzlEFPYDO5yepdwrK1tg0
   svgQQ39MKbYd9OO5cIEX7VXlC63lpJ5HNha2qdS+f4Gw45PhE0jSQeHNj
   ijRJ8nG0ig70YrJ54+s/gykPzHT0zIscbCFDnidP9G/QX0N9NVBMdpAez
   YeVSGJ0USnx2prWyofL0RUG+PRWaePPK2fTNS4USPBpkwR58jFK6cPD8c
   g==;
X-CSE-ConnectionGUID: BoIdTQPqQbajVCoYkfHj9A==
X-CSE-MsgGUID: wxsr1moPSD64K0VhPsMB4w==
X-IronPort-AV: E=McAfee;i="6800,10657,11859"; a="85719972"
X-IronPort-AV: E=Sophos;i="6.25,192,1779174000"; 
   d="scan'208";a="85719972"
Received: from fmviesa001.fm.intel.com ([10.60.135.141])
  by orvoesa112.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 29 Jul 2026 09:48:44 -0700
X-CSE-ConnectionGUID: 26CHL3gfREGxxoX/Frd69A==
X-CSE-MsgGUID: HsBFe2lISVeUwB5B8IU9kg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,192,1779174000"; 
   d="scan'208";a="284621772"
Received: from lkp-server02.sh.intel.com (HELO ea128546eb3d) ([10.239.97.151])
  by fmviesa001.fm.intel.com with ESMTP; 29 Jul 2026 09:48:42 -0700
Received: from kbuild by ea128546eb3d with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1wp7SM-00000000fXP-3swr;
	Wed, 29 Jul 2026 16:48:36 +0000
Date: Thu, 30 Jul 2026 00:47:31 +0800
From: kernel test robot <lkp@intel.com>
To: Akari Tsuyukusa <akkun11.open@gmail.com>
Cc: oe-kbuild-all@lists.linux.dev, Brian Masney <bmasney@redhat.com>
Subject: [masneyb:clk-misc-round-two-for-v7.3 15/45]
 drivers/clk/mediatek/clk-mt8173-infracfg.c:131:36: error: 'clk_data'
 undeclared; did you mean 'clk_gate'?
Message-ID: <202607300024.JuXAGTRo-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>

tree:   https://github.com/masneyb/linux clk-misc-round-two-for-v7.3
head:   e2eec03ed313a8180ebe4eb9e32a6b8429f804a5
commit: d29088009b4afdb7fc1f3cbb6ba3364e483b17d9 [15/45] clk: mediatek: mt8173: fix memory leak on module removal
config: alpha-allmodconfig (https://download.01.org/0day-ci/archive/20260730/202607300024.JuXAGTRo-lkp@intel.com/config)
compiler: alpha-linux-gcc (GCC) 16.1.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260730/202607300024.JuXAGTRo-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202607300024.JuXAGTRo-lkp@intel.com/

All errors (new ones prefixed by >>):

   drivers/clk/mediatek/clk-mt8173-infracfg.c: In function 'clk_mt8173_infracfg_probe':
>> drivers/clk/mediatek/clk-mt8173-infracfg.c:131:36: error: 'clk_data' undeclared (first use in this function); did you mean 'clk_gate'?
     131 |         platform_set_drvdata(pdev, clk_data);
         |                                    ^~~~~~~~
         |                                    clk_gate
   drivers/clk/mediatek/clk-mt8173-infracfg.c:131:36: note: each undeclared identifier is reported only once for each function it appears in


vim +131 drivers/clk/mediatek/clk-mt8173-infracfg.c

    78	
    79	static void clk_mt8173_infra_init_early(struct device_node *node)
    80	{
    81		int i;
    82	
    83		infra_clk_data = mtk_alloc_clk_data(CLK_INFRA_NR_CLK);
    84		if (!infra_clk_data)
    85			return;
    86	
    87		for (i = 0; i < CLK_INFRA_NR_CLK; i++)
    88			infra_clk_data->hws[i] = ERR_PTR(-EPROBE_DEFER);
    89	
    90		mtk_clk_register_factors(infra_early_divs,
    91					 ARRAY_SIZE(infra_early_divs), infra_clk_data);
    92	
    93		of_clk_add_hw_provider(node, of_clk_hw_onecell_get, infra_clk_data);
    94	}
    95	CLK_OF_DECLARE_DRIVER(mtk_infrasys, "mediatek,mt8173-infracfg",
    96			      clk_mt8173_infra_init_early);
    97	
    98	static int clk_mt8173_infracfg_probe(struct platform_device *pdev)
    99	{
   100		struct device_node *node = pdev->dev.of_node;
   101		int r, i;
   102	
   103		if (!infra_clk_data) {
   104			infra_clk_data = mtk_alloc_clk_data(CLK_INFRA_NR_CLK);
   105			if (!infra_clk_data)
   106				return -ENOMEM;
   107		} else {
   108			for (i = 0; i < CLK_INFRA_NR_CLK; i++)
   109				if (infra_clk_data->hws[i] == ERR_PTR(-EPROBE_DEFER))
   110					infra_clk_data->hws[i] = ERR_PTR(-ENOENT);
   111		}
   112	
   113		r = mtk_clk_register_gates(&pdev->dev, node, infra_gates,
   114					   ARRAY_SIZE(infra_gates), infra_clk_data);
   115		if (r)
   116			return r;
   117	
   118		r = mtk_clk_register_cpumuxes(&pdev->dev, node, cpu_muxes,
   119					      ARRAY_SIZE(cpu_muxes), infra_clk_data);
   120		if (r)
   121			goto unregister_gates;
   122	
   123		r = of_clk_add_hw_provider(node, of_clk_hw_onecell_get, infra_clk_data);
   124		if (r)
   125			goto unregister_cpumuxes;
   126	
   127		r = mtk_register_reset_controller_with_dev(&pdev->dev, &clk_rst_desc);
   128		if (r)
   129			goto unregister_clk_hw;
   130	
 > 131		platform_set_drvdata(pdev, clk_data);
   132	
   133		return 0;
   134	
   135	unregister_clk_hw:
   136		of_clk_del_provider(node);
   137	unregister_cpumuxes:
   138		mtk_clk_unregister_cpumuxes(cpu_muxes, ARRAY_SIZE(cpu_muxes), infra_clk_data);
   139	unregister_gates:
   140		mtk_clk_unregister_gates(infra_gates, ARRAY_SIZE(infra_gates), infra_clk_data);
   141		return r;
   142	}
   143	

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
