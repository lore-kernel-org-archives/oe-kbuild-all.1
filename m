Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.9])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F11652C1B9
	for <oe-kbuild-all@lists.linux.dev>; Thu, 29 Feb 2024 00:21:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.9
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1709166087; cv=none; b=UCxwOrokrrChaIZ3UP+qThB05nrLllOWrhOWLsvXpyO2PaC26AZDZrNapfme+l7BrpJJnIdSdUcE5+ixp1jJhcgMzUfv2JHKOuNukzsLHiS6y2XNMp/OQaw57fBzquPS3HsEZwTFK9hJCke/UmZ3Q9yJzbzfv3ohKs245MnIjhI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1709166087; c=relaxed/simple;
	bh=pYy0ilPiwQk/pdTVy1PuoXOWe6S5rk1zFh4nKrN/C5w=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=H1/dmIC/sZRtu1DZ08geSgjVZBzSsCEY6LCER02G3GzGAZ3IXuPAbL0t/nQTUM/I/yOEz2T2YZT/PYgCFBqq9Uli8xKe3R28W0q6KsqmpzKtCA2BM8GNkDU38rFy3/NLGbNEtcFqDsfqTrGDQ0a9+XZe6MszUP6dFrI2NM8bkTo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=fETBEvAq; arc=none smtp.client-ip=198.175.65.9
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="fETBEvAq"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1709166086; x=1740702086;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=pYy0ilPiwQk/pdTVy1PuoXOWe6S5rk1zFh4nKrN/C5w=;
  b=fETBEvAqz8OShjxK8MiU+F0xMuSYsJQIjFLlhMb9HAat1/x5b2QSsGhv
   /Je8C9QzABKXBjwi80Hk1WxzFt5rtKyByTa6asOzMyXMatKCG2+MG+Vyn
   JuUKmbPTHarojGU5wBze6P/szcMJ9PJK3olHX4xgeLa5Ldl5lDwT03jIg
   lgUDFhaZfpi4xFD54WzBsEGkD+J4JgpqsmFLk/4Gg9f+jay+M+vlF6e5V
   0JjNGJo4dolkCmema5p4mcZSlPTUDlV/NXE8VL3vJETe6GpUdNE67wxk+
   ATd1V0biRlNLw97ARvK7TVDzHXRJGQIURtEEUmBfR7qv5C2z4oiiaXTnQ
   Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10998"; a="26075590"
X-IronPort-AV: E=Sophos;i="6.06,191,1705392000"; 
   d="scan'208";a="26075590"
Received: from fmviesa010.fm.intel.com ([10.60.135.150])
  by orvoesa101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 28 Feb 2024 16:21:25 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.06,191,1705392000"; 
   d="scan'208";a="7565553"
Received: from lkp-server02.sh.intel.com (HELO 3c78fa4d504c) ([10.239.97.151])
  by fmviesa010.fm.intel.com with ESMTP; 28 Feb 2024 16:21:23 -0800
Received: from kbuild by 3c78fa4d504c with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1rfUAq-000CVX-2e;
	Thu, 29 Feb 2024 00:21:20 +0000
Date: Thu, 29 Feb 2024 08:20:53 +0800
From: kernel test robot <lkp@intel.com>
To: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [morimoto:card2-trigger-order-2023-02-28 25/33]
 drivers/hwtracing/coresight/coresight-platform.c:289:9: sparse: sparse:
 incorrect type in argument 1 (different modifiers)
