Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.20])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A79D3377553
	for <oe-kbuild-all@lists.linux.dev>; Fri, 27 Mar 2026 20:36:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.20
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774643783; cv=none; b=mOvAphIxiI+857ovG/66POVWZ5UbB8J8muc+bX+R41/xOlyQQYLjfIB7emKcES7dZFwICYFA3wAsb5Xac5ZDgezwJ6kNArOef2tDNTQm2YMJ77r7DSBuc+DO6cWsRZYeNWY3jgbQrXPtssoNrp3rkXobbxu4b9s4+GjJRQLcGnc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774643783; c=relaxed/simple;
	bh=ev4gvOphWfAh+vdu8KAuyQB7smUt/qhaaYFIat++A0k=;
	h=Date:From:To:Cc:Subject:Message-ID; b=YR+eNKW7IN67b4Z1w+Y/mjHVkJCyuTTTIe4n/xvkWkQ8eyb4Hb57w8f3mjZHcVU+CIfRjf/ZI/MmrXjdwAkPkher9LG2M+9MFGUw+mMDe4uVm7ErV8nWYq9B1MEmb5E9NHJVJPJTOQnv8vxDbuV2StDOx86a85IuW2GgyMfpZEA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=UuzJaW+V; arc=none smtp.client-ip=198.175.65.20
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="UuzJaW+V"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1774643781; x=1806179781;
  h=date:from:to:cc:subject:message-id;
  bh=ev4gvOphWfAh+vdu8KAuyQB7smUt/qhaaYFIat++A0k=;
  b=UuzJaW+VMybq+AbGzCgdjOI0P/uIIQESkl0JHc3VLCgWyJjLHbsSrcV0
   33Gr5rPY/kziuizO+92wDqM4vhUP4RtwCCSgn7AbPXAt2+RiASScD7OiH
   6zHgxH6WFJ2k8hktGF2483E/u2yoJB7VbYLjMiFftLXFxGqwR1+HztOP1
   4KoF1/f8YEAQvGOey6tFvTR5TW2NdLQFR2uT6Q5ecemPYMc5Pit3X/WDU
   mDmy6Q/pSFwd+Q8TRtn1ZBQGRz05qNbktTKn/T+BLss5z1HEQc5sPa8AU
   M8iSFmb5iwSZuCIOIz6Av446FkDgehv1lGSCGhusqyX1fvkra3SlhXzSK
   Q==;
X-CSE-ConnectionGUID: NKuj/w6jRAeFyx7VjMORhA==
X-CSE-MsgGUID: gKZRKScFTG+3mJVPzE3CcA==
X-IronPort-AV: E=McAfee;i="6800,10657,11742"; a="75438269"
X-IronPort-AV: E=Sophos;i="6.23,144,1770624000"; 
   d="scan'208";a="75438269"
Received: from fmviesa010.fm.intel.com ([10.60.135.150])
  by orvoesa112.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 27 Mar 2026 13:36:21 -0700
X-CSE-ConnectionGUID: CA8nsJucRUKMaJYiiYJcuQ==
X-CSE-MsgGUID: zyYUsGJrROCBN54jSdhtNw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,144,1770624000"; 
   d="scan'208";a="221020653"
Received: from lkp-server01.sh.intel.com (HELO 3905d212be1b) ([10.239.97.150])
  by fmviesa010.fm.intel.com with ESMTP; 27 Mar 2026 13:36:18 -0700
Received: from kbuild by 3905d212be1b with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1w6Dui-00000000Ait-0oFi;
	Fri, 27 Mar 2026 20:36:16 +0000
Date: Sat, 28 Mar 2026 04:35:45 +0800
From: kernel test robot <lkp@intel.com>
To: cros-kernel-buildreports@googlegroups.com
Cc: oe-kbuild-all@lists.linux.dev
Subject: [android-common:android13-5.15 4/4]
 kernel/hung_task.c:287:35: sparse: sparse: incorrect type in initializer
 (incompatible argument 3 (different address spaces))
Message-ID: <202603280446.lvWmNccA-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>

