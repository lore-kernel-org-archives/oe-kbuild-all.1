Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C552E7E572
	for <oe-kbuild-all@lists.linux.dev>; Thu, 29 Feb 2024 13:37:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.19
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1709213873; cv=none; b=I6W2/Kz+S/lvQdtgW4Gj3gH3VyAfzdJeRJzsch/jU3k3gVdAaY6lab96WP87Zq88k3nko1SCeTsjcNz/WiJqyJ6yfwe4TXg8XbtGrMtE6BZUK420Mlk1BR7etaL9s18WGylVBYDMMdWwZHj+oi4pIqPufPPpJdJrmwBhyRe3YsM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1709213873; c=relaxed/simple;
	bh=YBkunS7fccxeTsVYyIuroOKYIlQLbfYeE0my6A2I8sw=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=ElQlpfz+WtgMVGrE6vbkHbqES/AiiyJywnZZpTsGhfzHp2qqHK0cbS7e7k5DqO5Dj4sTpmYIeDg0GlrBZMkNCBDrZT1SyiBn2TSVMckzR1vRArj2EOIgwB8vri2YEsEr5NS8PaCFnh3hfr5+nwJnYKYxn0c7jdXtyFkOeLoY0Lc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=Q8ugPCOM; arc=none smtp.client-ip=198.175.65.19
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="Q8ugPCOM"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1709213871; x=1740749871;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=YBkunS7fccxeTsVYyIuroOKYIlQLbfYeE0my6A2I8sw=;
  b=Q8ugPCOMr/e7gCbN82OxAQMZHReADCV+m4DfHgNOFgbMiV5ipXareJlm
   51V6+3ezFnLK/D5IDiAXqz9HtPG+Is52Fu4HWLwsIy+T8Z39oMiLF43qg
   tTlOZ0pZWoiCESKcXWBTV+lfzw0BUWqaw1h5hYQnAdkZDGVXLf6PxHlED
   +Id4z4pt9s8SDl9LeBITSVeFfkuxRlIJ/USPghVW7ZJyj3IbMNg2/HJAI
   FVJoM4fUmYwDG/qQKv4Rl7ieEzrKeKeU2Epby1VqE0JWwUJSNPKroLt0m
   1b4K0lhZ7KEfVe2lzqGqPDiYcII5sgZiPw3WSykreSoaY/ceSfXsrM0PH
   Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10998"; a="3527240"
X-IronPort-AV: E=Sophos;i="6.06,194,1705392000"; 
   d="scan'208";a="3527240"
Received: from fmviesa007.fm.intel.com ([10.60.135.147])
  by orvoesa111.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 29 Feb 2024 05:37:50 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.06,194,1705392000"; 
   d="scan'208";a="7702285"
Received: from lkp-server02.sh.intel.com (HELO 3c78fa4d504c) ([10.239.97.151])
  by fmviesa007.fm.intel.com with ESMTP; 29 Feb 2024 05:37:49 -0800
Received: from kbuild by 3c78fa4d504c with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1rfgbA-000Cxt-2A;
	Thu, 29 Feb 2024 13:37:34 +0000
Date: Thu, 29 Feb 2024 21:35:54 +0800
From: kernel test robot <lkp@intel.com>
To: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [morimoto:card2-trigger-order-2023-02-28 25/33]
 drivers/hwtracing/coresight/coresight-platform.c:289:28: error: passing
 'const struct device_node *' to parameter of type 'struct device_node *'
 discards qualifiers
Message-ID: <202402292147.nHUgoBsd-lkp@intel.com>
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
config: arm64-randconfig-r122-20240228 (https://download.01.org/0day-ci/archive/20240229/202402292147.nHUgoBsd-lkp@intel.com/config)
compiler: clang version 19.0.0git (https://github.com/llvm/llvm-project edd4aee4dd9b5b98b2576a6f783e4086173d902a)
reproduce: (https://download.01.org/0day-ci/archive/20240229/202402292147.nHUgoBsd-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202402292147.nHUgoBsd-lkp@intel.com/

All errors (new ones prefixed by >>):

   In file included from drivers/hwtracing/coresight/coresight-platform.c:14:
   In file included from include/linux/amba/bus.h:19:
   In file included from include/linux/regulator/consumer.h:35:
   In file included from include/linux/suspend.h:5:
   In file included from include/linux/swap.h:9:
   In file included from include/linux/memcontrol.h:20:
   In file included from include/linux/mm.h:2188:
   include/linux/vmstat.h:522:36: warning: arithmetic between different enumeration types ('enum node_stat_item' and 'enum lru_list') [-Wenum-enum-conversion]
     522 |         return node_stat_name(NR_LRU_BASE + lru) + 3; // skip "nr_"
         |                               ~~~~~~~~~~~ ^ ~~~
>> drivers/hwtracing/coresight/coresight-platform.c:289:28: error: passing 'const struct device_node *' to parameter of type 'struct device_node *' discards qualifiers [-Werror,-Wincompatible-pointer-types-discards-qualifiers]
     289 |         for_each_endpoint_of_node(parent, ep) {
         |                                   ^~~~~~
   include/linux/of_graph.h:37:60: note: expanded from macro 'for_each_endpoint_of_node'
      37 |         for (struct device_node *___port = of_graph_get_next_port(parent, NULL); ___port != NULL; \
         |                                                                   ^~~~~~
   include/linux/of_graph.h:86:64: note: passing argument to parameter 'parent' here
      86 | struct device_node *of_graph_get_next_port(struct device_node *parent,
         |                                                                ^
>> drivers/hwtracing/coresight/coresight-platform.c:289:28: error: passing 'const struct device_node *' to parameter of type 'struct device_node *' discards qualifiers [-Werror,-Wincompatible-pointer-types-discards-qualifiers]
     289 |         for_each_endpoint_of_node(parent, ep) {
         |                                   ^~~~~~
   include/linux/of_graph.h:38:40: note: expanded from macro 'for_each_endpoint_of_node'
      38 |              ___port = of_graph_get_next_port(parent, ___port)) \
         |                                               ^~~~~~
   include/linux/of_graph.h:86:64: note: passing argument to parameter 'parent' here
      86 | struct device_node *of_graph_get_next_port(struct device_node *parent,
         |                                                                ^
   1 warning and 2 errors generated.


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
