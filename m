Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A5900EACE
	for <oe-kbuild-all@lists.linux.dev>; Wed,  5 Nov 2025 02:05:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.12
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1762308353; cv=none; b=jULuVf5zM2gPtYw75RkOKO04HH+fB39EwTr3/xSuUm//sSzQLSIYdSy2mjC/igo8Q6RH1yb8kDZUoAG18fzB4TwiupUcSupnYaQEz9Pim4xif0LeE9mnoJZs33z2COj23HTbCG3HkbHnavys6HT8tsvYnrV3zlTLgEYuirhuAF0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1762308353; c=relaxed/simple;
	bh=TatrB8oWfsQvxYkEHL0vHhuC+gPG2ILQLKs+oYAUboM=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=fXXvhoXGjJk8VLMUhx5nAASNd4KtqxwTdaljyJTpZYXVjhPIydVoV52hvhOXAai1cAb+QX/F659Z1iMNLai38oWF61dF6nBujBAsiLrihxWy9iGecBWI4j3Cdc/XN6Cg4pVeqlNBY8IB6eygLV3YkCe3UUvMgvfDUrWLGqnWYsY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=nn4vIxLs; arc=none smtp.client-ip=198.175.65.12
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="nn4vIxLs"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1762308351; x=1793844351;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=TatrB8oWfsQvxYkEHL0vHhuC+gPG2ILQLKs+oYAUboM=;
  b=nn4vIxLscUCGZD2LQeK7ScG+pcfIgfeatz8kxWe9864w3yXrYoRhNRSi
   DE3jbxKCxz+pKybMQ/iDZPjI/HQOh/WcLWfuHWbMhJawhGmLIRnsVxPe+
   FDupmdpc5vXOZ8XuLd8qk1PC9UyQWDeA4YHf8qIzG8yMFJESO5SfHrW7Y
   fG+aQ4Oj3EMkIuLcDdiJ0UOpwBqeJp2SJx7dDdXsZHwvMAcrARo+oglAs
   9UeEHWQ4CPgRmjJdw/h4z8pWr/Hm24tdzPDNB6JNL9jmU4AkQV3Bwc1rJ
   pE2w9yVMgrA2T43e15IwqAW2Hw29T7ns3LEEVEUlNTRwQ0KdzMiHd6ZkM
   g==;
X-CSE-ConnectionGUID: 6pLWEtDYSRWkNeahJ93Q1A==
X-CSE-MsgGUID: NME9BnciQb+EfZYm8o11YA==
X-IronPort-AV: E=McAfee;i="6800,10657,11603"; a="75865822"
X-IronPort-AV: E=Sophos;i="6.19,280,1754982000"; 
   d="scan'208";a="75865822"
Received: from fmviesa010.fm.intel.com ([10.60.135.150])
  by orvoesa104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 04 Nov 2025 18:05:51 -0800
X-CSE-ConnectionGUID: oYc+p1QJTU2dsc7c2LSLCQ==
X-CSE-MsgGUID: QxhZXJq9RzqjjyVOT+OiEQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.19,280,1754982000"; 
   d="scan'208";a="188047496"
Received: from lkp-server02.sh.intel.com (HELO 66d7546c76b2) ([10.239.97.151])
  by fmviesa010.fm.intel.com with ESMTP; 04 Nov 2025 18:05:50 -0800
Received: from kbuild by 66d7546c76b2 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1vGSsX-000S2V-0g;
	Wed, 05 Nov 2025 02:04:35 +0000
Date: Wed, 5 Nov 2025 10:01:23 +0800
From: kernel test robot <lkp@intel.com>
To: kernel@openeuler.org, GONG Ruiqi <gongruiqi1@huawei.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [openeuler:OLK-6.6 3098/3098] kernel/bpf-rvi/common_kfuncs.c:143:26:
 warning: no previous prototype for 'bpf_kstat_softirqs_cpu'
Message-ID: <202511050941.wo8YZedF-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://gitee.com/openeuler/kernel.git OLK-6.6
head:   faa195bad3afed3c326917fb4cd36e0bd311220c
commit: e553ff4b5e1eed196ab68b4efd4a189c45396667 [3098/3098] bpf-rvi: Add kstat_ & kcpustat_ kfuncs
config: x86_64-randconfig-001-20251104 (https://download.01.org/0day-ci/archive/20251105/202511050941.wo8YZedF-lkp@intel.com/config)
compiler: gcc-14 (Debian 14.2.0-19) 14.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20251105/202511050941.wo8YZedF-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202511050941.wo8YZedF-lkp@intel.com/

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
>> kernel/bpf-rvi/common_kfuncs.c:143:26: warning: no previous prototype for 'bpf_kstat_softirqs_cpu' [-Wmissing-prototypes]
     143 | __bpf_kfunc unsigned int bpf_kstat_softirqs_cpu(unsigned int irq, int cpu)
         |                          ^~~~~~~~~~~~~~~~~~~~~~
>> kernel/bpf-rvi/common_kfuncs.c:148:27: warning: no previous prototype for 'bpf_kstat_cpu_irqs_sum' [-Wmissing-prototypes]
     148 | __bpf_kfunc unsigned long bpf_kstat_cpu_irqs_sum(unsigned int cpu)
         |                           ^~~~~~~~~~~~~~~~~~~~~~
>> kernel/bpf-rvi/common_kfuncs.c:153:18: warning: no previous prototype for 'bpf_kcpustat_cpu_fetch' [-Wmissing-prototypes]
     153 | __bpf_kfunc void bpf_kcpustat_cpu_fetch(struct kernel_cpustat *dst, int cpu)
         |                  ^~~~~~~~~~~~~~~~~~~~~~


vim +/bpf_kstat_softirqs_cpu +143 kernel/bpf-rvi/common_kfuncs.c

   126	
 > 127	__bpf_kfunc unsigned int bpf_nr_running(void)
   128	{
   129		return nr_running();
   130	}
   131	
 > 132	__bpf_kfunc unsigned long long bpf_nr_context_switches(void)
   133	{
   134		return nr_context_switches();
   135	}
   136	
 > 137	__bpf_kfunc unsigned int bpf_nr_iowait(void)
   138	{
   139		return nr_iowait();
   140	}
   141	
   142	/* Kernel statistics for CPU accounting */
 > 143	__bpf_kfunc unsigned int bpf_kstat_softirqs_cpu(unsigned int irq, int cpu)
   144	{
   145		return kstat_softirqs_cpu(irq, cpu);
   146	}
   147	
 > 148	__bpf_kfunc unsigned long bpf_kstat_cpu_irqs_sum(unsigned int cpu)
   149	{
   150		return kstat_cpu_irqs_sum(cpu);
   151	}
   152	
 > 153	__bpf_kfunc void bpf_kcpustat_cpu_fetch(struct kernel_cpustat *dst, int cpu)
   154	{
   155		kcpustat_cpu_fetch(dst, cpu);
   156	}
   157	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
