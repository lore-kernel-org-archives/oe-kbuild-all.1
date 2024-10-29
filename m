Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E96401FF7BF
	for <oe-kbuild-all@lists.linux.dev>; Tue, 29 Oct 2024 08:32:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1730190778; cv=none; b=tQFXDWkuT8gbs0z+ITPXOR3ZvpEksDdmhDkS8PjJsb8QahhcXuJbTHPKsRLwDlnMUFsXEGlcPaPRi8s51EApGpr2/w5G1BMfOYNevLwPoKujRQ4S9oEcrrT58bKrMhj/h55WA2anHqCEdBqPpkHUfiKgbQ2lPZrTln8i7r3v/I0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1730190778; c=relaxed/simple;
	bh=zYzz0RuzpAaUWuuPWbxlRQJfyYovS0CCvRz2E0Izms0=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=m7dv/jBRQ7mSMcmhYySxA69PgxLWu5nnAb0sV5RamZ0h19SYlP/w5/KFZvfCXNqUnUcblHpX5kCa+vNwbX/prO9a+5FwSxJ9Ed15CtJP0PDGa+gGxfVnpHAdno0HJEHQEcKHawj1wGuvn2zy0P3MyqNE1mmrhH+AFOuTHAjYKU0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=Px9WJDES; arc=none smtp.client-ip=198.175.65.18
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="Px9WJDES"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1730190776; x=1761726776;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=zYzz0RuzpAaUWuuPWbxlRQJfyYovS0CCvRz2E0Izms0=;
  b=Px9WJDES2eisD6yzHxWvee6fYw22vQ71hsOmczUG8l9IhYSAMvPhw2DO
   gwoTNFyItmk5V6OPn+x0vYBkDxGs/akfKsoAuae4H+SVH0cA+ROOx3GIa
   Vdz/ip5fyaoWw+5dHxz9pcaZ0rEtIT/DORkjU9SQOBf/jMc94VU77ghQA
   OAeAnZIJtcyah6s6PYqxeamNK7591vjFb9IKf0SrVwPxfTdMRNtCWr6Sz
   aWr5Rl6p7F5dBehdqXw/p/PvvwfeytCAX0rXPq2iOYQIl0MeV0KrQbnfc
   hMXi3RUVOmQ/9Y/orlVb6AeSKtmDJo/ERqitNTdZlRVtZ8YhjDMJXsxNt
   Q==;
X-CSE-ConnectionGUID: zOfCjSDkS7uBb1zXs9eXUg==
X-CSE-MsgGUID: S3vsIdbbQTCVrrsEb4FrGQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11222"; a="30002831"
X-IronPort-AV: E=Sophos;i="6.11,199,1725346800"; 
   d="scan'208";a="30002831"
Received: from fmviesa009.fm.intel.com ([10.60.135.149])
  by orvoesa110.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 29 Oct 2024 01:32:53 -0700
X-CSE-ConnectionGUID: MSt7OLk7T6W15mYTx+pocw==
X-CSE-MsgGUID: +CNW1nKtQWODOdViRgsCyg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.11,241,1725346800"; 
   d="scan'208";a="81957004"
Received: from lkp-server01.sh.intel.com (HELO a48cf1aa22e8) ([10.239.97.150])
  by fmviesa009.fm.intel.com with ESMTP; 29 Oct 2024 01:32:50 -0700
Received: from kbuild by a48cf1aa22e8 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1t5heh-000dR2-2z;
	Tue, 29 Oct 2024 08:32:47 +0000
Date: Tue, 29 Oct 2024 16:31:52 +0800
From: kernel test robot <lkp@intel.com>
To: kaixuxia@tencent.com, frankjpliu@tencent.com, kasong@tencent.com,
	sagazchen@tencent.com, kernelxing@tencent.com,
	aurelianliu@tencent.com, deshengwu@tencent.com,
	flyingpeng@tencent.com, jingqunli@tencent.com, jason.zeng@intel.com,
	wu.zheng@intel.com, yingbao.jia@intel.com, pei.p.jia@intel.com
Cc: oe-kbuild-all@lists.linux.dev
Subject: [opencloudos:next 10459/13046] kernel/sched/ext.c:2987:59: sparse:
 sparse: incorrect type in argument 3 (different address spaces)