tree:   https://android.googlesource.com/kernel/common android13-5.15
head:   fc88a7504f0f262cc5b2e8a7f58b2a1108034856
commit: d96a8f8e86d1ae0b1652ff93ee06891962240232 [4/4] hung_task: move hung_task sysctl interface to hung_task.c
config: i386-randconfig-r133-20260325 (https://download.01.org/0day-ci/archive/20260328/202603280446.lvWmNccA-lkp@intel.com/config)
compiler: gcc-14 (Debian 14.2.0-19) 14.2.0
sparse: v0.6.5-rc1
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260328/202603280446.lvWmNccA-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202603280446.lvWmNccA-lkp@intel.com/

sparse warnings: (new ones prefixed by >>)
   kernel/hung_task.c:237:52: sparse: sparse: incorrect type in argument 3 (different address spaces) @@     expected void * @@     got void [noderef] __user *buffer @@
   kernel/hung_task.c:237:52: sparse:     expected void *
   kernel/hung_task.c:237:52: sparse:     got void [noderef] __user *buffer
>> kernel/hung_task.c:287:35: sparse: sparse: incorrect type in initializer (incompatible argument 3 (different address spaces)) @@     expected int ( [usertype] *proc_handler )( ... ) @@     got int ( * )( ... ) @@
   kernel/hung_task.c:287:35: sparse:     expected int ( [usertype] *proc_handler )( ... )
   kernel/hung_task.c:287:35: sparse:     got int ( * )( ... )
   kernel/hung_task.c:295:35: sparse: sparse: incorrect type in initializer (incompatible argument 3 (different address spaces)) @@     expected int ( [usertype] *proc_handler )( ... ) @@     got int ( * )( ... ) @@
   kernel/hung_task.c:295:35: sparse:     expected int ( [usertype] *proc_handler )( ... )
   kernel/hung_task.c:295:35: sparse:     got int ( * )( ... )

vim +287 kernel/hung_task.c

   247	
   248	/*
   249	 * This is needed for proc_doulongvec_minmax of sysctl_hung_task_timeout_secs
   250	 * and hung_task_check_interval_secs
   251	 */
   252	static const unsigned long hung_task_timeout_max = (LONG_MAX / HZ);
   253	static struct ctl_table hung_task_sysctls[] = {
   254	#ifdef CONFIG_SMP
   255		{
   256			.procname	= "hung_task_all_cpu_backtrace",
   257			.data		= &sysctl_hung_task_all_cpu_backtrace,
   258			.maxlen		= sizeof(int),
   259			.mode		= 0644,
   260			.proc_handler	= proc_dointvec_minmax,
   261			.extra1		= SYSCTL_ZERO,
   262			.extra2		= SYSCTL_ONE,
   263		},
   264	#endif /* CONFIG_SMP */
   265		{
   266			.procname	= "hung_task_panic",
   267			.data		= &sysctl_hung_task_panic,
   268			.maxlen		= sizeof(int),
   269			.mode		= 0644,
   270			.proc_handler	= proc_dointvec_minmax,
   271			.extra1		= SYSCTL_ZERO,
   272			.extra2		= SYSCTL_ONE,
   273		},
   274		{
   275			.procname	= "hung_task_check_count",
   276			.data		= &sysctl_hung_task_check_count,
   277			.maxlen		= sizeof(int),
   278			.mode		= 0644,
   279			.proc_handler	= proc_dointvec_minmax,
   280			.extra1		= SYSCTL_ZERO,
   281		},
   282		{
   283			.procname	= "hung_task_timeout_secs",
   284			.data		= &sysctl_hung_task_timeout_secs,
   285			.maxlen		= sizeof(unsigned long),
   286			.mode		= 0644,
 > 287			.proc_handler	= proc_dohung_task_timeout_secs,
   288			.extra2		= (void *)&hung_task_timeout_max,
   289		},
   290		{
   291			.procname	= "hung_task_check_interval_secs",
   292			.data		= &sysctl_hung_task_check_interval_secs,
   293			.maxlen		= sizeof(unsigned long),
   294			.mode		= 0644,
   295			.proc_handler	= proc_dohung_task_timeout_secs,
   296			.extra2		= (void *)&hung_task_timeout_max,
   297		},
   298		{
   299			.procname	= "hung_task_warnings",
   300			.data		= &sysctl_hung_task_warnings,
   301			.maxlen		= sizeof(int),
   302			.mode		= 0644,
   303			.proc_handler	= proc_dointvec_minmax,
   304			.extra1		= SYSCTL_NEG_ONE,
   305		},
   306		{}
   307	};
   308	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
