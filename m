Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.9])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0201B200A3
	for <oe-kbuild-all@lists.linux.dev>; Mon,  6 Jan 2025 15:39:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.9
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1736177973; cv=none; b=OMiIUom6x3L/ebCXFLKiChNOIWkHiKfOVzxw8kfDOyTzlU51Xr/wEeUEcOnFlCIhfUP/8OlxfROFCxMsKB2iXjal0rodjfGH5nfvWrNMaKfj87T+ThJEw8Qrnb5kGKoV34Ce3gRyfAp2WsmNJLFBQ4aFWinVFNkmf40VG4ev5vk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1736177973; c=relaxed/simple;
	bh=axvZnU2k5X2RvabuSnvgVNRX85MMP3VoOalMSgJTJdo=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=qZ4ZhR7OLBFtQoBcp8sUeSe/1xYSQ22ExUHvhDHv3wMnjYvD4xcik6TOwpeazpOxz1Hlcq3fEtTVNO+oU/u6Jxr2MUsky6UWbDD0e398URZDzOZ8Z5qqNEqv7yJP6Mv2asZ3qsU+ceVnAUNKDPGCiGq1dNWnM+yKd0sijMArUy8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=LiYiJMxB; arc=none smtp.client-ip=198.175.65.9
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="LiYiJMxB"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1736177972; x=1767713972;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=axvZnU2k5X2RvabuSnvgVNRX85MMP3VoOalMSgJTJdo=;
  b=LiYiJMxBcPdGjZHDlan23hhd9s2B65ByquiZ8/sLLBWCsvsUJETjd+MH
   NRvQ3q8UFImGssnPNEh7J7sHyr89pF+sQeeaJBZ/26vonZGFeAjOLIeik
   DgbVbnyjnuV+3F7DJ+Pb2uvnSDWXfx3j7WIgwEeVHdcfgwyrsdvVOIgpb
   R7b2lMl8G7kwqgz01K0KLSuXAR5+3B6SM5asgV3JqrkfTZ6m/UKtuTicB
   S0mAyuVTr9K0v5r+Arx+LWGHGtktkR12K/pzSA/aw4+zmvifGoe1G3pTf
   Zxi9DyZ8teXACWBlSxojtnfy5QhFpzLhwN5fVjzyBExd0FFf2AvCykUiI
   A==;
X-CSE-ConnectionGUID: Fzj0h7Q3RnymRlvSqWbcOg==
X-CSE-MsgGUID: tQWzw413QLWxKe1Lyrpqbw==
X-IronPort-AV: E=McAfee;i="6700,10204,11307"; a="58789049"
X-IronPort-AV: E=Sophos;i="6.12,293,1728975600"; 
   d="scan'208";a="58789049"
Received: from orviesa008.jf.intel.com ([10.64.159.148])
  by orvoesa101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 06 Jan 2025 07:39:31 -0800
X-CSE-ConnectionGUID: f6qB0idDTHiBGvQwGBflxw==
X-CSE-MsgGUID: xKGP4i0KS9CtXKIqYEvMgQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,224,1728975600"; 
   d="scan'208";a="103334828"
Received: from lkp-server01.sh.intel.com (HELO d63d4d77d921) ([10.239.97.150])
  by orviesa008.jf.intel.com with ESMTP; 06 Jan 2025 07:39:30 -0800
Received: from kbuild by d63d4d77d921 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1tUpCR-000D63-1f;
	Mon, 06 Jan 2025 15:39:27 +0000
Date: Mon, 6 Jan 2025 23:38:52 +0800
From: kernel test robot <lkp@intel.com>
To: jason.zeng@intel.com, lin.x.wang@intel.com, pei.p.jia@intel.com
Cc: oe-kbuild-all@lists.linux.dev
Subject: [bytedance:5.15-velinux 27/1347] kernel/cgroup/cgroup_proc.c:39:
 warning: This comment starts with '/**', but isn't a kernel-doc comment.
 Refer Documentation/doc-guide/kernel-doc.rst
Message-ID: <202501062352.Ih6eLYRo-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://github.com/bytedance/kernel.git 5.15-velinux
head:   272d9bd3d7e15bb1ad1efac12d9921350f961339
commit: bf247c5c326424d0c951a23dc50dd96c8148ee6e [27/1347] bytedance: x86: override /proc/cpuinfo in cgroup
config: arm64-allmodconfig (https://download.01.org/0day-ci/archive/20250106/202501062352.Ih6eLYRo-lkp@intel.com/config)
compiler: aarch64-linux-gcc (GCC) 14.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250106/202501062352.Ih6eLYRo-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202501062352.Ih6eLYRo-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> kernel/cgroup/cgroup_proc.c:39: warning: This comment starts with '/**', but isn't a kernel-doc comment. Refer Documentation/doc-guide/kernel-doc.rst
    * The value of cpuset is preferred, and if not configured, the ratio of cpu_quota
>> kernel/cgroup/cgroup_proc.c:82: warning: Function parameter or member 'cpuset' not described in 'cgroup_override_get_cpuset'
>> kernel/cgroup/cgroup_proc.c:82: warning: expecting prototype for Get the mapped value. Such as 2-5 -> 0(). Prototype was for cgroup_override_get_cpuset() instead


vim +39 kernel/cgroup/cgroup_proc.c

    37	
    38	/**
  > 39	 * The value of cpuset is preferred, and if not configured, the ratio of cpu_quota
    40	 * to cpu_period is used.
    41	 */
    42	void cgroup_override_get_raw_cpuset(struct cpumask *cpuset)
    43	{
    44		long quota, period;
    45		int cpus, cpu_index, count = 0;
    46		struct task_struct *cg_init_tsk = cgroup_override_get_init_tsk();
    47		struct task_group *sched_task_group;
    48	
    49		cpuset_cpus_allowed(cg_init_tsk, cpuset);
    50	
    51		rcu_read_lock();
    52	
    53		sched_task_group = cg_init_tsk->sched_task_group;
    54	
    55		quota = tg_get_cfs_quota(sched_task_group);
    56		period = tg_get_cfs_period(sched_task_group);
    57	
    58		rcu_read_unlock();
    59	
    60		if (quota != -1 && period != -1) {
    61			/* period can't be 0 */
    62			cpus = (quota + period - 1) / period;
    63			cpus = clamp(cpus, 1, (int)num_online_cpus());
    64	
    65			/* otherwise direct use cpuset. */
    66			if (cpumask_weight(cpuset) > cpus) {
    67				for_each_cpu(cpu_index, cpuset) {
    68					if (count++ < cpus)
    69						continue;
    70					cpumask_clear_cpu(cpu_index, cpuset);
    71				}
    72			}
    73		}
    74	
    75		put_task_struct(cg_init_tsk);
    76	}
    77	
    78	/**
    79	 * Get the mapped value. Such as 2-5 -> 0-3
    80	 */
    81	void cgroup_override_get_cpuset(struct cpumask *cpuset)
  > 82	{

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
