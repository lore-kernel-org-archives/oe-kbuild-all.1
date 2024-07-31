Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D21FD1B29A7
	for <oe-kbuild-all@lists.linux.dev>; Wed, 31 Jul 2024 13:42:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1722433365; cv=none; b=cT7R3RpFeWXsYCZCH4ULam+Ppg3PwHJ6b4EFEV2c2NDja6ibJJre+Lxd3y4I3zUXYRbBZsiGino4zFJ3TOLOz1Sds51AgGrMAALqRTDNFLRRGZs9v9IDIHEdUEEAfwznWSxtxnG4KHhU7W2DF1vCg5FOGDQWdLf8oMJa4VnYyTE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1722433365; c=relaxed/simple;
	bh=YaIFulBUiNNBemXJQQ452kt9gcODljGMy5PlbcItQgU=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=UE2FkId1I4boxddsJLNj2vTQWBs1zANbq8wLSDNNXocW+9rwVOM9NxUK3UQmuOl/Gr64jBI5AKrMwW0eC2wkegX9AGHESnK+2XQBoYpu96J5SOGHsxP53q6vHjFOXQLGG0lXhKpfXhvi8f1ilatNX6vs1leBq06WgtIK2L1vLGo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=KlhG+Iln; arc=none smtp.client-ip=198.175.65.18
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="KlhG+Iln"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1722433363; x=1753969363;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=YaIFulBUiNNBemXJQQ452kt9gcODljGMy5PlbcItQgU=;
  b=KlhG+IlnXYaB5V+TTmBFXPej1ROn5LKvKMb7YLFWNveLnMsys5DpsLd0
   D2DfjizvrcTPA+4OKRBX4UrKvt9q1wEc6Vsrto6HwAodkuJra9I/y/4D1
   OSx8yIqhD4773Pb4MUQAxS2a8WBlEt0f/xMRBtVLn7OwVtxrEJYJElUrG
   B1JMjvO6tsmcqrSew7tSPpLd+W0k/yfJA1h6iwUqJf7XVev8KzSVCXgub
   HcFMugv0PmLavD9m3i1OMhz9DyqJkCYN+rS3fz4C/OeFbknWlX6gEmZf5
   VIrc+NAfJOHhcLKO+/4pj5HYsj/BpMZ16IGcHcI+ATfsBKJlnfSarvGlb
   w==;
X-CSE-ConnectionGUID: WsERkNVxQxiqlleEOcW/fA==
X-CSE-MsgGUID: UO2K2UHoRkWFH0/a8n0y4Q==
X-IronPort-AV: E=McAfee;i="6700,10204,11150"; a="20453098"
X-IronPort-AV: E=Sophos;i="6.09,251,1716274800"; 
   d="scan'208";a="20453098"
Received: from fmviesa007.fm.intel.com ([10.60.135.147])
  by orvoesa110.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 31 Jul 2024 06:42:41 -0700
X-CSE-ConnectionGUID: OszrIZvkQSeMA5HH4DfYBA==
X-CSE-MsgGUID: l3tJJmDgR9uKKRCSjgnBag==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.09,251,1716274800"; 
   d="scan'208";a="54347046"
Received: from lkp-server01.sh.intel.com (HELO 68891e0c336b) ([10.239.97.150])
  by fmviesa007.fm.intel.com with ESMTP; 31 Jul 2024 06:42:40 -0700
Received: from kbuild by 68891e0c336b with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1sZ9bC-000uNh-0D;
	Wed, 31 Jul 2024 13:42:38 +0000
Date: Wed, 31 Jul 2024 21:42:32 +0800
From: kernel test robot <lkp@intel.com>
To: "Rob Herring (Arm)" <robh@kernel.org>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [robh:dt/api-cleanups 3/36] drivers/cpufreq/spear-cpufreq.c:188:15:
 error: implicit declaration of function 'of_property_count_32_elems'; did
 you mean 'of_property_count_u32_elems'?
