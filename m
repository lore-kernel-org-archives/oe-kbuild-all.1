Received: from mga17.intel.com (mga17.intel.com [192.55.52.151])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F0586A4C
	for <oe-kbuild-all@lists.linux.dev>; Sat, 11 Feb 2023 05:34:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1676093699; x=1707629699;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=2QNf1elOVD/etm/+4KmTLuJo8hyae9EX1HoxuLhR+zI=;
  b=TT9q9dkv1S/PNnSr+YRwznVk+kojUqCS3GLN7PcTF0KSMzwIHPCpew16
   vzIdT4iDGGMGy0vm+8xxCGILYLmjp5h76jRPb9IsN1R+VF/DQ4b8cGKzp
   EY/dZ6FS3MMCPL6pcogN76hooaWIS0aQZy/4sgMdD0xG//5J3bXfFXbZn
   jequPfkxFtuSJF/scAIjCnlg/kgi20Cz9Omip2UIzZ5+BptL8KMpiQBPp
   +dpho8INWdXxZCxKSMPbhDTOKkNEcvpRFoqsX0wlzHYxhFZlcXmv2Zd38
   m3JZ//s/06sFVrn9zLQGLF25nCWb3J/Ag5rUZnZ9UifAMpqyIXPQSS+sP
   w==;
X-IronPort-AV: E=McAfee;i="6500,9779,10617"; a="310951028"
X-IronPort-AV: E=Sophos;i="5.97,289,1669104000"; 
   d="scan'208";a="310951028"
Received: from orsmga004.jf.intel.com ([10.7.209.38])
  by fmsmga107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 10 Feb 2023 21:34:59 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10617"; a="792195731"
X-IronPort-AV: E=Sophos;i="5.97,289,1669104000"; 
   d="scan'208";a="792195731"
Received: from lkp-server01.sh.intel.com (HELO 4455601a8d94) ([10.239.97.150])
  by orsmga004.jf.intel.com with ESMTP; 10 Feb 2023 21:34:57 -0800
Received: from kbuild by 4455601a8d94 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1pQiXJ-0006HJ-0R;
	Sat, 11 Feb 2023 05:34:57 +0000
Date: Sat, 11 Feb 2023 13:34:33 +0800
From: kernel test robot <lkp@intel.com>
To: Yury Norov <yury.norov@gmail.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [norov:numa-improve 2/3]
 drivers/net/ethernet/mellanox/mlx5/core/eq.c:847:32: warning: suggest
 parentheses around assignment used as truth value
