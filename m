Received: from mga09.intel.com (mga09.intel.com [134.134.136.24])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2D810440F
	for <oe-kbuild-all@lists.linux.dev>; Sun,  2 Jul 2023 10:33:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1688294018; x=1719830018;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=TcebG2ohWb5yN8NlV821pVK2IHQrnvNvKVfBO5U2N+w=;
  b=M78JfDeeloRu9VgTKYwJZkcGiLnKtD5KeTTsrRBVTaalhqmRpRRVlzF7
   va9fce1JuTrNxZWm66RSijEb0Uhq8eqRjo7+5/V4zEE3cXTvxMzRdGJao
   fj1Ppa+UloOG0fpCXP+G/PKD3xD3QmczRvnIub6Ula+hQQK2iOTaRg4bm
   G8cpleK4h/imQzw3v+af1zEqV8qSonna8fucOG5qJIpLRXkIMHdrVykt8
   j/Fql2XBIbWnpF6DFECnyeoE/OjGxMcssnVJMr8LMShQgwL5NFAsFuziY
   3pMh9CUFe1OgWbWQOSCy0Soot9y8EIOO0YYI69EGN4k76+nppKXYyV2DD
   w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10758"; a="365262068"
X-IronPort-AV: E=Sophos;i="6.01,176,1684825200"; 
   d="scan'208";a="365262068"
Received: from fmsmga008.fm.intel.com ([10.253.24.58])
  by orsmga102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 02 Jul 2023 03:33:37 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10758"; a="783566573"
X-IronPort-AV: E=Sophos;i="6.01,176,1684825200"; 
   d="scan'208";a="783566573"
Received: from lkp-server01.sh.intel.com (HELO 783282924a45) ([10.239.97.150])
  by fmsmga008.fm.intel.com with ESMTP; 02 Jul 2023 03:33:35 -0700
Received: from kbuild by 783282924a45 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1qFuOd-000Gan-0A;
	Sun, 02 Jul 2023 10:33:35 +0000
Date: Sun, 2 Jul 2023 18:32:43 +0800
From: kernel test robot <lkp@intel.com>
To: Jason Gunthorpe <jgg@nvidia.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [jgunthorpe:for_maor_reuse_roce_gid 12/16]
 drivers/infiniband/core/cache.c:372:27: sparse: sparse: symbol
 'get_valid_entry' was not declared. Should it be static?
Message-ID: <202307021819.6rlwlkIs-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://github.com/jgunthorpe/linux for_maor_reuse_roce_gid
head:   1b26be51e181c4a802d87e5d1f806d3722b3a834
commit: 23f090b3a944d84665bfaac23948a0a36a579a7c [12/16] rdma/gidtable: Use an xarray instead of a preallocated array
config: i386-randconfig-i061-20230702 (https://download.01.org/0day-ci/archive/20230702/202307021819.6rlwlkIs-lkp@intel.com/config)
compiler: gcc-12 (Debian 12.2.0-14) 12.2.0
reproduce: (https://download.01.org/0day-ci/archive/20230702/202307021819.6rlwlkIs-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202307021819.6rlwlkIs-lkp@intel.com/

sparse warnings: (new ones prefixed by >>)
>> drivers/infiniband/core/cache.c:372:27: sparse: sparse: symbol 'get_valid_entry' was not declared. Should it be static?
   drivers/infiniband/core/cache.c:666:47: sparse: sparse: incompatible types in comparison expression (different address spaces):
   drivers/infiniband/core/cache.c:666:47: sparse:    struct net_device [noderef] __rcu *
   drivers/infiniband/core/cache.c:666:47: sparse:    struct net_device *
   drivers/infiniband/core/cache.c:704:43: sparse: sparse: incorrect type in initializer (different address spaces) @@     expected struct net_device [noderef] __rcu *ndev @@     got struct net_device *ndev @@
   drivers/infiniband/core/cache.c:704:43: sparse:     expected struct net_device [noderef] __rcu *ndev
   drivers/infiniband/core/cache.c:704:43: sparse:     got struct net_device *ndev
   drivers/infiniband/core/cache.c:864:23: sparse: sparse: incorrect type in assignment (different address spaces) @@     expected struct net_device [noderef] __rcu *[addressable] ndev @@     got struct net_device *ndev @@
   drivers/infiniband/core/cache.c:864:23: sparse:     expected struct net_device [noderef] __rcu *[addressable] ndev
   drivers/infiniband/core/cache.c:864:23: sparse:     got struct net_device *ndev
   drivers/infiniband/core/cache.c:1032:52: sparse: sparse: incorrect type in initializer (different address spaces) @@     expected struct net_device [noderef] __rcu *ndev @@     got struct net_device *ndev @@
   drivers/infiniband/core/cache.c:1032:52: sparse:     expected struct net_device [noderef] __rcu *ndev
   drivers/infiniband/core/cache.c:1032:52: sparse:     got struct net_device *ndev
   drivers/infiniband/core/cache.c:1443:59: sparse: sparse: incorrect type in argument 1 (different address spaces) @@     expected struct net_device *dev @@     got struct net_device [noderef] __rcu *const ndev @@
   drivers/infiniband/core/cache.c:1443:59: sparse:     expected struct net_device *dev
   drivers/infiniband/core/cache.c:1443:59: sparse:     got struct net_device [noderef] __rcu *const ndev

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
