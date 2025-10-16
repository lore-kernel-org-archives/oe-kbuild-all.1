Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.15])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4E8B920322
	for <oe-kbuild-all@lists.linux.dev>; Thu, 16 Oct 2025 01:07:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.15
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1760576877; cv=none; b=gLshWf3lWut5LOzzJ00+pKno88KBVwLmwsnD+qI9diT4l73/Zs4fa/XjbwXDFEcKj6TB4//qwvszsStdxT0cnb1GDYKKbwzWN8XyoAFYVXxRpu/inqxDVODgHgfljK8aVs9XBntd72UvFYo6kz1KqNKvgNAZiJCdb0lYxrO7Kps=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1760576877; c=relaxed/simple;
	bh=S+f5+W52JCblpxonMKbo2Jf/KS2qIjOKKc6V/3XyKcs=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=LR7YByaclJn4lphTUaE4Ijbk89Xm1wKZWs0NcrEJZxZnULLNNSwtSgHmXNQA1lrPZkhkLlt9sdelLbiUmUmZPWEja94DEl5l0x7wibs6L9DzdTRMd30i0ddGPPHp7rYlzBhcuNIUpwmOr0l9FzzhHyDSyVg6ilc5Mq84FC3meSw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=LWbUnkC8; arc=none smtp.client-ip=198.175.65.15
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="LWbUnkC8"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1760576875; x=1792112875;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=S+f5+W52JCblpxonMKbo2Jf/KS2qIjOKKc6V/3XyKcs=;
  b=LWbUnkC8XS5GVG2FtrQez+3PmjHfj5OLboLDARm0jQNP36KFst5uIbKA
   kyTL3/U3nJARHkXIoKT1gzAy5i4MCUYRs6J3tnqjqIvLGOhYC+Nxab5md
   sPkKbFrY5zt67QRoN1cfU6ZkT7aDogTnzruWIH7fcuNO5X0J8yyv/TbFC
   UAz2B7jB3TQ7JX+ylWi5nwA2TbRdzmd2YcTxqD+pGBwvtDATZpi/ymm80
   x5oQav8/lYn9QvkhqxxiUafq8b92TOtnGnkh5CLubyx0QWn/Q4A8K6pYP
   nPFfJD9dEa56l+ov/Mv/gPGR622J9oaXcDLmZVXhv+Bphm1SlnV+8mP0X
   w==;
X-CSE-ConnectionGUID: E3qkVMFwT22dxFrM2WxifA==
X-CSE-MsgGUID: zPbY4YRHRwivAv/w4JXqug==
X-IronPort-AV: E=McAfee;i="6800,10657,11583"; a="66412428"
X-IronPort-AV: E=Sophos;i="6.19,232,1754982000"; 
   d="scan'208";a="66412428"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
  by orvoesa107.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 15 Oct 2025 18:07:54 -0700
X-CSE-ConnectionGUID: f+M3wWEeRKSAE9dP0FDATg==
X-CSE-MsgGUID: lMSI4V4hRcCXAavZ0fOmrQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.19,232,1754982000"; 
   d="scan'208";a="186721819"
Received: from lkp-server02.sh.intel.com (HELO 66d7546c76b2) ([10.239.97.151])
  by fmviesa005.fm.intel.com with ESMTP; 15 Oct 2025 18:07:53 -0700
Received: from kbuild by 66d7546c76b2 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1v9CT8-0004L1-0m;
	Thu, 16 Oct 2025 01:07:50 +0000
Date: Thu, 16 Oct 2025 09:06:52 +0800
From: kernel test robot <lkp@intel.com>
To: kernel@openeuler.org, Jinjiang Tu <tujinjiang@huawei.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [openeuler:OLK-6.6 2972/2972] mm/memcontrol.c:8068:35: sparse:
 sparse: incorrect type in initializer (incompatible argument 3 (different
 address spaces))
