Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.14])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DE67E142905
	for <oe-kbuild-all@lists.linux.dev>; Mon, 27 Jan 2025 18:08:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.14
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738001318; cv=none; b=n92VceZ1RxyUhtyLy6lMypK80g3geQjVYFGVJxduDouwRgzwEdG2ish2PMnl7+6LctcX+A8R3wroZ7NNx3NnVrWSQ/Hj2xDA5DZMNSfkh0mi3RVrNvocrgWxdCg93inydUQ9d3P6b71Zcq306jnXUP32Zw9CmJ1zJsp6zLxJo4w=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738001318; c=relaxed/simple;
	bh=B/RVQnVt2C+I0P/3ut+HJKgwSlMgzPAYgE6V987TekM=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=augBBXF0RD4zNCp/qo40no0QAy+RdXrQZRQQgGsdEgbaIgj7/RdvZeQyMXkhm/Jn8gBBqTpaNqr4QhPf5Js5Fa3VrpLKD6Rk097kFypBh2idaQEzlpMqZU7veN241sUK2UnVPd1moKnZdOPVzmQTS5deGOwgRahl+X8y/mHgf2A=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=kASaiP71; arc=none smtp.client-ip=198.175.65.14
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="kASaiP71"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1738001316; x=1769537316;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=B/RVQnVt2C+I0P/3ut+HJKgwSlMgzPAYgE6V987TekM=;
  b=kASaiP71CYZasg9jNxcFxXMYjh/JKrnlmUcChd5QnBu6ki8v1XxBRXIC
   Cfbaghoi3WOpwjAqeuFAOXw3QH5IgLVcrU2Kj3EgM8SMthWefZPioc+2J
   3zO/sOQUVBAJboAtI16jYD8+0WwSn92HE04ZmVWnVMr9fhXfFTvV0wfkL
   p8etti5vTIXv3/ze/i5uJs7cjcXhs0JJjf7sKoTMmbpqBL6YVChPUNSts
   NPA6AJYd/VOMc01D1iIRDuO9y6uSzZiCTZZHzf+UcA0CvFY3LphQU1QwJ
   k2BVKRDPzi2nMBMhkmKQFMnOseDw+1T6sJdrh5jgL3txyeHx77YCQkd5t
   Q==;
X-CSE-ConnectionGUID: 66qPFrMHQwu2EtE7SHakvw==
X-CSE-MsgGUID: f2HINpXlS+O9Uwb0fmO4Bw==
X-IronPort-AV: E=McAfee;i="6700,10204,11328"; a="42229481"
X-IronPort-AV: E=Sophos;i="6.13,239,1732608000"; 
   d="scan'208";a="42229481"
Received: from fmviesa001.fm.intel.com ([10.60.135.141])
  by orvoesa106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 27 Jan 2025 10:08:34 -0800
X-CSE-ConnectionGUID: b6zHLxytRUOXPOVEF67BQg==
X-CSE-MsgGUID: pZhDvAP3QWqkD/xBwt8y1Q==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,224,1728975600"; 
   d="scan'208";a="139363697"
Received: from lkp-server01.sh.intel.com (HELO d63d4d77d921) ([10.239.97.150])
  by fmviesa001.fm.intel.com with ESMTP; 27 Jan 2025 10:08:33 -0800
Received: from kbuild by d63d4d77d921 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1tcTXD-000h39-08;
	Mon, 27 Jan 2025 18:08:31 +0000
Date: Tue, 28 Jan 2025 02:07:55 +0800
From: kernel test robot <lkp@intel.com>
To: Steev Klimaszewski <steev@kali.org>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [steev:lenovo-x13s-linux-6.13.y 83/83] kernel/sched/bore.c:347:33:
 sparse: sparse: incorrect type in initializer (incompatible argument 3
 (different address spaces))
