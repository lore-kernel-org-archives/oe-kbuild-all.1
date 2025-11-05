Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.7])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CB9BB314B9D
	for <oe-kbuild-all@lists.linux.dev>; Wed,  5 Nov 2025 12:42:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.7
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1762346528; cv=none; b=AGkHuI1Qi7A8CCc9zbazndTCHeO1gOBzWsUqQ8+pgnI5Iup/5YktnjLGaYj3Qfml53r6xQwGxMswdlpz0oCOO+ne592IZb7LKr5zCxoWh6AP346q00d2UAyyVpx/dN0Y2us4m/nZR8INMxZn7+OBvAL9ByS1h45lBjZ8aWe1SBE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1762346528; c=relaxed/simple;
	bh=7/4ijTCQH7ETA4mZXoDsDZjR5TTyacJY5fO1z1oKXPw=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=hvcY12bQbdnSmAOPUYR1WN8+X86/mDu+58bocnnkMjO8pOyxhBmOjqa7A673oYtmJWzUBxGwE4hq5c/gtTRQzMxEZzNNChRlcsIXbrJswXOV0fErN3CMYHx6CbKwwXj2EzjrPFqXFaN1WSWpaPiMu7/NCgfQLWyyMY8LiVaSd5o=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=hkvSc7+k; arc=none smtp.client-ip=192.198.163.7
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="hkvSc7+k"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1762346525; x=1793882525;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=7/4ijTCQH7ETA4mZXoDsDZjR5TTyacJY5fO1z1oKXPw=;
  b=hkvSc7+kz2z122TXnxATZfbmv2uoHvE9ZbxhkwSbC9ZIljC0BymF8cah
   TScDAhWi0VgxckWzxFl3TWPYZ7J6tuHemJBXeiwEJ0UbVuCuyWCz86mXy
   WmcUIgvZJXHMa4zbywmunqfeelt8BpThK9D0vgE4vvZzVqcIiQZ+pnufd
   9Napmii++YBKLjiCavr3vs3/AF3jhO7sLfzMAa/CeVW7USmoLwBFuof0j
   /n4PCY/huUXho+jVObiOOBSTfVjbB+aGThqYg/GQVkwrQU62IxOfZ2Qhv
   rTL2vZBTBki7GQholPI7oFCNSZdtiQH3XHv+aVXhKoDgZdU+9c0z/zGJD
   w==;
X-CSE-ConnectionGUID: sFIQ/ucjRXqW9C01C6JR/Q==
X-CSE-MsgGUID: RA5aq755To+AmkehKcydkw==
X-IronPort-AV: E=McAfee;i="6800,10657,11603"; a="89920735"
X-IronPort-AV: E=Sophos;i="6.19,281,1754982000"; 
   d="scan'208";a="89920735"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
  by fmvoesa101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 05 Nov 2025 04:42:04 -0800
X-CSE-ConnectionGUID: dt35Y+ZDQjmV0XkIcPlOTA==
X-CSE-MsgGUID: mFlMwtbLTB6j9+0rkG4MQw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.19,281,1754982000"; 
   d="scan'208";a="224694573"
Received: from lkp-server02.sh.intel.com (HELO 66d7546c76b2) ([10.239.97.151])
  by orviesa001.jf.intel.com with ESMTP; 05 Nov 2025 04:42:03 -0800
Received: from kbuild by 66d7546c76b2 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1vGcps-000SYh-2n;
	Wed, 05 Nov 2025 12:42:00 +0000
Date: Wed, 5 Nov 2025 20:41:14 +0800
From: kernel test robot <lkp@intel.com>
To: kernel@openeuler.org, GONG Ruiqi <gongruiqi1@huawei.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [openeuler:OLK-6.6 3098/3098] kernel/bpf-rvi/common_kfuncs.c:250:27:
 warning: no previous prototype for 'bpf_mem_commit_limit'
Message-ID: <202511052033.01T6CrLU-lkp@intel.com>
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
commit: 7aa850a9126f0acd994e09afe54bb0200214e068 [3098/3098] bpf-rvi: Add bpf_mem_commit_limit & bpf_mem_committed kfunc
config: x86_64-randconfig-001-20251104 (https://download.01.org/0day-ci/archive/20251105/202511052033.01T6CrLU-lkp@intel.com/config)
compiler: gcc-14 (Debian 14.2.0-19) 14.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20251105/202511052033.01T6CrLU-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202511052033.01T6CrLU-lkp@intel.com/

All warnings (new ones prefixed by >>):

   kernel/bpf-rvi/common_kfuncs.c:28:32: warning: no previous prototype for 'bpf_mem_cgroup_from_task' [-Wmissing-prototypes]
      28 | __bpf_kfunc struct mem_cgroup *bpf_mem_cgroup_from_task(struct task_struct *p)
         |                                ^~~~~~~~~~~~~~~~~~~~~~~~
   kernel/bpf-rvi/common_kfuncs.c:37:35: warning: no previous prototype for 'bpf_task_active_pid_ns' [-Wmissing-prototypes]
      37 | __bpf_kfunc struct pid_namespace *bpf_task_active_pid_ns(struct task_struct *task)
         |                                   ^~~~~~~~~~~~~~~~~~~~~~
   kernel/bpf-rvi/common_kfuncs.c:42:17: warning: no previous prototype for 'bpf_pidns_nr_tasks' [-Wmissing-prototypes]
      42 | __bpf_kfunc u64 bpf_pidns_nr_tasks(struct pid_namespace *ns)
         |                 ^~~~~~~~~~~~~~~~~~
   kernel/bpf-rvi/common_kfuncs.c:56:17: warning: no previous prototype for 'bpf_pidns_last_pid' [-Wmissing-prototypes]
      56 | __bpf_kfunc u32 bpf_pidns_last_pid(struct pid_namespace *ns)
         |                 ^~~~~~~~~~~~~~~~~~
   kernel/bpf-rvi/common_kfuncs.c:85:18: warning: no previous prototype for 'bpf_si_memswinfo' [-Wmissing-prototypes]
      85 | __bpf_kfunc void bpf_si_memswinfo(struct bpf_sysinfo *bsi)
         |                  ^~~~~~~~~~~~~~~~
   kernel/bpf-rvi/common_kfuncs.c:95:27: warning: no previous prototype for 'bpf_page_counter_read' [-Wmissing-prototypes]
      95 | __bpf_kfunc unsigned long bpf_page_counter_read(struct page_counter *counter)
         |                           ^~~~~~~~~~~~~~~~~~~~~
   kernel/bpf-rvi/common_kfuncs.c:105:18: warning: no previous prototype for 'bpf_seq_file_append' [-Wmissing-prototypes]
     105 | __bpf_kfunc void bpf_seq_file_append(struct seq_file *dst, struct seq_file *src)
         |                  ^~~~~~~~~~~~~~~~~~~
   kernel/bpf-rvi/common_kfuncs.c:119:18: warning: no previous prototype for 'bpf_get_boottime_timens' [-Wmissing-prototypes]
     119 | __bpf_kfunc void bpf_get_boottime_timens(struct task_struct *tsk, struct timespec64 *boottime)
         |                  ^~~~~~~~~~~~~~~~~~~~~~~
   kernel/bpf-rvi/common_kfuncs.c:125:27: warning: no previous prototype for 'bpf_get_total_forks' [-Wmissing-prototypes]
     125 | __bpf_kfunc unsigned long bpf_get_total_forks(void)
         |                           ^~~~~~~~~~~~~~~~~~~
   kernel/bpf-rvi/common_kfuncs.c:130:26: warning: no previous prototype for 'bpf_nr_running' [-Wmissing-prototypes]
     130 | __bpf_kfunc unsigned int bpf_nr_running(void)
         |                          ^~~~~~~~~~~~~~
   kernel/bpf-rvi/common_kfuncs.c:135:32: warning: no previous prototype for 'bpf_nr_context_switches' [-Wmissing-prototypes]
     135 | __bpf_kfunc unsigned long long bpf_nr_context_switches(void)
         |                                ^~~~~~~~~~~~~~~~~~~~~~~
   kernel/bpf-rvi/common_kfuncs.c:140:26: warning: no previous prototype for 'bpf_nr_iowait' [-Wmissing-prototypes]
     140 | __bpf_kfunc unsigned int bpf_nr_iowait(void)
         |                          ^~~~~~~~~~~~~
   kernel/bpf-rvi/common_kfuncs.c:146:26: warning: no previous prototype for 'bpf_kstat_softirqs_cpu' [-Wmissing-prototypes]
     146 | __bpf_kfunc unsigned int bpf_kstat_softirqs_cpu(unsigned int irq, int cpu)
         |                          ^~~~~~~~~~~~~~~~~~~~~~
   kernel/bpf-rvi/common_kfuncs.c:151:27: warning: no previous prototype for 'bpf_kstat_cpu_irqs_sum' [-Wmissing-prototypes]
     151 | __bpf_kfunc unsigned long bpf_kstat_cpu_irqs_sum(unsigned int cpu)
         |                           ^~~~~~~~~~~~~~~~~~~~~~
   kernel/bpf-rvi/common_kfuncs.c:156:18: warning: no previous prototype for 'bpf_kcpustat_cpu_fetch' [-Wmissing-prototypes]
     156 | __bpf_kfunc void bpf_kcpustat_cpu_fetch(struct kernel_cpustat *dst, int cpu)
         |                  ^~~~~~~~~~~~~~~~~~~~~~
   kernel/bpf-rvi/common_kfuncs.c:165:27: warning: no previous prototype for 'bpf_mem_file_hugepage' [-Wmissing-prototypes]
     165 | __bpf_kfunc unsigned long bpf_mem_file_hugepage(void)
         |                           ^~~~~~~~~~~~~~~~~~~~~
   kernel/bpf-rvi/common_kfuncs.c:170:27: warning: no previous prototype for 'bpf_mem_file_pmdmapped' [-Wmissing-prototypes]
     170 | __bpf_kfunc unsigned long bpf_mem_file_pmdmapped(void)
         |                           ^~~~~~~~~~~~~~~~~~~~~~
   kernel/bpf-rvi/common_kfuncs.c:175:27: warning: no previous prototype for 'bpf_mem_kreclaimable' [-Wmissing-prototypes]
     175 | __bpf_kfunc unsigned long bpf_mem_kreclaimable(void)
         |                           ^~~~~~~~~~~~~~~~~~~~
   kernel/bpf-rvi/common_kfuncs.c:181:27: warning: no previous prototype for 'bpf_mem_totalcma' [-Wmissing-prototypes]
     181 | __bpf_kfunc unsigned long bpf_mem_totalcma(void)
         |                           ^~~~~~~~~~~~~~~~
   kernel/bpf-rvi/common_kfuncs.c:186:27: warning: no previous prototype for 'bpf_mem_freecma' [-Wmissing-prototypes]
     186 | __bpf_kfunc unsigned long bpf_mem_freecma(void)
         |                           ^~~~~~~~~~~~~~~
   kernel/bpf-rvi/common_kfuncs.c:201:17: warning: no previous prototype for 'bpf_hugetlb_report_meminfo' [-Wmissing-prototypes]
     201 | __bpf_kfunc int bpf_hugetlb_report_meminfo(struct bpf_mem_hugepage *hugepage_info)
         |                 ^~~~~~~~~~~~~~~~~~~~~~~~~~
   kernel/bpf-rvi/common_kfuncs.c:234:27: warning: no previous prototype for 'bpf_mem_failure' [-Wmissing-prototypes]
     234 | __bpf_kfunc unsigned long bpf_mem_failure(void)
         |                           ^~~~~~~~~~~~~~~
   kernel/bpf-rvi/common_kfuncs.c:245:27: warning: no previous prototype for 'bpf_mem_percpu' [-Wmissing-prototypes]
     245 | __bpf_kfunc unsigned long bpf_mem_percpu(void)
         |                           ^~~~~~~~~~~~~~
>> kernel/bpf-rvi/common_kfuncs.c:250:27: warning: no previous prototype for 'bpf_mem_commit_limit' [-Wmissing-prototypes]
     250 | __bpf_kfunc unsigned long bpf_mem_commit_limit(void)
         |                           ^~~~~~~~~~~~~~~~~~~~
>> kernel/bpf-rvi/common_kfuncs.c:254:27: warning: no previous prototype for 'bpf_mem_committed' [-Wmissing-prototypes]
     254 | __bpf_kfunc unsigned long bpf_mem_committed(void)
         |                           ^~~~~~~~~~~~~~~~~


vim +/bpf_mem_commit_limit +250 kernel/bpf-rvi/common_kfuncs.c

   199	
   200	#ifdef CONFIG_HUGETLB_PAGE
 > 201	__bpf_kfunc int bpf_hugetlb_report_meminfo(struct bpf_mem_hugepage *hugepage_info)
   202	{
   203		struct hstate *h;
   204		unsigned long total = 0;
   205	
   206		if (!hugepages_supported())
   207			return -1;
   208	
   209		for_each_hstate(h) {
   210			unsigned long count = h->nr_huge_pages;
   211	
   212			total += huge_page_size(h) * count;
   213	
   214			if (h == &default_hstate) {
   215				hugepage_info->total = count;
   216				hugepage_info->free = h->free_huge_pages;
   217				hugepage_info->rsvd = h->resv_huge_pages;
   218				hugepage_info->surp = h->surplus_huge_pages;
   219				hugepage_info->size = huge_page_size(h) / SZ_1K;
   220			}
   221		}
   222	
   223		hugepage_info->hugetlb = total / SZ_1K;
   224		return 0;
   225	}
   226	#else
   227	__bpf_kfunc int bpf_hugetlb_report_meminfo(struct bpf_mem_hugepage *hugepage_info)
   228	{
   229		return -1;
   230	}
   231	#endif
   232	
   233	#ifdef CONFIG_MEMORY_FAILURE
 > 234	__bpf_kfunc unsigned long bpf_mem_failure(void)
   235	{
   236		return atomic_long_read(&num_poisoned_pages) << (PAGE_SHIFT - 10);
   237	}
   238	#else
   239	__bpf_kfunc unsigned long bpf_mem_failure(void)
   240	{
   241		return 0;
   242	}
   243	#endif
   244	
   245	__bpf_kfunc unsigned long bpf_mem_percpu(void)
   246	{
   247		return pcpu_nr_pages();
   248	}
   249	
 > 250	__bpf_kfunc unsigned long bpf_mem_commit_limit(void)
   251	{
   252		return vm_commit_limit();
   253	}
 > 254	__bpf_kfunc unsigned long bpf_mem_committed(void)
   255	{
   256		return vm_memory_committed();
   257	}
   258	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