Message-ID: <202510160946.S2au7i5E-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://gitee.com/openeuler/kernel.git OLK-6.6
head:   f974d7dec2997dfe2d417f1c9cc0e2a6adb2d25c
commit: 65b18684d289783f92db2eb97d60bf24c9200cf7 [2972/2972] memcg: introduce memcg swap qos feature
config: x86_64-randconfig-r121-20251016 (https://download.01.org/0day-ci/archive/20251016/202510160946.S2au7i5E-lkp@intel.com/config)
compiler: gcc-14 (Debian 14.2.0-19) 14.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20251016/202510160946.S2au7i5E-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202510160946.S2au7i5E-lkp@intel.com/

sparse warnings: (new ones prefixed by >>)
   mm/memcontrol.c:4255:50: sparse: sparse: incorrect type in argument 3 (different address spaces) @@     expected void * @@     got void [noderef] __user *buffer @@
   mm/memcontrol.c:4255:50: sparse:     expected void *
   mm/memcontrol.c:4255:50: sparse:     got void [noderef] __user *buffer
   mm/memcontrol.c:4516:21: sparse: sparse: incompatible types in comparison expression (different address spaces):
   mm/memcontrol.c:4516:21: sparse:    struct mem_cgroup_threshold_ary [noderef] __rcu *
   mm/memcontrol.c:4516:21: sparse:    struct mem_cgroup_threshold_ary *
   mm/memcontrol.c:4518:21: sparse: sparse: incompatible types in comparison expression (different address spaces):
   mm/memcontrol.c:4518:21: sparse:    struct mem_cgroup_threshold_ary [noderef] __rcu *
   mm/memcontrol.c:4518:21: sparse:    struct mem_cgroup_threshold_ary *
   mm/memcontrol.c:4674:9: sparse: sparse: incompatible types in comparison expression (different address spaces):
   mm/memcontrol.c:4674:9: sparse:    struct mem_cgroup_threshold_ary [noderef] __rcu *
   mm/memcontrol.c:4674:9: sparse:    struct mem_cgroup_threshold_ary *
   mm/memcontrol.c:4768:9: sparse: sparse: incompatible types in comparison expression (different address spaces):
   mm/memcontrol.c:4768:9: sparse:    struct mem_cgroup_threshold_ary [noderef] __rcu *
   mm/memcontrol.c:4768:9: sparse:    struct mem_cgroup_threshold_ary *
   mm/memcontrol.c:6811:23: sparse: sparse: incompatible types in comparison expression (different address spaces):
   mm/memcontrol.c:6811:23: sparse:    struct task_struct [noderef] __rcu *
   mm/memcontrol.c:6811:23: sparse:    struct task_struct *
   mm/memcontrol.c:7028:52: sparse: sparse: incompatible types in comparison expression (different address spaces):
   mm/memcontrol.c:7028:52: sparse:    struct task_struct [noderef] __rcu *
   mm/memcontrol.c:7028:52: sparse:    struct task_struct *
>> mm/memcontrol.c:8068:35: sparse: sparse: incorrect type in initializer (incompatible argument 3 (different address spaces)) @@     expected int ( [usertype] *proc_handler )( ... ) @@     got int ( * )( ... ) @@
   mm/memcontrol.c:8068:35: sparse:     expected int ( [usertype] *proc_handler )( ... )
   mm/memcontrol.c:8068:35: sparse:     got int ( * )( ... )
   mm/memcontrol.c: note: in included file:
   include/linux/memcontrol.h:786:9: sparse: sparse: context imbalance in 'folio_lruvec_lock' - wrong count at exit
   include/linux/memcontrol.h:786:9: sparse: sparse: context imbalance in 'folio_lruvec_lock_irq' - wrong count at exit
   include/linux/memcontrol.h:786:9: sparse: sparse: context imbalance in 'folio_lruvec_lock_irqsave' - wrong count at exit
   mm/memcontrol.c:2135:6: sparse: sparse: context imbalance in 'folio_memcg_lock' - wrong count at exit
   mm/memcontrol.c:2182:17: sparse: sparse: context imbalance in '__folio_memcg_unlock' - unexpected unlock
   mm/memcontrol.c:6671:9: sparse: sparse: context imbalance in 'mem_cgroup_count_precharge_pte_range' - unexpected unlock
   mm/memcontrol.c:6939:9: sparse: sparse: context imbalance in 'mem_cgroup_move_charge_pte_range' - unexpected unlock

vim +8068 mm/memcontrol.c

  8044	
  8045	#ifdef CONFIG_SYSCTL
  8046	static struct ctl_table mem_cgroup_sysctls[] = {
  8047	#ifdef CONFIG_MEMCG_OOM_PRIORITY
  8048		{
  8049			/*
  8050			 * This sysctl is used to control memcg oom priority
  8051			 * feature, the sysctl name is for compatibility.
  8052			 */
  8053			.procname	= "memcg_qos_enable",
  8054			.data		= &sysctl_memcg_oom_prio,
  8055			.maxlen		= sizeof(int),
  8056			.mode		= 0644,
  8057			.proc_handler	= sysctl_memcg_oom_prio_handler,
  8058			.extra1		= SYSCTL_ZERO,
  8059			.extra2		= SYSCTL_ONE,
  8060		},
  8061	#endif
  8062	#ifdef CONFIG_MEMCG_SWAP_QOS
  8063		{
  8064			.procname	= "memcg_swap_qos_enable",
  8065			.data		= &sysctl_memcg_swap_qos_stat,
  8066			.maxlen		= sizeof(int),
  8067			.mode		= 0644,
> 8068			.proc_handler	= sysctl_memcg_swap_qos_handler,
  8069			.extra1		= SYSCTL_ZERO,
  8070			.extra2		= SYSCTL_ONE,
  8071		},
  8072	#endif
  8073	};
  8074	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
