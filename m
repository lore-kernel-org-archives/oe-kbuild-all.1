Received: from mga12.intel.com (mga12.intel.com [192.55.52.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CC5E78483
	for <oe-kbuild-all@lists.linux.dev>; Sat, 11 Feb 2023 20:23:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1676147005; x=1707683005;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=grQaB8pEZ5b3QxOQ1fRCCA7TJjKmStl9XHXwWpRfImY=;
  b=KlZdYpo/ugvGMyPPtvAJqUTFUnGsEOuzXmE6FKsVZAOTnfWWRXDKCHSu
   Vh4rBPJamuY/v3BGCsfh6m0vGctLLzIhat3hbApwQsxLaWTwu3kPEBg7e
   M3b8k+ew2XWlAeVJ6NOFcEo+mO0wd4u178TzRcNMTCraCdoDpRUH39q6p
   TsO0f9ZTDngEyVJqV1XPsOWE02I3ZBvLW/KdhpgRHe80V2dSHu5ZfZMH6
   BdZ25Jl6ao1Nk+H43xODsE/EYszWcW6z3tPO8UElgIb5GFoDIIhgpxSMJ
   wMZJinOE3S6nUeJ+0hAOP2GjPJfHV+l4s7Nnj5ktx1EcJpU0ndCfVaTna
   g==;
X-IronPort-AV: E=McAfee;i="6500,9779,10618"; a="310281831"
X-IronPort-AV: E=Sophos;i="5.97,290,1669104000"; 
   d="scan'208";a="310281831"
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
  by fmsmga106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 11 Feb 2023 12:23:25 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10618"; a="811176443"
X-IronPort-AV: E=Sophos;i="5.97,290,1669104000"; 
   d="scan'208";a="811176443"
Received: from lkp-server01.sh.intel.com (HELO 4455601a8d94) ([10.239.97.150])
  by fmsmga001.fm.intel.com with ESMTP; 11 Feb 2023 12:23:24 -0800
Received: from kbuild by 4455601a8d94 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1pQwP5-0006mN-0p;
	Sat, 11 Feb 2023 20:23:23 +0000
Date: Sun, 12 Feb 2023 04:22:26 +0800
From: kernel test robot <lkp@intel.com>
To: Yury Norov <yury.norov@gmail.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [norov:numa-improve 4/4]
 drivers/net/ethernet/mellanox/mlx5/core/eq.c:847:63: error: macro
 "for_each_numa_cpu" passed 4 arguments, but takes just 3
Message-ID: <202302120409.RF1ftaJB-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://github.com/norov/linux numa-improve
head:   1f7fb4e8a13be40a2721c24c30227463bc1f556a
commit: c78c77cc5b1ae8a51131d12717971640d781347e [4/4] for_each_numa_cpu
config: powerpc-allmodconfig (https://download.01.org/0day-ci/archive/20230212/202302120409.RF1ftaJB-lkp@intel.com/config)
compiler: powerpc-linux-gcc (GCC) 12.1.0
reproduce (this is a W=1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # https://github.com/norov/linux/commit/c78c77cc5b1ae8a51131d12717971640d781347e
        git remote add norov https://github.com/norov/linux
        git fetch --no-tags norov numa-improve
        git checkout c78c77cc5b1ae8a51131d12717971640d781347e
        # save the config file
        mkdir build_dir && cp config build_dir/.config
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=gcc-12.1.0 make.cross W=1 O=build_dir ARCH=powerpc olddefconfig
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=gcc-12.1.0 make.cross W=1 O=build_dir ARCH=powerpc SHELL=/bin/bash drivers/net/ethernet/mellanox/mlx5/core/

If you fix the issue, kindly add following tag where applicable
| Reported-by: kernel test robot <lkp@intel.com>
| Link: https://lore.kernel.org/oe-kbuild-all/202302120409.RF1ftaJB-lkp@intel.com/

All error/warnings (new ones prefixed by >>):

   drivers/net/ethernet/mellanox/mlx5/core/eq.c: In function 'comp_irqs_request':
>> drivers/net/ethernet/mellanox/mlx5/core/eq.c:847:63: error: macro "for_each_numa_cpu" passed 4 arguments, but takes just 3
     847 |         for_each_numa_cpu(cpu, mask, prev, dev->priv.numa_node) {
         |                                                               ^
   In file included from include/linux/irq.h:19,
                    from arch/powerpc/include/asm/hardirq.h:6,
                    from include/linux/hardirq.h:11,
                    from include/linux/interrupt.h:11,
                    from drivers/net/ethernet/mellanox/mlx5/core/eq.c:6:
   include/linux/topology.h:300: note: macro "for_each_numa_cpu" defined here
     300 | #define for_each_numa_cpu(cpu, hop, node)                                      \
         | 
>> drivers/net/ethernet/mellanox/mlx5/core/eq.c:847:9: error: 'for_each_numa_cpu' undeclared (first use in this function)
     847 |         for_each_numa_cpu(cpu, mask, prev, dev->priv.numa_node) {
         |         ^~~~~~~~~~~~~~~~~
   drivers/net/ethernet/mellanox/mlx5/core/eq.c:847:9: note: each undeclared identifier is reported only once for each function it appears in
>> drivers/net/ethernet/mellanox/mlx5/core/eq.c:847:26: error: expected ';' before '{' token
     847 |         for_each_numa_cpu(cpu, mask, prev, dev->priv.numa_node) {
         |                          ^                                      ~
         |                          ;
>> drivers/net/ethernet/mellanox/mlx5/core/eq.c:826:13: warning: variable 'i' set but not used [-Wunused-but-set-variable]
     826 |         int i;
         |             ^
   drivers/net/ethernet/mellanox/mlx5/core/eq.c:825:13: warning: unused variable 'cpu' [-Wunused-variable]
     825 |         int cpu;
         |             ^~~
   drivers/net/ethernet/mellanox/mlx5/core/eq.c:821:31: warning: unused variable 'mask' [-Wunused-variable]
     821 |         const struct cpumask *mask;
         |                               ^~~~
   drivers/net/ethernet/mellanox/mlx5/core/eq.c:820:31: warning: unused variable 'prev' [-Wunused-variable]
     820 |         const struct cpumask *prev = cpu_none_mask;
         |                               ^~~~


vim +/for_each_numa_cpu +847 drivers/net/ethernet/mellanox/mlx5/core/eq.c

79b60ca83b6fa6 Shay Drory   2021-12-12  816  
79b60ca83b6fa6 Shay Drory   2021-12-12  817  static int comp_irqs_request(struct mlx5_core_dev *dev)
79b60ca83b6fa6 Shay Drory   2021-12-12  818  {
79b60ca83b6fa6 Shay Drory   2021-12-12  819  	struct mlx5_eq_table *table = dev->priv.eq_table;
2acda57736de1e Tariq Toukan 2023-01-20  820  	const struct cpumask *prev = cpu_none_mask;
2acda57736de1e Tariq Toukan 2023-01-20  821  	const struct cpumask *mask;
79b60ca83b6fa6 Shay Drory   2021-12-12  822  	int ncomp_eqs = table->num_comp_eqs;
79b60ca83b6fa6 Shay Drory   2021-12-12  823  	u16 *cpus;
79b60ca83b6fa6 Shay Drory   2021-12-12  824  	int ret;
2acda57736de1e Tariq Toukan 2023-01-20  825  	int cpu;
79b60ca83b6fa6 Shay Drory   2021-12-12 @826  	int i;
79b60ca83b6fa6 Shay Drory   2021-12-12  827  
79b60ca83b6fa6 Shay Drory   2021-12-12  828  	ncomp_eqs = table->num_comp_eqs;
79b60ca83b6fa6 Shay Drory   2021-12-12  829  	table->comp_irqs = kcalloc(ncomp_eqs, sizeof(*table->comp_irqs), GFP_KERNEL);
79b60ca83b6fa6 Shay Drory   2021-12-12  830  	if (!table->comp_irqs)
79b60ca83b6fa6 Shay Drory   2021-12-12  831  		return -ENOMEM;
061f5b23588a2b Shay Drory   2021-11-23  832  	if (mlx5_core_is_sf(dev)) {
061f5b23588a2b Shay Drory   2021-11-23  833  		ret = mlx5_irq_affinity_irqs_request_auto(dev, ncomp_eqs, table->comp_irqs);
061f5b23588a2b Shay Drory   2021-11-23  834  		if (ret < 0)
061f5b23588a2b Shay Drory   2021-11-23  835  			goto free_irqs;
061f5b23588a2b Shay Drory   2021-11-23  836  		return ret;
061f5b23588a2b Shay Drory   2021-11-23  837  	}
79b60ca83b6fa6 Shay Drory   2021-12-12  838  
79b60ca83b6fa6 Shay Drory   2021-12-12  839  	cpus = kcalloc(ncomp_eqs, sizeof(*cpus), GFP_KERNEL);
79b60ca83b6fa6 Shay Drory   2021-12-12  840  	if (!cpus) {
79b60ca83b6fa6 Shay Drory   2021-12-12  841  		ret = -ENOMEM;
79b60ca83b6fa6 Shay Drory   2021-12-12  842  		goto free_irqs;
79b60ca83b6fa6 Shay Drory   2021-12-12  843  	}
2acda57736de1e Tariq Toukan 2023-01-20  844  
2acda57736de1e Tariq Toukan 2023-01-20  845  	i = 0;
2acda57736de1e Tariq Toukan 2023-01-20  846  	rcu_read_lock();
c7bf8107bd3d3c Yury Norov   2023-02-10 @847  	for_each_numa_cpu(cpu, mask, prev, dev->priv.numa_node) {
2acda57736de1e Tariq Toukan 2023-01-20  848  		cpus[i] = cpu;
2acda57736de1e Tariq Toukan 2023-01-20  849  		if (++i == ncomp_eqs)
2acda57736de1e Tariq Toukan 2023-01-20  850  			goto spread_done;
2acda57736de1e Tariq Toukan 2023-01-20  851  	}
2acda57736de1e Tariq Toukan 2023-01-20  852  spread_done:
2acda57736de1e Tariq Toukan 2023-01-20  853  	rcu_read_unlock();
79b60ca83b6fa6 Shay Drory   2021-12-12  854  	ret = mlx5_irqs_request_vectors(dev, cpus, ncomp_eqs, table->comp_irqs);
79b60ca83b6fa6 Shay Drory   2021-12-12  855  	kfree(cpus);
79b60ca83b6fa6 Shay Drory   2021-12-12  856  	if (ret < 0)
79b60ca83b6fa6 Shay Drory   2021-12-12  857  		goto free_irqs;
79b60ca83b6fa6 Shay Drory   2021-12-12  858  	return ret;
79b60ca83b6fa6 Shay Drory   2021-12-12  859  
79b60ca83b6fa6 Shay Drory   2021-12-12  860  free_irqs:
79b60ca83b6fa6 Shay Drory   2021-12-12  861  	kfree(table->comp_irqs);
79b60ca83b6fa6 Shay Drory   2021-12-12  862  	return ret;
79b60ca83b6fa6 Shay Drory   2021-12-12  863  }
79b60ca83b6fa6 Shay Drory   2021-12-12  864  

:::::: The code at line 847 was first introduced by commit
:::::: c7bf8107bd3d3c9fba1cd720da4e5b481ae400d6 for_each_numa_cpu

:::::: TO: Yury Norov <yury.norov@gmail.com>
:::::: CC: Yury Norov <yury.norov@gmail.com>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests
