Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.9])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E74ED42A83
	for <oe-kbuild-all@lists.linux.dev>; Wed, 20 Nov 2024 01:12:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.9
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1732065155; cv=none; b=fxnNG2zuAiGpjUlUhLurfqLHcExXqKOvAkoDZLvTEoSyHnAo7fcAraC6/BhVH7XTfiCcn8Os8Ncn8s+FNIoXfKhnsq7z5RUdnb0gSCzBHpoGQXWdgXxCl1AK6Gc6uLHuT9yHK+uSUHqxJkp0mlgLlwz8WPD+V5KI8931b2dxwGQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1732065155; c=relaxed/simple;
	bh=Wv5BzXDoJyudx5FEoL/WmxsUXP0VP7NDT4zztjlWcHg=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=Xw4hK+zG/WowCB/gH7oUBzvbrsc4HGvDjKHCmOkiDSPLGfpEr5emfZTV0F83nj5BzHfYI2XYZZmBa1IE+i+E6SvpE5+tAt3pjOC0+EQTTq6DN/Ns9hxBFtgO3GMT81m6Pqgq3o+zt3FL7TYJz2TZrAmCo4MbQB+aT979YKi07mw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=lX4tC9/J; arc=none smtp.client-ip=198.175.65.9
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="lX4tC9/J"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1732065154; x=1763601154;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=Wv5BzXDoJyudx5FEoL/WmxsUXP0VP7NDT4zztjlWcHg=;
  b=lX4tC9/JrvOqWc15tBmkUdHiOsFda+uNsGmTHu31QYdKICqbG4IMk3IH
   Ejkaf6Op5KZtvzgQqu/5pMmuX1Eliu+I8umQwbF/kDW08D1HT//rv5FAP
   pOTuTsxzKnXXypGc8CjkC5rSxRSFyss51T1+CL43uSri+BVtx0ElH6bUk
   c5+mDv4/Mm1PrndbCginF2TpUsgfI6i8mP/SB7dhMXMbep3IDNnhlk2WK
   eMQs6/p8P0ziq6fNDHiUckCpk+VjkCG4SgH6FpB9LpuAWVO0iwgx5dwo1
   MSCZiFnmHtkyoaz+olFEegqGl5ufa1K330EIhNM6cSNR48UI7QDTNXvQO
   g==;
X-CSE-ConnectionGUID: /b5pW5iETZCtE1oB4rUmJw==
X-CSE-MsgGUID: lSEMHDJOShGdiYtTYmXjZw==
X-IronPort-AV: E=McAfee;i="6700,10204,11261"; a="54602150"
X-IronPort-AV: E=Sophos;i="6.12,168,1728975600"; 
   d="scan'208";a="54602150"
Received: from orviesa003.jf.intel.com ([10.64.159.143])
  by orvoesa101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 19 Nov 2024 17:12:30 -0800
X-CSE-ConnectionGUID: +ZBl1uafS6Oem981hglzhA==
X-CSE-MsgGUID: fuP7EXymSbSwyin4JX6ztw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.11,199,1725346800"; 
   d="scan'208";a="94805466"
Received: from lkp-server01.sh.intel.com (HELO 8122d2fc1967) ([10.239.97.150])
  by orviesa003.jf.intel.com with ESMTP; 19 Nov 2024 17:12:29 -0800
Received: from kbuild by 8122d2fc1967 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1tDZGc-0000Oj-1P;
	Wed, 20 Nov 2024 01:12:26 +0000
Date: Wed, 20 Nov 2024 09:11:49 +0800
From: kernel test robot <lkp@intel.com>
To: kernel@openeuler.org, Zheng Zengkai <zhengzengkai@huawei.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [openeuler:OLK-5.10 2430/2430] net/ipv4/sysctl_net_ipv4.c:477:50:
 sparse: sparse: incorrect type in argument 3 (different address spaces)
