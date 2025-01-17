Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.10])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2755125A659
	for <oe-kbuild-all@lists.linux.dev>; Fri, 17 Jan 2025 09:37:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.10
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1737106643; cv=none; b=eb37hLHXX6wQNDk8qApEKsvcrq1aPx0Qm2r5BCEc1YO689RkmJzDKuXlZ1qOdHfUC8S963/xxhDTzgtLzb6vI0jUAvAil9w04FRyR5h+4SsaBJOqNP330ptUENMFtxE3cP1DrQosGfag0kgQta8oK03WnYRKgTyAPSyXoeWsm0M=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1737106643; c=relaxed/simple;
	bh=oPIXBcPrngOAb9UWSi7G3SglIwWleQ207OuRNUExvNA=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=svWwlV3zEQ4viZfUQSbw4zqRAvixANsyLDapfqzveI82vXjfcrbmcpxQATqzvTPFAiXqTO2BXHX7qkPPo5pInSp1DzNMfz/aVATQfD4zZGqvLYC8i0RycNQbIH2NgsB3gL75D5LolIZjqjLBD1eA0aXQLYXn8A8NAdqmDAyjO3g=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=mRzrQKXY; arc=none smtp.client-ip=192.198.163.10
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="mRzrQKXY"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1737106641; x=1768642641;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=oPIXBcPrngOAb9UWSi7G3SglIwWleQ207OuRNUExvNA=;
  b=mRzrQKXYD2ZzN1YO8nxwFf/vQE7IMJEIzuQq8PpbqgkXfS9ZWutzofTC
   Sp8HltPkwV2nFhohGIQDD5gSiOXu4sOsgd0jGsPY8bw+9MOggmr+4bFn6
   Wk3/u5t9yx3ZuobcfZ7kOWpWZvlwYTgD4NDp1sUScMPcFNODD32xNHxzR
   0NoXw6MCznw/ZmJNx9gJXmbe5AfPnX5CoB7egLzUZOlGz1R91PhOTHzVG
   aXNO7HcuDLrqCJgcoCgjeksiIRGsUoENIso4iUHHwyq4Lk/eAf97+eXv5
   2fLZ9Z0OR/NI67nXGNwlOFSJTGJ7IFPsxrvxsmWZEKYBZZg/yccfjt6MJ
   Q==;
X-CSE-ConnectionGUID: R51HG2AmTECDQDm9wQcbtw==
X-CSE-MsgGUID: 1M6vzNsySQmKiVWCqVNGJQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11314"; a="48951333"
X-IronPort-AV: E=Sophos;i="6.12,310,1728975600"; 
   d="scan'208";a="48951333"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
  by fmvoesa104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 17 Jan 2025 01:37:20 -0800
X-CSE-ConnectionGUID: Bv+UmKp9SJqxo9N2EtGZow==
X-CSE-MsgGUID: hBDCD6G+TG2PPQ5wAf5PrA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,224,1728975600"; 
   d="scan'208";a="143040121"
Received: from lkp-server01.sh.intel.com (HELO d63d4d77d921) ([10.239.97.150])
  by orviesa001.jf.intel.com with ESMTP; 17 Jan 2025 01:37:19 -0800
Received: from kbuild by d63d4d77d921 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1tYimx-000T1n-39;
	Fri, 17 Jan 2025 09:37:15 +0000
Date: Fri, 17 Jan 2025 17:36:35 +0800
From: kernel test robot <lkp@intel.com>
To: Nicolas Bouchinet <nicolas.bouchinet@ssi.gouv.fr>
Cc: oe-kbuild-all@lists.linux.dev, Joel Granados <joel.granados@kernel.org>,
	Jan Kara <jack@suse.cz>
Subject: [joel-granados:jag/sysctl_usage_error 2/2] kernel/sysctl.c:2197:18:
 sparse: sparse: Initializer entry defined twice