Message-ID: <202402290803.LLryuAO6-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://github.com/morimoto/linux card2-trigger-order-2023-02-28
head:   7954e5e1bfde7e92159d3cc1922b94fbd5957915
commit: 9d527a5dc80bc8b77f67a23ef1cb3361098805dc [25/33] of: property: replace of_graph_get_next_device_endpoint()
config: arm-randconfig-r133-20240228 (https://download.01.org/0day-ci/archive/20240229/202402290803.LLryuAO6-lkp@intel.com/config)
compiler: arm-linux-gnueabi-gcc (GCC) 13.2.0
reproduce: (https://download.01.org/0day-ci/archive/20240229/202402290803.LLryuAO6-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202402290803.LLryuAO6-lkp@intel.com/

sparse warnings: (new ones prefixed by >>)
>> drivers/hwtracing/coresight/coresight-platform.c:289:9: sparse: sparse: incorrect type in argument 1 (different modifiers) @@     expected struct device_node *parent @@     got struct device_node const *[assigned] parent @@
   drivers/hwtracing/coresight/coresight-platform.c:289:9: sparse:     expected struct device_node *parent
   drivers/hwtracing/coresight/coresight-platform.c:289:9: sparse:     got struct device_node const *[assigned] parent
>> drivers/hwtracing/coresight/coresight-platform.c:289:9: sparse: sparse: incorrect type in argument 1 (different modifiers) @@     expected struct device_node *parent @@     got struct device_node const *[assigned] parent @@
   drivers/hwtracing/coresight/coresight-platform.c:289:9: sparse:     expected struct device_node *parent
   drivers/hwtracing/coresight/coresight-platform.c:289:9: sparse:     got struct device_node const *[assigned] parent

vim +289 drivers/hwtracing/coresight/coresight-platform.c

6575fdb74645c1 drivers/hwtracing/coresight/of_coresight.c       Suzuki K Poulose  2018-09-20  260  
f03631da4be332 drivers/hwtracing/coresight/coresight-platform.c Suzuki K Poulose  2019-06-19  261  static int of_get_coresight_platform_data(struct device *dev,
f03631da4be332 drivers/hwtracing/coresight/coresight-platform.c Suzuki K Poulose  2019-06-19  262  					  struct coresight_platform_data *pdata)
a06ae8609b3dd0 drivers/coresight/of_coresight.c                 Pratik Patel      2014-11-03  263  {
c2c729415b2d21 drivers/hwtracing/coresight/of_coresight.c       Suzuki K Poulose  2018-09-20  264  	int ret = 0;
a06ae8609b3dd0 drivers/coresight/of_coresight.c                 Pratik Patel      2014-11-03  265  	struct device_node *ep = NULL;
5ecc7120194c6f drivers/hwtracing/coresight/of_coresight.c       Suzuki K Poulose  2018-09-20  266  	const struct device_node *parent = NULL;
5ecc7120194c6f drivers/hwtracing/coresight/of_coresight.c       Suzuki K Poulose  2018-09-20  267  	bool legacy_binding = false;
f03631da4be332 drivers/hwtracing/coresight/coresight-platform.c Suzuki K Poulose  2019-06-19  268  	struct device_node *node = dev->of_node;
a06ae8609b3dd0 drivers/coresight/of_coresight.c                 Pratik Patel      2014-11-03  269  
5ecc7120194c6f drivers/hwtracing/coresight/of_coresight.c       Suzuki K Poulose  2018-09-20  270  	parent = of_coresight_get_output_ports_node(node);
5ecc7120194c6f drivers/hwtracing/coresight/of_coresight.c       Suzuki K Poulose  2018-09-20  271  	/*
5ecc7120194c6f drivers/hwtracing/coresight/of_coresight.c       Suzuki K Poulose  2018-09-20  272  	 * If the DT uses obsoleted bindings, the ports are listed
5ecc7120194c6f drivers/hwtracing/coresight/of_coresight.c       Suzuki K Poulose  2018-09-20  273  	 * under the device and we need to filter out the input
5ecc7120194c6f drivers/hwtracing/coresight/of_coresight.c       Suzuki K Poulose  2018-09-20  274  	 * ports.
5ecc7120194c6f drivers/hwtracing/coresight/of_coresight.c       Suzuki K Poulose  2018-09-20  275  	 */
5ecc7120194c6f drivers/hwtracing/coresight/of_coresight.c       Suzuki K Poulose  2018-09-20  276  	if (!parent) {
ae7f2b5a7b569f drivers/hwtracing/coresight/coresight-platform.c James Clark       2023-04-25  277  		/*
8ddfa4b1c6de6d drivers/hwtracing/coresight/coresight-platform.c Kuninori Morimoto 2024-02-02  278  		 * Avoid warnings in for_each_endpoint_of_node()
ae7f2b5a7b569f drivers/hwtracing/coresight/coresight-platform.c James Clark       2023-04-25  279  		 * if the device doesn't have any graph connections
ae7f2b5a7b569f drivers/hwtracing/coresight/coresight-platform.c James Clark       2023-04-25  280  		 */
ae7f2b5a7b569f drivers/hwtracing/coresight/coresight-platform.c James Clark       2023-04-25  281  		if (!of_graph_is_present(node))
ae7f2b5a7b569f drivers/hwtracing/coresight/coresight-platform.c James Clark       2023-04-25  282  			return 0;
5ecc7120194c6f drivers/hwtracing/coresight/of_coresight.c       Suzuki K Poulose  2018-09-20  283  		legacy_binding = true;
5ecc7120194c6f drivers/hwtracing/coresight/of_coresight.c       Suzuki K Poulose  2018-09-20  284  		parent = node;
5ecc7120194c6f drivers/hwtracing/coresight/of_coresight.c       Suzuki K Poulose  2018-09-20  285  		dev_warn_once(dev, "Uses obsolete Coresight DT bindings\n");
5ecc7120194c6f drivers/hwtracing/coresight/of_coresight.c       Suzuki K Poulose  2018-09-20  286  	}
5ecc7120194c6f drivers/hwtracing/coresight/of_coresight.c       Suzuki K Poulose  2018-09-20  287  
5ecc7120194c6f drivers/hwtracing/coresight/of_coresight.c       Suzuki K Poulose  2018-09-20  288  	/* Iterate through each output port to discover topology */
8ddfa4b1c6de6d drivers/hwtracing/coresight/coresight-platform.c Kuninori Morimoto 2024-02-02 @289  	for_each_endpoint_of_node(parent, ep) {
a06ae8609b3dd0 drivers/coresight/of_coresight.c                 Pratik Patel      2014-11-03  290  		/*
5ecc7120194c6f drivers/hwtracing/coresight/of_coresight.c       Suzuki K Poulose  2018-09-20  291  		 * Legacy binding mixes input/output ports under the
5ecc7120194c6f drivers/hwtracing/coresight/of_coresight.c       Suzuki K Poulose  2018-09-20  292  		 * same parent. So, skip the input ports if we are dealing
5ecc7120194c6f drivers/hwtracing/coresight/of_coresight.c       Suzuki K Poulose  2018-09-20  293  		 * with legacy binding, as they processed with their
5ecc7120194c6f drivers/hwtracing/coresight/of_coresight.c       Suzuki K Poulose  2018-09-20  294  		 * connected output ports.
a06ae8609b3dd0 drivers/coresight/of_coresight.c                 Pratik Patel      2014-11-03  295  		 */
5ecc7120194c6f drivers/hwtracing/coresight/of_coresight.c       Suzuki K Poulose  2018-09-20  296  		if (legacy_binding && of_coresight_legacy_ep_is_input(ep))
a06ae8609b3dd0 drivers/coresight/of_coresight.c                 Pratik Patel      2014-11-03  297  			continue;
a06ae8609b3dd0 drivers/coresight/of_coresight.c                 Pratik Patel      2014-11-03  298  
d375b356e687f2 drivers/hwtracing/coresight/coresight-platform.c Suzuki K Poulose  2020-05-18  299  		ret = of_coresight_parse_endpoint(dev, ep, pdata);
d375b356e687f2 drivers/hwtracing/coresight/coresight-platform.c Suzuki K Poulose  2020-05-18  300  		if (ret)
f03631da4be332 drivers/hwtracing/coresight/coresight-platform.c Suzuki K Poulose  2019-06-19  301  			return ret;
6575fdb74645c1 drivers/hwtracing/coresight/of_coresight.c       Suzuki K Poulose  2018-09-20  302  	}
04c9490035691a drivers/hwtracing/coresight/of_coresight.c       Suzuki K Poulose  2017-06-05  303  
f03631da4be332 drivers/hwtracing/coresight/coresight-platform.c Suzuki K Poulose  2019-06-19  304  	return 0;
f03631da4be332 drivers/hwtracing/coresight/coresight-platform.c Suzuki K Poulose  2019-06-19  305  }
f03631da4be332 drivers/hwtracing/coresight/coresight-platform.c Suzuki K Poulose  2019-06-19  306  #else
f03631da4be332 drivers/hwtracing/coresight/coresight-platform.c Suzuki K Poulose  2019-06-19  307  static inline int
f03631da4be332 drivers/hwtracing/coresight/coresight-platform.c Suzuki K Poulose  2019-06-19  308  of_get_coresight_platform_data(struct device *dev,
f03631da4be332 drivers/hwtracing/coresight/coresight-platform.c Suzuki K Poulose  2019-06-19  309  			       struct coresight_platform_data *pdata)
f03631da4be332 drivers/hwtracing/coresight/coresight-platform.c Suzuki K Poulose  2019-06-19  310  {
f03631da4be332 drivers/hwtracing/coresight/coresight-platform.c Suzuki K Poulose  2019-06-19  311  	return -ENOENT;
a06ae8609b3dd0 drivers/coresight/of_coresight.c                 Pratik Patel      2014-11-03  312  }
40a1c5b31969eb drivers/hwtracing/coresight/coresight-platform.c Suzuki K Poulose  2019-06-19  313  

:::::: The code at line 289 was first introduced by commit
:::::: 8ddfa4b1c6de6d0e795163279fd71707dcf309fb hwtracing: use for_each_endpoint_of_node()

:::::: TO: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
:::::: CC: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