Message-ID: <202302111344.tdVmcGrR-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://github.com/norov/linux numa-improve
head:   44d77430b10a193932bbc758e21566f365b9b0e7
commit: 7c8533e8a8f49e9e310c075f6b581ab551dd8edc [2/3] sched_numa_hop_mask
config: sparc-allyesconfig (https://download.01.org/0day-ci/archive/20230211/202302111344.tdVmcGrR-lkp@intel.com/config)
compiler: sparc64-linux-gcc (GCC) 12.1.0
reproduce (this is a W=1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # https://github.com/norov/linux/commit/7c8533e8a8f49e9e310c075f6b581ab551dd8edc
        git remote add norov https://github.com/norov/linux
        git fetch --no-tags norov numa-improve
        git checkout 7c8533e8a8f49e9e310c075f6b581ab551dd8edc
        # save the config file
        mkdir build_dir && cp config build_dir/.config
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=gcc-12.1.0 make.cross W=1 O=build_dir ARCH=sparc olddefconfig
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=gcc-12.1.0 make.cross W=1 O=build_dir ARCH=sparc SHELL=/bin/bash drivers/net/ethernet/mellanox/mlx5/core/

If you fix the issue, kindly add following tag where applicable
| Reported-by: kernel test robot <lkp@intel.com>
| Link: https://lore.kernel.org/oe-kbuild-all/202302111344.tdVmcGrR-lkp@intel.com/

All warnings (new ones prefixed by >>):

   In file included from include/linux/interrupt.h:8,
                    from drivers/net/ethernet/mellanox/mlx5/core/eq.c:6:
   drivers/net/ethernet/mellanox/mlx5/core/eq.c: In function 'comp_irqs_request':
   include/linux/cpumask.h:1006:9: warning: initialization of 'unsigned int' from 'struct cpumask *' makes integer from pointer without a cast [-Wint-conversion]
    1006 |         ((struct cpumask *)(1 ? (bitmap)                                \
         |         ^
   include/linux/cpumask.h:934:23: note: in expansion of macro 'to_cpumask'
     934 | #define cpu_none_mask to_cpumask(cpu_bit_bitmap[0])
         |                       ^~~~~~~~~~
   include/linux/topology.h:276:51: note: in expansion of macro 'cpu_none_mask'
     276 |         for (unsigned int __hops = 0, prev_mask = cpu_none_mask;               \
         |                                                   ^~~~~~~~~~~~~
   drivers/net/ethernet/mellanox/mlx5/core/eq.c:847:9: note: in expansion of macro 'for_each_numa_hop_mask'
     847 |         for_each_numa_hop_mask(mask, prev, dev->priv.numa_node) {
         |         ^~~~~~~~~~~~~~~~~~~~~~
   In file included from include/linux/gfp.h:8,
                    from include/linux/xarray.h:15,
                    from include/linux/radix-tree.h:21,
                    from include/linux/idr.h:15,
                    from include/linux/kernfs.h:12,
                    from include/linux/sysfs.h:16,
                    from include/linux/kobject.h:20,
                    from include/linux/pci.h:35,
                    from include/linux/mlx5/driver.h:38,
                    from drivers/net/ethernet/mellanox/mlx5/core/eq.c:8:
>> drivers/net/ethernet/mellanox/mlx5/core/eq.c:847:32: warning: suggest parentheses around assignment used as truth value [-Wparentheses]
     847 |         for_each_numa_hop_mask(mask, prev, dev->priv.numa_node) {
         |                                ^~~~
   include/linux/topology.h:277:14: note: in definition of macro 'for_each_numa_hop_mask'
     277 |              mask = sched_numa_hop_mask(node, __hops);                         \
         |              ^~~~
   include/linux/topology.h:278:14: warning: value computed is not used [-Wunused-value]
     278 |              !IS_ERR_OR_NULL(mask);                                            \
         |              ^~~~~~~~~~~~~~~~~~~~~
   drivers/net/ethernet/mellanox/mlx5/core/eq.c:847:9: note: in expansion of macro 'for_each_numa_hop_mask'
     847 |         for_each_numa_hop_mask(mask, prev, dev->priv.numa_node) {
         |         ^~~~~~~~~~~~~~~~~~~~~~
   include/linux/topology.h:278:35: error: expected ')' before ';' token
     278 |              !IS_ERR_OR_NULL(mask);                                            \
         |                                   ^
   drivers/net/ethernet/mellanox/mlx5/core/eq.c:847:9: note: in expansion of macro 'for_each_numa_hop_mask'
     847 |         for_each_numa_hop_mask(mask, prev, dev->priv.numa_node) {
         |         ^~~~~~~~~~~~~~~~~~~~~~
   include/linux/topology.h:276:13: note: to match this '('
     276 |         for (unsigned int __hops = 0, prev_mask = cpu_none_mask;               \
         |             ^
   drivers/net/ethernet/mellanox/mlx5/core/eq.c:847:9: note: in expansion of macro 'for_each_numa_hop_mask'
     847 |         for_each_numa_hop_mask(mask, prev, dev->priv.numa_node) {
         |         ^~~~~~~~~~~~~~~~~~~~~~
   In file included from include/linux/bitmap.h:9,
                    from include/linux/cpumask.h:12:
   include/linux/cpumask.h:28:37: error: invalid type argument of '->' (have 'unsigned int')
      28 | #define cpumask_bits(maskp) ((maskp)->bits)
         |                                     ^~
   include/linux/find.h:536:53: note: in definition of macro 'for_each_andnot_bit'
     536 |              (bit) = find_next_andnot_bit((addr1), (addr2), (size), (bit)), (bit) < (size);\
         |                                                     ^~~~~
   include/linux/cpumask.h:328:55: note: in expansion of macro 'cpumask_bits'
     328 |         for_each_andnot_bit(cpu, cpumask_bits(mask1), cpumask_bits(mask2), nr_cpumask_bits)
         |                                                       ^~~~~~~~~~~~
   drivers/net/ethernet/mellanox/mlx5/core/eq.c:848:17: note: in expansion of macro 'for_each_cpu_andnot'
     848 |                 for_each_cpu_andnot(cpu, mask, prev) {
         |                 ^~~~~~~~~~~~~~~~~~~
   include/linux/find.h:536:75: warning: left-hand operand of comma expression has no effect [-Wunused-value]
     536 |              (bit) = find_next_andnot_bit((addr1), (addr2), (size), (bit)), (bit) < (size);\
         |                                                                           ^
   include/linux/cpumask.h:328:9: note: in expansion of macro 'for_each_andnot_bit'
     328 |         for_each_andnot_bit(cpu, cpumask_bits(mask1), cpumask_bits(mask2), nr_cpumask_bits)
         |         ^~~~~~~~~~~~~~~~~~~
   drivers/net/ethernet/mellanox/mlx5/core/eq.c:848:17: note: in expansion of macro 'for_each_cpu_andnot'
     848 |                 for_each_cpu_andnot(cpu, mask, prev) {
         |                 ^~~~~~~~~~~~~~~~~~~
   drivers/net/ethernet/mellanox/mlx5/core/eq.c:820:31: warning: unused variable 'prev' [-Wunused-variable]
     820 |         const struct cpumask *prev = cpu_none_mask;
         |                               ^~~~


vim +847 drivers/net/ethernet/mellanox/mlx5/core/eq.c

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
79b60ca83b6fa6 Shay Drory   2021-12-12  826  	int i;
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
975525edc1c9aa Yury Norov   2023-02-10 @847  	for_each_numa_hop_mask(mask, prev, dev->priv.numa_node) {
2acda57736de1e Tariq Toukan 2023-01-20  848  		for_each_cpu_andnot(cpu, mask, prev) {
2acda57736de1e Tariq Toukan 2023-01-20  849  			cpus[i] = cpu;
2acda57736de1e Tariq Toukan 2023-01-20  850  			if (++i == ncomp_eqs)
2acda57736de1e Tariq Toukan 2023-01-20  851  				goto spread_done;
2acda57736de1e Tariq Toukan 2023-01-20  852  		}
2acda57736de1e Tariq Toukan 2023-01-20  853  	}
2acda57736de1e Tariq Toukan 2023-01-20  854  spread_done:
2acda57736de1e Tariq Toukan 2023-01-20  855  	rcu_read_unlock();
79b60ca83b6fa6 Shay Drory   2021-12-12  856  	ret = mlx5_irqs_request_vectors(dev, cpus, ncomp_eqs, table->comp_irqs);
79b60ca83b6fa6 Shay Drory   2021-12-12  857  	kfree(cpus);
79b60ca83b6fa6 Shay Drory   2021-12-12  858  	if (ret < 0)
79b60ca83b6fa6 Shay Drory   2021-12-12  859  		goto free_irqs;
79b60ca83b6fa6 Shay Drory   2021-12-12  860  	return ret;
79b60ca83b6fa6 Shay Drory   2021-12-12  861  
79b60ca83b6fa6 Shay Drory   2021-12-12  862  free_irqs:
79b60ca83b6fa6 Shay Drory   2021-12-12  863  	kfree(table->comp_irqs);
79b60ca83b6fa6 Shay Drory   2021-12-12  864  	return ret;
79b60ca83b6fa6 Shay Drory   2021-12-12  865  }
79b60ca83b6fa6 Shay Drory   2021-12-12  866  

:::::: The code at line 847 was first introduced by commit
:::::: 975525edc1c9aaeb32e4d9adc753e198cae86e44 improve for_each_numa_hop

:::::: TO: Yury Norov <yury.norov@gmail.com>
:::::: CC: Yury Norov <yury.norov@gmail.com>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests
