Received: from mga14.intel.com (mga14.intel.com [192.55.52.115])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2FC2C5680
	for <oe-kbuild-all@lists.linux.dev>; Thu, 13 Jul 2023 07:56:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1689235004; x=1720771004;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=C0ZNS0+ywmBfHilA1vqY59L9FBYrQUTJGRzSc0rPHqU=;
  b=X4EtwPZ7UNP3ZJmwrYdWXZVS0sfPuyKgkGNxooLC9V33kx1V7MJIv5hc
   +PMC+29pLovKAH5u73/4STuIIWCtiMkX10hyvbqkPOuUSd6aTt/RrFqPL
   rxlS4yi7oDA7GSD6CcM0DdE9drXve4OoTMWdNBA9j4wIRdufwQGnGuUcf
   N80IuMcNJlPDdzd39TqVk+W8eoCKNEtiA4vftLteQda9vtevuPKhetW2P
   3ou7XUMXoFlUet+znjcq0+yap0Gv8c+CNX4wtKnKNWpgRtU0snDrwjtpJ
   vJu8ywqCVSPXrwgU0GrO3C5r0XWzh/x3+laEBpJRKVmxH9tB8fJ/c4VIM
   g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10769"; a="365153107"
X-IronPort-AV: E=Sophos;i="6.01,202,1684825200"; 
   d="scan'208";a="365153107"
Received: from fmsmga007.fm.intel.com ([10.253.24.52])
  by fmsmga103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 13 Jul 2023 00:56:43 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10769"; a="725207054"
X-IronPort-AV: E=Sophos;i="6.01,202,1684825200"; 
   d="scan'208";a="725207054"
Received: from lkp-server01.sh.intel.com (HELO c544d7fc5005) ([10.239.97.150])
  by fmsmga007.fm.intel.com with ESMTP; 13 Jul 2023 00:56:42 -0700
Received: from kbuild by c544d7fc5005 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1qJrBp-0006Oc-1S;
	Thu, 13 Jul 2023 07:56:41 +0000
Date: Thu, 13 Jul 2023 15:55:48 +0800
From: kernel test robot <lkp@intel.com>
To: Rob Herring <robh@kernel.org>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [robh:for-kernelci 55/101]
 drivers/net/ethernet/ibm/emac/core.c:2384:39: warning: assignment to 'struct
 platform_device *' from 'int' makes pointer from integer without a cast
Message-ID: <202307131558.XgjmgTdC-lkp@intel.com>
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
config: powerpc-canyonlands_defconfig (https://download.01.org/0day-ci/archive/20230713/202307131558.XgjmgTdC-lkp@intel.com/config)
compiler: powerpc-linux-gcc (GCC) 12.3.0
reproduce: (https://download.01.org/0day-ci/archive/20230713/202307131558.XgjmgTdC-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202307131558.XgjmgTdC-lkp@intel.com/

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

1d3bb996481e11 drivers/net/ibm_newemac/core.c       David Gibson   2007-08-23  2355  
fe17dc1e2bae85 drivers/net/ethernet/ibm/emac/core.c Bill Pemberton 2012-12-03  2356  static int emac_check_deps(struct emac_instance *dev,
1d3bb996481e11 drivers/net/ibm_newemac/core.c       David Gibson   2007-08-23  2357  			   struct emac_depentry *deps)
1d3bb996481e11 drivers/net/ibm_newemac/core.c       David Gibson   2007-08-23  2358  {
1d3bb996481e11 drivers/net/ibm_newemac/core.c       David Gibson   2007-08-23  2359  	int i, there = 0;
1d3bb996481e11 drivers/net/ibm_newemac/core.c       David Gibson   2007-08-23  2360  	struct device_node *np;
1d3bb996481e11 drivers/net/ibm_newemac/core.c       David Gibson   2007-08-23  2361  
1d3bb996481e11 drivers/net/ibm_newemac/core.c       David Gibson   2007-08-23  2362  	for (i = 0; i < EMAC_DEP_COUNT; i++) {
1d3bb996481e11 drivers/net/ibm_newemac/core.c       David Gibson   2007-08-23  2363  		/* no dependency on that item, allright */
1d3bb996481e11 drivers/net/ibm_newemac/core.c       David Gibson   2007-08-23  2364  		if (deps[i].phandle == 0) {
1d3bb996481e11 drivers/net/ibm_newemac/core.c       David Gibson   2007-08-23  2365  			there++;
1d3bb996481e11 drivers/net/ibm_newemac/core.c       David Gibson   2007-08-23  2366  			continue;
1d3bb996481e11 drivers/net/ibm_newemac/core.c       David Gibson   2007-08-23  2367  		}
1d3bb996481e11 drivers/net/ibm_newemac/core.c       David Gibson   2007-08-23  2368  		/* special case for blist as the dependency might go away */
1d3bb996481e11 drivers/net/ibm_newemac/core.c       David Gibson   2007-08-23  2369  		if (i == EMAC_DEP_PREV_IDX) {
1d3bb996481e11 drivers/net/ibm_newemac/core.c       David Gibson   2007-08-23  2370  			np = *(dev->blist - 1);
1d3bb996481e11 drivers/net/ibm_newemac/core.c       David Gibson   2007-08-23  2371  			if (np == NULL) {
1d3bb996481e11 drivers/net/ibm_newemac/core.c       David Gibson   2007-08-23  2372  				deps[i].phandle = 0;
1d3bb996481e11 drivers/net/ibm_newemac/core.c       David Gibson   2007-08-23  2373  				there++;
1d3bb996481e11 drivers/net/ibm_newemac/core.c       David Gibson   2007-08-23  2374  				continue;
1d3bb996481e11 drivers/net/ibm_newemac/core.c       David Gibson   2007-08-23  2375  			}
1d3bb996481e11 drivers/net/ibm_newemac/core.c       David Gibson   2007-08-23  2376  			if (deps[i].node == NULL)
1d3bb996481e11 drivers/net/ibm_newemac/core.c       David Gibson   2007-08-23  2377  				deps[i].node = of_node_get(np);
1d3bb996481e11 drivers/net/ibm_newemac/core.c       David Gibson   2007-08-23  2378  		}
1d3bb996481e11 drivers/net/ibm_newemac/core.c       David Gibson   2007-08-23  2379  		if (deps[i].node == NULL)
1d3bb996481e11 drivers/net/ibm_newemac/core.c       David Gibson   2007-08-23  2380  			deps[i].node = of_find_node_by_phandle(deps[i].phandle);
1d3bb996481e11 drivers/net/ibm_newemac/core.c       David Gibson   2007-08-23  2381  		if (deps[i].node == NULL)
1d3bb996481e11 drivers/net/ibm_newemac/core.c       David Gibson   2007-08-23  2382  			continue;
1d3bb996481e11 drivers/net/ibm_newemac/core.c       David Gibson   2007-08-23  2383  		if (deps[i].ofdev == NULL)
1d3bb996481e11 drivers/net/ibm_newemac/core.c       David Gibson   2007-08-23 @2384  			deps[i].ofdev = of_find_device_by_node(deps[i].node);
1d3bb996481e11 drivers/net/ibm_newemac/core.c       David Gibson   2007-08-23  2385  		if (deps[i].ofdev == NULL)
1d3bb996481e11 drivers/net/ibm_newemac/core.c       David Gibson   2007-08-23  2386  			continue;
1d3bb996481e11 drivers/net/ibm_newemac/core.c       David Gibson   2007-08-23  2387  		if (deps[i].drvdata == NULL)
bc353832565635 drivers/net/ethernet/ibm/emac/core.c Jingoo Han     2013-09-02  2388  			deps[i].drvdata = platform_get_drvdata(deps[i].ofdev);
1d3bb996481e11 drivers/net/ibm_newemac/core.c       David Gibson   2007-08-23  2389  		if (deps[i].drvdata != NULL)
1d3bb996481e11 drivers/net/ibm_newemac/core.c       David Gibson   2007-08-23  2390  			there++;
1d3bb996481e11 drivers/net/ibm_newemac/core.c       David Gibson   2007-08-23  2391  	}
807540baae406c drivers/net/ibm_newemac/core.c       Eric Dumazet   2010-09-23  2392  	return there == EMAC_DEP_COUNT;
1d3bb996481e11 drivers/net/ibm_newemac/core.c       David Gibson   2007-08-23  2393  }
1d3bb996481e11 drivers/net/ibm_newemac/core.c       David Gibson   2007-08-23  2394  

:::::: The code at line 2384 was first introduced by commit
:::::: 1d3bb996481e116f5f2b127cbd29b83365d2cf62 Device tree aware EMAC driver

:::::: TO: David Gibson <david@gibson.dropbear.id.au>
:::::: CC: David S. Miller <davem@sunset.davemloft.net>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