Message-ID: <202411191914.zP0QrT48-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://gitee.com/openeuler/kernel.git OLK-5.10
head:   e74aedc9df70f84e50a280478b93d98b3a622bc3
commit: dae7bed961c55d9837eada7f98f34f1adb0e9d21 [2430/2430] tcp_comp: add sysctl for enable/disable compression
config: x86_64-randconfig-121-20241114 (https://download.01.org/0day-ci/archive/20241119/202411191914.zP0QrT48-lkp@intel.com/config)
compiler: gcc-12 (Debian 12.2.0-14) 12.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20241119/202411191914.zP0QrT48-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202411191914.zP0QrT48-lkp@intel.com/

sparse warnings: (new ones prefixed by >>)
>> net/ipv4/sysctl_net_ipv4.c:477:50: sparse: sparse: incorrect type in argument 3 (different address spaces) @@     expected void * @@     got void [noderef] __user *buffer @@
   net/ipv4/sysctl_net_ipv4.c:477:50: sparse:     expected void *
   net/ipv4/sysctl_net_ipv4.c:477:50: sparse:     got void [noderef] __user *buffer
>> net/ipv4/sysctl_net_ipv4.c:621:35: sparse: sparse: incorrect type in initializer (incompatible argument 3 (different address spaces)) @@     expected int ( [usertype] *proc_handler )( ... ) @@     got int ( * )( ... ) @@
   net/ipv4/sysctl_net_ipv4.c:621:35: sparse:     expected int ( [usertype] *proc_handler )( ... )
   net/ipv4/sysctl_net_ipv4.c:621:35: sparse:     got int ( * )( ... )

vim +477 net/ipv4/sysctl_net_ipv4.c

   467	
   468	#if IS_ENABLED(CONFIG_TCP_COMP)
   469	static int proc_tcp_compression_ports(struct ctl_table *table, int write,
   470					      void __user *buffer, size_t *lenp,
   471					      loff_t *ppos)
   472	{
   473		unsigned long *bitmap = *(unsigned long **)table->data;
   474		unsigned long bitmap_len = table->maxlen;
   475		int ret;
   476	
 > 477		ret = proc_do_large_bitmap(table, write, buffer, lenp, ppos);
   478		if (write && ret == 0) {
   479			if (bitmap_empty(bitmap, bitmap_len)) {
   480				if (static_key_enabled(&tcp_have_comp))
   481					static_branch_disable(&tcp_have_comp);
   482			} else {
   483				if (!static_key_enabled(&tcp_have_comp))
   484					static_branch_enable(&tcp_have_comp);
   485			}
   486		}
   487	
   488		return ret;
   489	}
   490	#endif
   491	
   492	static struct ctl_table ipv4_table[] = {
   493		{
   494			.procname	= "tcp_max_orphans",
   495			.data		= &sysctl_tcp_max_orphans,
   496			.maxlen		= sizeof(int),
   497			.mode		= 0644,
   498			.proc_handler	= proc_dointvec
   499		},
   500		{
   501			.procname	= "inet_peer_threshold",
   502			.data		= &inet_peer_threshold,
   503			.maxlen		= sizeof(int),
   504			.mode		= 0644,
   505			.proc_handler	= proc_dointvec
   506		},
   507		{
   508			.procname	= "inet_peer_minttl",
   509			.data		= &inet_peer_minttl,
   510			.maxlen		= sizeof(int),
   511			.mode		= 0644,
   512			.proc_handler	= proc_dointvec_jiffies,
   513		},
   514		{
   515			.procname	= "inet_peer_maxttl",
   516			.data		= &inet_peer_maxttl,
   517			.maxlen		= sizeof(int),
   518			.mode		= 0644,
   519			.proc_handler	= proc_dointvec_jiffies,
   520		},
   521		{
   522			.procname	= "tcp_mem",
   523			.maxlen		= sizeof(sysctl_tcp_mem),
   524			.data		= &sysctl_tcp_mem,
   525			.mode		= 0644,
   526			.proc_handler	= proc_doulongvec_minmax,
   527		},
   528		{
   529			.procname	= "tcp_low_latency",
   530			.data		= &sysctl_tcp_low_latency,
   531			.maxlen		= sizeof(int),
   532			.mode		= 0644,
   533			.proc_handler	= proc_dointvec
   534		},
   535	#ifdef CONFIG_NETLABEL
   536		{
   537			.procname	= "cipso_cache_enable",
   538			.data		= &cipso_v4_cache_enabled,
   539			.maxlen		= sizeof(int),
   540			.mode		= 0644,
   541			.proc_handler	= proc_dointvec,
   542		},
   543		{
   544			.procname	= "cipso_cache_bucket_size",
   545			.data		= &cipso_v4_cache_bucketsize,
   546			.maxlen		= sizeof(int),
   547			.mode		= 0644,
   548			.proc_handler	= proc_dointvec,
   549		},
   550		{
   551			.procname	= "cipso_rbm_optfmt",
   552			.data		= &cipso_v4_rbm_optfmt,
   553			.maxlen		= sizeof(int),
   554			.mode		= 0644,
   555			.proc_handler	= proc_dointvec,
   556		},
   557		{
   558			.procname	= "cipso_rbm_strictvalid",
   559			.data		= &cipso_v4_rbm_strictvalid,
   560			.maxlen		= sizeof(int),
   561			.mode		= 0644,
   562			.proc_handler	= proc_dointvec,
   563		},
   564	#endif /* CONFIG_NETLABEL */
   565		{
   566			.procname	= "tcp_available_ulp",
   567			.maxlen		= TCP_ULP_BUF_MAX,
   568			.mode		= 0444,
   569			.proc_handler   = proc_tcp_available_ulp,
   570		},
   571		{
   572			.procname	= "icmp_msgs_per_sec",
   573			.data		= &sysctl_icmp_msgs_per_sec,
   574			.maxlen		= sizeof(int),
   575			.mode		= 0644,
   576			.proc_handler	= proc_dointvec_minmax,
   577			.extra1		= SYSCTL_ZERO,
   578		},
   579		{
   580			.procname	= "icmp_msgs_burst",
   581			.data		= &sysctl_icmp_msgs_burst,
   582			.maxlen		= sizeof(int),
   583			.mode		= 0644,
   584			.proc_handler	= proc_dointvec_minmax,
   585			.extra1		= SYSCTL_ZERO,
   586		},
   587		{
   588			.procname	= "udp_mem",
   589			.data		= &sysctl_udp_mem,
   590			.maxlen		= sizeof(sysctl_udp_mem),
   591			.mode		= 0644,
   592			.proc_handler	= proc_doulongvec_minmax,
   593		},
   594		{
   595			.procname	= "fib_sync_mem",
   596			.data		= &sysctl_fib_sync_mem,
   597			.maxlen		= sizeof(sysctl_fib_sync_mem),
   598			.mode		= 0644,
   599			.proc_handler	= proc_douintvec_minmax,
   600			.extra1		= &sysctl_fib_sync_mem_min,
   601			.extra2		= &sysctl_fib_sync_mem_max,
   602		},
   603		{
   604			.procname	= "tcp_rx_skb_cache",
   605			.data		= &tcp_rx_skb_cache_key.key,
   606			.mode		= 0644,
   607			.proc_handler	= proc_do_static_key,
   608		},
   609		{
   610			.procname	= "tcp_tx_skb_cache",
   611			.data		= &tcp_tx_skb_cache_key.key,
   612			.mode		= 0644,
   613			.proc_handler	= proc_do_static_key,
   614		},
   615	#if IS_ENABLED(CONFIG_TCP_COMP)
   616		{
   617			.procname	= "tcp_compression_ports",
   618			.data		= &sysctl_tcp_compression_ports,
   619			.maxlen		= 65536,
   620			.mode		= 0644,
 > 621			.proc_handler	= proc_tcp_compression_ports,
   622		},
   623	#endif
   624		{ }
   625	};
   626	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