Message-ID: <202407312113.XQP7fgXu-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/robh/linux.git dt/api-cleanups
head:   55dff5ffdb04a96e8f78fc4708ffa4701b509a0c
commit: 8b264e285050068c79e499ea56f57805166fd5b1 [3/36] cpufreq: spear: Use property API
config: arm-allmodconfig (https://download.01.org/0day-ci/archive/20240731/202407312113.XQP7fgXu-lkp@intel.com/config)
compiler: arm-linux-gnueabi-gcc (GCC) 14.1.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240731/202407312113.XQP7fgXu-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202407312113.XQP7fgXu-lkp@intel.com/

All errors (new ones prefixed by >>):

   drivers/cpufreq/spear-cpufreq.c: In function 'spear_cpufreq_probe':
>> drivers/cpufreq/spear-cpufreq.c:188:15: error: implicit declaration of function 'of_property_count_32_elems'; did you mean 'of_property_count_u32_elems'? [-Wimplicit-function-declaration]
     188 |         cnt = of_property_count_32_elems(np, "cpufreq_tbl");
         |               ^~~~~~~~~~~~~~~~~~~~~~~~~~
         |               of_property_count_u32_elems
   In file included from include/linux/cpufreq.h:17,
                    from drivers/cpufreq/spear-cpufreq.c:17:
>> include/linux/of.h:1435:51: error: lvalue required as unary '&' operand
    1435 |                  of_prop_next_u32(_it.prop, NULL, &u)};                 \
         |                                                   ^
   drivers/cpufreq/spear-cpufreq.c:201:9: note: in expansion of macro 'of_property_for_each_u32'
     201 |         of_property_for_each_u32(np, "cpufreq_tbl", &val)
         |         ^~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/of.h:1437:62: error: lvalue required as unary '&' operand
    1437 |              _it.item = of_prop_next_u32(_it.prop, _it.item, &u))
         |                                                              ^
   drivers/cpufreq/spear-cpufreq.c:201:9: note: in expansion of macro 'of_property_for_each_u32'
     201 |         of_property_for_each_u32(np, "cpufreq_tbl", &val)
         |         ^~~~~~~~~~~~~~~~~~~~~~~~


vim +188 drivers/cpufreq/spear-cpufreq.c

   170	
   171	static int spear_cpufreq_probe(struct platform_device *pdev)
   172	{
   173		struct device_node *np;
   174		struct cpufreq_frequency_table *freq_tbl;
   175		u32 val;
   176		int cnt, i, ret;
   177	
   178		np = of_cpu_device_node_get(0);
   179		if (!np) {
   180			pr_err("No cpu node found\n");
   181			return -ENODEV;
   182		}
   183	
   184		if (of_property_read_u32(np, "clock-latency",
   185					&spear_cpufreq.transition_latency))
   186			spear_cpufreq.transition_latency = CPUFREQ_ETERNAL;
   187	
 > 188		cnt = of_property_count_32_elems(np, "cpufreq_tbl");
   189		if (cnt <= 0) {
   190			pr_err("Invalid cpufreq_tbl\n");
   191			ret = -ENODEV;
   192			goto out_put_node;
   193		}
   194	
   195		freq_tbl = kcalloc(cnt + 1, sizeof(*freq_tbl), GFP_KERNEL);
   196		if (!freq_tbl) {
   197			ret = -ENOMEM;
   198			goto out_put_node;
   199		}
   200	
   201		of_property_for_each_u32(np, "cpufreq_tbl", &val)
   202			freq_tbl[i].frequency = val;
   203	
   204		freq_tbl[cnt].frequency = CPUFREQ_TABLE_END;
   205	
   206		spear_cpufreq.freq_tbl = freq_tbl;
   207	
   208		of_node_put(np);
   209	
   210		spear_cpufreq.clk = clk_get(NULL, "cpu_clk");
   211		if (IS_ERR(spear_cpufreq.clk)) {
   212			pr_err("Unable to get CPU clock\n");
   213			ret = PTR_ERR(spear_cpufreq.clk);
   214			goto out_put_mem;
   215		}
   216	
   217		ret = cpufreq_register_driver(&spear_cpufreq_driver);
   218		if (!ret)
   219			return 0;
   220	
   221		pr_err("failed register driver: %d\n", ret);
   222		clk_put(spear_cpufreq.clk);
   223	
   224	out_put_mem:
   225		kfree(freq_tbl);
   226		return ret;
   227	
   228	out_put_node:
   229		of_node_put(np);
   230		return ret;
   231	}
   232	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
