Received: from mga11.intel.com (mga11.intel.com [192.55.52.93])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F1A1E6116
	for <oe-kbuild-all@lists.linux.dev>; Thu, 13 Jul 2023 07:45:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1689234348; x=1720770348;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=6fKoMdO7npKA5R99rlg9U2LjoERnTHsgeXjJ1PVvWHc=;
  b=jmolYNOrf3FFFt4YffYdN/+N7wP7nUA/OFGolH0BDdQ6UGzVQ4F1c3kc
   R1YKkQSsVbmHHKkmWdjTNrUhF5pb8iHWXGfPm9Qf2CZdF5S08jWv68YZu
   BOeEFFqiqiLs49LA1XyoW8fh1dMD+Q4ME2x3j7aAhLrxdaljl47FF9DYF
   twvToyb7CIpX9J09K45s8a1s3xKGuXKuNK2TH89qwZbxWwhcCwp0P2nvg
   yjjOQtgp5jbEHQa7CwoSt1uA41X/5F9XUFOMqMl6vd5t5yVfgE+vK54x/
   hvIngeHPfvLmIivyxhmO5QsyGHdbhkDJhLE0wYe58WOH/C32GNuuDShA7
   g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10769"; a="362582683"
X-IronPort-AV: E=Sophos;i="6.01,202,1684825200"; 
   d="scan'208";a="362582683"
Received: from orsmga007.jf.intel.com ([10.7.209.58])
  by fmsmga102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 13 Jul 2023 00:45:44 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10769"; a="715861474"
X-IronPort-AV: E=Sophos;i="6.01,202,1684825200"; 
   d="scan'208";a="715861474"
Received: from lkp-server01.sh.intel.com (HELO c544d7fc5005) ([10.239.97.150])
  by orsmga007.jf.intel.com with ESMTP; 13 Jul 2023 00:45:41 -0700
Received: from kbuild by c544d7fc5005 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1qJr1B-0006Nn-09;
	Thu, 13 Jul 2023 07:45:41 +0000
Date: Thu, 13 Jul 2023 15:45:36 +0800
From: kernel test robot <lkp@intel.com>
To: Rob Herring <robh@kernel.org>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [robh:for-kernelci 55/101]
 drivers/net/ethernet/ibm/emac/core.c:2384:39: warning: assignment to 'struct
 platform_device *' from 'int' makes pointer from integer without a cast
