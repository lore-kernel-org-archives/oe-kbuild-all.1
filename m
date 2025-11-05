Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.14])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5F309309F18
	for <oe-kbuild-all@lists.linux.dev>; Wed,  5 Nov 2025 10:47:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.14
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1762339677; cv=none; b=GL7m8kWIaVZUJ+SXEW4ycF4T3UWW11Z4t3j2Se8+JrGuENgwL23URwKbAhhSNGgWTCIibLCwLVGBbpINkh+mZ91yRtbhOlYSsP95+8OYIB8Mkm6DzwIFFXpubVDzBdDlW1l4SVdIuqheRDdjH0aKTdVlt8FR2jPFyRJ2sCLWyBg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1762339677; c=relaxed/simple;
	bh=FYNxq3miScymIg6+HPn/sm6m7FydL8dmcaGHfDvwaDI=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=CfUiWn0f+/xYjoNHXWybZxipdSeg8B5FBMYgIj1q20xzaVHdcG+c0pzFpWKLEYNnhZ7zZO5sdzb6tntUDkF8OOWtVl+Fut7dw2jGurzi0V9Ta1uYNAPiOtNS9RRrGGx51tJQvll2lPZlTzdbhKKor9lqiLMCW+O+q1Om5ml1+pI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=Nx2Hbk4v; arc=none smtp.client-ip=192.198.163.14
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="Nx2Hbk4v"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1762339675; x=1793875675;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=FYNxq3miScymIg6+HPn/sm6m7FydL8dmcaGHfDvwaDI=;
  b=Nx2Hbk4vhX+bABNbDeNadT++QjIIhQwg9ujclke/N4i3pf3A1a0K+m8G
   BskBB59FBYR7sXXmVsRq27JfzhmKYfexCcukLk4/EiS+8g4dzyjT7tHU3
   EZTuV/JBn+LSp8kyyYczXoae4JYtIyjNMT21yf45tju2gb1IUYjb0c1OW
   rt5N1SQ5sw62aal9zWCU91k1hAr3EFxfte/r93zZEx7GMWOLNKcvXI6N9
   Na1mcPikT3wnnhycx7/77aKyckeB79vMIwW9EutxWM7U5v/f4HXAqTIqK
   Hngl3KsyS7gBDAhl8kTZo0O+0swQylYnqT8zRmSs1SmIilodAbdnglvlZ
   g==;
X-CSE-ConnectionGUID: tuRaPIyOQKyvMjN6unl/Gg==
X-CSE-MsgGUID: 8ZwdxacOSwC50AXE/DFB+A==
X-IronPort-AV: E=McAfee;i="6800,10657,11603"; a="64481333"
X-IronPort-AV: E=Sophos;i="6.19,281,1754982000"; 
   d="scan'208";a="64481333"
Received: from fmviesa002.fm.intel.com ([10.60.135.142])
  by fmvoesa108.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 05 Nov 2025 02:47:55 -0800
X-CSE-ConnectionGUID: cy8KObWDTW203uigtqFRsg==
X-CSE-MsgGUID: 3dOf3Bv/S+OIZO3m5DhElg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.19,281,1754982000"; 
   d="scan'208";a="210904757"
Received: from lkp-server02.sh.intel.com (HELO 66d7546c76b2) ([10.239.97.151])
  by fmviesa002.fm.intel.com with ESMTP; 05 Nov 2025 02:47:53 -0800
Received: from kbuild by 66d7546c76b2 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1vGb3P-000SRa-1F;
	Wed, 05 Nov 2025 10:47:51 +0000
Date: Wed, 5 Nov 2025 18:47:41 +0800
From: kernel test robot <lkp@intel.com>
To: kernel@openeuler.org, GONG Ruiqi <gongruiqi1@huawei.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [openeuler:OLK-6.6 3098/3098] kernel/bpf-rvi/common_kfuncs.c:244:27:
 warning: no previous prototype for 'bpf_mem_percpu'
Message-ID: <202511051816.mAnFluwr-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://gitee.com/openeuler/kernel.git OLK-6.6
head:   534b306a9ab27f36c465a7c90a32a1b4ff3a641c
commit: af34a7a840fd24a050a5fee8ea4dcfad963f3abc [3098/3098] bpf-rvi: Add bpf_mem_percpu kfunc
config: x86_64-randconfig-001-20251104 (https://download.01.org/0day-ci/archive/20251105/202511051816.mAnFluwr-lkp@intel.com/config)
compiler: gcc-14 (Debian 14.2.0-19) 14.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20251105/202511051816.mAnFluwr-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202511051816.mAnFluwr-lkp@intel.com/

All warnings (new ones prefixed by >>):

   kernel/bpf-rvi/common_kfuncs.c:27:32: warning: no previous prototype for 'bpf_mem_cgroup_from_task' [-Wmissing-prototypes]
      27 | __bpf_kfunc struct mem_cgroup *bpf_mem_cgroup_from_task(struct task_struct *p)
         |                                ^~~~~~~~~~~~~~~~~~~~~~~~
   kernel/bpf-rvi/common_kfuncs.c:36:35: warning: no previous prototype for 'bpf_task_active_pid_ns' [-Wmissing-prototypes]
      36 | __bpf_kfunc struct pid_namespace *bpf_task_active_pid_ns(struct task_struct *task)
         |                                   ^~~~~~~~~~~~~~~~~~~~~~
   kernel/bpf-rvi/common_kfuncs.c:41:17: warning: no previous prototype for 'bpf_pidns_nr_tasks' [-Wmissing-prototypes]
      41 | __bpf_kfunc u64 bpf_pidns_nr_tasks(struct pid_namespace *ns)
         |                 ^~~~~~~~~~~~~~~~~~
   kernel/bpf-rvi/common_kfuncs.c:55:17: warning: no previous prototype for 'bpf_pidns_last_pid' [-Wmissing-prototypes]
      55 | __bpf_kfunc u32 bpf_pidns_last_pid(struct pid_namespace *ns)
         |                 ^~~~~~~~~~~~~~~~~~
   kernel/bpf-rvi/common_kfuncs.c:84:18: warning: no previous prototype for 'bpf_si_memswinfo' [-Wmissing-prototypes]
      84 | __bpf_kfunc void bpf_si_memswinfo(struct bpf_sysinfo *bsi)
         |                  ^~~~~~~~~~~~~~~~
   kernel/bpf-rvi/common_kfuncs.c:94:27: warning: no previous prototype for 'bpf_page_counter_read' [-Wmissing-prototypes]
      94 | __bpf_kfunc unsigned long bpf_page_counter_read(struct page_counter *counter)
         |                           ^~~~~~~~~~~~~~~~~~~~~
   kernel/bpf-rvi/common_kfuncs.c:104:18: warning: no previous prototype for 'bpf_seq_file_append' [-Wmissing-prototypes]
     104 | __bpf_kfunc void bpf_seq_file_append(struct seq_file *dst, struct seq_file *src)
         |                  ^~~~~~~~~~~~~~~~~~~
   kernel/bpf-rvi/common_kfuncs.c:118:18: warning: no previous prototype for 'bpf_get_boottime_timens' [-Wmissing-prototypes]
     118 | __bpf_kfunc void bpf_get_boottime_timens(struct task_struct *tsk, struct timespec64 *boottime)
         |                  ^~~~~~~~~~~~~~~~~~~~~~~
   kernel/bpf-rvi/common_kfuncs.c:124:27: warning: no previous prototype for 'bpf_get_total_forks' [-Wmissing-prototypes]
     124 | __bpf_kfunc unsigned long bpf_get_total_forks(void)
         |                           ^~~~~~~~~~~~~~~~~~~
   kernel/bpf-rvi/common_kfuncs.c:129:26: warning: no previous prototype for 'bpf_nr_running' [-Wmissing-prototypes]
     129 | __bpf_kfunc unsigned int bpf_nr_running(void)
         |                          ^~~~~~~~~~~~~~
   kernel/bpf-rvi/common_kfuncs.c:134:32: warning: no previous prototype for 'bpf_nr_context_switches' [-Wmissing-prototypes]
     134 | __bpf_kfunc unsigned long long bpf_nr_context_switches(void)
         |                                ^~~~~~~~~~~~~~~~~~~~~~~
   kernel/bpf-rvi/common_kfuncs.c:139:26: warning: no previous prototype for 'bpf_nr_iowait' [-Wmissing-prototypes]
     139 | __bpf_kfunc unsigned int bpf_nr_iowait(void)
         |                          ^~~~~~~~~~~~~
   kernel/bpf-rvi/common_kfuncs.c:145:26: warning: no previous prototype for 'bpf_kstat_softirqs_cpu' [-Wmissing-prototypes]
     145 | __bpf_kfunc unsigned int bpf_kstat_softirqs_cpu(unsigned int irq, int cpu)
         |                          ^~~~~~~~~~~~~~~~~~~~~~
   kernel/bpf-rvi/common_kfuncs.c:150:27: warning: no previous prototype for 'bpf_kstat_cpu_irqs_sum' [-Wmissing-prototypes]
     150 | __bpf_kfunc unsigned long bpf_kstat_cpu_irqs_sum(unsigned int cpu)
         |                           ^~~~~~~~~~~~~~~~~~~~~~
   kernel/bpf-rvi/common_kfuncs.c:155:18: warning: no previous prototype for 'bpf_kcpustat_cpu_fetch' [-Wmissing-prototypes]
     155 | __bpf_kfunc void bpf_kcpustat_cpu_fetch(struct kernel_cpustat *dst, int cpu)
         |                  ^~~~~~~~~~~~~~~~~~~~~~
   kernel/bpf-rvi/common_kfuncs.c:164:27: warning: no previous prototype for 'bpf_mem_file_hugepage' [-Wmissing-prototypes]
     164 | __bpf_kfunc unsigned long bpf_mem_file_hugepage(void)
         |                           ^~~~~~~~~~~~~~~~~~~~~
   kernel/bpf-rvi/common_kfuncs.c:169:27: warning: no previous prototype for 'bpf_mem_file_pmdmapped' [-Wmissing-prototypes]
     169 | __bpf_kfunc unsigned long bpf_mem_file_pmdmapped(void)
         |                           ^~~~~~~~~~~~~~~~~~~~~~
   kernel/bpf-rvi/common_kfuncs.c:174:27: warning: no previous prototype for 'bpf_mem_kreclaimable' [-Wmissing-prototypes]
     174 | __bpf_kfunc unsigned long bpf_mem_kreclaimable(void)
         |                           ^~~~~~~~~~~~~~~~~~~~
   kernel/bpf-rvi/common_kfuncs.c:180:27: warning: no previous prototype for 'bpf_mem_totalcma' [-Wmissing-prototypes]
     180 | __bpf_kfunc unsigned long bpf_mem_totalcma(void)
         |                           ^~~~~~~~~~~~~~~~
   kernel/bpf-rvi/common_kfuncs.c:185:27: warning: no previous prototype for 'bpf_mem_freecma' [-Wmissing-prototypes]
     185 | __bpf_kfunc unsigned long bpf_mem_freecma(void)
         |                           ^~~~~~~~~~~~~~~
   kernel/bpf-rvi/common_kfuncs.c:200:17: warning: no previous prototype for 'bpf_hugetlb_report_meminfo' [-Wmissing-prototypes]
     200 | __bpf_kfunc int bpf_hugetlb_report_meminfo(struct bpf_mem_hugepage *hugepage_info)
         |                 ^~~~~~~~~~~~~~~~~~~~~~~~~~
   kernel/bpf-rvi/common_kfuncs.c:233:27: warning: no previous prototype for 'bpf_mem_failure' [-Wmissing-prototypes]
     233 | __bpf_kfunc unsigned long bpf_mem_failure(void)
         |                           ^~~~~~~~~~~~~~~
>> kernel/bpf-rvi/common_kfuncs.c:244:27: warning: no previous prototype for 'bpf_mem_percpu' [-Wmissing-prototypes]
     244 | __bpf_kfunc unsigned long bpf_mem_percpu(void)
         |                           ^~~~~~~~~~~~~~


vim +/bpf_mem_percpu +244 kernel/bpf-rvi/common_kfuncs.c

   184	
 > 185	__bpf_kfunc unsigned long bpf_mem_freecma(void)
   186	{
   187		return global_zone_page_state(NR_FREE_CMA_PAGES);
   188	}
   189	
   190	struct bpf_mem_hugepage {
   191		unsigned long total;
   192		unsigned long free;
   193		unsigned long rsvd;
   194		unsigned long surp;
   195		unsigned long size;
   196		unsigned long hugetlb;
   197	};
   198	
   199	#ifdef CONFIG_HUGETLB_PAGE
   200	__bpf_kfunc int bpf_hugetlb_report_meminfo(struct bpf_mem_hugepage *hugepage_info)
   201	{
   202		struct hstate *h;
   203		unsigned long total = 0;
   204	
   205		if (!hugepages_supported())
   206			return -1;
   207	
   208		for_each_hstate(h) {
   209			unsigned long count = h->nr_huge_pages;
   210	
   211			total += huge_page_size(h) * count;
   212	
   213			if (h == &default_hstate) {
   214				hugepage_info->total = count;
   215				hugepage_info->free = h->free_huge_pages;
   216				hugepage_info->rsvd = h->resv_huge_pages;
   217				hugepage_info->surp = h->surplus_huge_pages;
   218				hugepage_info->size = huge_page_size(h) / SZ_1K;
   219			}
   220		}
   221	
   222		hugepage_info->hugetlb = total / SZ_1K;
   223		return 0;
   224	}
   225	#else
   226	__bpf_kfunc int bpf_hugetlb_report_meminfo(struct bpf_mem_hugepage *hugepage_info)
   227	{
   228		return -1;
   229	}
   230	#endif
   231	
   232	#ifdef CONFIG_MEMORY_FAILURE
   233	__bpf_kfunc unsigned long bpf_mem_failure(void)
   234	{
   235		return atomic_long_read(&num_poisoned_pages) << (PAGE_SHIFT - 10);
   236	}
   237	#else
   238	__bpf_kfunc unsigned long bpf_mem_failure(void)
   239	{
   240		return 0;
   241	}
   242	#endif
   243	
 > 244	__bpf_kfunc unsigned long bpf_mem_percpu(void)
   245	{
   246		return pcpu_nr_pages();
   247	}
   248	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
