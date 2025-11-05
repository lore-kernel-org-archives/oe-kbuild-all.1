Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.11])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EA1CF207A0B
	for <oe-kbuild-all@lists.linux.dev>; Wed,  5 Nov 2025 03:55:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.11
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1762314947; cv=none; b=ElJ9uxVsjKJ4XxhGYrQ7f6guBDiHycWzIN6asuoFhYJb0qdrlXSCV7jFIn9kxLfSgKMJnpPvN/3dNeUHReopIVODvk4wGKsS+kDO3B0/6PaYT0J+PaymG9OoDXAAAdy9v4eQ/8OeCY8DFHmPxmlcRQzc0LtGY/XaXMawn+RfyuU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1762314947; c=relaxed/simple;
	bh=GgdIvjdU8uL/QtVKzEtOForLRp3chwqvmV3QsWt8voA=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=B0t1Fq+xi7PPH1tCxq87Skzj1bVRcKY1fjCMF6HuYqhdHdJSCJ37DnKzTncejm05d142skq+vUE+aG59fvS73UAOOmr+MBc/gHexelhkWSc/W5eQju8TKIbYDhgBH/shjmZr1by6uLTec2/q/Tng/5BlofACBzZm8sZ7Bmp4dPM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=WWKPDq2q; arc=none smtp.client-ip=198.175.65.11
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="WWKPDq2q"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1762314945; x=1793850945;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=GgdIvjdU8uL/QtVKzEtOForLRp3chwqvmV3QsWt8voA=;
  b=WWKPDq2qhDb0l91hRlCQIv571I/qNrfJnJr6WHxiR/iZs2RpJNSa8ZUi
   /DN3KeW0ydwHNVvDOs3BL2m5W9TKIkyPmsph6hMU3oXrM6QC8DanMC0xi
   Qk2TIgWc8sQvwwmn0NbXAGZdtv25OJrJF+/4atc4yXBc1J9GeBruUTvDu
   LV1YrIioNrbb1mxSEYr78xt46DyU91yVL+p79sgZOUG1j/a0n3Ml2yqmN
   8Ma2mZY3rYKKcBgmLURHzgOPfxoi8S/9Q6RICBX+5VEIpZJMHwPbz7BQS
   5ltoP6ugXwRkWbUgWrqzCCKZUpzpcko/s3byIk/DKb3ANymCJeXL1LbQq
   w==;
X-CSE-ConnectionGUID: 4AGrEnohTmK7Ujr73hmBkQ==
X-CSE-MsgGUID: ZnYb2pyBSJ6QdPrOBgs05A==
X-IronPort-AV: E=McAfee;i="6800,10657,11603"; a="74715329"
X-IronPort-AV: E=Sophos;i="6.19,280,1754982000"; 
   d="scan'208";a="74715329"
Received: from orviesa007.jf.intel.com ([10.64.159.147])
  by orvoesa103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 04 Nov 2025 19:55:44 -0800
X-CSE-ConnectionGUID: ZJC6u131Rkym/XF7aVzZgg==
X-CSE-MsgGUID: dQfpEgmjSPipy2OXJeqAMA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.19,280,1754982000"; 
   d="scan'208";a="187283312"
Received: from lkp-server02.sh.intel.com (HELO 66d7546c76b2) ([10.239.97.151])
  by orviesa007.jf.intel.com with ESMTP; 04 Nov 2025 19:55:43 -0800
Received: from kbuild by 66d7546c76b2 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1vGUcW-000S8N-2h;
	Wed, 05 Nov 2025 03:55:40 +0000
Date: Wed, 5 Nov 2025 11:48:55 +0800
From: kernel test robot <lkp@intel.com>
To: kernel@openeuler.org, GONG Ruiqi <gongruiqi1@huawei.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [openeuler:OLK-6.6 3098/3098] kernel/bpf-rvi/common_kfuncs.c:162:27:
 warning: no previous prototype for 'bpf_mem_file_hugepage'