Message-ID: <202307131526.57jS7TPz-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/robh/linux.git for-kernelci
head:   ac7a2a5947cf0a60d9614031b509c5b65e99f87a
commit: abf44efd37f3ba94c30934248287cc3ca2617135 [55/101] net: Explicitly include correct DT includes
config: powerpc-sam440ep_defconfig (https://download.01.org/0day-ci/archive/20230713/202307131526.57jS7TPz-lkp@intel.com/config)
compiler: powerpc-linux-gcc (GCC) 12.3.0
reproduce: (https://download.01.org/0day-ci/archive/20230713/202307131526.57jS7TPz-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202307131526.57jS7TPz-lkp@intel.com/

All warnings (new ones prefixed by >>):

   drivers/net/ethernet/ibm/emac/core.c: In function 'emac_check_deps':
   drivers/net/ethernet/ibm/emac/core.c:2384:41: error: implicit declaration of function 'of_find_device_by_node'; did you mean 'of_find_net_device_by_node'? [-Werror=implicit-function-declaration]
    2384 |                         deps[i].ofdev = of_find_device_by_node(deps[i].node);
         |                                         ^~~~~~~~~~~~~~~~~~~~~~
         |                                         of_find_net_device_by_node
>> drivers/net/ethernet/ibm/emac/core.c:2384:39: warning: assignment to 'struct platform_device *' from 'int' makes pointer from integer without a cast [-Wint-conversion]
    2384 |                         deps[i].ofdev = of_find_device_by_node(deps[i].node);
         |                                       ^
   cc1: some warnings being treated as errors


vim +2384 drivers/net/ethernet/ibm/emac/core.c

1d3bb996481e116 drivers/net/ibm_newemac/core.c       David Gibson   2007-08-23  2355  
fe17dc1e2bae859 drivers/net/ethernet/ibm/emac/core.c Bill Pemberton 2012-12-03  2356  static int emac_check_deps(struct emac_instance *dev,
1d3bb996481e116 drivers/net/ibm_newemac/core.c       David Gibson   2007-08-23  2357  			   struct emac_depentry *deps)
1d3bb996481e116 drivers/net/ibm_newemac/core.c       David Gibson   2007-08-23  2358  {
1d3bb996481e116 drivers/net/ibm_newemac/core.c       David Gibson   2007-08-23  2359  	int i, there = 0;
1d3bb996481e116 drivers/net/ibm_newemac/core.c       David Gibson   2007-08-23  2360  	struct device_node *np;
1d3bb996481e116 drivers/net/ibm_newemac/core.c       David Gibson   2007-08-23  2361  
1d3bb996481e116 drivers/net/ibm_newemac/core.c       David Gibson   2007-08-23  2362  	for (i = 0; i < EMAC_DEP_COUNT; i++) {
1d3bb996481e116 drivers/net/ibm_newemac/core.c       David Gibson   2007-08-23  2363  		/* no dependency on that item, allright */
1d3bb996481e116 drivers/net/ibm_newemac/core.c       David Gibson   2007-08-23  2364  		if (deps[i].phandle == 0) {
1d3bb996481e116 drivers/net/ibm_newemac/core.c       David Gibson   2007-08-23  2365  			there++;
1d3bb996481e116 drivers/net/ibm_newemac/core.c       David Gibson   2007-08-23  2366  			continue;
1d3bb996481e116 drivers/net/ibm_newemac/core.c       David Gibson   2007-08-23  2367  		}
1d3bb996481e116 drivers/net/ibm_newemac/core.c       David Gibson   2007-08-23  2368  		/* special case for blist as the dependency might go away */
1d3bb996481e116 drivers/net/ibm_newemac/core.c       David Gibson   2007-08-23  2369  		if (i == EMAC_DEP_PREV_IDX) {
1d3bb996481e116 drivers/net/ibm_newemac/core.c       David Gibson   2007-08-23  2370  			np = *(dev->blist - 1);
1d3bb996481e116 drivers/net/ibm_newemac/core.c       David Gibson   2007-08-23  2371  			if (np == NULL) {
1d3bb996481e116 drivers/net/ibm_newemac/core.c       David Gibson   2007-08-23  2372  				deps[i].phandle = 0;
1d3bb996481e116 drivers/net/ibm_newemac/core.c       David Gibson   2007-08-23  2373  				there++;
1d3bb996481e116 drivers/net/ibm_newemac/core.c       David Gibson   2007-08-23  2374  				continue;
1d3bb996481e116 drivers/net/ibm_newemac/core.c       David Gibson   2007-08-23  2375  			}
1d3bb996481e116 drivers/net/ibm_newemac/core.c       David Gibson   2007-08-23  2376  			if (deps[i].node == NULL)
1d3bb996481e116 drivers/net/ibm_newemac/core.c       David Gibson   2007-08-23  2377  				deps[i].node = of_node_get(np);
1d3bb996481e116 drivers/net/ibm_newemac/core.c       David Gibson   2007-08-23  2378  		}
1d3bb996481e116 drivers/net/ibm_newemac/core.c       David Gibson   2007-08-23  2379  		if (deps[i].node == NULL)
1d3bb996481e116 drivers/net/ibm_newemac/core.c       David Gibson   2007-08-23  2380  			deps[i].node = of_find_node_by_phandle(deps[i].phandle);
1d3bb996481e116 drivers/net/ibm_newemac/core.c       David Gibson   2007-08-23  2381  		if (deps[i].node == NULL)
1d3bb996481e116 drivers/net/ibm_newemac/core.c       David Gibson   2007-08-23  2382  			continue;
1d3bb996481e116 drivers/net/ibm_newemac/core.c       David Gibson   2007-08-23  2383  		if (deps[i].ofdev == NULL)
1d3bb996481e116 drivers/net/ibm_newemac/core.c       David Gibson   2007-08-23 @2384  			deps[i].ofdev = of_find_device_by_node(deps[i].node);
1d3bb996481e116 drivers/net/ibm_newemac/core.c       David Gibson   2007-08-23  2385  		if (deps[i].ofdev == NULL)
1d3bb996481e116 drivers/net/ibm_newemac/core.c       David Gibson   2007-08-23  2386  			continue;
1d3bb996481e116 drivers/net/ibm_newemac/core.c       David Gibson   2007-08-23  2387  		if (deps[i].drvdata == NULL)
bc3538325656358 drivers/net/ethernet/ibm/emac/core.c Jingoo Han     2013-09-02  2388  			deps[i].drvdata = platform_get_drvdata(deps[i].ofdev);
1d3bb996481e116 drivers/net/ibm_newemac/core.c       David Gibson   2007-08-23  2389  		if (deps[i].drvdata != NULL)
1d3bb996481e116 drivers/net/ibm_newemac/core.c       David Gibson   2007-08-23  2390  			there++;
1d3bb996481e116 drivers/net/ibm_newemac/core.c       David Gibson   2007-08-23  2391  	}
807540baae406c8 drivers/net/ibm_newemac/core.c       Eric Dumazet   2010-09-23  2392  	return there == EMAC_DEP_COUNT;
1d3bb996481e116 drivers/net/ibm_newemac/core.c       David Gibson   2007-08-23  2393  }
1d3bb996481e116 drivers/net/ibm_newemac/core.c       David Gibson   2007-08-23  2394  

:::::: The code at line 2384 was first introduced by commit
:::::: 1d3bb996481e116f5f2b127cbd29b83365d2cf62 Device tree aware EMAC driver

:::::: TO: David Gibson <david@gibson.dropbear.id.au>
:::::: CC: David S. Miller <davem@sunset.davemloft.net>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
