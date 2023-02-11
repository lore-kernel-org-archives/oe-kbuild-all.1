Received: from mga14.intel.com (mga14.intel.com [192.55.52.115])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 06BB47F0
	for <oe-kbuild-all@lists.linux.dev>; Sat, 11 Feb 2023 04:43:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1676090639; x=1707626639;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=ocsyosgoVyr3txpxyhGGypYFnqEjyiXgs5IeYEZd2MA=;
  b=FdivCgxqnZRPgRF1+5am5zinwFiSdYFgfQcUaTKEHH66+6KYBGV0oEdc
   ND1vC+JTqrxPf8kiNxo3rvSc6eX9mO6EDZadVwL8UZMK2/avU9o5d8NbO
   1CkHwwHpRMDLoj8K98Wwi0fzWhUdwhwH8QauOQQlFwchOsXdB4V6nMkUs
   c1DTOSTNMfEvngRGnYEPrIURlqGywDaqwqNxHauDX1c5Ezg9ABIAz0ruZ
   bZXPqdDSAYYI+pmF9typSINbf4hq/TRTXLCxhgHLGXBEDZXGkXHe0Uxt2
   Ls1yPW4zJ3FYE4W3s3pZNFaPhQOm1Yb9xGkDsfX5CSQTiNNi0GTdZ4O4/
   A==;
X-IronPort-AV: E=McAfee;i="6500,9779,10617"; a="330592653"
X-IronPort-AV: E=Sophos;i="5.97,289,1669104000"; 
   d="scan'208";a="330592653"
Received: from orsmga006.jf.intel.com ([10.7.209.51])
  by fmsmga103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 10 Feb 2023 20:43:58 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10617"; a="645844814"
X-IronPort-AV: E=Sophos;i="5.97,289,1669104000"; 
   d="scan'208";a="645844814"
Received: from lkp-server01.sh.intel.com (HELO 4455601a8d94) ([10.239.97.150])
  by orsmga006.jf.intel.com with ESMTP; 10 Feb 2023 20:43:56 -0800
Received: from kbuild by 4455601a8d94 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1pQhjw-0006Fl-0M;
	Sat, 11 Feb 2023 04:43:56 +0000
Date: Sat, 11 Feb 2023 12:43:47 +0800
From: kernel test robot <lkp@intel.com>
To: Yury Norov <yury.norov@gmail.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [norov:numa-improve 1/3] include/linux/cpumask.h:1006:9: warning:
 initialization of 'unsigned int' from 'struct cpumask *' makes integer from
 pointer without a cast
Message-ID: <202302111257.ZnQ4u1Un-lkp@intel.com>
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
commit: 975525edc1c9aaeb32e4d9adc753e198cae86e44 [1/3] improve for_each_numa_hop
config: sparc-allyesconfig (https://download.01.org/0day-ci/archive/20230211/202302111257.ZnQ4u1Un-lkp@intel.com/config)
compiler: sparc64-linux-gcc (GCC) 12.1.0
reproduce (this is a W=1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # https://github.com/norov/linux/commit/975525edc1c9aaeb32e4d9adc753e198cae86e44
        git remote add norov https://github.com/norov/linux
        git fetch --no-tags norov numa-improve
        git checkout 975525edc1c9aaeb32e4d9adc753e198cae86e44
        # save the config file
        mkdir build_dir && cp config build_dir/.config
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=gcc-12.1.0 make.cross W=1 O=build_dir ARCH=sparc olddefconfig
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=gcc-12.1.0 make.cross W=1 O=build_dir ARCH=sparc SHELL=/bin/bash drivers/net/ethernet/mellanox/mlx5/core/

If you fix the issue, kindly add following tag where applicable
| Reported-by: kernel test robot <lkp@intel.com>
| Link: https://lore.kernel.org/oe-kbuild-all/202302111257.ZnQ4u1Un-lkp@intel.com/

All warnings (new ones prefixed by >>):

   In file included from include/linux/interrupt.h:8,
                    from drivers/net/ethernet/mellanox/mlx5/core/eq.c:6:
   drivers/net/ethernet/mellanox/mlx5/core/eq.c: In function 'comp_irqs_request':
>> include/linux/cpumask.h:1006:9: warning: initialization of 'unsigned int' from 'struct cpumask *' makes integer from pointer without a cast [-Wint-conversion]
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
   include/linux/topology.h:281:34: warning: assignment to 'unsigned int' from 'const struct cpumask *' makes integer from pointer without a cast [-Wint-conversion]
     281 |              __hops++, prev_mask = mask)
         |                                  ^
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


vim +1006 include/linux/cpumask.h

9425676a363c09 Rasmus Villemoes 2016-01-20   994  
6ba2ef7baac23a Rusty Russell    2009-09-24   995  /**
6ba2ef7baac23a Rusty Russell    2009-09-24   996   * to_cpumask - convert an NR_CPUS bitmap to a struct cpumask *
6ba2ef7baac23a Rusty Russell    2009-09-24   997   * @bitmap: the bitmap
6ba2ef7baac23a Rusty Russell    2009-09-24   998   *
6ba2ef7baac23a Rusty Russell    2009-09-24   999   * There are a few places where cpumask_var_t isn't appropriate and
6ba2ef7baac23a Rusty Russell    2009-09-24  1000   * static cpumasks must be used (eg. very early boot), yet we don't
6ba2ef7baac23a Rusty Russell    2009-09-24  1001   * expose the definition of 'struct cpumask'.
6ba2ef7baac23a Rusty Russell    2009-09-24  1002   *
6ba2ef7baac23a Rusty Russell    2009-09-24  1003   * This does the conversion, and can be used as a constant initializer.
6ba2ef7baac23a Rusty Russell    2009-09-24  1004   */
6ba2ef7baac23a Rusty Russell    2009-09-24  1005  #define to_cpumask(bitmap)						\
6ba2ef7baac23a Rusty Russell    2009-09-24 @1006  	((struct cpumask *)(1 ? (bitmap)				\
6ba2ef7baac23a Rusty Russell    2009-09-24  1007  			    : (void *)sizeof(__check_is_bitmap(bitmap))))
6ba2ef7baac23a Rusty Russell    2009-09-24  1008  

:::::: The code at line 1006 was first introduced by commit
:::::: 6ba2ef7baac23a5d9bb85e28b882d16b439a2293 cpumask: Move deprecated functions to end of header.

:::::: TO: Rusty Russell <rusty@rustcorp.com.au>
:::::: CC: Rusty Russell <rusty@rustcorp.com.au>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests
