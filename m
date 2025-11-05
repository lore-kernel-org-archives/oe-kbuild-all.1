Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.8])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8344F2F7446
	for <oe-kbuild-all@lists.linux.dev>; Wed,  5 Nov 2025 16:07:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.8
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1762358840; cv=none; b=DpJm9apN+EAwWO4vJ/mq9f3xYNCwdLAnZ2ffDQHG58zf9bL079PDdXEWeg6eBn7FnEcjufyWUwKioLdwGXu+1ffElqRpOpi8dndoW9TLA923I4U9NAbMLgYPtXG9+sGdT3TihFlfhPr8n9rBrbSqLaqziRNMxNxPi8KJ8JbhL4w=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1762358840; c=relaxed/simple;
	bh=EDyXYfzQyTycqgS2pZCwxwdOs1l7iqzcuvhSD4vU3YY=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=aCtY08kzxbvRAkz44ZGwBTgMTxco9jGvuCk4TEvQwkuYO6MN5GkgxlN6uYMrgTtFj8t7hRub7ot9kyZIBhmihtUPlnE/B51e89bSlIpBYn+dW7IPq4KOeAD8kNF4pJtVUKo57SoY8p1I2UxiAsdWQ7gvq2VtOP4p/W759vNdD+M=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=LYNX/k19; arc=none smtp.client-ip=192.198.163.8
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="LYNX/k19"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1762358838; x=1793894838;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=EDyXYfzQyTycqgS2pZCwxwdOs1l7iqzcuvhSD4vU3YY=;
  b=LYNX/k19dC83YnVB6gvPP1WfEjrJEaHiuxQM/crqIPWX2f0ZqNoR5H35
   JCcbgA5vZfoh/vUSsavQeuAVHhWKrI9TpQWB9GWIZdZI3FH7VEvyUuK8O
   g/eevFJRuthE89uZNssXC0nnEnBcjSBku7SX9RJbzHMOeZCG7c2p50dwr
   yj8ar/c4qCXDIEp6cBQLqbjfzMSmbt7b7fR4qAabks/LNJn+3UvkzVtHH
   /fNdIRd22PCMjiTYfq39Mw1vMMC0uYlLXNgjkkj4nHsw3zbRAFhvAtz2k
   RKBEfBOL37f55Im77cVN9A5FDq0tznC/BA7pCXuuByZEu8KSVQY4RpURL
   A==;
X-CSE-ConnectionGUID: +Oyv0ylvQqWXDuyQuMpJbQ==
X-CSE-MsgGUID: 7BEmlKTXRRmUsMZZbj/c7w==
X-IronPort-AV: E=McAfee;i="6800,10657,11603"; a="82106080"
X-IronPort-AV: E=Sophos;i="6.19,282,1754982000"; 
   d="scan'208";a="82106080"
Received: from orviesa007.jf.intel.com ([10.64.159.147])
  by fmvoesa102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 05 Nov 2025 08:07:17 -0800
X-CSE-ConnectionGUID: /CfYlnKKRSqasDrg4O0J6w==
X-CSE-MsgGUID: Anytn1AaSoSroJD+dkR9yQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.19,282,1754982000"; 
   d="scan'208";a="187439733"
Received: from lkp-server02.sh.intel.com (HELO 66d7546c76b2) ([10.239.97.151])
  by orviesa007.jf.intel.com with ESMTP; 05 Nov 2025 08:07:15 -0800
Received: from kbuild by 66d7546c76b2 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1vGg1n-000Soh-0K;
	Wed, 05 Nov 2025 16:06:41 +0000
Date: Thu, 6 Nov 2025 00:03:06 +0800
From: kernel test robot <lkp@intel.com>
To: kernel@openeuler.org, GONG Ruiqi <gongruiqi1@huawei.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [openeuler:OLK-6.6 3098/3098] arch/x86/mm/pat/set_memory.c:127:22:
 warning: no previous prototype for 'x86_get_direct_pages_count'