Message-ID: <202501171753.XD44nkCL-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/joel.granados/linux.git jag/sysctl_usage_error
head:   d39a3f701b746dc3d15d205a66561dc4b98ab460
commit: d39a3f701b746dc3d15d205a66561dc4b98ab460 [2/2] sysctl: Fix underflow value setting risk in vm_table
config: i386-randconfig-061-20250116 (https://download.01.org/0day-ci/archive/20250117/202501171753.XD44nkCL-lkp@intel.com/config)
compiler: gcc-12 (Debian 12.2.0-14) 12.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250117/202501171753.XD44nkCL-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202501171753.XD44nkCL-lkp@intel.com/

sparse warnings: (new ones prefixed by >>)
>> kernel/sysctl.c:2197:18: sparse: sparse: Initializer entry defined twice
   kernel/sysctl.c:2198:18: sparse:   also defined here

vim +2197 kernel/sysctl.c

^1da177e4c3f41 Linus Torvalds               2005-04-16  2032  
f461d2dcd511c0 Christoph Hellwig            2020-04-24  2033  static struct ctl_table vm_table[] = {
e51b6ba077791f Eric W. Biederman            2007-11-30  2034  	{
f461d2dcd511c0 Christoph Hellwig            2020-04-24  2035  		.procname	= "overcommit_memory",
f461d2dcd511c0 Christoph Hellwig            2020-04-24  2036  		.data		= &sysctl_overcommit_memory,
f461d2dcd511c0 Christoph Hellwig            2020-04-24  2037  		.maxlen		= sizeof(sysctl_overcommit_memory),
d6e711448137ca Alan Cox                     2005-06-23  2038  		.mode		= 0644,
56f3547bfa4d36 Feng Tang                    2020-08-06  2039  		.proc_handler	= overcommit_policy_handler,
eec4844fae7c03 Matteo Croce                 2019-07-18  2040  		.extra1		= SYSCTL_ZERO,
78e36f3b0dae58 Xiaoming Ni                  2022-01-21  2041  		.extra2		= SYSCTL_TWO,
d6e711448137ca Alan Cox                     2005-06-23  2042  	},
f5dd3d6fadf98a Sam Vilain                   2006-10-02  2043  	{
f461d2dcd511c0 Christoph Hellwig            2020-04-24  2044  		.procname	= "overcommit_ratio",
f461d2dcd511c0 Christoph Hellwig            2020-04-24  2045  		.data		= &sysctl_overcommit_ratio,
f461d2dcd511c0 Christoph Hellwig            2020-04-24  2046  		.maxlen		= sizeof(sysctl_overcommit_ratio),
f461d2dcd511c0 Christoph Hellwig            2020-04-24  2047  		.mode		= 0644,
f461d2dcd511c0 Christoph Hellwig            2020-04-24  2048  		.proc_handler	= overcommit_ratio_handler,
d29216842a85c7 Eric W. Biederman            2016-09-28  2049  	},
00b7c3395aec3d Amerigo Wang                 2010-05-05  2050  	{
f461d2dcd511c0 Christoph Hellwig            2020-04-24  2051  		.procname	= "overcommit_kbytes",
f461d2dcd511c0 Christoph Hellwig            2020-04-24  2052  		.data		= &sysctl_overcommit_kbytes,
f461d2dcd511c0 Christoph Hellwig            2020-04-24  2053  		.maxlen		= sizeof(sysctl_overcommit_kbytes),
abd4f7505bafdd Masoud Asgharifard Sharbiani 2007-07-22  2054  		.mode		= 0644,
f461d2dcd511c0 Christoph Hellwig            2020-04-24  2055  		.proc_handler	= overcommit_kbytes_handler,
abd4f7505bafdd Masoud Asgharifard Sharbiani 2007-07-22  2056  	},
9f977fb7ae9ddf Octavian Purdila             2010-05-05  2057  	{
f461d2dcd511c0 Christoph Hellwig            2020-04-24  2058  		.procname	= "page-cluster",
f461d2dcd511c0 Christoph Hellwig            2020-04-24  2059  		.data		= &page_cluster,
b2be84df99ebc9 Masami Hiramatsu             2010-02-25  2060  		.maxlen		= sizeof(int),
b2be84df99ebc9 Masami Hiramatsu             2010-02-25  2061  		.mode		= 0644,
f461d2dcd511c0 Christoph Hellwig            2020-04-24  2062  		.proc_handler	= proc_dointvec_minmax,
eec4844fae7c03 Matteo Croce                 2019-07-18  2063  		.extra1		= SYSCTL_ZERO,
ea0ffd0c08d0fe Kairui Song                  2022-10-24  2064  		.extra2		= (void *)&page_cluster_max,
b2be84df99ebc9 Masami Hiramatsu             2010-02-25  2065  	},
^1da177e4c3f41 Linus Torvalds               2005-04-16  2066  	{
f461d2dcd511c0 Christoph Hellwig            2020-04-24  2067  		.procname	= "dirtytime_expire_seconds",
f461d2dcd511c0 Christoph Hellwig            2020-04-24  2068  		.data		= &dirtytime_expire_interval,
f461d2dcd511c0 Christoph Hellwig            2020-04-24  2069  		.maxlen		= sizeof(dirtytime_expire_interval),
f461d2dcd511c0 Christoph Hellwig            2020-04-24  2070  		.mode		= 0644,
f461d2dcd511c0 Christoph Hellwig            2020-04-24  2071  		.proc_handler	= dirtytime_interval_handler,
f461d2dcd511c0 Christoph Hellwig            2020-04-24  2072  		.extra1		= SYSCTL_ZERO,
f461d2dcd511c0 Christoph Hellwig            2020-04-24  2073  	},
fcfbd547b1209a Kirill Korotaev              2006-10-02  2074  	{
f461d2dcd511c0 Christoph Hellwig            2020-04-24  2075  		.procname	= "swappiness",
f461d2dcd511c0 Christoph Hellwig            2020-04-24  2076  		.data		= &vm_swappiness,
f461d2dcd511c0 Christoph Hellwig            2020-04-24  2077  		.maxlen		= sizeof(vm_swappiness),
f461d2dcd511c0 Christoph Hellwig            2020-04-24  2078  		.mode		= 0644,
f461d2dcd511c0 Christoph Hellwig            2020-04-24  2079  		.proc_handler	= proc_dointvec_minmax,
f461d2dcd511c0 Christoph Hellwig            2020-04-24  2080  		.extra1		= SYSCTL_ZERO,
78e36f3b0dae58 Xiaoming Ni                  2022-01-21  2081  		.extra2		= SYSCTL_TWO_HUNDRED,
f461d2dcd511c0 Christoph Hellwig            2020-04-24  2082  	},
43b5240ca6b331 Muchun Song                  2022-06-09  2083  #ifdef CONFIG_NUMA
43b5240ca6b331 Muchun Song                  2022-06-09  2084  	{
43b5240ca6b331 Muchun Song                  2022-06-09  2085  		.procname	= "numa_stat",
43b5240ca6b331 Muchun Song                  2022-06-09  2086  		.data		= &sysctl_vm_numa_stat,
43b5240ca6b331 Muchun Song                  2022-06-09  2087  		.maxlen		= sizeof(int),
43b5240ca6b331 Muchun Song                  2022-06-09  2088  		.mode		= 0644,
43b5240ca6b331 Muchun Song                  2022-06-09  2089  		.proc_handler	= sysctl_vm_numa_stat_handler,
43b5240ca6b331 Muchun Song                  2022-06-09  2090  		.extra1		= SYSCTL_ZERO,
43b5240ca6b331 Muchun Song                  2022-06-09  2091  		.extra2		= SYSCTL_ONE,
43b5240ca6b331 Muchun Song                  2022-06-09  2092  	},
f461d2dcd511c0 Christoph Hellwig            2020-04-24  2093  #endif
f461d2dcd511c0 Christoph Hellwig            2020-04-24  2094  	{
f461d2dcd511c0 Christoph Hellwig            2020-04-24  2095  		.procname	= "drop_caches",
f461d2dcd511c0 Christoph Hellwig            2020-04-24  2096  		.data		= &sysctl_drop_caches,
f461d2dcd511c0 Christoph Hellwig            2020-04-24  2097  		.maxlen		= sizeof(int),
f461d2dcd511c0 Christoph Hellwig            2020-04-24  2098  		.mode		= 0200,
f461d2dcd511c0 Christoph Hellwig            2020-04-24  2099  		.proc_handler	= drop_caches_sysctl_handler,
f461d2dcd511c0 Christoph Hellwig            2020-04-24  2100  		.extra1		= SYSCTL_ONE,
78e36f3b0dae58 Xiaoming Ni                  2022-01-21  2101  		.extra2		= SYSCTL_FOUR,
f461d2dcd511c0 Christoph Hellwig            2020-04-24  2102  	},
5ef64cc8987a92 Linus Torvalds               2020-09-13  2103  	{
5ef64cc8987a92 Linus Torvalds               2020-09-13  2104  		.procname	= "page_lock_unfairness",
5ef64cc8987a92 Linus Torvalds               2020-09-13  2105  		.data		= &sysctl_page_lock_unfairness,
5ef64cc8987a92 Linus Torvalds               2020-09-13  2106  		.maxlen		= sizeof(sysctl_page_lock_unfairness),
5ef64cc8987a92 Linus Torvalds               2020-09-13  2107  		.mode		= 0644,
5ef64cc8987a92 Linus Torvalds               2020-09-13  2108  		.proc_handler	= proc_dointvec_minmax,
5ef64cc8987a92 Linus Torvalds               2020-09-13  2109  		.extra1		= SYSCTL_ZERO,
5ef64cc8987a92 Linus Torvalds               2020-09-13  2110  	},
f461d2dcd511c0 Christoph Hellwig            2020-04-24  2111  #ifdef CONFIG_MMU
61d9b56a89208d Luis R. Rodriguez            2017-07-12  2112  	{
f461d2dcd511c0 Christoph Hellwig            2020-04-24  2113  		.procname	= "max_map_count",
f461d2dcd511c0 Christoph Hellwig            2020-04-24  2114  		.data		= &sysctl_max_map_count,
f461d2dcd511c0 Christoph Hellwig            2020-04-24  2115  		.maxlen		= sizeof(sysctl_max_map_count),
f461d2dcd511c0 Christoph Hellwig            2020-04-24  2116  		.mode		= 0644,
f461d2dcd511c0 Christoph Hellwig            2020-04-24  2117  		.proc_handler	= proc_dointvec_minmax,
f461d2dcd511c0 Christoph Hellwig            2020-04-24  2118  		.extra1		= SYSCTL_ZERO,
f461d2dcd511c0 Christoph Hellwig            2020-04-24  2119  	},
f461d2dcd511c0 Christoph Hellwig            2020-04-24  2120  #else
7a8d181949fb2c Joe Lawrence                 2017-11-17  2121  	{
f461d2dcd511c0 Christoph Hellwig            2020-04-24  2122  		.procname	= "nr_trim_pages",
f461d2dcd511c0 Christoph Hellwig            2020-04-24  2123  		.data		= &sysctl_nr_trim_pages,
f461d2dcd511c0 Christoph Hellwig            2020-04-24  2124  		.maxlen		= sizeof(sysctl_nr_trim_pages),
f461d2dcd511c0 Christoph Hellwig            2020-04-24  2125  		.mode		= 0644,
f461d2dcd511c0 Christoph Hellwig            2020-04-24  2126  		.proc_handler	= proc_dointvec_minmax,
f461d2dcd511c0 Christoph Hellwig            2020-04-24  2127  		.extra1		= SYSCTL_ZERO,
f461d2dcd511c0 Christoph Hellwig            2020-04-24  2128  	},
bfdc0b497faa82 Richard Weinberger           2011-03-23  2129  #endif
54b501992dd2a8 Kees Cook                    2012-07-30  2130  	{
f461d2dcd511c0 Christoph Hellwig            2020-04-24  2131  		.procname	= "vfs_cache_pressure",
f461d2dcd511c0 Christoph Hellwig            2020-04-24  2132  		.data		= &sysctl_vfs_cache_pressure,
f461d2dcd511c0 Christoph Hellwig            2020-04-24  2133  		.maxlen		= sizeof(sysctl_vfs_cache_pressure),
f461d2dcd511c0 Christoph Hellwig            2020-04-24  2134  		.mode		= 0644,
3b3376f222e3ab Lin Feng                     2021-02-25  2135  		.proc_handler	= proc_dointvec_minmax,
f461d2dcd511c0 Christoph Hellwig            2020-04-24  2136  		.extra1		= SYSCTL_ZERO,
f461d2dcd511c0 Christoph Hellwig            2020-04-24  2137  	},
f461d2dcd511c0 Christoph Hellwig            2020-04-24  2138  #if defined(HAVE_ARCH_PICK_MMAP_LAYOUT) || \
f461d2dcd511c0 Christoph Hellwig            2020-04-24  2139      defined(CONFIG_ARCH_WANT_DEFAULT_TOPDOWN_MMAP_LAYOUT)
54b501992dd2a8 Kees Cook                    2012-07-30  2140  	{
f461d2dcd511c0 Christoph Hellwig            2020-04-24  2141  		.procname	= "legacy_va_layout",
f461d2dcd511c0 Christoph Hellwig            2020-04-24  2142  		.data		= &sysctl_legacy_va_layout,
f461d2dcd511c0 Christoph Hellwig            2020-04-24  2143  		.maxlen		= sizeof(sysctl_legacy_va_layout),
f461d2dcd511c0 Christoph Hellwig            2020-04-24  2144  		.mode		= 0644,
3b3376f222e3ab Lin Feng                     2021-02-25  2145  		.proc_handler	= proc_dointvec_minmax,
f461d2dcd511c0 Christoph Hellwig            2020-04-24  2146  		.extra1		= SYSCTL_ZERO,
f461d2dcd511c0 Christoph Hellwig            2020-04-24  2147  	},
046d662f481830 Alex Kelly                   2012-10-04  2148  #endif
f461d2dcd511c0 Christoph Hellwig            2020-04-24  2149  #ifdef CONFIG_NUMA
eaee41727e6d8a Dmitry Safonov               2020-03-02  2150  	{
f461d2dcd511c0 Christoph Hellwig            2020-04-24  2151  		.procname	= "zone_reclaim_mode",
f461d2dcd511c0 Christoph Hellwig            2020-04-24  2152  		.data		= &node_reclaim_mode,
f461d2dcd511c0 Christoph Hellwig            2020-04-24  2153  		.maxlen		= sizeof(node_reclaim_mode),
f461d2dcd511c0 Christoph Hellwig            2020-04-24  2154  		.mode		= 0644,
3b3376f222e3ab Lin Feng                     2021-02-25  2155  		.proc_handler	= proc_dointvec_minmax,
f461d2dcd511c0 Christoph Hellwig            2020-04-24  2156  		.extra1		= SYSCTL_ZERO,
f461d2dcd511c0 Christoph Hellwig            2020-04-24  2157  	},
046d662f481830 Alex Kelly                   2012-10-04  2158  #endif
f461d2dcd511c0 Christoph Hellwig            2020-04-24  2159  #ifdef CONFIG_SMP
^1da177e4c3f41 Linus Torvalds               2005-04-16  2160  	{
f461d2dcd511c0 Christoph Hellwig            2020-04-24  2161  		.procname	= "stat_interval",
f461d2dcd511c0 Christoph Hellwig            2020-04-24  2162  		.data		= &sysctl_stat_interval,
f461d2dcd511c0 Christoph Hellwig            2020-04-24  2163  		.maxlen		= sizeof(sysctl_stat_interval),
f461d2dcd511c0 Christoph Hellwig            2020-04-24  2164  		.mode		= 0644,
f461d2dcd511c0 Christoph Hellwig            2020-04-24  2165  		.proc_handler	= proc_dointvec_jiffies,
f461d2dcd511c0 Christoph Hellwig            2020-04-24  2166  	},
^1da177e4c3f41 Linus Torvalds               2005-04-16  2167  	{
f461d2dcd511c0 Christoph Hellwig            2020-04-24  2168  		.procname	= "stat_refresh",
f461d2dcd511c0 Christoph Hellwig            2020-04-24  2169  		.data		= NULL,
f461d2dcd511c0 Christoph Hellwig            2020-04-24  2170  		.maxlen		= 0,
f461d2dcd511c0 Christoph Hellwig            2020-04-24  2171  		.mode		= 0600,
f461d2dcd511c0 Christoph Hellwig            2020-04-24  2172  		.proc_handler	= vmstat_refresh,
f461d2dcd511c0 Christoph Hellwig            2020-04-24  2173  	},
046d662f481830 Alex Kelly                   2012-10-04  2174  #endif
f461d2dcd511c0 Christoph Hellwig            2020-04-24  2175  #ifdef CONFIG_MMU
^1da177e4c3f41 Linus Torvalds               2005-04-16  2176  	{
f461d2dcd511c0 Christoph Hellwig            2020-04-24  2177  		.procname	= "mmap_min_addr",
f461d2dcd511c0 Christoph Hellwig            2020-04-24  2178  		.data		= &dac_mmap_min_addr,
f461d2dcd511c0 Christoph Hellwig            2020-04-24  2179  		.maxlen		= sizeof(unsigned long),
f461d2dcd511c0 Christoph Hellwig            2020-04-24  2180  		.mode		= 0644,
f461d2dcd511c0 Christoph Hellwig            2020-04-24  2181  		.proc_handler	= mmap_min_addr_handler,
f461d2dcd511c0 Christoph Hellwig            2020-04-24  2182  	},
eaee41727e6d8a Dmitry Safonov               2020-03-02  2183  #endif
f461d2dcd511c0 Christoph Hellwig            2020-04-24  2184  #if (defined(CONFIG_X86_32) && !defined(CONFIG_UML))|| \
f461d2dcd511c0 Christoph Hellwig            2020-04-24  2185     (defined(CONFIG_SUPERH) && defined(CONFIG_VSYSCALL))
^1da177e4c3f41 Linus Torvalds               2005-04-16  2186  	{
f461d2dcd511c0 Christoph Hellwig            2020-04-24  2187  		.procname	= "vdso_enabled",
f461d2dcd511c0 Christoph Hellwig            2020-04-24  2188  #ifdef CONFIG_X86_32
f461d2dcd511c0 Christoph Hellwig            2020-04-24  2189  		.data		= &vdso32_enabled,
f461d2dcd511c0 Christoph Hellwig            2020-04-24  2190  		.maxlen		= sizeof(vdso32_enabled),
f461d2dcd511c0 Christoph Hellwig            2020-04-24  2191  #else
f461d2dcd511c0 Christoph Hellwig            2020-04-24  2192  		.data		= &vdso_enabled,
f461d2dcd511c0 Christoph Hellwig            2020-04-24  2193  		.maxlen		= sizeof(vdso_enabled),
f461d2dcd511c0 Christoph Hellwig            2020-04-24  2194  #endif
f461d2dcd511c0 Christoph Hellwig            2020-04-24  2195  		.mode		= 0644,
d39a3f701b746d Nicolas Bouchinet            2024-12-17  2196  		.proc_handler	= proc_dointvec_minmax,
f461d2dcd511c0 Christoph Hellwig            2020-04-24 @2197  		.extra1		= SYSCTL_ZERO,
d39a3f701b746d Nicolas Bouchinet            2024-12-17  2198  		.extra1		= SYSCTL_ONE,
f461d2dcd511c0 Christoph Hellwig            2020-04-24  2199  	},
f461d2dcd511c0 Christoph Hellwig            2020-04-24  2200  #endif
9ec52099e4b867 Cedric Le Goater             2006-10-02  2201  	{
f461d2dcd511c0 Christoph Hellwig            2020-04-24  2202  		.procname	= "user_reserve_kbytes",
f461d2dcd511c0 Christoph Hellwig            2020-04-24  2203  		.data		= &sysctl_user_reserve_kbytes,
f461d2dcd511c0 Christoph Hellwig            2020-04-24  2204  		.maxlen		= sizeof(sysctl_user_reserve_kbytes),
f461d2dcd511c0 Christoph Hellwig            2020-04-24  2205  		.mode		= 0644,
f461d2dcd511c0 Christoph Hellwig            2020-04-24  2206  		.proc_handler	= proc_doulongvec_minmax,
f461d2dcd511c0 Christoph Hellwig            2020-04-24  2207  	},
9f977fb7ae9ddf Octavian Purdila             2010-05-05  2208  	{
f461d2dcd511c0 Christoph Hellwig            2020-04-24  2209  		.procname	= "admin_reserve_kbytes",
f461d2dcd511c0 Christoph Hellwig            2020-04-24  2210  		.data		= &sysctl_admin_reserve_kbytes,
f461d2dcd511c0 Christoph Hellwig            2020-04-24  2211  		.maxlen		= sizeof(sysctl_admin_reserve_kbytes),
f461d2dcd511c0 Christoph Hellwig            2020-04-24  2212  		.mode		= 0644,
f461d2dcd511c0 Christoph Hellwig            2020-04-24  2213  		.proc_handler	= proc_doulongvec_minmax,
f461d2dcd511c0 Christoph Hellwig            2020-04-24  2214  	},
f461d2dcd511c0 Christoph Hellwig            2020-04-24  2215  #ifdef CONFIG_HAVE_ARCH_MMAP_RND_BITS
^1da177e4c3f41 Linus Torvalds               2005-04-16  2216  	{
f461d2dcd511c0 Christoph Hellwig            2020-04-24  2217  		.procname	= "mmap_rnd_bits",
f461d2dcd511c0 Christoph Hellwig            2020-04-24  2218  		.data		= &mmap_rnd_bits,
f461d2dcd511c0 Christoph Hellwig            2020-04-24  2219  		.maxlen		= sizeof(mmap_rnd_bits),
f461d2dcd511c0 Christoph Hellwig            2020-04-24  2220  		.mode		= 0600,
f461d2dcd511c0 Christoph Hellwig            2020-04-24  2221  		.proc_handler	= proc_dointvec_minmax,
f461d2dcd511c0 Christoph Hellwig            2020-04-24  2222  		.extra1		= (void *)&mmap_rnd_bits_min,
f461d2dcd511c0 Christoph Hellwig            2020-04-24  2223  		.extra2		= (void *)&mmap_rnd_bits_max,
f461d2dcd511c0 Christoph Hellwig            2020-04-24  2224  	},
f461d2dcd511c0 Christoph Hellwig            2020-04-24  2225  #endif
f461d2dcd511c0 Christoph Hellwig            2020-04-24  2226  #ifdef CONFIG_HAVE_ARCH_MMAP_RND_COMPAT_BITS
^1da177e4c3f41 Linus Torvalds               2005-04-16  2227  	{
f461d2dcd511c0 Christoph Hellwig            2020-04-24  2228  		.procname	= "mmap_rnd_compat_bits",
f461d2dcd511c0 Christoph Hellwig            2020-04-24  2229  		.data		= &mmap_rnd_compat_bits,
f461d2dcd511c0 Christoph Hellwig            2020-04-24  2230  		.maxlen		= sizeof(mmap_rnd_compat_bits),
f461d2dcd511c0 Christoph Hellwig            2020-04-24  2231  		.mode		= 0600,
f461d2dcd511c0 Christoph Hellwig            2020-04-24  2232  		.proc_handler	= proc_dointvec_minmax,
f461d2dcd511c0 Christoph Hellwig            2020-04-24  2233  		.extra1		= (void *)&mmap_rnd_compat_bits_min,
f461d2dcd511c0 Christoph Hellwig            2020-04-24  2234  		.extra2		= (void *)&mmap_rnd_compat_bits_max,
f461d2dcd511c0 Christoph Hellwig            2020-04-24  2235  	},
f461d2dcd511c0 Christoph Hellwig            2020-04-24  2236  #endif
f461d2dcd511c0 Christoph Hellwig            2020-04-24  2237  };
^1da177e4c3f41 Linus Torvalds               2005-04-16  2238  

:::::: The code at line 2197 was first introduced by commit
:::::: f461d2dcd511c020a26d4d791fae595c65ed09b6 sysctl: avoid forward declarations

:::::: TO: Christoph Hellwig <hch@lst.de>
:::::: CC: Al Viro <viro@zeniv.linux.org.uk>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
