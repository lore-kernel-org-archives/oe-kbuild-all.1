Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.151])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 33EA02F869
	for <oe-kbuild-all@lists.linux.dev>; Wed,  6 Dec 2023 12:29:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="gnMVhWGp"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1701865769; x=1733401769;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=m+yByfAcHFLosEF6dICTRXkq+mb5gLPqNAf+PPLRLLA=;
  b=gnMVhWGp/AEYQViYlib0+ZaaOEQcKo5RwqU9bN+FsPJV2/3ZkTDUvyO8
   8nyOvUiwbYZceccECq19myGVW96xMHFYgLMxiDLDevrGUczycS2wW/SwU
   +f994w3jfdX6neBytriPj1PuvQDzEit7TJTZBh4wEJ92VwgwMPZqf1HPV
   rqAvneogqEs8ODsQZ7OKX/DnCQqdamQGw2O+asOuA+ZSn4zBWFHiYr98g
   qYzTGbo7pGwKMEq5jsbBWlPkBFozAY8MeS7ZUZGQ0+E/AHp8Pk1tOlWQ+
   c4x1S5dhLHntj08u5rQ3TDjZHlmKzje+a/mmT62GdOUQ2EBYZOxmwxPBM
   Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10915"; a="374231751"
X-IronPort-AV: E=Sophos;i="6.04,255,1695711600"; 
   d="scan'208";a="374231751"
Received: from fmsmga005.fm.intel.com ([10.253.24.32])
  by fmsmga107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 06 Dec 2023 04:29:28 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10915"; a="1102812979"
X-IronPort-AV: E=Sophos;i="6.04,255,1695711600"; 
   d="scan'208";a="1102812979"
Received: from lkp-server02.sh.intel.com (HELO b07ab15da5fe) ([10.239.97.151])
  by fmsmga005.fm.intel.com with ESMTP; 06 Dec 2023 04:29:27 -0800
Received: from kbuild by b07ab15da5fe with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1rAr1n-000Amc-2f;
	Wed, 06 Dec 2023 12:29:24 +0000
Date: Wed, 6 Dec 2023 20:28:40 +0800
From: kernel test robot <lkp@intel.com>
To: Yury Norov <yury.norov@gmail.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [norov:for_each_numa_cpu 6/7]
 drivers/net/ethernet/mellanox/mlx5/core/eq.c:840:9: error: implicit
 declaration of function 'for_each_numa_hop_mask'; did you mean
 'for_each_numa_cpu'?
Message-ID: <202312062028.IvSWI4kh-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://github.com/norov/linux for_each_numa_cpu
head:   d348e04a6f8498089a335a87fc5e7b03bca42411
commit: 00d4334c1cccbcd557bfbef79b4ab30bc0cffb77 [6/7] sched: drop for_each_numa_hop_mask()
config: arm64-defconfig (https://download.01.org/0day-ci/archive/20231206/202312062028.IvSWI4kh-lkp@intel.com/config)
compiler: aarch64-linux-gcc (GCC) 13.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20231206/202312062028.IvSWI4kh-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202312062028.IvSWI4kh-lkp@intel.com/

All error/warnings (new ones prefixed by >>):

   drivers/net/ethernet/mellanox/mlx5/core/eq.c: In function 'mlx5_cpumask_default_spread':
>> drivers/net/ethernet/mellanox/mlx5/core/eq.c:840:9: error: implicit declaration of function 'for_each_numa_hop_mask'; did you mean 'for_each_numa_cpu'? [-Werror=implicit-function-declaration]
     840 |         for_each_numa_hop_mask(mask, numa_node) {
         |         ^~~~~~~~~~~~~~~~~~~~~~
         |         for_each_numa_cpu
>> drivers/net/ethernet/mellanox/mlx5/core/eq.c:840:48: error: expected ';' before '{' token
     840 |         for_each_numa_hop_mask(mask, numa_node) {
         |                                                ^~
         |                                                ;
>> drivers/net/ethernet/mellanox/mlx5/core/eq.c:837:13: warning: unused variable 'cpu' [-Wunused-variable]
     837 |         int cpu;
         |             ^~~
>> drivers/net/ethernet/mellanox/mlx5/core/eq.c:836:13: warning: unused variable 'i' [-Wunused-variable]
     836 |         int i = 0;
         |             ^
>> drivers/net/ethernet/mellanox/mlx5/core/eq.c:833:31: warning: unused variable 'prev' [-Wunused-variable]
     833 |         const struct cpumask *prev = cpu_none_mask;
         |                               ^~~~
   cc1: some warnings being treated as errors


vim +840 drivers/net/ethernet/mellanox/mlx5/core/eq.c

79b60ca83b6fa6 Shay Drory    2021-12-12  830  
ddd2c79da02021 Maher Sanalla 2023-06-12  831  static int mlx5_cpumask_default_spread(int numa_node, int index)
79b60ca83b6fa6 Shay Drory    2021-12-12  832  {
2acda57736de1e Tariq Toukan  2023-01-20 @833  	const struct cpumask *prev = cpu_none_mask;
2acda57736de1e Tariq Toukan  2023-01-20  834  	const struct cpumask *mask;
54b2cf41b853e0 Maher Sanalla 2023-06-12  835  	int found_cpu = 0;
54b2cf41b853e0 Maher Sanalla 2023-06-12 @836  	int i = 0;
2acda57736de1e Tariq Toukan  2023-01-20 @837  	int cpu;
2acda57736de1e Tariq Toukan  2023-01-20  838  
2acda57736de1e Tariq Toukan  2023-01-20  839  	rcu_read_lock();
ddd2c79da02021 Maher Sanalla 2023-06-12 @840  	for_each_numa_hop_mask(mask, numa_node) {
2acda57736de1e Tariq Toukan  2023-01-20  841  		for_each_cpu_andnot(cpu, mask, prev) {
ddd2c79da02021 Maher Sanalla 2023-06-12  842  			if (i++ == index) {
54b2cf41b853e0 Maher Sanalla 2023-06-12  843  				found_cpu = cpu;
2acda57736de1e Tariq Toukan  2023-01-20  844  				goto spread_done;
2acda57736de1e Tariq Toukan  2023-01-20  845  			}
54b2cf41b853e0 Maher Sanalla 2023-06-12  846  		}
2acda57736de1e Tariq Toukan  2023-01-20  847  		prev = mask;
2acda57736de1e Tariq Toukan  2023-01-20  848  	}
54b2cf41b853e0 Maher Sanalla 2023-06-12  849  
2acda57736de1e Tariq Toukan  2023-01-20  850  spread_done:
2acda57736de1e Tariq Toukan  2023-01-20  851  	rcu_read_unlock();
ddd2c79da02021 Maher Sanalla 2023-06-12  852  	return found_cpu;
ddd2c79da02021 Maher Sanalla 2023-06-12  853  }
ddd2c79da02021 Maher Sanalla 2023-06-12  854  

:::::: The code at line 840 was first introduced by commit
:::::: ddd2c79da02021153dc8674e5a7e9748e56c1240 net/mlx5: Introduce mlx5_cpumask_default_spread

:::::: TO: Maher Sanalla <msanalla@nvidia.com>
:::::: CC: Saeed Mahameed <saeedm@nvidia.com>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
