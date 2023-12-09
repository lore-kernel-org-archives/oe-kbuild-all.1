Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.9])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 141703224
	for <oe-kbuild-all@lists.linux.dev>; Sat,  9 Dec 2023 09:39:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="ELPstRhg"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1702114758; x=1733650758;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=1sKMCjUEcubhfj7L4SemObGiUe2N8HioXeFnJywR870=;
  b=ELPstRhgO1cVMcSlZ21L7u+WnXatCOxPKc0bQg3DqhK3YcvaFYC78NCc
   00FdByYYEDJIy12hVhmPZ+FfI4fv4O6u695kF3ctHrotHwRFeiE9cL6EZ
   Y68DwNTxbkwnrgGX+rgQv9Sddk9QTvWcfL9u4Eq6DWcEPzsdXhFBUVEkP
   WDWbpOktH+/RqAOywQLpFsF2MwYSPa0QDIwnmvIg1ydcM4qZBlZ2q2Q/+
   G35iWMX4fqxvMm7gY9Q6qrimWCdF6lGgkVq4zYGH07XjwsxpH0f3vLAOO
   2JlgKI0o3iNS/TzuOPnV+LlGGJp9I/+KEIzYORGfOMNewiBaE6ILVcwu9
   Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10918"; a="1376283"
X-IronPort-AV: E=Sophos;i="6.04,263,1695711600"; 
   d="scan'208";a="1376283"
Received: from fmsmga006.fm.intel.com ([10.253.24.20])
  by fmvoesa103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 09 Dec 2023 01:39:17 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10918"; a="1019618671"
X-IronPort-AV: E=Sophos;i="6.04,263,1695711600"; 
   d="scan'208";a="1019618671"
Received: from lkp-server02.sh.intel.com (HELO b07ab15da5fe) ([10.239.97.151])
  by fmsmga006.fm.intel.com with ESMTP; 09 Dec 2023 01:39:16 -0800
Received: from kbuild by b07ab15da5fe with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1rBtn2-000F8z-1w;
	Sat, 09 Dec 2023 09:38:40 +0000
Date: Sat, 9 Dec 2023 17:37:55 +0800
From: kernel test robot <lkp@intel.com>
To: Yury Norov <yury.norov@gmail.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [norov:for_each_numa_cpu 6/7]
 drivers/net/ethernet/mellanox/mlx5/core/eq.c:840:2: error: call to
 undeclared function 'for_each_numa_hop_mask'; ISO C99 and later do not
 support implicit function declarations
Message-ID: <202312091736.OkEYjdmX-lkp@intel.com>
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
config: arm64-allyesconfig (https://download.01.org/0day-ci/archive/20231209/202312091736.OkEYjdmX-lkp@intel.com/config)
compiler: clang version 17.0.0 (https://github.com/llvm/llvm-project.git 4a5ac14ee968ff0ad5d2cc1ffa0299048db4c88a)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20231209/202312091736.OkEYjdmX-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202312091736.OkEYjdmX-lkp@intel.com/

All errors (new ones prefixed by >>):

>> drivers/net/ethernet/mellanox/mlx5/core/eq.c:840:2: error: call to undeclared function 'for_each_numa_hop_mask'; ISO C99 and later do not support implicit function declarations [-Wimplicit-function-declaration]
     840 |         for_each_numa_hop_mask(mask, numa_node) {
         |         ^
>> drivers/net/ethernet/mellanox/mlx5/core/eq.c:840:41: error: expected ';' after expression
     840 |         for_each_numa_hop_mask(mask, numa_node) {
         |                                                ^
         |                                                ;
   2 errors generated.


vim +/for_each_numa_hop_mask +840 drivers/net/ethernet/mellanox/mlx5/core/eq.c

79b60ca83b6fa6 Shay Drory    2021-12-12  830  
ddd2c79da02021 Maher Sanalla 2023-06-12  831  static int mlx5_cpumask_default_spread(int numa_node, int index)
79b60ca83b6fa6 Shay Drory    2021-12-12  832  {
2acda57736de1e Tariq Toukan  2023-01-20  833  	const struct cpumask *prev = cpu_none_mask;
2acda57736de1e Tariq Toukan  2023-01-20  834  	const struct cpumask *mask;
54b2cf41b853e0 Maher Sanalla 2023-06-12  835  	int found_cpu = 0;
54b2cf41b853e0 Maher Sanalla 2023-06-12  836  	int i = 0;
2acda57736de1e Tariq Toukan  2023-01-20  837  	int cpu;
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