Message-ID: <202511051134.JuwQrZOr-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://gitee.com/openeuler/kernel.git OLK-6.6
head:   f1418110051edb8e47923b009bbd051f7c06ad1a
commit: d97bc9c8827bb5cd9f66dab10e0b505a879256e2 [3098/3098] bpf-rvi: Add bpf_mem_{file_{hugepage,pmdmapped},kreclaimable} kfunc
config: x86_64-randconfig-001-20251104 (https://download.01.org/0day-ci/archive/20251105/202511051134.JuwQrZOr-lkp@intel.com/config)
compiler: gcc-14 (Debian 14.2.0-19) 14.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20251105/202511051134.JuwQrZOr-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202511051134.JuwQrZOr-lkp@intel.com/

All warnings (new ones prefixed by >>):

   kernel/bpf-rvi/common_kfuncs.c:25:32: warning: no previous prototype for 'bpf_mem_cgroup_from_task' [-Wmissing-prototypes]
      25 | __bpf_kfunc struct mem_cgroup *bpf_mem_cgroup_from_task(struct task_struct *p)
         |                                ^~~~~~~~~~~~~~~~~~~~~~~~
   kernel/bpf-rvi/common_kfuncs.c:34:35: warning: no previous prototype for 'bpf_task_active_pid_ns' [-Wmissing-prototypes]
      34 | __bpf_kfunc struct pid_namespace *bpf_task_active_pid_ns(struct task_struct *task)
         |                                   ^~~~~~~~~~~~~~~~~~~~~~
   kernel/bpf-rvi/common_kfuncs.c:39:17: warning: no previous prototype for 'bpf_pidns_nr_tasks' [-Wmissing-prototypes]
      39 | __bpf_kfunc u64 bpf_pidns_nr_tasks(struct pid_namespace *ns)
         |                 ^~~~~~~~~~~~~~~~~~
   kernel/bpf-rvi/common_kfuncs.c:53:17: warning: no previous prototype for 'bpf_pidns_last_pid' [-Wmissing-prototypes]
      53 | __bpf_kfunc u32 bpf_pidns_last_pid(struct pid_namespace *ns)
         |                 ^~~~~~~~~~~~~~~~~~
   kernel/bpf-rvi/common_kfuncs.c:82:18: warning: no previous prototype for 'bpf_si_memswinfo' [-Wmissing-prototypes]
      82 | __bpf_kfunc void bpf_si_memswinfo(struct bpf_sysinfo *bsi)
         |                  ^~~~~~~~~~~~~~~~
   kernel/bpf-rvi/common_kfuncs.c:92:27: warning: no previous prototype for 'bpf_page_counter_read' [-Wmissing-prototypes]
      92 | __bpf_kfunc unsigned long bpf_page_counter_read(struct page_counter *counter)
         |                           ^~~~~~~~~~~~~~~~~~~~~
   kernel/bpf-rvi/common_kfuncs.c:102:18: warning: no previous prototype for 'bpf_seq_file_append' [-Wmissing-prototypes]
     102 | __bpf_kfunc void bpf_seq_file_append(struct seq_file *dst, struct seq_file *src)
         |                  ^~~~~~~~~~~~~~~~~~~
   kernel/bpf-rvi/common_kfuncs.c:116:18: warning: no previous prototype for 'bpf_get_boottime_timens' [-Wmissing-prototypes]
     116 | __bpf_kfunc void bpf_get_boottime_timens(struct task_struct *tsk, struct timespec64 *boottime)
         |                  ^~~~~~~~~~~~~~~~~~~~~~~
   kernel/bpf-rvi/common_kfuncs.c:122:27: warning: no previous prototype for 'bpf_get_total_forks' [-Wmissing-prototypes]
     122 | __bpf_kfunc unsigned long bpf_get_total_forks(void)
         |                           ^~~~~~~~~~~~~~~~~~~
   kernel/bpf-rvi/common_kfuncs.c:127:26: warning: no previous prototype for 'bpf_nr_running' [-Wmissing-prototypes]
     127 | __bpf_kfunc unsigned int bpf_nr_running(void)
         |                          ^~~~~~~~~~~~~~
   kernel/bpf-rvi/common_kfuncs.c:132:32: warning: no previous prototype for 'bpf_nr_context_switches' [-Wmissing-prototypes]
     132 | __bpf_kfunc unsigned long long bpf_nr_context_switches(void)
         |                                ^~~~~~~~~~~~~~~~~~~~~~~
   kernel/bpf-rvi/common_kfuncs.c:137:26: warning: no previous prototype for 'bpf_nr_iowait' [-Wmissing-prototypes]
     137 | __bpf_kfunc unsigned int bpf_nr_iowait(void)
         |                          ^~~~~~~~~~~~~
   kernel/bpf-rvi/common_kfuncs.c:143:26: warning: no previous prototype for 'bpf_kstat_softirqs_cpu' [-Wmissing-prototypes]
     143 | __bpf_kfunc unsigned int bpf_kstat_softirqs_cpu(unsigned int irq, int cpu)
         |                          ^~~~~~~~~~~~~~~~~~~~~~
   kernel/bpf-rvi/common_kfuncs.c:148:27: warning: no previous prototype for 'bpf_kstat_cpu_irqs_sum' [-Wmissing-prototypes]
     148 | __bpf_kfunc unsigned long bpf_kstat_cpu_irqs_sum(unsigned int cpu)
         |                           ^~~~~~~~~~~~~~~~~~~~~~
   kernel/bpf-rvi/common_kfuncs.c:153:18: warning: no previous prototype for 'bpf_kcpustat_cpu_fetch' [-Wmissing-prototypes]
     153 | __bpf_kfunc void bpf_kcpustat_cpu_fetch(struct kernel_cpustat *dst, int cpu)
         |                  ^~~~~~~~~~~~~~~~~~~~~~
>> kernel/bpf-rvi/common_kfuncs.c:162:27: warning: no previous prototype for 'bpf_mem_file_hugepage' [-Wmissing-prototypes]
     162 | __bpf_kfunc unsigned long bpf_mem_file_hugepage(void)
         |                           ^~~~~~~~~~~~~~~~~~~~~
>> kernel/bpf-rvi/common_kfuncs.c:167:27: warning: no previous prototype for 'bpf_mem_file_pmdmapped' [-Wmissing-prototypes]
     167 | __bpf_kfunc unsigned long bpf_mem_file_pmdmapped(void)
         |                           ^~~~~~~~~~~~~~~~~~~~~~
>> kernel/bpf-rvi/common_kfuncs.c:172:27: warning: no previous prototype for 'bpf_mem_kreclaimable' [-Wmissing-prototypes]
     172 | __bpf_kfunc unsigned long bpf_mem_kreclaimable(void)
         |                           ^~~~~~~~~~~~~~~~~~~~


vim +/bpf_mem_file_hugepage +162 kernel/bpf-rvi/common_kfuncs.c

   157	
   158	/*
   159	 * Meminfo related kfuncs
   160	 */
   161	
 > 162	__bpf_kfunc unsigned long bpf_mem_file_hugepage(void)
   163	{
   164		return global_node_page_state(NR_FILE_THPS);
   165	}
   166	
 > 167	__bpf_kfunc unsigned long bpf_mem_file_pmdmapped(void)
   168	{
   169		return global_node_page_state(NR_FILE_PMDMAPPED);
   170	}
   171	
 > 172	__bpf_kfunc unsigned long bpf_mem_kreclaimable(void)
   173	{
   174		return global_node_page_state_pages(NR_SLAB_RECLAIMABLE_B) +
   175			global_node_page_state(NR_KERNEL_MISC_RECLAIMABLE);
   176	}
   177	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