Message-ID: <202410291645.9dgpSYwB-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://gitee.com/OpenCloudOS/OpenCloudOS-Kernel.git next
head:   ce9f9d823a41831d622fa11e29c3d620c044f51b
commit: a1752a576097efb1abc99ff2ffb8808200474d01 [10459/13046] rue/scx: Add readonly sysctl knob kernel.cpu_qos for SCHED_BT compatibility
config: x86_64-randconfig-121-20241029 (https://download.01.org/0day-ci/archive/20241029/202410291645.9dgpSYwB-lkp@intel.com/config)
compiler: gcc-12 (Debian 12.2.0-14) 12.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20241029/202410291645.9dgpSYwB-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202410291645.9dgpSYwB-lkp@intel.com/

sparse warnings: (new ones prefixed by >>)
   kernel/sched/build_policy.c: note: in included file:
   kernel/sched/rt.c:965:70: sparse: sparse: incompatible types in comparison expression (different address spaces):
   kernel/sched/rt.c:965:70: sparse:    struct task_struct [noderef] __rcu *
   kernel/sched/rt.c:965:70: sparse:    struct task_struct *
   kernel/sched/rt.c:581:54: sparse: sparse: incorrect type in initializer (different address spaces) @@     expected struct task_struct *curr @@     got struct task_struct [noderef] __rcu *curr @@
   kernel/sched/rt.c:581:54: sparse:     expected struct task_struct *curr
   kernel/sched/rt.c:581:54: sparse:     got struct task_struct [noderef] __rcu *curr
   kernel/sched/rt.c:1051:38: sparse: sparse: incorrect type in initializer (different address spaces) @@     expected struct task_struct *curr @@     got struct task_struct [noderef] __rcu *curr @@
   kernel/sched/rt.c:1051:38: sparse:     expected struct task_struct *curr
   kernel/sched/rt.c:1051:38: sparse:     got struct task_struct [noderef] __rcu *curr
   kernel/sched/rt.c:1596:31: sparse: sparse: incorrect type in argument 2 (different address spaces) @@     expected struct task_struct *p @@     got struct task_struct [noderef] __rcu *curr @@
   kernel/sched/rt.c:1596:31: sparse:     expected struct task_struct *p
   kernel/sched/rt.c:1596:31: sparse:     got struct task_struct [noderef] __rcu *curr
   kernel/sched/build_policy.c: note: in included file:
   kernel/sched/deadline.c:1945:42: sparse: sparse: incorrect type in argument 2 (different address spaces) @@     expected struct sched_dl_entity const *b @@     got struct sched_dl_entity [noderef] __rcu * @@
   kernel/sched/deadline.c:1945:42: sparse:     expected struct sched_dl_entity const *b
   kernel/sched/deadline.c:1945:42: sparse:     got struct sched_dl_entity [noderef] __rcu *
   kernel/sched/deadline.c:1177:23: sparse: sparse: incorrect type in argument 1 (different address spaces) @@     expected struct task_struct *p @@     got struct task_struct [noderef] __rcu *curr @@
   kernel/sched/deadline.c:1177:23: sparse:     expected struct task_struct *p
   kernel/sched/deadline.c:1177:23: sparse:     got struct task_struct [noderef] __rcu *curr
   kernel/sched/deadline.c:1300:38: sparse: sparse: incorrect type in initializer (different address spaces) @@     expected struct task_struct *curr @@     got struct task_struct [noderef] __rcu *curr @@
   kernel/sched/deadline.c:1300:38: sparse:     expected struct task_struct *curr
   kernel/sched/deadline.c:1300:38: sparse:     got struct task_struct [noderef] __rcu *curr
   kernel/sched/deadline.c:2651:22: sparse: sparse: incompatible types in comparison expression (different address spaces):
   kernel/sched/deadline.c:2651:22: sparse:    struct task_struct [noderef] __rcu *
   kernel/sched/deadline.c:2651:22: sparse:    struct task_struct *
   kernel/sched/build_policy.c: note: in included file:
   kernel/sched/ext.c:106:25: sparse: sparse: symbol 'scx_has_op' was not declared. Should it be static?
   kernel/sched/ext.c:601:38: sparse: sparse: incorrect type in initializer (different address spaces) @@     expected struct task_struct *curr @@     got struct task_struct [noderef] __rcu *curr @@
   kernel/sched/ext.c:677:56: sparse: sparse: incompatible types in comparison expression (different address spaces):
   kernel/sched/ext.c:677:56: sparse:    struct task_struct *
   kernel/sched/ext.c:677:56: sparse:    struct task_struct [noderef] __rcu *
   kernel/sched/ext.c:1063:35: sparse: sparse: incorrect type in initializer (different address spaces) @@     expected struct task_struct *p @@     got struct task_struct [noderef] __rcu *curr @@
   kernel/sched/ext.c:1063:35: sparse:     expected struct task_struct *p
   kernel/sched/ext.c:1063:35: sparse:     got struct task_struct [noderef] __rcu *curr
   kernel/sched/ext.c:1073:38: sparse: sparse: incorrect type in initializer (different address spaces) @@     expected struct task_struct *from @@     got struct task_struct [noderef] __rcu *curr @@
   kernel/sched/ext.c:1073:38: sparse:     expected struct task_struct *from
   kernel/sched/ext.c:1073:38: sparse:     got struct task_struct [noderef] __rcu *curr
   kernel/sched/ext.c:1798:35: sparse: sparse: incorrect type in argument 2 (different address spaces) @@     expected struct task_struct *prev @@     got struct task_struct [noderef] __rcu *curr @@
   kernel/sched/ext.c:1798:35: sparse:     expected struct task_struct *prev
   kernel/sched/ext.c:1798:35: sparse:     got struct task_struct [noderef] __rcu *curr
>> kernel/sched/ext.c:2987:59: sparse: sparse: incorrect type in argument 3 (different address spaces) @@     expected void * @@     got void [noderef] __user *buffer @@
   kernel/sched/ext.c:2987:59: sparse:     expected void *
   kernel/sched/ext.c:2987:59: sparse:     got void [noderef] __user *buffer
>> kernel/sched/ext.c:2998:36: sparse: sparse: incorrect type in initializer (incompatible argument 3 (different address spaces)) @@     expected int ( [usertype] *proc_handler )( ... ) @@     got int ( * )( ... ) @@
   kernel/sched/ext.c:2998:36: sparse:     expected int ( [usertype] *proc_handler )( ... )
   kernel/sched/ext.c:2998:36: sparse:     got int ( * )( ... )
   kernel/sched/ext.c:3619:31: sparse: sparse: symbol 'bpf_scx_verifier_ops' was not declared. Should it be static?
   kernel/sched/ext.c:4490:33: sparse: sparse: incompatible types in comparison expression (different address spaces):
   kernel/sched/ext.c:4490:33: sparse:    struct task_struct [noderef] __rcu *
   kernel/sched/ext.c:4490:33: sparse:    struct task_struct const *
   kernel/sched/build_policy.c: note: in included file (through include/linux/smp.h, include/linux/sched/clock.h):
   include/linux/list.h:83:21: sparse: sparse: self-comparison always evaluates to true
   include/linux/list.h:83:21: sparse: sparse: self-comparison always evaluates to true
   kernel/sched/build_policy.c: note: in included file:
   kernel/sched/sched.h:2243:25: sparse: sparse: incompatible types in comparison expression (different address spaces):
   kernel/sched/sched.h:2243:25: sparse:    struct task_struct [noderef] __rcu *
   kernel/sched/sched.h:2243:25: sparse:    struct task_struct *
   kernel/sched/sched.h:2243:25: sparse: sparse: incompatible types in comparison expression (different address spaces):
   kernel/sched/sched.h:2243:25: sparse:    struct task_struct [noderef] __rcu *
   kernel/sched/sched.h:2243:25: sparse:    struct task_struct *
   kernel/sched/sched.h:2243:25: sparse: sparse: incompatible types in comparison expression (different address spaces):
   kernel/sched/sched.h:2243:25: sparse:    struct task_struct [noderef] __rcu *
   kernel/sched/sched.h:2243:25: sparse:    struct task_struct *
   kernel/sched/sched.h:2243:25: sparse: sparse: incompatible types in comparison expression (different address spaces):
   kernel/sched/sched.h:2243:25: sparse:    struct task_struct [noderef] __rcu *
   kernel/sched/sched.h:2243:25: sparse:    struct task_struct *
   kernel/sched/sched.h:2243:25: sparse: sparse: incompatible types in comparison expression (different address spaces):
   kernel/sched/sched.h:2243:25: sparse:    struct task_struct [noderef] __rcu *
   kernel/sched/sched.h:2243:25: sparse:    struct task_struct *
   kernel/sched/sched.h:2243:25: sparse: sparse: incompatible types in comparison expression (different address spaces):
   kernel/sched/sched.h:2243:25: sparse:    struct task_struct [noderef] __rcu *
   kernel/sched/sched.h:2243:25: sparse:    struct task_struct *

vim +2987 kernel/sched/ext.c

  2980	
  2981	static int sysctl_cpu_qos_handler(struct ctl_table *table, int write,
  2982	                                  void __user *buffer, size_t *lenp, loff_t *ppos)
  2983	{
  2984		if (write)
  2985			return -EPERM;
  2986		else
> 2987			return proc_dointvec_minmax(table, write, buffer, lenp, ppos);
  2988	}
  2989	
  2990	static struct ctl_table_header *scx_sysctl_table_hdr;
  2991	
  2992	static struct ctl_table scx_sysctl_table[] = {
  2993		{
  2994			.procname	= "cpu_qos",
  2995			.data		= &sysctl_cpu_qos_enabled,
  2996			.maxlen		= sizeof(u32),
  2997			.mode		= 0644,
> 2998			.proc_handler	= &sysctl_cpu_qos_handler,
  2999			.extra1		= SYSCTL_ZERO,
  3000			.extra2		= SYSCTL_ONE,
  3001		},
  3002		{
  3003			.procname	= "scx_hung_exit",
  3004			.data		= &sysctl_scx_hung_exit,
  3005			.maxlen		= sizeof(u32),
  3006			.mode		= 0644,
  3007			.proc_handler	= proc_dointvec_minmax,
  3008			.extra1		= SYSCTL_ZERO,
  3009			.extra2		= SYSCTL_ONE,
  3010		},
  3011		{}
  3012	};
  3013	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