Message-ID: <202501280115.qWvpAB3Z-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://github.com/steev/linux lenovo-x13s-linux-6.13.y
head:   c358c65925524fe1dfe962d59966a6aa01b5fc9b
commit: c358c65925524fe1dfe962d59966a6aa01b5fc9b [83/83] linux6.13.y-bore5.9.6
config: alpha-randconfig-r112-20250127 (https://download.01.org/0day-ci/archive/20250128/202501280115.qWvpAB3Z-lkp@intel.com/config)
compiler: alpha-linux-gcc (GCC) 14.2.0
reproduce: (https://download.01.org/0day-ci/archive/20250128/202501280115.qWvpAB3Z-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202501280115.qWvpAB3Z-lkp@intel.com/

sparse warnings: (new ones prefixed by >>)
   kernel/sched/bore.c:145:53: sparse: sparse: incorrect type in argument 3 (different address spaces) @@     expected void *buffer @@     got void [noderef] __user *buffer @@
   kernel/sched/bore.c:145:53: sparse:     expected void *buffer
   kernel/sched/bore.c:145:53: sparse:     got void [noderef] __user *buffer
>> kernel/sched/bore.c:347:33: sparse: sparse: incorrect type in initializer (incompatible argument 3 (different address spaces)) @@     expected int ( [usertype] *proc_handler )( ... ) @@     got int ( * )( ... ) @@
   kernel/sched/bore.c:347:33: sparse:     expected int ( [usertype] *proc_handler )( ... )
   kernel/sched/bore.c:347:33: sparse:     got int ( * )( ... )
   kernel/sched/bore.c:287:38: sparse: sparse: incompatible types in comparison expression (different address spaces):
   kernel/sched/bore.c:287:38: sparse:    struct task_struct [noderef] __rcu *
   kernel/sched/bore.c:287:38: sparse:    struct task_struct *
   kernel/sched/bore.c:258:31: sparse: sparse: incorrect type in assignment (different address spaces) @@     expected struct task_struct *next @@     got struct task_struct [noderef] __rcu *real_parent @@
   kernel/sched/bore.c:197:24: sparse: sparse: incorrect type in assignment (different address spaces) @@     expected struct task_struct *parent @@     got struct task_struct [noderef] __rcu *real_parent @@
   kernel/sched/bore.c:296:6: sparse: sparse: context imbalance in 'sched_clone_bore' - wrong count at exit

vim +347 kernel/sched/bore.c

   339	
   340	#ifdef CONFIG_SYSCTL
   341	static struct ctl_table sched_bore_sysctls[] = {
   342		{
   343			.procname	= "sched_bore",
   344			.data		= &sched_bore,
   345			.maxlen		= sizeof(u8),
   346			.mode		= 0644,
 > 347			.proc_handler = sched_bore_update_handler,
   348			.extra1		= SYSCTL_ZERO,
   349			.extra2		= SYSCTL_ONE,
   350		},
   351		{
   352			.procname	= "sched_burst_exclude_kthreads",
   353			.data		= &sched_burst_exclude_kthreads,
   354			.maxlen		= sizeof(u8),
   355			.mode		= 0644,
   356			.proc_handler = proc_dou8vec_minmax,
   357			.extra1		= SYSCTL_ZERO,
   358			.extra2		= SYSCTL_ONE,
   359		},
   360		{
   361			.procname	= "sched_burst_smoothness_long",
   362			.data		= &sched_burst_smoothness_long,
   363			.maxlen		= sizeof(u8),
   364			.mode		= 0644,
   365			.proc_handler = proc_dou8vec_minmax,
   366			.extra1		= SYSCTL_ZERO,
   367			.extra2		= SYSCTL_ONE,
   368		},
   369		{
   370			.procname	= "sched_burst_smoothness_short",
   371			.data		= &sched_burst_smoothness_short,
   372			.maxlen		= sizeof(u8),
   373			.mode		= 0644,
   374			.proc_handler = proc_dou8vec_minmax,
   375			.extra1		= SYSCTL_ZERO,
   376			.extra2		= SYSCTL_ONE,
   377		},
   378		{
   379			.procname	= "sched_burst_fork_atavistic",
   380			.data		= &sched_burst_fork_atavistic,
   381			.maxlen		= sizeof(u8),
   382			.mode		= 0644,
   383			.proc_handler = proc_dou8vec_minmax,
   384			.extra1		= SYSCTL_ZERO,
   385			.extra2		= SYSCTL_THREE,
   386		},
   387		{
   388			.procname	= "sched_burst_parity_threshold",
   389			.data		= &sched_burst_parity_threshold,
   390			.maxlen		= sizeof(u8),
   391			.mode		= 0644,
   392			.proc_handler = proc_dou8vec_minmax,
   393			.extra1		= SYSCTL_ZERO,
   394			.extra2		= &maxval_u8,
   395		},
   396		{
   397			.procname	= "sched_burst_penalty_offset",
   398			.data		= &sched_burst_penalty_offset,
   399			.maxlen		= sizeof(u8),
   400			.mode		= 0644,
   401			.proc_handler = proc_dou8vec_minmax,
   402			.extra1		= SYSCTL_ZERO,
   403			.extra2		= &sixty_four,
   404		},
   405		{
   406			.procname	= "sched_burst_penalty_scale",
   407			.data		= &sched_burst_penalty_scale,
   408			.maxlen		= sizeof(uint),
   409			.mode		= 0644,
   410			.proc_handler = proc_douintvec_minmax,
   411			.extra1		= SYSCTL_ZERO,
   412			.extra2		= &maxval_12_bits,
   413		},
   414		{
   415			.procname	= "sched_burst_cache_stop_count",
   416			.data		= &sched_burst_cache_stop_count,
   417			.maxlen		= sizeof(uint),
   418			.mode		= 0644,
   419			.proc_handler = proc_douintvec,
   420		},
   421		{
   422			.procname	= "sched_burst_cache_lifetime",
   423			.data		= &sched_burst_cache_lifetime,
   424			.maxlen		= sizeof(uint),
   425			.mode		= 0644,
   426			.proc_handler = proc_douintvec,
   427		},
   428		{
   429			.procname	= "sched_deadline_boost_mask",
   430			.data		= &sched_deadline_boost_mask,
   431			.maxlen		= sizeof(uint),
   432			.mode		= 0644,
   433			.proc_handler = proc_douintvec,
   434		},
   435	};
   436	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