Message-ID: <202511052304.LJ7vOaWB-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://gitee.com/openeuler/kernel.git OLK-6.6
head:   b2b8512ca97108929f3aca5405875d91577b8c80
commit: ef5847533f910a4b3aca1cd1c855b02d60389ad3 [3098/3098] bpf-rvi: Add bpf_x86_direct_pages kfunc
config: x86_64-randconfig-001-20251104 (https://download.01.org/0day-ci/archive/20251105/202511052304.LJ7vOaWB-lkp@intel.com/config)
compiler: gcc-14 (Debian 14.2.0-19) 14.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20251105/202511052304.LJ7vOaWB-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202511052304.LJ7vOaWB-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> arch/x86/mm/pat/set_memory.c:127:22: warning: no previous prototype for 'x86_get_direct_pages_count' [-Wmissing-prototypes]
     127 | const unsigned long *x86_get_direct_pages_count(void)
         |                      ^~~~~~~~~~~~~~~~~~~~~~~~~~
--
   kernel/bpf-rvi/common_kfuncs.c:29:32: warning: no previous prototype for 'bpf_mem_cgroup_from_task' [-Wmissing-prototypes]
      29 | __bpf_kfunc struct mem_cgroup *bpf_mem_cgroup_from_task(struct task_struct *p)
         |                                ^~~~~~~~~~~~~~~~~~~~~~~~
   kernel/bpf-rvi/common_kfuncs.c:38:35: warning: no previous prototype for 'bpf_task_active_pid_ns' [-Wmissing-prototypes]
      38 | __bpf_kfunc struct pid_namespace *bpf_task_active_pid_ns(struct task_struct *task)
         |                                   ^~~~~~~~~~~~~~~~~~~~~~
   kernel/bpf-rvi/common_kfuncs.c:43:17: warning: no previous prototype for 'bpf_pidns_nr_tasks' [-Wmissing-prototypes]
      43 | __bpf_kfunc u64 bpf_pidns_nr_tasks(struct pid_namespace *ns)
         |                 ^~~~~~~~~~~~~~~~~~
   kernel/bpf-rvi/common_kfuncs.c:57:17: warning: no previous prototype for 'bpf_pidns_last_pid' [-Wmissing-prototypes]
      57 | __bpf_kfunc u32 bpf_pidns_last_pid(struct pid_namespace *ns)
         |                 ^~~~~~~~~~~~~~~~~~
   kernel/bpf-rvi/common_kfuncs.c:86:18: warning: no previous prototype for 'bpf_si_memswinfo' [-Wmissing-prototypes]
      86 | __bpf_kfunc void bpf_si_memswinfo(struct bpf_sysinfo *bsi)
         |                  ^~~~~~~~~~~~~~~~
   kernel/bpf-rvi/common_kfuncs.c:96:27: warning: no previous prototype for 'bpf_page_counter_read' [-Wmissing-prototypes]
      96 | __bpf_kfunc unsigned long bpf_page_counter_read(struct page_counter *counter)
         |                           ^~~~~~~~~~~~~~~~~~~~~
   kernel/bpf-rvi/common_kfuncs.c:106:18: warning: no previous prototype for 'bpf_seq_file_append' [-Wmissing-prototypes]
     106 | __bpf_kfunc void bpf_seq_file_append(struct seq_file *dst, struct seq_file *src)
         |                  ^~~~~~~~~~~~~~~~~~~
   kernel/bpf-rvi/common_kfuncs.c:120:18: warning: no previous prototype for 'bpf_get_boottime_timens' [-Wmissing-prototypes]
     120 | __bpf_kfunc void bpf_get_boottime_timens(struct task_struct *tsk, struct timespec64 *boottime)
         |                  ^~~~~~~~~~~~~~~~~~~~~~~
   kernel/bpf-rvi/common_kfuncs.c:126:27: warning: no previous prototype for 'bpf_get_total_forks' [-Wmissing-prototypes]
     126 | __bpf_kfunc unsigned long bpf_get_total_forks(void)
         |                           ^~~~~~~~~~~~~~~~~~~
   kernel/bpf-rvi/common_kfuncs.c:131:26: warning: no previous prototype for 'bpf_nr_running' [-Wmissing-prototypes]
     131 | __bpf_kfunc unsigned int bpf_nr_running(void)
         |                          ^~~~~~~~~~~~~~
   kernel/bpf-rvi/common_kfuncs.c:136:32: warning: no previous prototype for 'bpf_nr_context_switches' [-Wmissing-prototypes]
     136 | __bpf_kfunc unsigned long long bpf_nr_context_switches(void)
         |                                ^~~~~~~~~~~~~~~~~~~~~~~
   kernel/bpf-rvi/common_kfuncs.c:141:26: warning: no previous prototype for 'bpf_nr_iowait' [-Wmissing-prototypes]
     141 | __bpf_kfunc unsigned int bpf_nr_iowait(void)
         |                          ^~~~~~~~~~~~~
   kernel/bpf-rvi/common_kfuncs.c:147:26: warning: no previous prototype for 'bpf_kstat_softirqs_cpu' [-Wmissing-prototypes]
     147 | __bpf_kfunc unsigned int bpf_kstat_softirqs_cpu(unsigned int irq, int cpu)
         |                          ^~~~~~~~~~~~~~~~~~~~~~
   kernel/bpf-rvi/common_kfuncs.c:152:27: warning: no previous prototype for 'bpf_kstat_cpu_irqs_sum' [-Wmissing-prototypes]
     152 | __bpf_kfunc unsigned long bpf_kstat_cpu_irqs_sum(unsigned int cpu)
         |                           ^~~~~~~~~~~~~~~~~~~~~~
   kernel/bpf-rvi/common_kfuncs.c:157:18: warning: no previous prototype for 'bpf_kcpustat_cpu_fetch' [-Wmissing-prototypes]
     157 | __bpf_kfunc void bpf_kcpustat_cpu_fetch(struct kernel_cpustat *dst, int cpu)
         |                  ^~~~~~~~~~~~~~~~~~~~~~
   kernel/bpf-rvi/common_kfuncs.c:166:27: warning: no previous prototype for 'bpf_mem_file_hugepage' [-Wmissing-prototypes]
     166 | __bpf_kfunc unsigned long bpf_mem_file_hugepage(void)
         |                           ^~~~~~~~~~~~~~~~~~~~~
   kernel/bpf-rvi/common_kfuncs.c:171:27: warning: no previous prototype for 'bpf_mem_file_pmdmapped' [-Wmissing-prototypes]
     171 | __bpf_kfunc unsigned long bpf_mem_file_pmdmapped(void)
         |                           ^~~~~~~~~~~~~~~~~~~~~~
   kernel/bpf-rvi/common_kfuncs.c:176:27: warning: no previous prototype for 'bpf_mem_kreclaimable' [-Wmissing-prototypes]
     176 | __bpf_kfunc unsigned long bpf_mem_kreclaimable(void)
         |                           ^~~~~~~~~~~~~~~~~~~~
   kernel/bpf-rvi/common_kfuncs.c:182:27: warning: no previous prototype for 'bpf_mem_totalcma' [-Wmissing-prototypes]
     182 | __bpf_kfunc unsigned long bpf_mem_totalcma(void)
         |                           ^~~~~~~~~~~~~~~~
   kernel/bpf-rvi/common_kfuncs.c:187:27: warning: no previous prototype for 'bpf_mem_freecma' [-Wmissing-prototypes]
     187 | __bpf_kfunc unsigned long bpf_mem_freecma(void)
         |                           ^~~~~~~~~~~~~~~
   kernel/bpf-rvi/common_kfuncs.c:202:17: warning: no previous prototype for 'bpf_hugetlb_report_meminfo' [-Wmissing-prototypes]
     202 | __bpf_kfunc int bpf_hugetlb_report_meminfo(struct bpf_mem_hugepage *hugepage_info)
         |                 ^~~~~~~~~~~~~~~~~~~~~~~~~~
   kernel/bpf-rvi/common_kfuncs.c:235:27: warning: no previous prototype for 'bpf_mem_failure' [-Wmissing-prototypes]
     235 | __bpf_kfunc unsigned long bpf_mem_failure(void)
         |                           ^~~~~~~~~~~~~~~
   kernel/bpf-rvi/common_kfuncs.c:246:27: warning: no previous prototype for 'bpf_mem_percpu' [-Wmissing-prototypes]
     246 | __bpf_kfunc unsigned long bpf_mem_percpu(void)
         |                           ^~~~~~~~~~~~~~
   kernel/bpf-rvi/common_kfuncs.c:251:27: warning: no previous prototype for 'bpf_mem_commit_limit' [-Wmissing-prototypes]
     251 | __bpf_kfunc unsigned long bpf_mem_commit_limit(void)
         |                           ^~~~~~~~~~~~~~~~~~~~
   kernel/bpf-rvi/common_kfuncs.c:255:27: warning: no previous prototype for 'bpf_mem_committed' [-Wmissing-prototypes]
     255 | __bpf_kfunc unsigned long bpf_mem_committed(void)
         |                           ^~~~~~~~~~~~~~~~~
   kernel/bpf-rvi/common_kfuncs.c:260:27: warning: no previous prototype for 'bpf_mem_vmalloc_used' [-Wmissing-prototypes]
     260 | __bpf_kfunc unsigned long bpf_mem_vmalloc_used(void)
         |                           ^~~~~~~~~~~~~~~~~~~~
   kernel/bpf-rvi/common_kfuncs.c:265:27: warning: no previous prototype for 'bpf_mem_vmalloc_total' [-Wmissing-prototypes]
     265 | __bpf_kfunc unsigned long bpf_mem_vmalloc_total(void)
         |                           ^~~~~~~~~~~~~~~~~~~~~
>> kernel/bpf-rvi/common_kfuncs.c:273:18: warning: no previous prototype for 'bpf_x86_direct_pages' [-Wmissing-prototypes]
     273 | __bpf_kfunc void bpf_x86_direct_pages(unsigned long *p)
         |                  ^~~~~~~~~~~~~~~~~~~~


vim +/x86_get_direct_pages_count +127 arch/x86/mm/pat/set_memory.c

   125	
   126	#ifdef CONFIG_BPF_RVI
 > 127	const unsigned long *x86_get_direct_pages_count(void)
   128	{
   129		return direct_pages_count;
   130	}
   131	#endif
   132	#else
   133	static inline void split_page_count(int level) { }
   134	#endif
   135	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
